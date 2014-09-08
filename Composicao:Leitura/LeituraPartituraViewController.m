//
//  LeituraPartituraViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 08/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "LeituraPartituraViewController.h"

@interface LeituraPartituraViewController ()

@end

@implementation LeituraPartituraViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
    
    //Tira o som da partitura caso o usuario saia com a musica tocando
    [[Sinfonia sharedManager]pararPlayerPartitura];
    
}


- (void) viewDidLoad{
    
    //Add componentes da Tela Edicao
    [[GerenciadorComponenteView sharedManager]addComponentesPlayerPartitura:self];
    [[GerenciadorComponenteView sharedManager]addComponentesEscolhaInstrumentoPartitura:self];
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoNomePartitura:self];
    [[GerenciadorComponenteView sharedManager]addComponentesBotaoEstudio:self:20:670];
    [[GerenciadorComponenteView sharedManager]addComponentesListaPartituras:self];
    
    
    //Manda o UIScrollView para a classe modeladora
    [[ComponenteScroll sharedManager]recebeScroll:self.scroll];
    
    
}




@end
