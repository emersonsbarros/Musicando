//
//  ModuloViewController.m
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 16/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ModuloViewController.h"
#import "AulasViewController.h"

@interface ModuloViewController ()

@end

@implementation ModuloViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)chamaStoryBoardAulas:(Modulo*)sender{
    
    Modulo *button =  sender;
    [Biblioteca sharedManager].moduloAtual = button;
    
    [self performSegueWithIdentifier:@"chamaAulas" sender:self];
    
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
//    UINavigationController *vc = [sb instantiateViewControllerWithIdentifier:@"aulas"];
//    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    AulasViewController *aul = [[AulasViewController alloc]init];
//    [self.navigationController pushViewController:aul animated:NO];
    
//    if([[segue identifier] isEqualToString:@"chamaAulas"]){
//        AulasViewController *aul = segue.destinationViewController;
//        //[self performSegueWithIdentifier:@"chamaAulas" sender:self];
//    }

}


////////////////////////// Metodos Carrega Modulos ///////////////////////////

-(void)carregaModulos{
    
    int contadorDistanciaEntreBotoes = 80;
    for(Modulo *mod in [[self bibliotecaDosModulos] listaDeModulos]){
        mod.layer.zPosition = +5;
        [mod addTarget:self
                action:@selector(chamaStoryBoardAulas:)
                forControlEvents:UIControlEventTouchUpInside];
        
        mod.frame = CGRectMake(contadorDistanciaEntreBotoes, 210.0, 100, 150);
        [mod setBackgroundImage:[mod capa] forState:UIControlStateNormal];
        [[self view] addSubview:mod];
        
        mod.descricaoBotao =  [[UILabel alloc] initWithFrame: CGRectMake(-45,130,200,100)];
        mod.descricaoBotao.text = [mod nome];
        mod.descricaoBotao.font = [UIFont fontWithName:@"Papyrus" size:30];
        mod.descricaoBotao.textAlignment = NSTextAlignmentCenter;
        [mod addSubview:mod.descricaoBotao];
        
        [self.view bringSubviewToFront:mod];
        
        contadorDistanciaEntreBotoes += 200;
    }

}

///////////////////////////////////////////////////////////////////////////

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tela.png"]];
//    [self.view addSubview:backgroundView];
    
    self.bibliotecaDosModulos = [Biblioteca sharedManager];
    [self carregaModulos];

}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}



@end
