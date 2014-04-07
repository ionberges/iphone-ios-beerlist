#import "DetalleViewController.h"

@interface DetalleViewController ()

@end

@implementation DetalleViewController

- (void)setup
{
	self.nombreLabel.text = self.cerveza.nombre;
	self.tipoLabel.text = self.cerveza.tipo;
	self.fotoImageView.image = [UIImage imageNamed:self.cerveza.foto];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setup];
}

@end
