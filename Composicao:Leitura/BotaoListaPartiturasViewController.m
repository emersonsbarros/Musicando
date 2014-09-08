//
//  BotaoListaPartiturasViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 05/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "BotaoListaPartiturasViewController.h"

@interface BotaoListaPartiturasViewController ()

@end

@implementation BotaoListaPartiturasViewController

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
    
    //retorna a variavel como yes para poder ficar oculta novamente na proxima interacao
    [ListaPartiturasViewController sharedManager].auxTabelaHidden = YES;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


///////////////////////////// METODOS //////////////////////////////////////////


//Botao que faz aparecer e desaparecer a view da lista partitura
- (IBAction)btnTabelaPartituras:(id)sender {
    
    if([ListaPartiturasViewController sharedManager].auxTabelaHidden){
        [ListaPartiturasViewController sharedManager].auxTabelaHidden = NO;
        [ListaPartiturasViewController sharedManager].viewTabelaPartituras.hidden = NO;
    }else{
        [ListaPartiturasViewController sharedManager].auxTabelaHidden = YES;
        [ListaPartiturasViewController sharedManager].viewTabelaPartituras.hidden = YES;
        
    }
    
}




@end
