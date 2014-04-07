#import <UIKit/UIKit.h>
#import "Cervezas.h"

@protocol SeleccionarFotoViewControllerDelegate <NSObject>

-(void)cancelarSeleccionFoto;
-(void)aceptarFotoSeleccionada:(NSString *)foto;

@end

@interface SeleccionarFotoViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) Cervezas *cervezas;

@property (strong, nonatomic) NSString *foto;
@property (weak, nonatomic) id <SeleccionarFotoViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *fotoImageView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerFotos;

@end
