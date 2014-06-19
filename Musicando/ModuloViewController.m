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
        //Seta com o Singleton
      
    
    }
    return self;
}

-(void)chamaStoryBoardAulas:(id)sender{
    
    Modulo *button = (Modulo*) sender;
    [Biblioteca sharedManager].moduloAtual = button;
    
    [self performSegueWithIdentifier:@"chamaAulas" sender:sender];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bibliotecaDosModulos = [Biblioteca sharedManager];
    
    int contadorDistanciaEntreBotoes = 80;
    
    for(Modulo *mod in [[self bibliotecaDosModulos ]listaDeModulos]){
        
        //UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [mod addTarget:self
                action:@selector(chamaStoryBoardAulas:)
               forControlEvents:UIControlEventTouchUpInside];
        
        [mod setTitle:@"" forState:UIControlStateNormal];
        mod.frame = CGRectMake(contadorDistanciaEntreBotoes, 210.0, 100, 150);
        [mod setImage:[mod capa] forState:UIControlStateNormal];
        
        [[self view] addSubview:mod];
        
        UILabel *label =  [[UILabel alloc] initWithFrame: CGRectMake(contadorDistanciaEntreBotoes,210.0+120,200,100)];
        label.text = [mod nome];
        [self.view addSubview:label];
        
        contadorDistanciaEntreBotoes += 200;
        
    }
    
    
}


//-(void)chamaStoryBoardAulas:(id)sender{
//    //[Biblioteca sharedManager].moduloAtual = mod;
//    Modulo *button = (Modulo*) sender;
//    NSLog(@"nome = %@",button.nome);
//    [self performSegueWithIdentifier:@"chamaAulas" sender:sender];
//}
//
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    self.bibliotecaDosModulos = [Biblioteca sharedManager];
//    
//    int contadorDistanciaEntreBotoes = 80;
//    
//    for(Modulo *mod in [[self bibliotecaDosModulos ]listaDeModulos]){
//        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button addTarget:self
//                   action:@selector(chamaStoryBoardAulas:)
//         forControlEvents:UIControlEventTouchUpInside];
//        
//        [button setTitle:@"" forState:UIControlStateNormal];
//         button.frame = CGRectMake(contadorDistanciaEntreBotoes, 210.0, 100, 150);
//        [button setImage:[mod capa] forState:UIControlStateNormal];
//        
//        
//        [self.view addSubview:button];
//        
//        UILabel *label =  [[UILabel alloc] initWithFrame: CGRectMake(contadorDistanciaEntreBotoes,210.0+120,200,100)];
//        label.text = [mod nome];
//        [self.view addSubview:label];
//        
//        contadorDistanciaEntreBotoes += 200;
//        
//    }
//    
//    
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
