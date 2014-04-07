#import "EditarViewController.h"
#import "SeleccionarFotoViewController.h"

@interface EditarViewController () <UITextFieldDelegate, SeleccionarFotoViewControllerDelegate>

@end

@implementation EditarViewController

#pragma mark View Lifecycle

- (void)setup
{
	self.nombreText.text = self.cerveza.nombre;
	self.tipoText.text = self.cerveza.tipo;
	self.fotoText.text = self.cerveza.foto;
	self.fotoImageView.image = [UIImage imageNamed:self.cerveza.foto];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setup];
}

#pragma mark Target Action

- (IBAction)pulsarGuardar:(UIBarButtonItem *)sender {
	self.cerveza.nombre = self.nombreText.text;
	self.cerveza.tipo = self.tipoText.text;
	self.cerveza.foto = self.fotoText.text;

	[self.delegate guardarCerveza:self.cerveza];
}

#pragma mark Transiciones del Storyboard

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if([segue.identifier isEqualToString:@"TransicionSeleccionarFoto"]) {
		SeleccionarFotoViewController *seleccionarFoto = segue.destinationViewController;
		seleccionarFoto.foto = self.cerveza.foto;
		seleccionarFoto.delegate = self;
	}
}

#pragma mark UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

#pragma mark SeleccionarFotoViewControllerDelegate

-(void)cancelarSeleccionFoto
{
	NSLog(@"cancelarSeleccionFoto");
	[self dismissViewControllerAnimated:YES completion:^{}];
}

-(void)aceptarFotoSeleccionada:(NSString *)foto
{
	NSLog(@"aceptarFotoSeleccionada: %@", foto);
	self.fotoText.text = foto;
	self.fotoImageView.image = [UIImage imageNamed:foto];
	[self dismissViewControllerAnimated:YES completion:^{}];
}

@end
