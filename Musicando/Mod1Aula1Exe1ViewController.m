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

- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    [[EfeitoTransicao sharedManager]finalizaExercicio:self];
   
}


- (void)viewDidLoad{
    [super viewDidLoad];
        
    //Add barra,Mascote,View de Retornar Pagina ao Xib
    [[EfeitoComponeteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    self.imgTocaTreco = [TocaTrecoViewController sharedManager].imgTocaTreco;
    
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    SEL selectors1 = @selector(pulaFalaMascote);
    [[MascoteViewController sharedManager]addGesturePassaFalaMascote:self.viewGesturePassaFala :selectors1:self];
    [[RetornaPaginaViewController sharedManager]addGesturePassaFalaMascote:[RetornaPaginaViewController sharedManager].viewRetornaPagina:selectors1:self];
    
    
    //Lista para cair animcao/colisao
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    //Add imagens que faram colisao
    [self.listaImangesColisao addObject:self.imgFitaFuracao];
    [self.listaImangesColisao addObject:self.imgFitaGalo];
    [self.listaImangesColisao addObject:self.imgFitaCarro];
    [self.listaImangesColisao addObject:self.imgObjetoMusica1];
    [self.listaImangesColisao addObject:self.imgObjetoMusica2];
    [self.listaImangesColisao addObject:self.imgObjetoMusica3];
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


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


//////////////////////////// Colisoes //////////////////////////////

////// colisao Galo
-(void) checkColisaoGalo:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgFitaGalo.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    //Tira e desoculta a animacao de introdudacao de como jogar objetos no tocaTreco
    UIPanGestureRecognizer *aux = self.imgFitaGalo.gestureRecognizers.firstObject;
    if (aux.numberOfTouches == 1){
        [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgGaloMao];
        [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgMaoTocaTreco];
    }
    
    if (nowIntersecting){

        
        self.imgFitaGalo.hidden = true;
        self.imgFitaGalo.frame = self.imgTocaTreco.frame;
        [self.listaLiberaFala addObject:self.estadoAux1];
      
        [theTimer invalidate];
        [self acaoColisaoAnimal];
    }
 
}

////// colisao Carro
-(void) checkColisaoCarro:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgFitaCarro.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    //Tira e desoculta a animacao de introdudacao de como jogar objetos no tocaTreco
    UIPanGestureRecognizer *aux = self.imgFitaCarro.gestureRecognizers.firstObject;
    if (aux.numberOfTouches == 1){
        [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgGaloMao];
        [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgMaoTocaTreco];
    }
    
    if (nowIntersecting){
        self.imgFitaCarro.hidden = true;
        self.imgFitaCarro.frame = self.imgFitaCarro.frame;
        [self.listaLiberaFala addObject:self.estadoAux1];
        [theTimer invalidate];
        [self acaoColisaoCarro];
    }
    
}

////// colisao Vento
-(void) checkColisaoVento:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgFitaFuracao.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    //Tira e desoculta a animacao de introdudacao de como jogar objetos no tocaTreco
    UIPanGestureRecognizer *aux = self.imgFitaFuracao.gestureRecognizers.firstObject;
    if (aux.numberOfTouches == 1){
        [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgGaloMao];
        [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgMaoTocaTreco];
    }
    
    if (nowIntersecting){
        self.imgFitaFuracao.hidden = true;
        self.imgFitaFuracao.frame = self.imgFitaFuracao.frame;
        [self.listaLiberaFala addObject:self.estadoAux1];
        [theTimer invalidate];
        [self acaoColisaoVento];
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
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"musicaCristal" withExtension:@"mp3"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
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
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"musicaPanela" withExtension:@"mp3"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
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
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"musicaPalmas" withExtension:@"mp3"];
        [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
        
        [theTimer invalidate];
    }
}


///////////////////////////////  Metodos de cada Fala /////////////////////////////
//OBS: sempre em cada metodo desse, deva aparecer o metodo removeBrilho e chamaAddBrilho, para
//poder tirar o passar de fala e depois liberar o passar de fala
//Tem dois jeitos de se liberar o passar fala, e usa os seguitnes metodos:

//-chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala -> consegue colocar o tempo
//que vc quer até o liberar fala aconteca, necessario caso haja só texto

//chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:3 ->
//só libera a fala quando as colisoes acontecerem


-(void)chamaMetodosFala0 {
    
    //Animcao para cair notas
    [[EfeitoNotaAnimada sharedManager]animacaoCaiNotaIdaVolta:self];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala1 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala2 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    //Remove todas as animacoes que estao na lista, no caso estou tirando as notas que caiem
    [[EfeitoNotaAnimada sharedManager]removeAnimacao];

    //Mostra imagem oculta
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgIndioMusica];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgCarnaval];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgCapoeiraMusica];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgAnimacaoIndio];
    UIImage *image1 = [UIImage imageNamed:@"animaIndio1.gif"];
    UIImage *image2 = [UIImage imageNamed:@"animaIndio2.gif"];
    NSArray *imageArray = [NSArray arrayWithObjects:image1,image2,nil];
    [[EfeitoImagem sharedManager]addAnimacaoSprite:imageArray:self.imgAnimacaoIndio];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgAnimacaoCarnaval];
    UIImage *image3 = [UIImage imageNamed:@"carnavalframe1.gif"];
    UIImage *image4 = [UIImage imageNamed:@"carnavalframe2.gif"];
    UIImage *image5 = [UIImage imageNamed:@"carnavalframe3.gif"];
    UIImage *image6 = [UIImage imageNamed:@"carnavalframe4.gif"];
    UIImage *image7 = [UIImage imageNamed:@"carnavalframe5.gif"];
    UIImage *image8 = [UIImage imageNamed:@"carnavalframe6.gif"];
    NSArray *imageArray2 = [NSArray arrayWithObjects:image3,image4,image5,image6,image7,image8,nil];
    [[EfeitoImagem sharedManager]addAnimacaoSprite:imageArray2:self.imgAnimacaoCarnaval];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgAnimacaoCapoeira];
    UIImage *image9 = [UIImage imageNamed:@"Capoeiraframe1.gif"];
    UIImage *image10 = [UIImage imageNamed:@"Capoeiraframe2.gif"];
    UIImage *image11 = [UIImage imageNamed:@"Capoeiraframe3.gif"];
    NSArray *imageArray3 = [NSArray arrayWithObjects:image9,image10,image11,nil];
    [[EfeitoImagem sharedManager]addAnimacaoSprite:imageArray3:self.imgAnimacaoCapoeira];
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgIndioMusica.frame.origin.x+500,
                                                      self.imgIndioMusica.frame.origin.y,
                                                      self.imgIndioMusica.frame.size.width,
                                                      self.imgIndioMusica.frame.size.height);
                         
                         self.imgIndioMusica.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:6.0
                                               delay:3.0
                                             options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                                          animations:^{
                                              [NSTimer scheduledTimerWithTimeInterval: 3.0
                                                                               target: self
                                                                             selector: @selector(tocaIndio)
                                                                             userInfo: nil
                                                                              repeats: NO];
                                            CGRect moveGalo2 = CGRectMake(self.imgAnimacaoIndio.frame.origin.x+330,
                                                                            self.imgAnimacaoIndio.frame.origin.y,
                                                                            self.imgAnimacaoIndio.frame.size.width,
                                                                            self.imgAnimacaoIndio.frame.size.height);
                                              self.imgAnimacaoIndio.frame = moveGalo2;
                                          }
                                          completion:(NULL)];
                     }];
    
    [UIView animateWithDuration:4.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgCarnaval.frame.origin.x+680,
                                                      self.imgCarnaval.frame.origin.y,
                                                      self.imgCarnaval.frame.size.width,
                                                      self.imgCarnaval.frame.size.height);
                         self.imgCarnaval.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:6.0
                                               delay:9.0
                                             options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                                          animations:^{
                                              [NSTimer scheduledTimerWithTimeInterval: 9.0
                                                                               target: self
                                                                             selector: @selector(tocaCarnaval)
                                                                             userInfo: nil
                                                                              repeats: NO];
                                              CGRect moveGalo2 = CGRectMake(self.imgAnimacaoCarnaval.frame.origin.x+550,
                                                                            self.imgAnimacaoCarnaval.frame.origin.y,
                                                                            self.imgAnimacaoCarnaval.frame.size.width,
                                                                            self.imgAnimacaoCarnaval.frame.size.height);
                                              self.imgAnimacaoCarnaval.frame = moveGalo2;
                                          }
                                          completion:(NULL)];
                     }];

    
    
    [UIView animateWithDuration:6.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgCapoeiraMusica.frame.origin.x+840,
                                                      self.imgCapoeiraMusica.frame.origin.y,
                                                      self.imgCapoeiraMusica.frame.size.width,
                                                      self.imgCapoeiraMusica.frame.size.height);
                         
                         self.imgCapoeiraMusica.frame = moveGalo;
                         
                         
                     }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:6.0
                                               delay:16.0
                                             options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                                          animations:^{
                                              [NSTimer scheduledTimerWithTimeInterval: 16.0
                                                                               target: self
                                                                             selector: @selector(tocaCapoeira)
                                                                             userInfo: nil
                                                                              repeats: NO];
                                              CGRect moveGalo2 = CGRectMake(self.imgAnimacaoCapoeira.frame.origin.x+710,
                                                                            self.imgAnimacaoCapoeira.frame.origin.y,
                                                                            self.imgAnimacaoCapoeira.frame.size.width,
                                                                            self.imgAnimacaoCapoeira.frame.size.height);
                                              self.imgAnimacaoCapoeira.frame = moveGalo2;
                                          }
                                          completion:^(BOOL finished){
                                              [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
                                          }];
                     }];
    

}

-(void)chamaMetodosFala3 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoPlayer sharedManager]stopAudio];
    
    //Tira e mostra imagem oculta
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgIndioMusica];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgCapoeiraMusica];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgCarnaval];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgAnimacaoCapoeira];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgAnimacaoCarnaval];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgAnimacaoIndio];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgTocaTreco];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
}

-(void)chamaMetodosFala4 {
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgMaoTocaTreco];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgGaloMao];
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgMaoTocaTreco.frame.origin.x,
                                                      self.imgMaoTocaTreco.frame.origin.y+140,
                                                      self.imgMaoTocaTreco.frame.size.width,
                                                      self.imgMaoTocaTreco.frame.size.height);
                         CGRect moveGalo2 = CGRectMake(self.imgGaloMao.frame.origin.x,
                                                      self.imgGaloMao.frame.origin.y+140,
                                                      self.imgGaloMao.frame.size.width,
                                                      self.imgGaloMao.frame.size.height);
                         self.imgMaoTocaTreco.frame = moveGalo;
                         self.imgGaloMao.frame = moveGalo2;
                         
                     }
                     completion:(NULL)];
    
    
    //Fica verificando se as imagens colidiram, se acontecer ele altera o valor para 1 dos 3 estados
    //e depois add em uma lista que verificará se todas tiveram colisao
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
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgFitaCarro];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgFitaGalo];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgFitaFuracao];
    
    self.imgTocaTreco.userInteractionEnabled = YES;
    
    //Metodo que verifica o passar fala, nele tem que passar a qt de objetos que colidirá nessa fala, no caso 3
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:3];
    
    
}

-(void)chamaMetodosFala5 {
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoPlayer sharedManager]stopAudio];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPipaGrande];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgCarroGrande];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgGaloGrande];

    
    [[EfeitoImagem sharedManager]removeTodasAnimacoesView:self.imgGaloMao];
    [[EfeitoImagem sharedManager]removeTodasAnimacoesView:self.imgMaoTocaTreco];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.outAlavancaTocaTreco];
    
    
    
}

- (IBAction)btnAlavancaTocaTreco:(id)sender {
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.outAlavancaTocaTreco.transform = CGAffineTransformRotate(self.outAlavancaTocaTreco.transform, ((10 * M_PI) / 180.0));
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"musicaMixaIntroducao" withExtension:@"wav"];
                         [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
                         
                         [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:8.0f:self.viewGesturePassaFala];
                     }];
    
   
}


-(void)chamaMetodosFala6 {
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];

    [[EfeitoPlayer sharedManager]stopAudio];
    
    [[EfeitoImagem sharedManager]removeTodasAnimacoesView:self.imgPipaGrande];
    [[EfeitoImagem sharedManager]removeTodasAnimacoesView:self.imgCarroGrande];
    [[EfeitoImagem sharedManager]removeTodasAnimacoesView:self.imgGaloGrande];
    
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.outAlavancaTocaTreco];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgTocaTreco];

    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
}


-(void)chamaMetodosFala7 {
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    //Remove todas as animacoes que estao na lista, no caso estou tirando as notas que caiem
    [[EfeitoNotaAnimada sharedManager]removeAnimacao];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgObjetoMusica1];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgObjetoMusica2];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgObjetoMusica3];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgTocaTreco];
    
    
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
    
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:3];
    
}

-(void)chamaMetodosFala8 {

    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
    [[EfeitoPlayer sharedManager]stopAudio];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgObjetoMusica1];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgObjetoMusica2];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgObjetoMusica3];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgTocaTreco];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgBen3];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgBen2];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgBen1];
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgBen3.frame.origin.x+280,
                                                      self.imgBen3.frame.origin.y,
                                                      self.imgBen3.frame.size.width,
                                                      self.imgBen3.frame.size.height);
                         self.imgBen3.frame = moveGalo;
                         
                     }
                     completion:(NULL)];
    
    [UIView animateWithDuration:4.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgBen2.frame.origin.x+480,
                                                      self.imgBen2.frame.origin.y,
                                                      self.imgBen2.frame.size.width,
                                                      self.imgBen2.frame.size.height);
                         self.imgBen2.frame = moveGalo;
                         
                     }
                     completion:(NULL)];
    
    
    [UIView animateWithDuration:6.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgBen1.frame.origin.x+680,
                                                      self.imgBen1.frame.origin.y,
                                                      self.imgBen1.frame.size.width,
                                                      self.imgBen1.frame.size.height);
                         self.imgBen1.frame = moveGalo;
                         
                     }
                     completion:(NULL)];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:8.0f:self.viewGesturePassaFala];
    
}

-(void)chamaMetodosFala9 {
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
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
            case 8:
                [self chamaMetodosFala8];
                break;
            case 9:
                [self chamaMetodosFala9];
                break;
            default:
                break;
        }

        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:[MascoteViewController sharedManager].contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        [MascoteViewController sharedManager].contadorDeFalas += 1;
        
    }
}


////////////////////////// ACOES DA COLISAO ////////////////////////

-(void)tocaIndio{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"indio" withExtension:@"mp3"];
    [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
}

-(void)tocaCarnaval{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"carnaval" withExtension:@"mp3"];
    [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
}

-(void)tocaCapoeira{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"capoeira" withExtension:@"mp3"];
    [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
}

//Fazem as imagens sairem da esquerda até direita, no caso o Galo,Carro,Vento
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

- (void)acaoColisaoAnimal{
    
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"galo" withExtension:@"wav"];
    [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];

    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgGaloGrande];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgCarroGrande];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPipaGrande];
  
    [self deslocaImagemGrandeParaDireita:self.imgGaloGrande:3.0];
   

}

- (void)acaoColisaoCarro {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"carro" withExtension:@"wav"];
    [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];

    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgCarroGrande];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgGaloGrande];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPipaGrande];
    
    [self deslocaImagemGrandeParaDireita:self.imgCarroGrande:7.0];
    
    
}

- (void)acaoColisaoVento {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"vento" withExtension:@"wav"];
    [[EfeitoPlayer sharedManager]playAudio:self.caminhoDoAudio];
    [[EfeitoPlayer sharedManager]ajustaVolume:5.0];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPipaGrande];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgGaloGrande];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgCarroGrande];
    
    
    [self deslocaImagemGrandeParaDireita:self.imgPipaGrande:7.0];
}




@end
