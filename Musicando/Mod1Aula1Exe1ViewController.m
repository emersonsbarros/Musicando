//
//  Mod1Aula1Exe1ViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 19/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import "Biblioteca.h"
#import "Conversa.h"
#import "Fala.h"
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
    
    //Falas
    Fala *fala1 = [[Fala alloc] init];
    fala1.conteudo = @"Primeira fala do mascote";
    
    Fala *fala2 = [[Fala alloc] init];
    fala1.conteudo = @"Segunda fala";
    
    //Conversa
    Conversa *conversa1 = [[Conversa alloc] init];
    [[conversa1 listaDeFalas]addObject: fala1];
    [[conversa1 listaDeFalas]addObject: fala2];
    
    Biblioteca *bibteste = [Biblioteca sharedManager];
    //[[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image
    
    
    [[[[[Biblioteca sharedManager] exercicioAtual] mascote] listaDeConversas] addObject: conversa1];    
    self.imagemDoMascote2.image = bibteste.exercicioAtual.mascote.imagem.image;
    [self.view addSubview: self.imagemDoMascote2];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}





-(void)carregarComponentesVisuais{
    
    
    self.lblFalaDoMascote.text = @"O que é som? ... Sons são ondas produzidas pela vibração de um corpo qualquer, são captadas pelos nossos ouvidos e interpretadas pelos nossos cérebros.";
    self.lblFalaDoMascote.hidden = YES;
   
    
    [self.view addSubview: self.lblTextoDeApresentacao];
    
    
}


-(void)animacaoAparecerTexto:(id)sender{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         self.lblFalaDoMascote.hidden = NO;
                         self.lblFalaDoMascote.frame = CGRectMake(100, 100, self.lblFalaDoMascote.frame.size.width, self.lblFalaDoMascote.frame.size.height);
                         
                     } completion:^(BOOL finished){
                         self.outBtoStart.hidden = YES;
                         
                     }];
    
}



//Teste para execução de música
- (IBAction)btoStart:(id)sender {
    [self carregarComponentesVisuais];
    [self.outBtoStart addTarget:self action:@selector(animacaoAparecerTexto:) forControlEvents:UIControlEventTouchUpInside];
}



//Teste para execução de audio
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




@end
