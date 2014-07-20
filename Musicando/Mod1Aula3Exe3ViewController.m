//
//  Mod1Aula3Exe3ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula3Exe3ViewController.h"

@interface Mod1Aula3Exe3ViewController ()
@end

@implementation Mod1Aula3Exe3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
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

//===ANIMAÇÕES


//Primeira
-(void)primeiraAnimacao{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         //Muda local do mascote e label
                         self.imgDoMascote.frame = CGRectMake(20, 20, self.imgDoMascote.frame.size.width, self.imgDoMascote.frame.size.height);
                         self.lblTextoMascote.frame = CGRectMake(200, 50, self.lblTextoMascote.frame.size.width, self.lblTextoMascote.frame.size.height);
                         self.outBtoStartIntro.frame = CGRectMake(600, 80, self.outBtoStartIntro.frame.size.width, self.outBtoStartIntro.frame.size.height);
                         self.viewDeExercitar.frame = CGRectMake(200, self.viewDeExercitar.frame.origin.y, self.viewDeExercitar.frame.size.width, self.viewDeExercitar.frame.size.height);
                     } completion:^(BOOL finished){
                     }];
    
    self.viewDeExercitar.hidden = NO;
    
}


//Animação toca treco
-(void)animacaoTocaTreco{
    
    if (self.outTocaTreco1.tag == 100){
        NSLog(@"Primeiro tocatreco");
        self.imgNota2.frame = CGRectMake(84, 110, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(143, 110, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
        self.imgNota4.frame = CGRectMake(204, 110, self.imgNota4.frame.size.width, self.imgNota4.frame.size.height);
        
        self.imgNota2.hidden = NO;
        self.imgNota3.hidden = NO;
        self.imgNota4.hidden = NO;
        
    }else if(self.outTocaTreco2.tag == 100){
        NSLog(@"Primeiro tocatreco");
        self.imgNota1.frame = CGRectMake(84, 322, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
        self.imgNota2.frame = CGRectMake(84, 364, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(143, 364, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
        self.imgNota4.frame = CGRectMake(204, 364, self.imgNota4.frame.size.width, self.imgNota4.frame.size.height);
        self.imgNota5.frame = CGRectMake(204, 322, self.imgNota5.frame.size.width, self.imgNota5.frame.size.height);
        
        self.imgNota1.hidden = NO;
        self.imgNota2.hidden = NO;
        self.imgNota3.hidden = NO;
        self.imgNota4.hidden = NO;
        self.imgNota5.hidden = NO;
    }
    


    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         
                         //Aumenta o tamanho do botão
                         self.imgNota1.frame = CGRectMake(1000, self.imgNota1.frame.origin.y, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
                         self.imgNota2.frame = CGRectMake(1050, self.imgNota2.frame.origin.y, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
                         self.imgNota3.frame = CGRectMake(1100, self.imgNota3.frame.origin.y, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
                         self.imgNota4.frame = CGRectMake(1150, self.imgNota4.frame.origin.y, self.imgNota4.frame.size.width, self.imgNota3.frame.size.height);
                         self.imgNota5.frame = CGRectMake(1200, self.imgNota5.frame.origin.y, self.imgNota5.frame.size.width, self.imgNota3.frame.size.height);
                         
                     } completion:^(BOOL finished){
                     }];
    
    self.outTocaTreco1.tag = 0;
    self.outTocaTreco2.tag = 0;
}



//Primeiro questão
- (IBAction)tocaTreco1:(id)sender {
    NSLog(@"TocaTreco1 acionado");
    self.outTocaTreco1.tag = 100;
    [self animacaoTocaTreco];

}

- (IBAction)tocaTreco2:(id)sender {
    NSLog(@"TocaTreco2 acionado");
    self.outTocaTreco2.tag = 100;
    [self animacaoTocaTreco];
}

- (IBAction)violao:(id)sender {
    NSLog(@"Violão acionado");

}

- (IBAction)flauta:(id)sender {
    NSLog(@"ACERTOU! Flauta acionada");
    [self.outBtoStartIntro setTitle:@"Finalizar Aula" forState: UIControlStateNormal];


}

- (IBAction)piano:(id)sender {
    NSLog(@"Piano acionado");

}

- (IBAction)btoStartIntro:(id)sender {
    
    //Ações START
    if (self.outBtoStartIntro.tag == 1) {
        [self primeiraAnimacao];
        
        self.lblTextoMascote.text = @"Entenda por melodia como sons ou notas tocados e cantados SEPARADAMENTE, sempre uma nota por vez. Veja abaixo o exemplo dos tocatrecos, clique em cada um.";
        [self.outBtoStartIntro setTitle:@"Continuar" forState: UIControlStateNormal];
        self.outBtoStartIntro.tag = 2;
        
    //Ações CONTINUAR
    }else if(self.outBtoStartIntro.tag == 2){
        
        self.lblTextoMascote.text = @"Para fixar, sabendo que a melodia ocorre equando notas são tocadas individualmente. Qual dos instrumentos abaixo tem essa caracteristica?";
        
        self.outTocaTreco1.hidden = YES;
        self.outTocaTreco2.hidden = YES;
        self.imgNota1.hidden = YES;
        self.imgNota2.hidden = YES;
        self.imgNota3.hidden = YES;
        self.imgNota4.hidden = YES;
        self.imgNota5.hidden = YES;
        
        self.outViolaco.hidden = NO;
        self.outFlauta.hidden = NO;
        self.outPiano.hidden = NO;
        
        self.outBtoStartIntro.tag = 3;
        
    }else if(self.outBtoStartIntro.tag == 3){
        NSLog(@"Aqui chamará a próxima aula");
    }
    
}
@end
