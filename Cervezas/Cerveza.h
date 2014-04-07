#import <Foundation/Foundation.h>

@interface Cerveza : NSObject <NSCoding>

@property (nonatomic) NSUInteger identificador;
@property (strong, nonatomic) NSString *nombre;
@property (strong, nonatomic) NSString *tipo;
@property (strong, nonatomic) NSString *foto;

-(Cerveza *)initWithIdentificador:(NSUInteger)identificador nombre:(NSString *)nombre tipo:(NSString *)tipo foto:(NSString *)foto;
-(NSString *)description;

@end
