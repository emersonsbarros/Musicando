//
//  Mod1Aula2Exe2ViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula2Exe2ViewController.h"

@interface Mod1Aula2Exe2ViewController ()

@end

@implementation Mod1Aula2Exe2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    [[EfeitoTransicao sharedManager]finalizaExercicio:self];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Add barra,Mascote,View de Retornar Pagina ao Xib
    [[EfeitoComponeteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    self.imgTocaTreco = [TocaTrecoViewController sharedManager].imgTocaTreco;
    
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    SEL selectors1 = @selector(pulaFalaMascote);
    [[MascoteViewController sharedManager]addGesturePassaFalaMascote:self.viewGesturePassaFala :selectors1:self];
    [[RetornaPaginaViewController sharedManager]addGesturePassaFalaMascote:[RetornaPaginaViewController sharedManager].viewRetornaPagina:selectors1:self];
    
    
    self.listaImagensColisao = [[NSMutableArray alloc]init];
    [self.listaImagensColisao addObject:self.imgApito];
    [self.listaImagensColisao addObject:self.imgTeclaPiano];
    [self.listaImagensColisao addObject:self.imgTelefone];
    [self.listaImagensColisao addObject:self.imgLeao];
    [self.listaImagensColisao addObject:self.imgGraficoGrave];
    [self.listaImagensColisao addObject:self.imgGraficoAgudo];
    [self.listaImagensColisao addObject:self.imgPianoTimbre];
    [self.listaImagensColisao addObject:self.imgCristalTimbre];
    [self.listaImagensColisao addObject:self.imgViolaoTimbre];
    [self.listaImagensColisao addObject:self.imgMusicaTocar];
    //Add gesture arrastar em todas imagens dessa lista
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImagensColisao];
    
    
    //Lista para saber se as colisoes na tela foram feitas p/ ir na prox fala
    self.listaLiberaFala = [[NSMutableArray alloc]init];
    //seta com alguma coisa para add uma coisa nao nula
    self.estadoAux1 = @"0";
    
    
    //Biblioteca
    self.lblFalaDoMascote = [MascoteViewController sharedManager].lblFalaDoMascote;
    self.testaBiblio = [MascoteViewController sharedManager].testaBiblio;
    self.testaConversa = [MascoteViewController sharedManager].testaConversa;
    self.imagemDoMascote2 = [MascoteViewController sharedManager].imagemDoMascote2;
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote2];
    
    
    [self pulaFalaMascote];
    
    
}

//////////////////////////// Colisoes //////////////////////////////


-(void) checkColisaoPiano:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgTeclaPiano.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgTeclaPiano.hidden = true;
        self.imgTeclaPiano.frame = self.imgTeclaPiano.frame;
        self.lblVisorTocaTreco.text = @"Grave";
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"P200 Piano A#2" withExtension:@"caf"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
        [theTimer invalidate];
    }
    
}

-(void) checkColisaoTelefone:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgTelefone.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgTelefone.hidden = true;
        self.imgTelefone.frame = self.imgTelefone.frame;
        self.lblVisorTocaTreco.text = @"Agudo";
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"telefone" withExtension:@"mp3"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
        [theTimer invalidate];
    }
    
}

-(void) checkColisaoLeao:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgLeao.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgLeao.hidden = true;
        self.imgLeao.frame = self.imgLeao.frame;
        self.lblVisorTocaTreco.text = @"Grave";
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"leao" withExtension:@"wav"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
        [theTimer invalidate];
    }
    
}

-(void) checkColisaoApito:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgApito.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgApito.hidden = true;
        self.imgApito.frame = self.imgApito.frame;
        self.lblVisorTocaTreco.text = @"Agudo";
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"apito" withExtension:@"wav"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
        [theTimer invalidate];
    }
    
}

-(void) checkColisaoGraficoAgudo:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgGraficoAgudo.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgGraficoAgudo.hidden = true;
        self.lblVisorTocaTreco.text = @"Agudo";
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"apito" withExtension:@"wav"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
        [theTimer invalidate];
    }
    
}

-(void) checkColisaoGraficoGrave:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgGraficoGrave.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgGraficoGrave.hidden = true;
        self.lblVisorTocaTreco.text = @"Grave";
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"P200 Piano A#2" withExtension:@"caf"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        [theTimer invalidate];
    }
    
}

-(void)checkColisaoPianoPonto:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPianoPonto.layer.presentationLayer;
    id presentationLayer2 = self.imgPianoTimbre.layer.presentationLayer;
    id presentationLayer3 = self.imgCristalTimbre.layer.presentationLayer;
    id presentationLayer4 = self.imgViolaoTimbre.layer.presentationLayer;
    
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    BOOL nowIntersecting2 = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer3 frame]);
    BOOL nowIntersecting3 = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer4 frame]);
    
    if (nowIntersecting){
        self.imgPianoTimbre.frame = CGRectMake(self.imgPianoPonto.frame.origin.x,
                                               self.imgPianoPonto.frame.origin.y,
                                               self.imgPianoTimbre.frame.size.width,
                                               self.imgPianoTimbre.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.imgPianoTimbre];
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"pianoPonto" withExtension:@"mp3"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
        [theTimer invalidate];
    }
    
    if (nowIntersecting2){
        [UIView animateWithDuration:2.0
                              delay:0.0
                            options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             self.imgCristalTimbre.frame = CGRectMake(self.imgPianoPonto.frame.origin.x,
                                                                      self.imgPianoPonto.frame.origin.y+200,
                                                                      self.imgCristalTimbre.frame.size.width,
                                                                      self.imgCristalTimbre.frame.size.height);
                         }
                         completion:(NULL)];
        
        
    }
    
    if (nowIntersecting3){
        [UIView animateWithDuration:2.0
                              delay:0.0
                            options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             self.imgViolaoTimbre.frame = CGRectMake(self.imgPianoPonto.frame.origin.x,
                                                                     self.imgPianoPonto.frame.origin.y+200,
                                                                     self.imgViolaoTimbre.frame.size.width,
                                                                     self.imgViolaoTimbre.frame.size.height);
                         }
                         completion:(NULL)];
        
        
    }
    
}

-(void)checkColisaoCristalPonto:(NSTimer *) theTimer{
    
    id presentationLayer1 = self.imgCristalTimbrePonto.layer.presentationLayer;
    id presentationLayer2 = self.imgCristalTimbre.layer.presentationLayer;
    id presentationLayer3 = self.imgPianoTimbre.layer.presentationLayer;
    id presentationLayer4 = self.imgViolaoTimbre.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    BOOL nowIntersecting2 = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer3 frame]);
    BOOL nowIntersecting3 = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer4 frame]);
    
    if (nowIntersecting){
        self.imgCristalTimbre.frame = CGRectMake(self.imgCristalTimbrePonto.frame.origin.x,
                                                 self.imgCristalTimbrePonto.frame.origin.y,
                                                 self.imgCristalTimbre.frame.size.width,
                                                 self.imgCristalTimbre.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.imgCristalTimbre];
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"musicaCristal" withExtension:@"mp3"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
        [theTimer invalidate];
    }
    
    if (nowIntersecting2){
        [UIView animateWithDuration:2.0
                              delay:0.0
                            options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             self.imgPianoTimbre.frame = CGRectMake(self.imgCristalTimbrePonto.frame.origin.x,
                                                                    self.imgCristalTimbrePonto.frame.origin.y+200,
                                                                    self.imgPianoTimbre.frame.size.width,
                                                                    self.imgPianoTimbre.frame.size.height);
                         }
                         completion:(NULL)];
        
        
    }
    
    if (nowIntersecting3){
        [UIView animateWithDuration:2.0
                              delay:0.0
                            options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             self.imgViolaoTimbre.frame = CGRectMake(self.imgCristalTimbrePonto.frame.origin.x,
                                                                     self.imgCristalTimbrePonto.frame.origin.y+200,
                                                                     self.imgViolaoTimbre.frame.size.width,
                                                                     self.imgViolaoTimbre.frame.size.height);
                         }
                         completion:(NULL)];
        
        
    }
    
    
}


-(void)checkColisaoViolaoPonto:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgViolaoPonto.layer.presentationLayer;
    id presentationLayer2 = self.imgViolaoTimbre.layer.presentationLayer;
    id presentationLayer3 = self.imgPianoTimbre.layer.presentationLayer;
    id presentationLayer4 = self.imgCristalTimbre.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    BOOL nowIntersecting2 = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer3 frame]);
    BOOL nowIntersecting3 = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer4 frame]);
    
    if (nowIntersecting){
        self.imgViolaoTimbre.frame = CGRectMake(self.imgViolaoPonto.frame.origin.x,
                                                self.imgViolaoPonto.frame.origin.y,
                                                self.imgViolaoTimbre.frame.size.width,
                                                self.imgViolaoTimbre.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.imgViolaoTimbre];
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"violaoPonto" withExtension:@"wav"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
        [theTimer invalidate];
    }
    
    
    if (nowIntersecting2){
        [UIView animateWithDuration:2.0
                              delay:0.0
                            options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             self.imgPianoTimbre.frame = CGRectMake(self.imgViolaoPonto.frame.origin.x,
                                                                    self.imgViolaoPonto.frame.origin.y+200,
                                                                    self.imgPianoTimbre.frame.size.width,
                                                                    self.imgPianoTimbre.frame.size.height);
                         }
                         completion:(NULL)];
        
        
    }
    
    if (nowIntersecting3){
        [UIView animateWithDuration:2.0
                              delay:0.0
                            options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             self.imgCristalTimbre.frame = CGRectMake(self.imgViolaoPonto.frame.origin.x,
                                                                      self.imgViolaoPonto.frame.origin.y+200,
                                                                      self.imgCristalTimbre.frame.size.width,
                                                                      self.imgCristalTimbre.frame.size.height);
                         }
                         completion:(NULL)];
        
        
    }
    
}


-(void) checkMusicaTocar:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgMusicaTocar.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgMusicaTocar.hidden = true;
        self.imgMusicaTocar.frame = self.imgTelefone.frame;
        //[self.listaLiberaFala addObject:self.estadoAux2];
        
        [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.volume];
        
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"musicaManeira" withExtension:@"mp3"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio:1:0.0];
        
        [theTimer invalidate];
    }
    
}


///////////////////////////////////////////////////////////////////

-(void)caiPilar:(UILabel*)texto{
    self.imgPilar1Altura.frame = self.posOriginalPilar;
    [UIView animateWithDuration:3.0
                          delay:0.1
                        options:  UIViewAnimationOptionCurveEaseInOut  | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect move = CGRectMake(self.imgPilar1Altura.frame.origin.x,
                                                  self.imgPilar1Altura.frame.origin.y+600,
                                                  self.imgPilar1Altura.frame.size.width,
                                                  self.imgPilar1Altura.frame.size.height);
                         self.imgPilar1Altura.frame = move ;
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"barulhoPilarCaindo" withExtension:@"mp3"];
                         [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
                         
                         [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.lblPilar];
                     }];
    
    
    
}

-(void)chamaMetodosFala1{
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPilar1Altura];
    
    self.posOriginalPilar = self.imgPilar1Altura.frame;
    
    self.lblPilar.text = @"Altura";
    [self performSelector:@selector(caiPilar:) withObject:self.lblPilar afterDelay:0.2];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}


-(void)chamaMetodosFala2{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.lblPilar];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPilar1Altura];
    
    self.imgTocaTreco.hidden = NO;
    self.imgTeclaPiano.hidden = NO;
    self.imgTelefone.hidden = NO;
    self.imgLeao.hidden = NO;
    self.imgApito.hidden = NO;
    self.lblVisorTocaTreco.hidden = NO;
    
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImagensColisao];
    
    self.imgTocaTreco.userInteractionEnabled = YES;
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPiano:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoTelefone:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoLeao:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoApito:)
                                   userInfo: nil
                                    repeats: YES];
    
    //Metodo que verifica o passar fala, nele tem que passar a qt de objetos que colidirá nessa fala, no caso 3
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:4];
    
    
}

-(void)chamaMetodosFala3{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgTocaTreco];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgTeclaPiano];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgTelefone];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgLeao];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgApito];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.lblVisorTocaTreco];
    self.lblVisorTocaTreco.text =@"";
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgFrequencia];
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgFrequencia.frame.origin.x+30,
                                                      self.imgFrequencia.frame.origin.y+50,
                                                      self.imgFrequencia.frame.size.width,
                                                      self.imgFrequencia.frame.size.height);
                         self.imgFrequencia.frame = moveGalo;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}


-(void)chamaMetodosFala4{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgFrequencia];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgTocaTreco];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.lblVisorTocaTreco];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgGraficoAgudo];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgGraficoGrave];
    
    
    self.posOriginalGrave = self.imgGraficoGrave.frame;
    self.posOriginalAgudo = self.imgGraficoAgudo.frame;
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoGraficoAgudo:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoGraficoGrave:)
                                   userInfo: nil
                                    repeats: YES];
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:2];
    
    
}

-(void)mostraNumeroOndinhas{
    
    UIImageView *traco = [[UIImageView alloc]init];
    traco.backgroundColor = [UIColor redColor];
    traco.frame = CGRectMake(0,-5,100,5);
    traco.hidden = YES;
    UILabel *numero = [[UILabel alloc]init];
    numero.text = @"2";
    numero.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    numero.frame = CGRectMake(40,-50,100,50);
    numero.hidden = YES;
    [self.imgGraficoAgudo addSubview:numero];
    [self.imgGraficoAgudo addSubview:traco];
    
    
    UIImageView *traco2 = [[UIImageView alloc]init];
    traco2.backgroundColor = [UIColor redColor];
    traco2.frame = CGRectMake(0,-5,100,5);
    traco2.hidden = YES;
    UILabel *numero2 = [[UILabel alloc]init];
    numero2.text = @"1";
    numero2.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    numero2.frame = CGRectMake(40,-50,100,50);
    numero2.hidden = YES;
    [self.imgGraficoGrave addSubview:numero2];
    [self.imgGraficoGrave addSubview:traco2];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:numero];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:numero2];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:traco];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:traco2];
    
}

-(void)chamaMetodosFala5{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]removeTodasAnimacoesView:self.imgFrequencia];
    
    self.imgGraficoGrave.image = [UIImage imageNamed:@"graficoGrave.jpg"];
    self.imgGraficoAgudo.image = [UIImage imageNamed:@"graficoAgudo.jpg"];
    
    [[EfeitoImagem sharedManager]tiraGestureObjeto:self.imgGraficoAgudo];
    [[EfeitoImagem sharedManager]tiraGestureObjeto:self.imgGraficoGrave];
    
    self.imgGraficoGrave.frame = self.posOriginalGrave;
    self.imgGraficoAgudo.frame = self.posOriginalAgudo;
    
    CGRect tam = CGRectMake(self.imgGraficoGrave.frame.origin.x+140, self.imgGraficoGrave.frame.origin.y, self.imgGraficoGrave.frame.size.width+200, self.imgGraficoGrave.frame.size.height);
    CGRect tam2 = CGRectMake(self.imgGraficoAgudo.frame.origin.x, self.imgGraficoAgudo.frame.origin.y, self.imgGraficoAgudo.frame.size.width+200, self.imgGraficoAgudo.frame.size.height);
    
    self.imgGraficoGrave.frame = tam;
    self.imgGraficoAgudo.frame = tam2;
    
    self.imgTocaTreco.hidden = YES;
    self.lblVisorTocaTreco.hidden = YES;
    self.imgGraficoAgudo.hidden =NO;
    self.imgGraficoGrave.hidden=NO;
    
    [NSTimer scheduledTimerWithTimeInterval: 2.0
                                     target: self
                                   selector: @selector(mostraNumeroOndinhas)
                                   userInfo: nil
                                    repeats: NO];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:8.0f:self.viewGesturePassaFala];
    
}

-(void)chamaMetodosFala6{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    self.imgGraficoAgudo.hidden =YES;
    self.imgGraficoGrave.hidden=YES;
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPilar1Altura];
    
    self.lblPilar.text = @"Timbre";
    [self performSelector:@selector(caiPilar:) withObject:self.lblPilar afterDelay:0.2];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala7{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.lblPilar];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPilar1Altura];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgTocaTreco];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgCristalTimbre];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgCristalTimbrePonto];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPianoTimbre];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPianoPonto];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgViolaoTimbre];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgViolaoPonto];
    
    self.imgNotaMusicalCaindo.layer.zPosition = -11;
    
    UITapGestureRecognizer *tapCristal = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tocaCristal)];
    tapCristal.numberOfTouchesRequired = 1;
    tapCristal.enabled = YES;
    self.imgCristalTimbrePonto.userInteractionEnabled = YES;
    [self.imgCristalTimbrePonto addGestureRecognizer:tapCristal];
    
    UITapGestureRecognizer *tapPiano = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tocaPiano)];
    tapPiano.numberOfTouchesRequired = 1;
    tapPiano.enabled = YES;
    self.imgPianoPonto.userInteractionEnabled = YES;
    [self.imgPianoPonto addGestureRecognizer:tapPiano];
    
    UITapGestureRecognizer *tapViolao = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tocaViolao)];
    tapViolao.numberOfTouchesRequired = 1;
    tapViolao.enabled = YES;
    self.imgViolaoPonto.userInteractionEnabled = YES;
    [self.imgViolaoPonto addGestureRecognizer:tapViolao];
    
    
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPianoPonto:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoCristalPonto:)
                                   userInfo: nil
                                    repeats: YES];
    
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoViolaoPonto:)
                                   userInfo: nil
                                    repeats: YES];
    
    
    
    //Metodo que verifica o passar fala, nele tem que passar a qt de objetos que colidirá nessa fala, no caso 3
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:3];
    
}

-(void)chamaMetodosFala8{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgTocaTreco];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgCristalTimbre];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgCristalTimbrePonto];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPianoTimbre];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPianoPonto];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgViolaoTimbre];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgViolaoPonto];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgFrequenciaDiapasao];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgFrequenciaFlauta];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgFrequenciaHomen];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgFrequenciaViolino];
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgFrequenciaFlauta.frame.origin.x+450,
                                                      self.imgFrequenciaFlauta.frame.origin.y,
                                                      self.imgFrequenciaFlauta.frame.size.width,
                                                      self.imgFrequenciaFlauta.frame.size.height);
                         
                         self.imgFrequenciaFlauta.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                     }];
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgFrequenciaHomen.frame.origin.x+600,
                                                      self.imgFrequenciaHomen.frame.origin.y,
                                                      self.imgFrequenciaHomen.frame.size.width,
                                                      self.imgFrequenciaHomen.frame.size.height);
                         
                         self.imgFrequenciaHomen.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                     }];
    
    
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgFrequenciaDiapasao.frame.origin.x+800,
                                                      self.imgFrequenciaDiapasao.frame.origin.y,
                                                      self.imgFrequenciaDiapasao.frame.size.width,
                                                      self.imgFrequenciaDiapasao.frame.size.height);
                         
                         self.imgFrequenciaDiapasao.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                     }];
    
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgFrequenciaViolino.frame.origin.x+700,
                                                      self.imgFrequenciaViolino.frame.origin.y,
                                                      self.imgFrequenciaViolino.frame.size.width,
                                                      self.imgFrequenciaViolino.frame.size.height);
                         
                         self.imgFrequenciaViolino.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                     }];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    //passar varias imagens infinatamente de lado, com timbre de varios instrumentos.
}

-(void)chamaMetodosFala9{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgFrequenciaDiapasao];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgFrequenciaFlauta];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgFrequenciaHomen];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgFrequenciaViolino];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPilar1Altura];
    
    
    self.lblPilar.text = @"Volume";
    [self performSelector:@selector(caiPilar:) withObject:self.lblPilar afterDelay:0.2];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}

- (IBAction)btnVolume:(id)sender {
    [[EfeitoPlayer sharedManager]mudaVolume:self.volume.value *10];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:2.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala10{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.lblPilar];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPilar1Altura];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkMusicaTocar:)
                                   userInfo: nil
                                    repeats: YES];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgTocaTreco];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgMusicaTocar];
    
    
}

-(void)mostraNumeroAmplitude{
    
    UIImageView *traco = [[UIImageView alloc]init];
    traco.backgroundColor = [UIColor redColor];
    traco.frame = CGRectMake(28,8,5,78);
    traco.hidden = YES;
    [self.imgAmplitude addSubview:traco];
    
    
    UIImageView *traco2 = [[UIImageView alloc]init];
    traco2.backgroundColor = [UIColor redColor];
    traco2.frame = CGRectMake(27,210,5,40);
    traco2.hidden = YES;
    [self.imgAmplitude addSubview:traco2];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:traco];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:traco2];
}

-(void)chamaMetodosFala11{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoPlayer sharedManager]stopAudio];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgTocaTreco];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.volume];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgAmplitude];
    
    [NSTimer scheduledTimerWithTimeInterval: 2.0
                                     target: self
                                   selector: @selector(mostraNumeroAmplitude)
                                   userInfo: nil
                                    repeats: NO];
    
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala12{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgAmplitude];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPilar1Altura];
    
    self.lblPilar.text = @"Duracao";
    [self performSelector:@selector(caiPilar:) withObject:self.lblPilar afterDelay:0.2];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}

-(void)andaCoelho{
    //self.imgCoelho.frame = self.posOriginalPilar;
    [UIView animateWithDuration:2.0
                          delay:0.1
                        options:  UIViewAnimationOptionCurveEaseInOut  | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect move = CGRectMake(self.imgLinhaChegada.frame.origin.x,
                                                  self.imgCoelho.frame.origin.y,
                                                  self.imgCoelho.frame.size.width,
                                                  self.imgCoelho.frame.size.height);
                         self.imgCoelho.frame = move ;
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"corridaCoelho" withExtension:@"wav"];
                         [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
                     }
                     completion:^(BOOL finished){
                         
                         [self.listaLiberaFala addObject:self.estadoAux1];
                     }];
}

-(void)andaTartaruga{
    [UIView animateWithDuration:7.0
                          delay:0.1
                        options:  UIViewAnimationOptionCurveEaseInOut  | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect move = CGRectMake(self.imgLinhaChegada.frame.origin.x,
                                                  self.imgTartaruga.frame.origin.y,
                                                  self.imgTartaruga.frame.size.width,
                                                  self.imgTartaruga.frame.size.height);
                         self.imgTartaruga.frame = move ;
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"corridaTartaruga" withExtension:@"wav"];
                         [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
                     }
                     completion:^(BOOL finished){
                         
                         [self.listaLiberaFala addObject:self.estadoAux1];
                     }];
}

-(void)chamaMetodosFala13{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.lblPilar];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPilar1Altura];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgLinhaChegada];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgCoelho];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgTartaruga];
    
    
    UITapGestureRecognizer *tapCristal = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(andaCoelho)];
    tapCristal.numberOfTouchesRequired = 1;
    tapCristal.enabled = YES;
    self.imgCoelho.userInteractionEnabled = YES;
    [self.imgCoelho addGestureRecognizer:tapCristal];
    
    UITapGestureRecognizer *tapCristal2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(andaTartaruga)];
    tapCristal2.numberOfTouchesRequired = 1;
    tapCristal2.enabled = YES;
    self.imgTartaruga.userInteractionEnabled = YES;
    [self.imgTartaruga addGestureRecognizer:tapCristal2];
    
    
    //Metodo que verifica o passar fala, nele tem que passar a qt de objetos que colidirá nessa fala, no caso 3
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:2];
    
    
}



-(void)pulaFalaMascote{
    //Usa pra não dar erro de nulo na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    
    [[BarraSuperiorViewController sharedManager]txtNumeroAulaAtual].text = [NSString stringWithFormat:@"%d",1+[MascoteViewController sharedManager].contadorDeFalas];
    
    if([MascoteViewController sharedManager].contadorDeFalas == contadorMaximo){
        NSString *proxExercicio = [[Biblioteca sharedManager]exercicioAtual].nomeView;
        [[EfeitoTransicao sharedManager]chamaViewTransicaoExercicio:self:proxExercicio];
    }
    
    if([MascoteViewController sharedManager].contadorDeFalas < contadorMaximo){
        switch ([MascoteViewController sharedManager].contadorDeFalas) {
            case 0:
                [self chamaMetodosFala1];
                break;
            case 1:
                [self chamaMetodosFala2];
                break;
            case 2:
                [self chamaMetodosFala3];
                break;
            case 3:
                [self chamaMetodosFala4];
                break;
            case 4:
                [self chamaMetodosFala5];
                break;
            case 5:
                [self chamaMetodosFala6];
                break;
            case 6:
                [self chamaMetodosFala7];
                break;
            case 7:
                [self chamaMetodosFala8];
                break;
            case 8:
                [self chamaMetodosFala9];
                break;
            case 9:
                [self chamaMetodosFala10];
                break;
            case 10:
                [self chamaMetodosFala11];
                break;
            case 11:
                [self chamaMetodosFala12];
                break;
            case 12:
                [self chamaMetodosFala13];
                break;
            default:
                break;
        }
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:[MascoteViewController sharedManager].contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        [MascoteViewController sharedManager].contadorDeFalas += 1;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
///////////////////////////////// METODOS AUXILIARES ///////////////////////



-(void)tocaViolao{
    CGRect posOriginal = self.imgNotaMusicalCaindo.frame;
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.imgNotaMusicalCaindo.frame = CGRectMake(self.imgNotaMusicalCaindo.frame.origin.x,
                                                                      self.imgTocaTreco.frame.origin.y+30,
                                                                      self.imgNotaMusicalCaindo.frame.size.width,
                                                                      self.imgNotaMusicalCaindo.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         self.imgNotaMusicalCaindo.frame = posOriginal;
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"violaoPonto" withExtension:@"wav"];
                         [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
                         
                     }];
}

-(void)tocaCristal{
    CGRect posOriginal = self.imgNotaMusicalCaindo.frame;
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.imgNotaMusicalCaindo.frame = CGRectMake(self.imgNotaMusicalCaindo.frame.origin.x,
                                                                      self.imgTocaTreco.frame.origin.y+30,
                                                                      self.imgNotaMusicalCaindo.frame.size.width,
                                                                      self.imgNotaMusicalCaindo.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         self.imgNotaMusicalCaindo.frame = posOriginal;
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"musicaCristal" withExtension:@"mp3"];
                         [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
                     }];
}

-(void)tocaPiano{
    CGRect posOriginal = self.imgNotaMusicalCaindo.frame;
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.imgNotaMusicalCaindo.frame = CGRectMake(self.imgNotaMusicalCaindo.frame.origin.x,
                                                                      self.imgTocaTreco.frame.origin.y+30,
                                                                      self.imgNotaMusicalCaindo.frame.size.width,
                                                                      self.imgNotaMusicalCaindo.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         self.imgNotaMusicalCaindo.frame = posOriginal;
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"pianoPonto" withExtension:@"mp3"];
                         [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
                         
                     }];
}



@end
