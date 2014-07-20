//
//  Mod1Aula3Exe2ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula3Exe2ViewController.h"

@interface Mod1Aula3Exe2ViewController ()

@end

@implementation Mod1Aula3Exe2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Sombreando view dos ritmos
    self.viewDosRitmos.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.viewDosRitmos.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.viewDosRitmos.layer.shadowRadius = 3.0f;
    self.viewDosRitmos.layer.shadowOpacity = 1.0f;
    [self.viewDosRitmos setBackgroundColor: [UIColor whiteColor]];
    
    //Áudio teste
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"mi3E" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}




//================Métodos de animação e gameficação do exercício


//Primeira animação
-(void)primeiraAnimacao{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         //Muda local do mascote e label
                        self.imagemDoMascote.frame = CGRectMake(20, 20, self.imagemDoMascote.frame.size.width, self.imagemDoMascote.frame.size.height);
                         self.lblTextoMascote.frame = CGRectMake(200, 50, self.lblTextoMascote.frame.size.width, self.lblTextoMascote.frame.size.height);
                        self.outBtoStartIntro.frame = CGRectMake(700, 100, self.outBtoStartIntro.frame.size.width, self.outBtoStartIntro.frame.size.height);
                         self.viewDosRitmos.frame = CGRectMake(200, self.viewDosRitmos.frame.origin.y, self.viewDosRitmos.frame.size.width, self.viewDosRitmos.frame.size.height);
                     } completion:^(BOOL finished){
                     }];
    
}

//TESTE
//Animação para aumentar e diminiuir o botão dos ritmos ao tocar
-(void)animacaoAumentarBtoRitmo:(UIButton*)botaoApertado{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         
                         //Aumenta o tamanho do botão
                         self.outBtoClassico.frame = CGRectMake(self.outBtoClassico.frame.origin.x, self.outBtoClassico.frame.origin.y, self.outBtoClassico.frame.size.width+100, self.outBtoClassico.frame.size.height+100);
                         NSLog(@"Aumentou");
                    } completion:^(BOOL finished){
                    }];
    
}
//Animação toca treco
-(void)animacaoTocaTreco:(float)duracao{
    
    if (self.outTocaTreco1.tag == 100){
         self.imgNota1.frame = CGRectMake(self.imgNota1.frame.origin.x, 70, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
        self.imgNota2.frame = CGRectMake(self.imgNota2.frame.origin.x, 70, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(self.imgNota3.frame.origin.x, 70, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
        
    }else if(self.outTocaTreco2.tag == 100){
        self.imgNota1.frame = CGRectMake(self.imgNota1.frame.origin.x, 300, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
        self.imgNota2.frame = CGRectMake(self.imgNota2.frame.origin.x, 300, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(self.imgNota3.frame.origin.x, 300, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
    }
    
    self.imgNota1.hidden = NO;
    self.imgNota2.hidden = NO;
    self.imgNota3.hidden = NO;
    
    [UIView animateWithDuration:duracao
                     animations:^(void){
                         
                         //Aumenta o tamanho do botão
                         self.imgNota1.frame = CGRectMake(900, self.imgNota1.frame.origin.y, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
                         self.imgNota2.frame = CGRectMake(950, self.imgNota2.frame.origin.y, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
                         self.imgNota3.frame = CGRectMake(1000, self.imgNota3.frame.origin.y, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);

                     } completion:^(BOOL finished){
                     }];
    
    self.outTocaTreco1.tag = 0;
    self.outTocaTreco2.tag = 0;
}

- (IBAction)btoStartIntro:(id)sender {
    
    //Ação START
    if (self.outBtoStartIntro.tag == 1) {
        [self primeiraAnimacao];
        
        self.viewDosRitmos.hidden = NO;
        self.lblTextoMascote.text = @"Você já deve ter ouvido essa música muito conhecida XXX, mas talvez nunca percebeu que ela pode ser apresentar de várias maneiras dependendo do ritmo. Clique em cada uma ao lado e veja diferença.";
        self.outBtoStartIntro.hidden = YES;
        [self.outBtoStartIntro setTitle:@"Continuar" forState: UIControlStateNormal];
        self.outBtoStartIntro.tag = 2;
        
    //Ações CONTINUAR
    }else if(self.outBtoStartIntro.tag == 2){
        
        //Esconde botões de ritmo
        self.outBtoClassico.hidden = YES;
        self.outBtoRock.hidden = YES;
        self.outBtoSamba.hidden = YES;
        
        //Mostra toca trecos
        self.outTocaTreco1.hidden = NO;
        self.outTocaTreco2.hidden = NO;
        
        self.lblTextoMascote.text = @"É nítido que de acordo com o ritmo a velocidade e tempo da música é alterada, se você se lembra do tocatreco clique em cada um e veja a diferença na saída da música.";
        self.outBtoStartIntro.tag = 3;
    }else if(self.outBtoStartIntro.tag == 3){
        self.lblTextoMascote.text = @"Agora para exercitar me responda, qual dessas figuras corresponde ao ritmo na música?";
        
        self.outBtoMaestro.hidden = NO;
        self.outBtoMicrofone.hidden = NO;
        self.outBtoTempoVelocidade.hidden = NO;
        self.outTocaTreco1.hidden = YES;
        self.outTocaTreco2.hidden = YES;

        
        self.outBtoStartIntro.tag = 4;
    }else if(self.outBtoStartIntro.tag == 4){
        NSLog(@"Aqui chamará a próxima aula");
    }
    
}

- (IBAction)btoClassico:(id)sender {
    [self animacaoAumentarBtoRitmo: self.outBtoClassico];
    self.audioPlayer.play;
    self.outBtoStartIntro.hidden = NO;

}

- (IBAction)btoRock:(id)sender {
    self.audioPlayer.play;
    self.outBtoStartIntro.hidden = NO;

}

- (IBAction)btoSamba:(id)sender {
    self.audioPlayer.play;
    self.outBtoStartIntro.hidden = NO;
}

- (IBAction)tempoVelocidade:(id)sender {
    NSLog(@"ACERTOU! Tempo e velocidade");
    [self.outBtoStartIntro setTitle:@"Finalizar Aula" forState: UIControlStateNormal];
}

- (IBAction)maestro:(id)sender {
    NSLog(@"Maestro");
}

- (IBAction)microfone:(id)sender {
    NSLog(@"Microfone");

}

- (IBAction)tocaTreco1:(id)sender {
    [self animacaoTocaTreco: 1.0];
    self.outTocaTreco1.tag = 100;
    
}

- (IBAction)tocaTreco2:(id)sender {
    [self animacaoTocaTreco: 3.0];
    self.outTocaTreco2.tag = 100;
}

@end
