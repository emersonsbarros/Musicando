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
    //Chama a view de Introducao
    [self performSelector:@selector(animacaoMaoMascote) withObject:NULL afterDelay:0.0f];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


/////////////////////////////////// ANIMACAO INTRODUCAO GESTURE ////////////////////////////////////////

//Botao que aparece na view introducao
- (IBAction)btnComecar:(id)sender {
    
    //Remove a animation do imgMascoteIntro
    [[EfeitoMascote sharedManager]removeBrilho:self.imgMascoteIntro:self.viewGesturePassaFala];
    //Oculta a intro
    self.viewInicialGesture.hidden = YES;
    
    //Habilita o gesture do mascote com a UIView que fica por cima dele
    //Coloquei essa view para colocar o gesture de pular fala, pois com animation atrapalha
    [self addGesturePassaFalaMascote:self.viewGesturePassaFala];
    
    
    //Lista para cair animcao/colisao
    self.listaImagensCai = [[NSMutableArray alloc]init];
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
    self.estadoAux2 = @"0";
    self.estadoAux3 = @"0";
    
    
    //Biblioteca
    self.contadorDeFalas = 0;
    self.testaBiblio = [Biblioteca sharedManager];
    self.testaConversa = self.testaBiblio.exercicioAtual.mascote.listaDeConversas.firstObject;
    //Usar sempre que quiser pular uma fala,no caso tem que passar para pegar a primeira fala
    [self pulaFalaMascote];
    //Imagem do mascote
    self.imagemDoMascote2.image = [[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image;
    [self.view addSubview: self.imagemDoMascote2];
    [self.view addSubview: self.lblFalaDoMascote];
    
    
    //Animcao para cair notas
    [self lacoCaindoNotas];
    
}

-(void)animacaoMaoMascote {
    
    //Add brilho e pulo a esse mascote que está na tela de intruducao
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imgMascoteIntro:2.0f:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imgMascoteIntro];
    
    //Altera a profundidade da mão para poder ficar na frente da imagem do mascote
    self.imgMaoTouch.layer.zPosition = 10;
    
    //Animcao da mão até o mascote
    [UIView animateWithDuration:2.0
                          delay:3.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         
                        CGRect moveGalo = CGRectMake(self.imgMaoTouch.frame.origin.x+380,
                                                      self.imgMaoTouch.frame.origin.y-40,
                                                      self.imgMaoTouch.frame.size.width,
                                                      self.imgMaoTouch.frame.size.height);
                         self.imgMaoTouch.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         //Add sprite as imagem da mão e comeca (tem uma parar no EfeitoImagem caso necesario)
                         UIImage *image1 = [UIImage imageNamed:@"gesturePassaFalaMascote.png"];
                         UIImage *image2 = [UIImage imageNamed:@"gesturePassaFalaMascoteTap.png"];
                         NSArray *imageArray = [NSArray arrayWithObjects:image1,image2,nil];
                         [[EfeitoImagem sharedManager]addAnimacaoSprite:imageArray:self.imgMaoTouch];
                         
                         //mostra o botao comecar
                         self.outBtnComecar.hidden = NO;
                         
                     }];

    
    
}

//////////////////////////// Colisoes //////////////////////////////

////// colisao Galo
-(void) checkColisaoGalo:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgFitaGalo.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
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

    if (nowIntersecting){
        self.imgFitaCarro.hidden = true;
        self.imgFitaCarro.frame = self.imgFitaCarro.frame;
        [self.listaLiberaFala addObject:self.estadoAux2];
        [theTimer invalidate];
        [self acaoColisaoCarro];
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
        [self.listaLiberaFala addObject:self.estadoAux3];
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
        [self.listaLiberaFala addObject:self.estadoAux2];
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
        [self.listaLiberaFala addObject:self.estadoAux3];
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
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala1 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala2 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala3 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    //Remove todas as animacoes que estao na lista, no caso estou tirando as notas que caiem
    [[EfeitoImagem sharedManager]removeTodasAnimacoesViewLista:self.listaImagensCai];
    
    self.imgTocaTreco.hidden = NO;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
 
}

-(void)chamaMetodosFala4 {
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
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
    
    self.imgFitaCarro.hidden = NO;
    self.imgFitaGalo.hidden = NO;
    self.imgFitaFuracao.hidden = NO;
    
    self.imgTocaTreco.userInteractionEnabled = YES;
    
    //Metodo que verifica o passar fala, nele tem que passar a qt de objetos que colidirá nessa fala, no caso 3
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:3];
    
    
}

-(void)chamaMetodosFala5 {
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    self.imgFitaCarro.hidden = YES;
    self.imgFitaGalo.hidden = YES;
    self.imgFitaFuracao.hidden = YES;
    self.outAlavancaTocaTreco.hidden = NO;
    
    
}

- (IBAction)btnAlavancaTocaTreco:(id)sender {
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}


-(void)chamaMetodosFala6 {
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    self.outAlavancaTocaTreco.hidden = YES;
    self.imgTocaTreco.hidden = YES;
    [self lacoCaindoNotas];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
}


-(void)chamaMetodosFala7 {
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]removeTodasAnimacoesViewLista:self.listaImagensCai];
    
    
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
    
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:3];
    
}

-(void)chamaMetodosFala8 {

    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
    self.imgObjetoMusica1.hidden = YES;
    self.imgObjetoMusica2.hidden = YES;
    self.imgObjetoMusica3.hidden = YES;
    self.imgTocaTreco.hidden = YES;
}

-(void)chamaMetodosFala9 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
}


//Gerencia o passa de falas
-(void)pulaFalaMascote{
    //Usa pra não dar erro de nulo na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    
    if(self.contadorDeFalas < contadorMaximo){
        switch (self.contadorDeFalas) {
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
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:self.contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        self.contadorDeFalas +=1;
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


////////////////////////// ACOES DA COLISAO ////////////////////////

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
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];

    [[self audioPlayer]play];
    
    self.imgCarroGrande.hidden = YES;
    self.imgPipaGrande.hidden = YES;
    self.imgGaloGrande.hidden = NO;
    [self deslocaImagemGrandeParaDireita:self.imgGaloGrande:3.0];
   

}

- (void)acaoColisaoCarro {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"carro" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
    
    self.imgGaloGrande.hidden = YES;
    self.imgPipaGrande.hidden = YES;
    self.imgCarroGrande.hidden = NO;
    [self deslocaImagemGrandeParaDireita:self.imgCarroGrande:7.0];
    
    
}

- (void)acaoColisaoVento {
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"vento" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
    [[self audioPlayer]setVolume:5.0];
    
    self.imgCarroGrande.hidden = YES;
    self.imgGaloGrande.hidden = YES;
    self.imgPipaGrande.hidden = NO;
    [self deslocaImagemGrandeParaDireita:self.imgPipaGrande:14.0];
}


//////////////////////////////// METODOS NOTAS CAINDO /////////////////////////
//Toca audio Nota
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
