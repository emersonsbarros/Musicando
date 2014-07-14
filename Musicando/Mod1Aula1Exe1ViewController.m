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
    
    //Guarda a lista de conversas e falas do mascote
    self.testaBiblio = [Biblioteca sharedManager];
    self.testaConversa = self.testaBiblio.exercicioAtual.mascote.listaDeConversas.firstObject;
    self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex: 0];
    self.lblFalaDoMascote.text = self.testaFala.conteudo;
    
    //Imagem do mascote
    self.imagemDoMascote2.image = [[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image;
    
    [self.view addSubview: self.imagemDoMascote2];
    [self.view addSubview: self.lblFalaDoMascote];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


//Carrega componentes para tela
-(void)carregarComponentesVisuais{
    
    //Teste para trocar o objeto de fala atual
    self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex: 1];
    NSLog(@"Quantidade de falas: %d", self.testaConversa.listaDeFalas.count);
    NSLog(@"Fala atual: %@", self.lblFalaDoMascote.text);
    
    self.lblFalaDoMascote.text = self.testaFala.conteudo;
}






//==================================== Teste de Animação
-(void)animacaoAparecerTexto:(id)sender{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         self.lblFalaDoMascote.hidden = NO;
                         self.lblFalaDoMascote.frame = CGRectMake(100, 100, self.lblFalaDoMascote.frame.size.width, self.lblFalaDoMascote.frame.size.height);

                         
                     } completion:^(BOOL finished){
                         self.outBtoStart.hidden = YES;
                     }];
    
}


- (IBAction)btoStart:(id)sender {
    [self carregarComponentesVisuais];
    [self.outBtoStart addTarget:self action:@selector(animacaoAparecerTexto:) forControlEvents:UIControlEventTouchUpInside];
}




//=================================== Teste para execução de audio
- (IBAction)btoAnimal:(id)sender {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"galo" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];

    self.audioPlayer.play;
    NSLog(@"tocou!");
}

- (IBAction)btoVeiculo:(id)sender {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"nota3C" withExtension:@"aif"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    self.audioPlayer.play;
    NSLog(@"tocou!");
}

- (IBAction)btoNota:(id)sender {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"nota3C" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    self.audioPlayer.play;
    NSLog(@"tocou!");
}




@end
