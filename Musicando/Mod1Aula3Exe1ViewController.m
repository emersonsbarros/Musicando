//
//  Mod1Aula3Exe1ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula3Exe1ViewController.h"

@interface Mod1Aula3Exe1ViewController ()

@end

@implementation Mod1Aula3Exe1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
    
}

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    //Sombreando view de exercitar
    self.viewDeExercitar.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.viewDeExercitar.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.viewDeExercitar.layer.shadowRadius = 3.0f;
    self.viewDeExercitar.layer.shadowOpacity = 1.0f;
    [self.viewDeExercitar setBackgroundColor: [UIColor whiteColor]];
}

- (void)didReceiveMemoryWarning{
    
    [super didReceiveMemoryWarning];
    
}





//================Métodos de animação e gameficação do exercício

//Mascote e fala sobem
-(void)primeiraAnimacao{
    
        [UIView animateWithDuration:2.0
                         animations:^(void){
                             
                             //Sobe mascote, fala e botão
                             self.imgDoMascote.frame = CGRectMake(20, 20, self.imgDoMascote.frame.size.width, self.imgDoMascote.frame.size.height);
                             self.lblTextoMascote.frame = CGRectMake(200, 50, self.lblTextoMascote.frame.size.width, self.lblTextoMascote.frame.size.height);
                             self.outBtoStartIntro.frame = CGRectMake(700, 100, self.outBtoStartIntro.frame.size.width, self.outBtoStartIntro.frame.size.height);

                         } completion:^(BOOL finished){
                             self.viewDeExercitar.hidden = NO;
                        }];
}

//Assim que o mascote sobe aparece desce a nota
-(void)animacaoNotaEntrandoNoTocador{
    
    //Para teste
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"do3C" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    self.imgNota.hidden = NO;
    self.imgNota2.hidden = NO;
    
    
    [UIView animateWithDuration:3.0
                     animations:^(void){
                         
                         //Notas entrando no tocador
                         self.imgNota.frame = CGRectMake(self.imgNota.frame.origin.x, 300, self.imgNota.frame.size.width, self.imgNota.frame.size.height);
                         self.imgNota2.frame = CGRectMake(self.imgNota2.frame.origin.x, 400, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
                     } completion:^(BOOL finished){
                         self.imgNota.hidden = YES;
                         self.imgNota2.hidden = YES;
                     }];
    
}

//Assim que a nota cai no tocador, um bloquinho sai do tocador
-(void)animacaoNotaSaindoDoTocador{
    
    //Para teste
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"do3C" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [UIView animateWithDuration:1.0
                     animations:^(void){
                         
                         //Notas e pausas andam pela esteira
                         self.imgBlocoDo.frame = CGRectMake(800, self.imgBlocoDo.frame.origin.y, self.imgBlocoDo.frame.size.width, self.imgBlocoDo.frame.size.height);
                         self.imgBlocoPausa.frame = CGRectMake(750, self.imgBlocoPausa.frame.origin.y, self.imgBlocoPausa.frame.size.width, self.imgBlocoPausa.frame.size.height);
                     } completion:^(BOOL finished){
                         self.audioPlayer.play;
                         self.imgBlocoDo.hidden = YES;
                         self.imgBlocoPausa.hidden = YES;
                     }];
    
}

//Assim que o mascote sobe aparece desce a nota
-(void)animacaoExplicandoNotaPausa{
    
    //Para teste
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"do3C" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    self.imgNota.frame = CGRectMake(290, 35, self.imgNota.frame.size.width, self.imgNota.frame.size.height);
    self.imgNota.hidden = NO;
    self.imgSeta.hidden = NO;
    
    [UIView animateWithDuration:1.0
                     animations:^(void){
                         
                         //Notas entrando no tocador
                         self.imgNota.frame = CGRectMake(self.imgNota.frame.origin.x, 70, self.imgNota.frame.size.width, self.imgNota.frame.size.height);
                         self.imgSeta.frame = CGRectMake(self.imgNota.frame.origin.x+100, 70, self.imgSeta.frame.size.width, self.imgSeta.frame.size.height);
                     } completion:^(BOOL finished){
                     }];
    
}

//Botão começar que mostrará a primeira animação
- (IBAction)btoStartIntro:(id)sender {
    
    //ACÃO START
    if (self.outBtoStartIntro.tag == 1) {
        [self primeiraAnimacao];
        
        //Esconde views, deixa apenas as notas caindo e o toca treco
        [self.outBtoStartIntro setTitle:@"Próximo" forState: UIControlStateNormal];
        self.outBtoStartIntro.tag = 2;
        
        //Texto label
        self.lblTextoMascote.text = @"De uma forma sucinta a música é um conjunto ou somatória de sons e silêncios. No tocatreco ao adicionarmos esses elementos sua saída pode ser considerada música. Clique em próximo e confira.";
    
    //ANIMAÇÃO COM TOCADOR
    }else if (self.outBtoStartIntro.tag == 2){
        [self animacaoNotaEntrandoNoTocador];
        [self animacaoNotaSaindoDoTocador];
        self.outBtoStartIntro.tag = 3;
        
        //Texto label
        self.lblTextoMascote.text = @"Desse resultado podemos perceber cada elemento da música, Clique em próximo novamente";
        
    //EXPLICAÇÃO NOTA E PAUSA
    }else if (self.outBtoStartIntro.tag == 3){
        [self animacaoExplicandoNotaPausa];
        self.outBtoStartIntro.tag = 4;
        
        //Texto label
        self.lblTextoMascote.text =@"O pequeno mascote apontado representa o som e o intervalo entre um som e outro, os silêncios são as pausas";
    
    }else if (self.outBtoStartIntro.tag == 4){
        
        //Esconde as views de explicação
        self.imgNota.hidden = YES;
        self.imgNota2.hidden = YES;
        self.imgSeta.hidden = YES;
        self.imgTocaTreco.hidden = YES;
        
        self.outBtoInstrumentos.hidden = NO;
        self.outBtoCoral.hidden = NO;
        self.outBtoNotasPausas.hidden = NO;
        
        //Texto label
        self.lblTextoMascote.text =@"Para memorizar agora vamos para um teste. Qual desses conjuntos representa o significado de música?";
        self.outBtoStartIntro.tag = 5;

    }else if (self.outBtoStartIntro.tag == 5){
        NSLog(@"Aqui chamará a próxima aula");
    }


}

//Opções
- (IBAction)intrumentos:(id)sender {
    NSLog(@"Instrumentos");
}

- (IBAction)coral:(id)sender {
    NSLog(@"Coral");
}

- (IBAction)notasPausas:(id)sender {
    NSLog(@"ACERTOU! Notas e pausas");
    [self.outBtoStartIntro setTitle:@"Finalizar Aula" forState: UIControlStateNormal];
}


@end
