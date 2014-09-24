//
//  ListaPartiturasViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ListaPartiturasViewController.h"

@interface ListaPartiturasViewController ()

@end

@implementation ListaPartiturasViewController


//////////////Sington

+(ListaPartiturasViewController*)sharedManager{
    static ListaPartiturasViewController *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


//////////////////////////////////////////////////////////////////


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.listaPartituras = [InicializaProjeto sharedManager].listaMusicXml;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//////////////////////////////// METODOS ///////////////////////////////


//carrega todos os nomes das partituras xml
-(void)carregaListaPartituras{
    self.listaPartituras = [InicializaProjeto sharedManager].listaMusicXml;
}


////////////////////////////////// TABELA ////////////////////////////


//Números de seções
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//Número de linhas por seção
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listaPartituras.count;
}


//Preeche a tabela com os nomes do xml
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *recipe = [self.listaPartituras objectAtIndex:[indexPath row]];
    cell.textLabel.font = [UIFont fontWithName:@"Papyrus" size:30.0f];
    cell.textLabel.textColor = [UIColor colorWithRed:(22/255.f) green:(29/255.f) blue:(189/255.f) alpha:1.0];
    [[cell textLabel]setText:recipe];
    

    return cell;
}


//Quando selecionado ele faz seta na escolha de usuario e deseparece a table
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [EscolhaUsuarioPartitura sharedManager].nomeXmlPartitura = [self.listaPartituras objectAtIndex: [indexPath row]];
    self.viewTabelaPartituras.hidden = YES;
    self.auxTabelaHidden = YES;
}


-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Lista de Partituras"];
}

//retorna Espacamento entre as celular
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}



@end
