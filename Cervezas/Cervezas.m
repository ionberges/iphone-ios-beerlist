
#import "Cervezas.h"

@implementation Cervezas

+ (Cervezas *)sharedInstance
{
    static Cervezas *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Cervezas alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {

		
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);

	
		NSString *docsDir = [paths objectAtIndex:0];

		_path = [docsDir stringByAppendingPathComponent:@"Cervezas.list"];

		if([[NSFileManager defaultManager] fileExistsAtPath:_path]) {
			_cervezas = [NSKeyedUnarchiver unarchiveObjectWithFile:_path];
		} else {
			NSString *bundlePath = [[NSBundle mainBundle] pathForResource:
									@"beers" ofType:@"plist"];
			NSArray *cervezas = [NSArray arrayWithContentsOfFile:bundlePath];

			_cervezas = [[NSMutableDictionary alloc] init];
			NSUInteger identificador = 0;
			for(NSDictionary *datos in cervezas) {
				Cerveza *cerveza = [[Cerveza alloc] initWithIdentificador:identificador
																   nombre:[datos valueForKey:@"name"]
																	 tipo:[datos valueForKey:@"type"]
																	 foto:[datos valueForKey:@"image"]];
				[_cervezas setObject:cerveza forKey:[NSString stringWithFormat:@"%i", identificador]];
				identificador += 1;
			}

			NSLog(@"Guardando datos en %@", _path);
            [self archivarDatos];
		}

		_fotos = [[NSMutableArray alloc] init];
		for(NSString *clave in _cervezas) {
			Cerveza *cerveza = [_cervezas valueForKey:clave];
			[_fotos addObject:cerveza.foto];
			if(![_fotos containsObject:cerveza.foto]) {
				[_fotos addObject:cerveza.foto];
			}
		}
	
    }
    return self;
}

- (void)archivarDatos
{
   
    [NSKeyedArchiver archiveRootObject:_cervezas toFile:_path];
}

-(Cerveza *)cervezaConIdentificador:(NSInteger)identificador
{
	return [self.cervezas valueForKey:[NSString stringWithFormat:@"%i", identificador]];
}

-(Cerveza *)cervezaConIndex:(NSInteger)index
{
	
	NSArray *claves = [[self.cervezas allKeys] sortedArrayUsingComparator:^(NSString *claveA, NSString *claveB) {
		Cerveza *cervezaA = [self.cervezas valueForKey:claveA];
		Cerveza *cervezaB = [self.cervezas valueForKey:claveB];
		return [cervezaA.nombre caseInsensitiveCompare:cervezaB.nombre];
	}];
	NSString *clave = [claves objectAtIndex:index];
	return [self.cervezas objectForKey:clave];
}

-(void)guardarCerveza:(Cerveza *)cerveza
{
	[self.cervezas setValue:cerveza forKey:[NSString stringWithFormat:@"%i", cerveza.identificador]];
	[self archivarDatos];
}

-(void)borrarCervezaConIdentificador:(NSInteger)identificador
{
	[self.cervezas removeObjectForKey:[NSString stringWithFormat:@"%i", identificador]];
	[self archivarDatos];
}

@end
