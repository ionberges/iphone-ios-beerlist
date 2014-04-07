#import "ListadoViewController.h"
#import "DetalleViewController.h"
#import "EditarViewController.h"

@interface ListadoViewController () <EditarViewControllerDelegate>

@end

@implementation ListadoViewController

-(void)guardarCerveza:(Cerveza *)cerveza
{
	[self.cervezas guardarCerveza:cerveza];
	[self.navigationController popToRootViewControllerAnimated:YES];
	[self.tableView reloadData];
}

#pragma mark View Lifecycle

- (void)setup
{
	self.cervezas = [Cervezas sharedInstance];

    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setup];
}

#pragma mark Transiciones del Storyboard

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if([segue.identifier isEqualToString:@"TransicionDetalle"]) {
		UITableViewCell *celda = sender;
		Cerveza *cerveza = [self.cervezas cervezaConIdentificador:celda.tag];

		DetalleViewController *detalle = segue.destinationViewController;
		detalle.cerveza = cerveza;

	}
	if([segue.identifier isEqualToString:@"TransicionEditar"]) {
		UITableViewCell *celda = sender;
		Cerveza *cerveza = [self.cervezas cervezaConIdentificador:celda.tag];

		EditarViewController *editar = segue.destinationViewController;
		editar.cerveza = cerveza;
		editar.delegate = self;
	}
	if([segue.identifier isEqualToString:@"TransicionNuevo"]) {
		Cerveza *cerveza = [[Cerveza alloc] initWithIdentificador:[self.cervezas.cervezas count]
														   nombre:@"Nombre"
															 tipo:@"Tipo"
															 foto:@""];

		EditarViewController *editar = segue.destinationViewController;
		editar.cerveza = cerveza;
		editar.delegate = self;
	}
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.cervezas.cervezas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CeldaCerveza";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

	Cerveza *cerveza = [self.cervezas cervezaConIndex:indexPath.row];
	cell.tag = cerveza.identificador;
	cell.textLabel.text = cerveza.nombre;
	cell.detailTextLabel.text = cerveza.tipo;
	cell.imageView.image = [UIImage imageNamed:cerveza.foto];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		UITableViewCell *celda = [tableView cellForRowAtIndexPath:indexPath];
        [self.cervezas borrarCervezaConIdentificador:celda.tag];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
