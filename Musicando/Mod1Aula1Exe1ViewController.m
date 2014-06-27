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
    
    [self carregarComponentesVisuais];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}





-(void)carregarComponentesVisuais{
    
    
    self.lblTeste.text = @"O que é som? ... Sons são ondas produzidas pela vibração de um corpo qualquer, são captadas pelos nossos ouvidos e interpretadas pelos nossos cérebros.";
    self.lblTeste.hidden = YES;
   
    [self.view addSubview: self.lblTextoDeApresentacao];

    
}



//Teste para execução de música
- (IBAction)btoStart:(id)sender {
    [self carregarComponentesVisuais];
    [self.outBtoStart addTarget:self action:@selector(animacaoAparecerTexto:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)btoAnimal:(id)sender {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"galo" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];

    self.audioPlayer.play;
    NSLog(@"tocou!");
}

- (IBAction)btoVeiculo:(id)sender {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"helicoptero" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    self.audioPlayer.play;
    NSLog(@"tocou!");
}

- (IBAction)btoNota:(id)sender {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"nota" withExtension:@"aif"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    self.audioPlayer.play;
    NSLog(@"tocou!");
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
