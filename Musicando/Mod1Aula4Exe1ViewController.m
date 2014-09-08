//
//  Mod1Aula4Exe1ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula4Exe1ViewController.h"

@interface Mod1Aula4Exe1ViewController ()

@end

@implementation Mod1Aula4Exe1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    [[ExercicioTransicao sharedManager]finalizaExercicio:self];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Add barra,Mascote,View de Retornar Pagina ao Xib
    [[GerenciadorComponenteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    SEL selectors1 = @selector(pulaFalaMascote);
    [[MascoteViewController sharedManager]addGesturePassaFalaMascote:self.viewGesturePassaFala :selectors1:self];
    [[RetornaPaginaViewController sharedManager]addGesturePassaFalaMascote:[RetornaPaginaViewController sharedManager].viewRetornaPagina:selectors1:self];
    
    [self iniciarComponentes];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


-(void)iniciarComponentes{
    
    //Inicia lista de imagens para colisão
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    
    //Adiciona imagens para colisao
    [self.listaImangesColisao addObject: self.melodia];
    [self.listaImangesColisao addObject: self.ritmo];
    [self.listaImangesColisao addObject: self.harmonia];
    
    //Adiciona gesture ARRASTAR em todas imagens dessa lista
    [[ExercicioImagem sharedManager]addGesturePainImagens: self.listaImangesColisao];
    
    //Lista para saber se as colisoes na tela foram feitas p/ ir na prox fala
    self.listaLiberaFala = [[NSMutableArray alloc]init];
    //seta com alguma coisa para add uma coisa nao nula
    self.estadoAux1 = @"0";
    
    
    //Biblioteca
    self.lblFalaDoMascote = [MascoteViewController sharedManager].lblFalaDoMascote;
    self.testaBiblio = [MascoteViewController sharedManager].testaBiblio;
    self.testaConversa = [MascoteViewController sharedManager].testaConversa;
    self.imagemDoMascote = [MascoteViewController sharedManager].imagemDoMascote2;
    [[ExercicioMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote];
    
    [self pulaFalaMascote];
    
}


//Gerenciador das falas
-(void)pulaFalaMascote{
    
    //Usa pra não dar erro de nulo na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    
    [[BarraSuperiorViewController sharedManager]txtNumeroAulaAtual].text = [NSString stringWithFormat:@"%d",1+[MascoteViewController sharedManager].contadorDeFalas];
    
    if([MascoteViewController sharedManager].contadorDeFalas == contadorMaximo){
        NSString *proxExercicio = [[Biblioteca sharedManager]exercicioAtual].nomeView;
        [[ExercicioTransicao sharedManager]chamaViewTransicaoExercicio:self:proxExercicio];
    }
    
    if([MascoteViewController sharedManager].contadorDeFalas < contadorMaximo){
        switch ([MascoteViewController sharedManager].contadorDeFalas) {
            case 0:
                [self chamaMetodosFala0];
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
            case 6:
                [self chamaMetodosFala6];
                break;
            case 7:
                [self chamaMetodosFala7];
                break;
                
            default:
                break;
        }
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:[MascoteViewController sharedManager].contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        [MascoteViewController sharedManager].contadorDeFalas += 1;
    }
}


//Intro
-(void)chamaMetodosFala0 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Explicação
-(void)chamaMetodosFala1 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala2 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
 
}

//TocaTreco
-(void)chamaMetodosFala3 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Verifica se as imagens colidiram e add em uma lista que verificará se todas tiveram colisao
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoRitmo:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoMelodia:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoHarmonia:)
                                   userInfo: nil
                                    repeats: YES];
    
    //Habilita interação e mostra views
    self.tocaTreco.userInteractionEnabled = YES;
    self.tocaTreco.hidden = NO;
    self.melodia.hidden = NO;
    self.ritmo.hidden = NO;
    self.harmonia.hidden = NO;
    self.telao.hidden = NO;
    self.lblSaidaTocaTreco.hidden = NO;
    
    [[ExercicioImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote :self.viewGesturePassaFala:self.listaLiberaFala: 3];
}

//Complemento
-(void)chamaMetodosFala4 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];

    [[ExercicioPlayer sharedManager]stopAudio];
    self.tocaTreco.hidden = YES;
    self.melodia.hidden = YES;
    self.ritmo.hidden = YES;
    self.harmonia.hidden = YES;
    self.telao.hidden = YES;
    self.lblSaidaTocaTreco.hidden = YES;
    
     [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Animacao pilares
-(void)chamaMetodosFala5 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    self.teto.hidden = NO;
    self.pilar1.hidden = NO;
    self.pilar2.hidden = NO;
    self.pilar3.hidden = NO;
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.pilar1.frame = CGRectMake(self.pilar1.frame.origin.x,
                                                        self.pilar1.frame.origin.y+200,
                                                        self.pilar1.frame.size.width,
                                                        self.pilar1.frame.size.height);
                         
                         self.pilar2.frame = CGRectMake(self.pilar2.frame.origin.x,
                                                        self.pilar2.frame.origin.y+200,
                                                        self.pilar2.frame.size.width,
                                                        self.pilar2.frame.size.height);
                         
                         self.pilar3.frame = CGRectMake(self.pilar3.frame.origin.x,
                                                        self.pilar3.frame.origin.y+200,
                                                        self.pilar3.frame.size.width,
                                                        self.pilar3.frame.size.height);
                         
                         self.teto.frame = CGRectMake(self.teto.frame.origin.x,
                                                      self.teto.frame.origin.y+200,
                                                      self.teto.frame.size.width,
                                                      self.teto.frame.size.height);
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala6 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    self.teto.hidden = YES;
    self.pilar1.hidden = YES;
    self.pilar2.hidden = YES;
    self.pilar3.hidden = YES;
    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala final
-(void)chamaMetodosFala7 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}


//==========================================================Colisões/Ações=========================================================//

-(void) checkColisaoMelodia:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.melodia.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.melodia.hidden = true;
        self.melodia.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        [theTimer invalidate];
        [self acaoColisaoMelodia];
    }
    
}

- (void)acaoColisaoMelodia{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"notasPausas" withExtension:@"mp3"];
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    [[ExercicioPlayer sharedManager]playAudios];
    self.lblSaidaTocaTreco.text = @"Melodia";
}

-(void) checkColisaoRitmo:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.ritmo.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.ritmo.hidden = true;
        self.ritmo.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        [theTimer invalidate];
        [self acaoColisaoRitmo];
    }
    
}

- (void)acaoColisaoRitmo{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"happybirthdaySamba" withExtension:@"mp3"];
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    [[ExercicioPlayer sharedManager]playAudios];
    self.lblSaidaTocaTreco.text = @"Ritmo";

}

-(void) checkColisaoHarmonia:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.harmonia.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.harmonia.hidden = true;
        self.harmonia.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        [theTimer invalidate];
        [self acaoColisaoHarmonia];
    }
    
}

- (void)acaoColisaoHarmonia{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"happibirthdayClassico" withExtension:@"mp3"];
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    [[ExercicioPlayer sharedManager]playAudios];
    self.lblSaidaTocaTreco.text = @"Harmonia";
}



@end
