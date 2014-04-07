#import <UIKit/UIKit.h>
#import "Cerveza.h"

@protocol EditarViewControllerDelegate <NSObject>

-(void)guardarCerveza:(Cerveza *)cerveza;

@end

@interface EditarViewController : UIViewController

@property (strong, nonatomic) Cerveza *cerveza;
@property (weak, nonatomic) id <EditarViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nombreText;
@property (weak, nonatomic) IBOutlet UITextField *tipoText;
@property (weak, nonatomic) IBOutlet UITextField *fotoText;
@property (weak, nonatomic) IBOutlet UIImageView *fotoImageView;

@end
