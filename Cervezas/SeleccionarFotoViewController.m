#import "SeleccionarFotoViewController.h"

@interface SeleccionarFotoViewController ()

@end

@implementation SeleccionarFotoViewController

#pragma mark View Lifecycle

- (void)setup
{
	self.cervezas = [Cervezas sharedInstance];
	self.pickerFotos.dataSource = self;
	self.pickerFotos.delegate = self;

	if(self.foto) {
        NSUInteger index = [self.cervezas.fotos indexOfObject:self.foto];
        if(index != NSNotFound) {
            [self.pickerFotos selectRow:index inComponent:0 animated:NO];
            self.fotoImageView.image = [UIImage imageNamed:self.foto];
            return;
        } else {
			[self seleccionarPrimera];
		}
	} else {
		[self seleccionarPrimera];
	}
}

- (void)seleccionarPrimera
{
    self.foto = [self.cervezas.fotos objectAtIndex:0];
    self.fotoImageView.image = [UIImage imageNamed:self.foto];
    [self.pickerFotos selectRow:0 inComponent:0 animated:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setup];
}

#pragma mark Target Action

- (IBAction)pulsarCancelar:(UIBarButtonItem *)sender {
	[self.delegate cancelarSeleccionFoto];
}

- (IBAction)pulsarAceptar:(UIBarButtonItem *)sender {
	[self.delegate aceptarFotoSeleccionada:self.foto];
}

#pragma mark UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [self.cervezas.fotos count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [self.cervezas.fotos objectAtIndex:row];
}

#pragma mark UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	self.foto = [self.cervezas.fotos objectAtIndex:row];
	self.fotoImageView.image = [UIImage imageNamed:self.foto];
}

@end
