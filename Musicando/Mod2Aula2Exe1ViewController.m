//
//  Mod2Aula2Exe1ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod2Aula2Exe1ViewController.h"

@interface Mod2Aula2Exe1ViewController ()

@end

@implementation Mod2Aula2Exe1ViewController

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ///Add barra,Mascote,View de Retornar Pagina ao Xib
    [[EfeitoComponeteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    self.imgTocaTreco = [TocaTrecoViewController sharedManager].imgTocaTreco;
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    SEL selectors1 = @selector(pulaFalaMascote);
    [[MascoteViewController sharedManager]addGesturePassaFalaMascote:self.viewGesturePassaFala :selectors1:self];
    [[RetornaPaginaViewController sharedManager]addGesturePassaFalaMascote:[RetornaPaginaViewController sharedManager].viewRetornaPagina:selectors1:self];
    
    
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    //Add imagens que faram colisao
    [self.listaImangesColisao addObject:self.imgNotaComPausa];
    [self.listaImangesColisao addObject:self.imgNotaSemPausa];
    [self.listaImangesColisao addObject:self.imgColisaoSom];
    [self.listaImangesColisao addObject:self.imgColisaoPausa];
    [self.listaImangesColisao addObject:self.imgColisaoNota];
    //Add gesture arrastar em todas imagens dessa lista
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImangesColisao];
    
    
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

-(void)tocarMusicaNotasComPausas {
    self.listaSons = [[NSMutableArray alloc]init];
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"C";
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    
    Nota *aux2 = [[Nota alloc]init];
    aux2.nomeNota = @"D";
    aux2.oitava = @"5";
    aux2.tom = @"";
    aux2.tipoNota = @"quarter";
    
    Nota *aux3 = [[Nota alloc]init];
    aux3.nomeNota = @"E";
    aux3.oitava = @"5";
    aux3.tom = @"";
    aux3.tipoNota = @"quarter";
    
    Nota *aux4 = [[Nota alloc]init];
    aux4.nomeNota = @"F";
    aux4.oitava = @"5";
    aux4.tom = @"";
    aux4.tipoNota = @"quarter";
    
    Nota *aux5 = [[Nota alloc]init];
    aux5.nomeNota = @"G";
    aux5.oitava = @"5";
    aux5.tom = @"";
    aux5.tipoNota = @"quarter";
    
    Nota *aux6 = [[Nota alloc]init];
    aux6.nomeNota = @"A";
    aux6.oitava = @"5";
    aux6.tom = @"";
    aux6.tipoNota = @"quarter";
    
    
    [self.listaSons addObject:aux];
    [self.listaSons addObject:aux2];
    [self.listaSons addObject:aux3];
    [self.listaSons addObject:aux4];
    [self.listaSons addObject:aux5];
    [self.listaSons addObject:aux6];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
}

-(void)tocarMusicaNotasSemPausa{
    self.listaSons = [[NSMutableArray alloc]init];
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"C";
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    
    Nota *aux2 = [[Nota alloc]init];
    aux2.nomeNota = @"D";
    aux2.oitava = @"5";
    aux2.tom = @"";
    aux2.tipoNota = @"quarter";
    
    Nota *aux22 = [[Nota alloc]init];
    aux22.nomeNota = @"";
    aux22.oitava = @"";
    aux22.tom = @"";
    aux22.tipoNota = @"quarter";
    
    Nota *aux3 = [[Nota alloc]init];
    aux3.nomeNota = @"E";
    aux3.oitava = @"5";
    aux3.tom = @"";
    aux3.tipoNota = @"quarter";
    
    Nota *aux23 = [[Nota alloc]init];
    aux23.nomeNota = @"";
    aux23.oitava = @"";
    aux23.tom = @"";
    aux23.tipoNota = @"quarter";
    
    Nota *aux4 = [[Nota alloc]init];
    aux4.nomeNota = @"F";
    aux4.oitava = @"5";
    aux4.tom = @"";
    aux4.tipoNota = @"quarter";
    
    Nota *aux5 = [[Nota alloc]init];
    aux5.nomeNota = @"G";
    aux5.oitava = @"5";
    aux5.tom = @"";
    aux5.tipoNota = @"quarter";
    
    
    Nota *aux55 = [[Nota alloc]init];
    aux55.nomeNota = @"";
    aux55.oitava = @"";
    aux55.tom = @"";
    aux55.tipoNota = @"quarter";
    
    Nota *aux6 = [[Nota alloc]init];
    aux6.nomeNota = @"A";
    aux6.oitava = @"5";
    aux6.tom = @"";
    aux6.tipoNota = @"quarter";
    
    
    [self.listaSons addObject:aux];
    [self.listaSons addObject:aux2];
    [self.listaSons addObject:aux22];
    [self.listaSons addObject:aux3];
    [self.listaSons addObject:aux23];
    [self.listaSons addObject:aux4];
    [self.listaSons addObject:aux5];
    [self.listaSons addObject:aux55];
    [self.listaSons addObject:aux6];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
}

-(void) checkMusicaTocarComPausa:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgNotaComPausa.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgNotaComPausa.hidden = true;
        self.imgNotaComPausa.frame = self.imgTocaTreco.frame;
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        [self tocarMusicaNotasSemPausa];
        
        [theTimer invalidate];
    }
    
}


-(void) checkMusicaTocarSemPausa:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgNotaSemPausa.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgNotaSemPausa.hidden = true;
        self.imgNotaSemPausa.frame = self.imgTocaTreco.frame;
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        [self tocarMusicaNotasComPausas];
        
        [theTimer invalidate];
    }
    
}


-(void)checkColisaoSom:(NSTimer *) theTimer{
    
        id presentationLayer1 = self.imgPontoSom.layer.presentationLayer;
    id presentationLayer2 = self.imgColisaoSom.layer.presentationLayer;
    
        BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
        
        if (nowIntersecting){
            self.imgColisaoSom.frame = CGRectMake(self.imgPontoSom.frame.origin.x,
                                                     self.imgPontoSom.frame.origin.y,
                                                     self.imgColisaoSom.frame.size.width,
                                                     self.imgColisaoSom.frame.size.height);
            [[EfeitoImagem sharedManager]tiraGestureObjeto:self.imgColisaoSom];
            [self.listaLiberaFala addObject:self.estadoAux1];
            
            self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"panela" withExtension:@"mp3"];
            self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
            [[self audioPlayer]play];
            
            [theTimer invalidate];
        }
    
    
}

-(void)checkColisaoNota:(NSTimer *) theTimer{
    
    id presentationLayer1 = self.imgPontoNota.layer.presentationLayer;
    id presentationLayer2 = self.imgColisaoNota.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgColisaoNota.frame = CGRectMake(self.imgPontoNota.frame.origin.x,
                                              self.imgPontoNota.frame.origin.y,
                                              self.imgColisaoNota.frame.size.width,
                                              self.imgColisaoNota.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.imgColisaoNota];
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        Nota *aux = [[Nota alloc]init];
        self.listaSons = [[NSMutableArray alloc]init];
        aux.nomeNota = @"C";
        aux.oitava = @"6";
        aux.tom = @"";
        aux.tipoNota = @"quarter";
        [self.listaSons addObject:aux];
        [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
        
        [theTimer invalidate];
    }
    
    
}

-(void)checkColisaoPausa:(NSTimer *) theTimer{
    
    id presentationLayer1 = self.imgPontoPausa.layer.presentationLayer;
    id presentationLayer2 = self.imgColisaoPausa.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgColisaoPausa.frame = CGRectMake(self.imgPontoPausa.frame.origin.x,
                                              self.imgPontoPausa.frame.origin.y,
                                              self.imgColisaoPausa.frame.size.width,
                                              self.imgColisaoPausa.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.imgColisaoPausa];
        [self.listaLiberaFala addObject:self.estadoAux1];
        
       
        
        [theTimer invalidate];
    }
    
    
}
//////////////////////////////////////// METODOS FALA ////////////////////////////////////////

//Add gesture passar de fala a view que fica por cima do mascote, usei por cauda do problema da animacao
-(void)addGesturePassaFalaMascote:(UIView*)viewGesture{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = NO;
    viewGesture.userInteractionEnabled = NO;
    [viewGesture addGestureRecognizer:singleTap];
    
}

//Gerencia o passa de falas
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
                [self performSelector:@selector(chamaMetodosFala0) withObject:NULL afterDelay:0.2];
                break;
            case 1:
                [self chamaMetodosFala1];
                break;
            case 2:
                [self chamaMetodosFala2];
                break;
            case 3:
                [self chamaMetodosFala3];
                break;
            case 4:
                [self chamaMetodosFala4];
                break;
            case 5:
                [self chamaMetodosFala5];
                break;
                
                
            default:
                break;
        }
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:[MascoteViewController sharedManager].contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        [MascoteViewController sharedManager].contadorDeFalas += 1;
        
    }
}

-(void)chamaMetodosFala0{

    UILabel *txtPilar2 = [[UILabel alloc]init];
    txtPilar2.text = @"Duracao";
    txtPilar2.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtPilar2.frame = CGRectMake(-20,150,100,300);
    [txtPilar2 sizeToFit];
    txtPilar2.textAlignment = NSTextAlignmentCenter;
    [txtPilar2 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.pilar3 addSubview:txtPilar2];
    
    UILabel *txtBase = [[UILabel alloc]init];
    txtBase.text = @"Pausa Musical";
    txtBase.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtBase.frame = CGRectMake(170,5,100,300);
    [txtBase sizeToFit];
    txtBase.textAlignment = NSTextAlignmentCenter;
    [self.base addSubview:txtBase];
    
    self.base.hidden = NO;
    self.pilar3.hidden = NO;
    
    [UIView animateWithDuration:3.0
                          delay:4.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.base.frame.origin.x,
                                                      self.base.frame.origin.y+170,
                                                      self.base.frame.size.width,
                                                      self.base.frame.size.height);
                         self.base.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"barulhoBasePilar" withExtension:@"wav"];
                         self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
                         [[self audioPlayer]play];
                         [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
                     }];

    [UIView animateWithDuration:3.0
                          delay:1.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar3.frame.origin.x,
                                                      self.pilar3.frame.origin.y+500,
                                                      self.pilar3.frame.size.width,
                                                      self.pilar3.frame.size.height);
                         self.pilar3.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"barulhoPilarCaindo" withExtension:@"mp3"];
                         self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
                         [[self audioPlayer]play];
                     }];

    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:6.0f:self.viewGesturePassaFala];
    
}

-(void)chamaMetodosFala1{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.pilar3];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.base];
    
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"x.png"]];
    img.frame = CGRectMake(img.frame.origin.x,img.frame.origin.y,self.imgNotaSemPausa.frame.size.width,self.imgNotaSemPausa.frame.size.height);
    [self.imgNotaSemPausa addSubview:img];

    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgTocaTreco];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgNotaSemPausa];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgNotaComPausa];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkMusicaTocarComPausa:)
                                   userInfo: nil
                                    repeats: YES];
    
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkMusicaTocarSemPausa:)
                                   userInfo: nil
                                    repeats: YES];
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:2];;
    
}

-(void)chamaMetodosFala2{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[self audioPlayer]stop];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgTocaTreco];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgNotaSemPausa];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgNotaComPausa];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPausaDuracao];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPausa];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];

}


-(void)tocaSom{
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
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"panela" withExtension:@"mp3"];
                         self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
                         
                         [[self audioPlayer]play];
                         
                     }];
}

-(void)tocaNota{
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
                         Nota *aux = [[Nota alloc]init];
                         self.listaSons = [[NSMutableArray alloc]init];
                         aux.nomeNota = @"C";
                         aux.oitava = @"6";
                         aux.tom = @"";
                         aux.tipoNota = @"quarter";
                         [self.listaSons addObject:aux];
                         [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
                         
                     }];
}

-(void)tocaPausa{
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
                     }];
}

-(void)chamaMetodosFala3{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPausaDuracao];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPausa];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgTocaTreco];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPontoNota];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPontoPausa];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPontoSom];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgColisaoPausa];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgColisaoNota];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgColisaoSom];
    

    UITapGestureRecognizer *tapCristal = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tocaPausa)];
    tapCristal.numberOfTouchesRequired = 1;
    tapCristal.enabled = YES;
    self.imgPontoPausa.userInteractionEnabled = YES;
    [self.imgPontoPausa addGestureRecognizer:tapCristal];
    
    UITapGestureRecognizer *tapPiano = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tocaSom)];
    tapPiano.numberOfTouchesRequired = 1;
    tapPiano.enabled = YES;
    self.imgPontoSom.userInteractionEnabled = YES;
    [self.imgPontoSom addGestureRecognizer:tapPiano];
    
    UITapGestureRecognizer *tapViolao = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tocaNota)];
    tapViolao.numberOfTouchesRequired = 1;
    tapViolao.enabled = YES;
    self.imgPontoNota.userInteractionEnabled = YES;
    [self.imgPontoNota addGestureRecognizer:tapViolao];
    
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPausa:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoNota:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoSom:)
                                   userInfo: nil
                                    repeats: YES];
    
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:3];
}

-(void)chamaMetodosFala4{
    
}

-(void)chamaMetodosFala5{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
