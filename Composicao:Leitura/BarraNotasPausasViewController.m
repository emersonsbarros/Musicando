//
//  BarraNotasPausasViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "BarraNotasPausasViewController.h"

@interface BarraNotasPausasViewController ()

@end

@implementation BarraNotasPausasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //Seta como padrao a escolha do usario como seminima
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"quarter"];
    
}


///////////////////////// Botao NOTA /////////////////////////


//Seta a nota que foi escolhida pelo usuario
- (IBAction)semibreveBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"whole"];
}

- (IBAction)minimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"half"];
}

- (IBAction)seminimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"quarter"];
}

- (IBAction)colcheiaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"eighth"];
}



///////////////////////// PAUSA /////////////////////////

- (IBAction)pausaSemibreveBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semibrevePausa"];
}

- (IBAction)pausaMinimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"minimaPausa"];
}

- (IBAction)pausaSeminimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"seminimaPausa"];
}

- (IBAction)pausaColcheiaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"colcheiaPausa"];
}




@end
