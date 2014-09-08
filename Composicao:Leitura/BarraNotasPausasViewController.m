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
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"seminima"];
    
}


///////////////////////// Botao NOTA /////////////////////////

//Seta a nota que foi escolhida pelo usuario
- (IBAction)semibreveBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semibreve"];
}

- (IBAction)minimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"minima"];
}

- (IBAction)seminimaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"seminima"];
}

- (IBAction)colcheiaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"colcheia"];
}

- (IBAction)semicolcheiaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semicolcheia"];
}

- (IBAction)fusaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"fusa"];
}

- (IBAction)semifusaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semifusa"];
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

- (IBAction)pausaSemicolcheiaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semicolcheiaPausa"];
}

- (IBAction)pausaFusaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"fusaPausa"];
}

- (IBAction)pausaSemifusaBotao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao = [[DataBaseNotaPadrao sharedManager]retornaNotaPadrao:@"semifusaPausa"];
}


@end
