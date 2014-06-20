//
//  ModuloViewController.m
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 16/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ModuloViewController.h"

@interface ModuloViewController ()

@end

@implementation ModuloViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void)chamaStoryBoardAulas:(Modulo*)sender{
    
    Modulo *button =  sender;
    NSLog(@"estado %@",button.nome);
    [Biblioteca sharedManager].moduloAtual = button;
    [self performSegueWithIdentifier:@"chamaAulas" sender:self];
    
}

////////////////////////// Metodos Carrega Modulos ///////////////////////////

-(void)carregaModulos{
    
    int contadorDistanciaEntreBotoes = 80;
    for(Modulo *mod in [[self bibliotecaDosModulos ]listaDeModulos]){
        
        [mod addTarget:self
                action:@selector(chamaStoryBoardAulas:)
                forControlEvents:UIControlEventTouchUpInside];
        
        mod.frame = CGRectMake(contadorDistanciaEntreBotoes, 210.0, 100, 150);
        [mod setBackgroundImage:[mod capa] forState:UIControlStateNormal];
        [[self view] addSubview:mod];
        
        mod.descricaoBotao =  [[UILabel alloc] initWithFrame: CGRectMake(-45,130,200,100)];
        mod.descricaoBotao.text = [mod nome];
        mod.descricaoBotao.textAlignment = NSTextAlignmentCenter;
        [mod addSubview:mod.descricaoBotao];
        mod.layer.zPosition = -10;
        
        contadorDistanciaEntreBotoes += 200;
    }

}

///////////////////////////////////////////////////////////////////////////

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.bibliotecaDosModulos = [Biblioteca sharedManager];
    
    [self carregaModulos];

}

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
