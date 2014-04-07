#import "Cerveza.h"

@implementation Cerveza

-(Cerveza *)initWithIdentificador:(NSUInteger)identificador nombre:(NSString *)nombre tipo:(NSString *)tipo foto:(NSString *)foto
{
    self = [super init];
    if (self) {
		_identificador = identificador;
		_nombre = nombre;
		_tipo = tipo;
		_foto = foto;
	}
	return self;
}

-(NSString *)description
{
	return [NSString stringWithFormat:@"%i %@", self.identificador, self.nombre];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	if (self) {
		_identificador = [aDecoder decodeIntegerForKey:@"identificador"];
		_nombre = [aDecoder decodeObjectForKey:@"nombre"];
		_tipo = [aDecoder decodeObjectForKey:@"tipo"];
		_foto = [aDecoder decodeObjectForKey:@"foto"];
	}
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeInteger:self.identificador forKey:@"identificador"];
	[aCoder encodeObject:self.nombre forKey:@"nombre"];
	[aCoder encodeObject:self.tipo forKey:@"tipo"];
	[aCoder encodeObject:self.foto forKey:@"foto"];
}

@end
