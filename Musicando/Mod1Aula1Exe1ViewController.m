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

- (IBAction)btnComecar:(id)sender {
    
    //Introducao gesture - pula fala
    self.viewInicialGesture.hidden = YES;
    
    //Add view na lista para add gesture de arrastar
    self.listaImagensCai = [[NSMutableArray alloc]init];
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    [self.listaImangesColisao addObject:self.imgFitaFuracao];
    [self.listaImangesColisao addObject:self.imgFitaGalo];
    [self.listaImangesColisao addObject:self.imgFitaCarro];
    [self.listaImangesColisao addObject:self.imgObjetoMusica1];
    [self.listaImangesColisao addObject:self.imgObjetoMusica2];
    [self.listaImangesColisao addObject:self.imgObjetoMusica3];
    
    //////////////Codigos Mutaveis////////////////
    //Guarda a lista de conversas e falas do mascote
    self.contadorDeFalas = 0;
    self.testaBiblio = [Biblioteca sharedManager];
    self.testaConversa = self.testaBiblio.exercicioAtual.mascote.listaDeConversas.firstObject;
    //Usar sempre que quiser pular uma fala
    [self pulaFalaMascote];
    //Imagem do mascote
    self.imagemDoMascote2.image = [[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image;
    [self.view addSubview: self.imagemDoMascote2];
    [self.view addSubview: self.lblFalaDoMascote];
    //Coloquei essa view para colocar o gesture de pular fala, pois com animation atrapalha
    [self addGesturePassaFalaMascote:self.viewGesturePassaFala];
    
    //Animcao para cair notas
    [self lacoCaindoNotas];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


//////////////////////// Colisoes ///////////////////////////

////// colisao Galo
-(void) checkColisaoGalo:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgFitaGalo.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgFitaGalo.hidden = true;
        self.imgFitaGalo.frame = self.imgTocaTreco.frame;
        [theTimer invalidate];
        [self btnAnimal];
    }
 
}

////// colisao Carro
-(void) checkColisaoCarro:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgFitaCarro.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);

    if (nowIntersecting){
        self.imgFitaCarro.hidden = true;
        self.imgFitaCarro.frame = self.imgFitaCarro.frame;
        [theTimer invalidate];
        [self btnCarro];
    }
    
}

////// colisao Vento
-(void) checkColisaoVento:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgFitaFuracao.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgFitaFuracao.hidden = true;
        self.imgFitaFuracao.frame = self.imgFitaFuracao.frame;
        [theTimer invalidate];
        [self btnVento];
    }
    
}

////// colisao Objeto 1 estranho
-(void) checkColisaoObjeto1:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgObjetoMusica1.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgObjetoMusica1.hidden = true;
        self.imgObjetoMusica1.frame = self.imgObjetoMusica1.frame;
        [theTimer invalidate];
    }
    
}

////// colisao Objeto 2 estranho
-(void) checkColisaoObjeto2:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgObjetoMusica2.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgObjetoMusica2.hidden = true;
        self.imgObjetoMusica2.frame = self.imgObjetoMusica2.frame;
        [theTimer invalidate];
    }
    
}

////// colisao Objeto 3 estranho
-(void) checkColisaoObjeto3:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgObjetoMusica3.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgObjetoMusica3.hidden = true;
        self.imgObjetoMusica3.frame = self.imgObjetoMusica3.frame;
        [theTimer invalidate];
    }
}

////////////////////////////  Metodos de cada Fala /////////////////////////////

-(void)chamaMetodosFala3 {
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoGalo:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoCarro:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoVento:)
                                   userInfo: nil
                                    repeats: YES];
    
    for(UIImageView *img in self.listaImagensCai){
        [img.layer removeAllAnimations];
    }
    
    self.imgTocaTreco.hidden = NO;
 
}


-(void)chamaMetodosFala4 {
    
    self.imgFitaCarro.hidden = NO;
    self.imgFitaGalo.hidden = NO;
    self.imgFitaFuracao.hidden = NO;
    
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImangesColisao];
    
    self.imgTocaTreco.userInteractionEnabled = YES;
    
}

-(void)chamaMetodosFala5 {
    self.imgFitaCarro.hidden = YES;
    self.imgFitaGalo.hidden = YES;
    self.imgFitaFuracao.hidden = YES;
    self.outAlavancaTocaTreco.hidden = NO;
    
}

- (IBAction)btnAlavancaTocaTreco:(id)sender {
    
}


-(void)chamaMetodosFala6 {
    
    self.outAlavancaTocaTreco.hidden = YES;
    self.imgTocaTreco.hidden = YES;
    [self lacoCaindoNotas];
    
}


-(void)chamaMetodosFala7 {
    
    for(UIImageView *img in self.listaImagensCai){
        [img.layer removeAllAnimations];
    }
    
    self.imgObjetoMusica1.hidden = NO;
    self.imgObjetoMusica2.hidden = NO;
    self.imgObjetoMusica3.hidden = NO;
    self.imgTocaTreco.hidden = NO;
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoObjeto1:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoObjeto2:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoObjeto3:)
                                   userInfo: nil
                                    repeats: YES];
}

-(void)chamaMetodosFala8 {
    self.imgObjetoMusica1.hidden = YES;
    self.imgObjetoMusica2.hidden = YES;
    self.imgObjetoMusica3.hidden = YES;
    self.imgTocaTreco.hidden = YES;
}

-(void)pulaFalaMascote{
    int contadorMaximo = self.testaConversa.listaDeFalas.count;
    
    if(self.contadorDeFalas < contadorMaximo){
        switch (self.contadorDeFalas) {
            case 0:
                break;
            case 1:
                break;
            case 2:
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
            case 6:
                [self chamaMetodosFala6];
                break;
            case 7:
                [self chamaMetodosFala7];
                break;
            case 8:
                [self chamaMetodosFala8];
                break;
                
            default:
                break;
        }
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:self.contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        self.contadorDeFalas +=1;
    }
}

-(void)addGesturePassaFalaMascote:(UIView*)imgMascote{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    singleTap.numberOfTouchesRequired = 1;
    imgMascote.userInteractionEnabled = YES;
    [imgMascote addGestureRecognizer:singleTap];
}


/////////////////// ACOES DA IMAGEM COM COLISAO NO TOCA TRECO ////////////////////////

-(void)deslocaImagemGrandeParaDireita:(UIImageView*)imgGrande :(float)duracaoAnimacao{
    CGRect posGaloOriginal = imgGrande.frame;
    [UIView animateWithDuration:duracaoAnimacao
                     animations:^(void){
                         imgGrande.hidden = NO;
                         CGRect moveGalo = CGRectMake(1050,
                                                      imgGrande.frame.origin.y,
                                                      imgGrande.frame.size.width,
                                                      imgGrande.frame.size.height);
                         imgGrande.frame = moveGalo;
                     } completion:^(BOOL finished){
                         imgGrande.hidden = YES;
                         imgGrande.frame = posGaloOriginal;
                     }];
    
}

- (void)btnAnimal{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"galo" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];

    [[self audioPlayer]play];
    
    self.imgCarroGrande.hidden = YES;
    self.imgPipaGrande.hidden = YES;
    self.imgGaloGrande.hidden = NO;
    [self deslocaImagemGrandeParaDireita:self.imgGaloGrande:3.0];
   

}

- (void)btnCarro {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"carro" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
    
    self.imgGaloGrande.hidden = YES;
    self.imgPipaGrande.hidden = YES;
    self.imgCarroGrande.hidden = NO;
    [self deslocaImagemGrandeParaDireita:self.imgCarroGrande:7.0];
    
    
}

- (void)btnVento {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"vento" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
    [[self audioPlayer]setVolume:5.0];
    
    self.imgCarroGrande.hidden = YES;
    self.imgGaloGrande.hidden = YES;
    self.imgPipaGrande.hidden = NO;
    [self deslocaImagemGrandeParaDireita:self.imgPipaGrande:14.0];
}


////////////////// METODOS NOTAS CAINDO //////////////////

-(void)tocaNotaPulando:(NSString*)nomeNota{
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = nomeNota;
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
}

-(void)lacoCaindoNotas{
    
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote2];
    
    self.duracao = 5.0;
    self.delay += 0.0;
    NSString *nomeNota;
    
        for(int i=1;i<=6;i++){
            UIImageView *notaCaindo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3.png"]];
            notaCaindo.frame = CGRectMake(self.posX,-100,notaCaindo.frame.size.width,notaCaindo.frame.size.height);
            [[self listaImagensCai]addObject:notaCaindo];
            [self.view addSubview:notaCaindo];
            
            switch (i) {
                case 1:
                    nomeNota = @"C";
                    break;
                case 2:
                    nomeNota = @"D";
                    break;
                case 3:
                    nomeNota = @"E";
                    break;
                case 4:
                    nomeNota = @"F";
                    break;
                case 5:
                    nomeNota = @"G";
                    break;
                case 6:
                    nomeNota = @"A";
                    break;
                default:
                    break;
            }
            
            [self animacaoCaindoNotas:notaCaindo:self.duracao:self.posX:self.delay:nomeNota];
            
            self.delay += 0.5;
            self.posX += 100;
            
        }
        self.delay = 0.0;
        self.posX = 0;
}


-(void)animacaoCaindoNotas:(UIImageView*)notaCaindo :(float)duracao :(CGFloat)posX :(float)tempoDemrora :(NSString*)nomeNota{
    //UIViewAnimationOptionAutoreverse ,UIViewAnimationOptionCurveEaseInOut,UIViewAnimationOptionTransitionCrossDissolve
    [UIView animateWithDuration:duracao
                          delay:tempoDemrora
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(posX,
                                                      600,
                                                      notaCaindo.frame.size.width,
                                                      notaCaindo.frame.size.height);
                         notaCaindo.frame = moveGalo;
                         
                         //                         [NSTimer scheduledTimerWithTimeInterval:duracao+0.5 target:self selector:@selector(tocaNotaPulando) userInfo:nil repeats:YES];
                     }
                     completion:^(BOOL finished){
                         notaCaindo.hidden = YES;
                         //[self tocaNotaPulando:nomeNota];
                     }];
    
    
}


@end
