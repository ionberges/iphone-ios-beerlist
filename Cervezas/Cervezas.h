#import <Foundation/Foundation.h>
#import "Cerveza.h"

@interface Cervezas : NSObject

@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSMutableDictionary *cervezas;
@property (strong, nonatomic) NSMutableArray *fotos;

+ (Cervezas *)sharedInstance;

- (Cerveza *)cervezaConIdentificador:(NSInteger)identificador;
- (Cerveza *)cervezaConIndex:(NSInteger)index;

- (void)guardarCerveza:(Cerveza *)cerveza;
- (void)borrarCervezaConIdentificador:(NSInteger)identificador;

@end
