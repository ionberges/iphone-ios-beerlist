#import <UIKit/UIKit.h>
#import "Cerveza.h"

@interface DetalleViewController : UIViewController

@property (strong, nonatomic) Cerveza *cerveza;

@property (weak, nonatomic) IBOutlet UILabel *nombreLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipoLabel;
@property (weak, nonatomic) IBOutlet UIImageView *fotoImageView;

@end
