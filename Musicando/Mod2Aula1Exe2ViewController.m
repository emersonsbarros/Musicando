//
//  Mod2Aula1Exe2ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod2Aula1Exe2ViewController.h"

@interface Mod2Aula1Exe2ViewController ()

@end

@implementation Mod2Aula1Exe2ViewController

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
    
    //Add barra,Mascote,View de Retornar Pagina ao Xib
    [[EfeitoComponeteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    SEL selectors1 = @selector(pulaFalaMascote);
    [[MascoteViewController sharedManager]addGesturePassaFalaMascote:self.viewGesturePassaFala :selectors1:self];
    [[RetornaPaginaViewController sharedManager]addGesturePassaFalaMascote:[RetornaPaginaViewController sharedManager].viewRetornaPagina:selectors1:self];
    
    
    //Lista para cair animcao/colisao
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    //Add imagens que faram colisao
    [self.listaImangesColisao addObject:self.placaDo];
    [self.listaImangesColisao addObject:self.placaRe];
    [self.listaImangesColisao addObject:self.placaMi];
    [self.listaImangesColisao addObject:self.placaFa];
    [self.listaImangesColisao addObject:self.placaSol];
    [self.listaImangesColisao addObject:self.placaLa];
    [self.listaImangesColisao addObject:self.placaSi];

    //Add gesture arrastar em todas imagens dessa lista
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImangesColisao];
    

    self.auxContaCacaPalavras = 0;
    self.auxContaErradoCacaPalavras = 0;
    
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


/////////////////////////////////////// COLISOES /////////////////////////////////////////

-(void)checkColisaoPlacaDo:(NSTimer *) theTimer{
    id presentationLayer1 = self.pontoDo.layer.presentationLayer;
    id presentationLayer2 = self.placaDo.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.placaDo.frame = CGRectMake(self.pontoDo.frame.origin.x,
                                        self.pontoDo.frame.origin.y+50,
                                        self.placaDo.frame.size.width,
                                        self.placaDo.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.placaDo];
        [self.listaLiberaFala addObject:self.estadoAux1];
        Nota *aux = [[Nota alloc]init];
        self.listaSons = [[NSMutableArray alloc]init];
        aux.nomeNota = @"C";
        aux.oitava = @"5";
        aux.tom = @"";
        aux.tipoNota = @"quarter";
        [self.listaSons addObject:aux];
        [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
        [theTimer invalidate];
    }
    
}

-(void)checkColisaoPlacaRe:(NSTimer *) theTimer{
    id presentationLayer1 = self.pontoRe.layer.presentationLayer;
    id presentationLayer2 = self.placaRe.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.placaRe.frame = CGRectMake(self.pontoRe.frame.origin.x,
                                        self.pontoRe.frame.origin.y+50,
                                        self.placaRe.frame.size.width,
                                        self.placaRe.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.placaRe];
        [self.listaLiberaFala addObject:self.estadoAux1];
        Nota *aux = [[Nota alloc]init];
        self.listaSons = [[NSMutableArray alloc]init];
        aux.nomeNota = @"D";
        aux.oitava = @"5";
        aux.tom = @"";
        aux.tipoNota = @"quarter";
        [self.listaSons addObject:aux];
        [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
        [theTimer invalidate];
    }
    
}

-(void)checkColisaoPlacaMi:(NSTimer *) theTimer{
    id presentationLayer1 = self.pontoMi.layer.presentationLayer;
    id presentationLayer2 = self.placaMi.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.placaMi.frame = CGRectMake(self.pontoMi.frame.origin.x,
                                        self.pontoMi.frame.origin.y+50,
                                        self.placaMi.frame.size.width,
                                        self.placaMi.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.placaMi];
        [self.listaLiberaFala addObject:self.estadoAux1];
        Nota *aux = [[Nota alloc]init];
        self.listaSons = [[NSMutableArray alloc]init];
        aux.nomeNota = @"E";
        aux.oitava = @"5";
        aux.tom = @"";
        aux.tipoNota = @"quarter";
        [self.listaSons addObject:aux];
        [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
        [theTimer invalidate];
    }
    
}

-(void)checkColisaoPlacaFa:(NSTimer *) theTimer{
    id presentationLayer1 = self.pontoFa.layer.presentationLayer;
    id presentationLayer2 = self.placaFa.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.placaFa.frame = CGRectMake(self.pontoFa.frame.origin.x,
                                        self.pontoFa.frame.origin.y+50,
                                        self.placaFa.frame.size.width,
                                        self.placaFa.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.placaFa];
        [self.listaLiberaFala addObject:self.estadoAux1];
        Nota *aux = [[Nota alloc]init];
        self.listaSons = [[NSMutableArray alloc]init];
        aux.nomeNota = @"F";
        aux.oitava = @"5";
        aux.tom = @"";
        aux.tipoNota = @"quarter";
        [self.listaSons addObject:aux];
        [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
        [theTimer invalidate];
    }
    
}

-(void)checkColisaoPlacaSol:(NSTimer *) theTimer{
    id presentationLayer1 = self.pontoSol.layer.presentationLayer;
    id presentationLayer2 = self.placaSol.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.placaSol.frame = CGRectMake(self.pontoSol.frame.origin.x,
                                         self.pontoSol.frame.origin.y+50,
                                         self.placaSol.frame.size.width,
                                         self.placaSol.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.placaSol];
        [self.listaLiberaFala addObject:self.estadoAux1];
        Nota *aux = [[Nota alloc]init];
        self.listaSons = [[NSMutableArray alloc]init];
        aux.nomeNota = @"G";
        aux.oitava = @"5";
        aux.tom = @"";
        aux.tipoNota = @"quarter";
        [self.listaSons addObject:aux];
        [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
        [theTimer invalidate];
    }
    
}

-(void)checkColisaoPlacaLa:(NSTimer *) theTimer{
    id presentationLayer1 = self.pontoLa.layer.presentationLayer;
    id presentationLayer2 = self.placaLa.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.placaLa.frame = CGRectMake(self.pontoLa.frame.origin.x,
                                        self.pontoLa.frame.origin.y+50,
                                        self.placaLa.frame.size.width,
                                        self.placaLa.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.placaLa];
        [self.listaLiberaFala addObject:self.estadoAux1];
        Nota *aux = [[Nota alloc]init];
        self.listaSons = [[NSMutableArray alloc]init];
        aux.nomeNota = @"A";
        aux.oitava = @"5";
        aux.tom = @"";
        aux.tipoNota = @"quarter";
        [self.listaSons addObject:aux];
        [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
        [theTimer invalidate];
    }
    
}

-(void)checkColisaoPlacaSi:(NSTimer *) theTimer{
    id presentationLayer1 = self.pontoSi.layer.presentationLayer;
    id presentationLayer2 = self.placaSi.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.placaSi.frame = CGRectMake(self.pontoSi.frame.origin.x,
                                        self.pontoSi.frame.origin.y+50,
                                        self.placaSi.frame.size.width,
                                        self.placaSi.frame.size.height);
        [[EfeitoImagem sharedManager]tiraGestureObjeto:self.placaSi];
        [self.listaLiberaFala addObject:self.estadoAux1];
        Nota *aux = [[Nota alloc]init];
        self.listaSons = [[NSMutableArray alloc]init];
        aux.nomeNota = @"B";
        aux.oitava = @"5";
        aux.tom = @"";
        aux.tipoNota = @"quarter";
        [self.listaSons addObject:aux];
        [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
        [theTimer invalidate];
    }
    
}


-(void)checkColisaoTocaTreco:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.txtNomeNota.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    

    if (nowIntersecting){
        Nota *aux = [[Nota alloc]init];
        self.listaSons = [[NSMutableArray alloc]init];
        
        if(([self.txtNomeNota.text isEqual: @"Dó"])||
           ([self.txtNomeNota.text isEqual: @"Ré"])||
           ([self.txtNomeNota.text isEqual: @"Mi"])||
           ([self.txtNomeNota.text isEqual: @"Fa"])||
           ([self.txtNomeNota.text isEqual: @"Sol"])||
           ([self.txtNomeNota.text isEqual: @"Lá"])||
           ([self.txtNomeNota.text isEqual: @"Si"])){
            
            aux.nomeNota = @"F";
            aux.oitava = @"5";
            aux.tom = @"";
            aux.tipoNota = @"quarter";
            [self.listaSons addObject:aux];
            [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
            
           [self.listaLiberaFala addObject:self.estadoAux1];
            
        }else{
            
            aux.nomeNota = @"F";
            aux.oitava = @"0";
            aux.tom = @"";
            aux.tipoNota = @"quarter";
            [self.listaSons addObject:aux];
            [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
            
            self.indiceListaNomeNotas = 0;
            [self.listaLiberaFala removeAllObjects];
        }
    }
    
}

////////////////////////////////////////////////////////////////////////////////////////

-(void)chamaMetodosFala0{
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgEscala];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala1{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    //Add sprite as imagem da mão e comeca (tem uma parar no EfeitoImagem caso necesario)
    UIImage *image1 = [UIImage imageNamed:@"escalaDo.png"];
    UIImage *image2 = [UIImage imageNamed:@"escalaRe.png"];
    UIImage *image3 = [UIImage imageNamed:@"escalaMi.png"];
    UIImage *image4 = [UIImage imageNamed:@"escalaFa.png"];
    UIImage *image5 = [UIImage imageNamed:@"escalaSol.png"];
    UIImage *image6 = [UIImage imageNamed:@"escalaLa.png"];
    UIImage *image7 = [UIImage imageNamed:@"escalaSi.png"];
    NSArray *imageArray = [NSArray arrayWithObjects:image1,image2,image3,image4,image5,image6,image7,nil];
    [[EfeitoImagem sharedManager]addAnimacaoSprite:imageArray :self.imgEscala :5.0 :5];

    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)verficaCacaPalavra:(NSTimer *) theTimer{
    
    
    self.txtAcerto.text = [NSString stringWithFormat:@"%d",self.auxContaCacaPalavras];
    self.txtErros.text = [NSString stringWithFormat:@"%d",self.auxContaErradoCacaPalavras];
    
    if(self.auxContaErradoCacaPalavras == 2){
        self.auxContaCacaPalavras = 0;
        self.auxContaErradoCacaPalavras=0;
        
       [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.txtGameOver];
        
    }
    
    if(self.auxContaCacaPalavras == 7){
        [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
        [theTimer invalidate];
        self.txtGameOver.text = @"Acertou!";
        [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.txtGameOver];
    }
    
}

-(void)acertaPalavra{
    self.auxContaCacaPalavras += 1;
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.txtGameOver];
}

-(void)erraCacaPalavras{
    self.auxContaErradoCacaPalavras += 1;
}

-(void)addGesturePalavraCerta:(UIView*)viewGesture{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(acertaPalavra)];
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = YES;
    viewGesture.userInteractionEnabled = YES;
    [viewGesture addGestureRecognizer:singleTap];
    
}

-(void)chamaMetodosFala2{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgEscala];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.viewCacaPalavras];

    
    [self addGesturePalavraCerta:self.gestureDo];
    [self addGesturePalavraCerta:self.gestureRe];
    [self addGesturePalavraCerta:self.gestureMi];
    [self addGesturePalavraCerta:self.gestureFa];
    [self addGesturePalavraCerta:self.gestureSol];
    [self addGesturePalavraCerta:self.gestureLa];
    [self addGesturePalavraCerta:self.gestureSi];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(erraCacaPalavras)];
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = YES;
    self.viewCacaPalavras.userInteractionEnabled = YES;
    [self.viewCacaPalavras addGestureRecognizer:singleTap];
    
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(verficaCacaPalavra:)
                                   userInfo: nil
                                    repeats: YES];
    
    
    
}


-(void)chamaMetodosFala3{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];

    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.viewCacaPalavras];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.viewPlaquinhas];
    
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPlacaDo:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPlacaRe:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPlacaMi:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPlacaFa:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPlacaSol:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPlacaLa:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPlacaSi:)
                                   userInfo: nil
                                    repeats: YES];
    
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:7];
   // [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:0];
    
}

-(void)desceNota:(NSTimer *) theTimer{
    self.txtNomeNota.hidden = NO;
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgMaoGesture];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.txtMaoGesture];
    [[EfeitoImagem sharedManager]removeTodasAnimacoesView:self.imgMaoGesture];
    [[EfeitoImagem sharedManager]removeTodasAnimacoesView:self.txtMaoGesture];

    if(self.indiceListaNomeNotas < self.listaNomeNotas.count){
        self.txtNomeNota.text = [self.listaNomeNotas objectAtIndex:self.indiceListaNomeNotas];

        [UIView animateWithDuration:2.0
                              delay:0.0
                            options: UIViewAnimationOptionCurveEaseInOut  | UIViewAnimationOptionTransitionCrossDissolve
         
                         animations:^{
                             self.txtNomeNota.frame = CGRectMake(self.txtNomeNota.frame.origin.x,
                                                                    self.txtNomeNota.frame.origin.y+250,
                                                                    self.txtNomeNota.frame.size.width,
                                                                    self.txtNomeNota.frame.size.height);                     }
                         completion:^(BOOL finished){
                                 [NSTimer scheduledTimerWithTimeInterval: 5.0
                                                                  target: self
                                                                selector: @selector(esperaJogaTocaTreco:)
                                                                userInfo: nil
                                                                 repeats: NO];
                        }];
    }else{
        NSLog(@"acabou");
        [theTimer invalidate];
    }
}

-(void)voltaPosicao{
    self.txtNomeNota.frame = self.posOriginalNomeNota;
    self.indiceListaNomeNotas +=1;
}

-(void)esperaJogaTocaTreco:(NSTimer *) theTimer{
    self.txtNomeNota.frame = CGRectMake(self.txtNomeNota.frame.origin.x,
                                        self.txtNomeNota.frame.origin.y+100,
                                        self.txtNomeNota.frame.size.width,
                                        self.txtNomeNota.frame.size.height);
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(voltaPosicao)
                                   userInfo: nil
                                    repeats: NO];

}

-(void)tapDetected{
    if(([self.txtNomeNota.text isEqual: @"Dó"])||
       ([self.txtNomeNota.text isEqual: @"Ré"])||
       ([self.txtNomeNota.text isEqual: @"Mi"])||
       ([self.txtNomeNota.text isEqual: @"Fa"])||
       ([self.txtNomeNota.text isEqual: @"Sol"])||
       ([self.txtNomeNota.text isEqual: @"Lá"])||
       ([self.txtNomeNota.text isEqual: @"Si"])){

       self.indiceListaNomeNotas = 0;
        [self.listaLiberaFala removeAllObjects];
        
    }
    
    self.txtNomeNota.hidden = YES;
    self.txtNomeNota.frame = CGRectMake(self.txtNomeNota.frame.origin.x+500,
                                        self.txtNomeNota.frame.origin.y,
                                        self.txtNomeNota.frame.size.width,
                                        self.txtNomeNota.frame.size.height);
}

-(void)chamaMetodosFala4{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.viewPlaquinhas];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.viewTocaTreco];
    
    self.posOriginalNomeNota = self.txtNomeNota.frame;
    
    UISwipeGestureRecognizer *singleTap = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTouchesRequired = 1;
    singleTap.direction = UISwipeGestureRecognizerDirectionRight;
    self.txtNomeNota.userInteractionEnabled = YES;
    [self.txtNomeNota addGestureRecognizer:singleTap];
    
    self.indiceListaNomeNotas = 0;
    self.listaNomeNotas = [NSArray arrayWithObjects:@"Dó", @"Mik", @"Ré", @"Mi", @"Fa", @"Fi", @"Sou", @"Sol", @"Laz", @"Lá", @"Sis", @"Si", nil];

    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options: UIViewAnimationOptionCurveEaseInOut  | UIViewAnimationOptionTransitionCrossDissolve |UIViewAnimationOptionRepeat
                     animations:^{
                         self.imgMaoGesture.frame = CGRectMake(self.imgMaoGesture.frame.origin.x+100,
                                                             self.imgMaoGesture.frame.origin.y,
                                                             self.imgMaoGesture.frame.size.width,
                                                             self.imgMaoGesture.frame.size.height);
                         self.txtMaoGesture.frame = CGRectMake(self.txtMaoGesture.frame.origin.x+100,
                                                               self.txtMaoGesture.frame.origin.y,
                                                               self.txtMaoGesture.frame.size.width,
                                                               self.txtMaoGesture.frame.size.height);
                     }
                     completion:^(BOOL finished){
                     }];
    
    
    [NSTimer scheduledTimerWithTimeInterval: 0.3
                                     target: self
                                   selector: @selector(checkColisaoTocaTreco:)
                                   userInfo: nil
                                    repeats: YES];
    
    
    [NSTimer scheduledTimerWithTimeInterval: 10.0
                                     target: self
                                   selector: @selector(desceNota:)
                                   userInfo: nil
                                    repeats: YES];
    
    
    
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:7];
}


-(void)chamaMetodosFala5{
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
            default:
                break;
        }
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:[MascoteViewController sharedManager].contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        [MascoteViewController sharedManager].contadorDeFalas += 1;
    }
}

//Add gesture passar de fala a view que fica por cima do mascote, usei por cauda do problema da animacao
-(void)addGesturePassaFalaMascote:(UIView*)viewGesture{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = NO;
    viewGesture.userInteractionEnabled = NO;
    [viewGesture addGestureRecognizer:singleTap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
