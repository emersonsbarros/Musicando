//
//  Mod1Aula1Exe1ViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 19/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula1Exe1ViewController.h"

@interface Mod1Aula1Exe1ViewController ()

@end

@implementation Mod1Aula1Exe1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview: self.lblTextoDeApresentacao];
    
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}





-(void)carregarComponentesVisuais{
    
    
    self.lblTeste.text = @"O que é som? ... Sons são ondas produzidas pela vibração de um corpo qualquer, transmitida por um meio de propagação de frequências regulares ou não, que são captadas pelos nossos ouvidos e interpretadas pelos nossos cérebros. Música é uma forma de arte que se constitui basicamente em combinar sons e ritmo seguindo uma pré-organização ao longo do tempo.";
    
    self.lblTeste.hidden = YES;

    
}




- (IBAction)btoStart:(id)sender {
    [self carregarComponentesVisuais];
    [self.outBtoStart addTarget:self action:@selector(animacaoAparecerTexto:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)animacaoAparecerTexto:(id)sender{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         self.lblTeste.hidden = NO;
                         self.lblTeste.frame = CGRectMake(100, 100, self.lblTeste.frame.size.width, self.lblTeste.frame.size.height);

                     } completion:^(BOOL finished){
                         self.outBtoStart.hidden = YES;
                         
                     }];
    
    
}

@end
