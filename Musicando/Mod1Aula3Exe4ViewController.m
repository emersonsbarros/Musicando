//
//  Mod1Aula3Exe4ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula3Exe4ViewController.h"

@interface Mod1Aula3Exe4ViewController ()
@end

@implementation Mod1Aula3Exe4ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Add barra Superior ao Xib
    [[BarraSuperiorViewController sharedManager]addBarraSuperioAoXib:self:[Biblioteca sharedManager].exercicioAtual];
    
    [self iniciarComponentes];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


-(void)iniciarComponentes{
    
    //Habilita o gesture do mascote com a UIView que fica por cima dele
    [self addGesturePassaFalaMascote:self.viewGesturePassaFala];
    
    //Inicia lista de imagens para colisão
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    
    //Adiciona imagens para colisao
    [self.listaImangesColisao addObject: self.notaMelodia];
    [self.listaImangesColisao addObject: self.notasHarmonia];
    [self.listaImangesColisao addObject: self.violao];
    [self.listaImangesColisao addObject: self.flauta];

    //Adiciona gesture ARRASTAR em todas imagens dessa lista
    [[EfeitoImagem sharedManager]addGesturePainImagens: self.listaImangesColisao];
    
    //Inicia lista para liberar falas e auxiliares
    self.listaLiberaFala = [[NSMutableArray alloc]init];
    self.estadoAux1 = @"0";
    self.estadoAux2 = @"0";
    self.estadoAux3 = @"0";
    
    //Inicia auxiliares da biblioteca
    self.contadorDeFalas = 0;
    self.testaBiblio = [Biblioteca sharedManager];
    self.testaConversa = self.testaBiblio.exercicioAtual.mascote.listaDeConversas.firstObject;
    
    //Usar sempre que quiser pular uma fala
    [self pulaFalaMascote];
    
    //Imagem do mascote
    self.imagemDoMascote.image = [[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image;
    [self.view addSubview: self.imagemDoMascote];
    [self.view addSubview: self.lblFalaDoMascote];
    
    //Mascote começa a pular
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando: self.imagemDoMascote];    
}

//Adiciona gesture ao passar de fala a view que fica por cima do mascote
-(void)addGesturePassaFalaMascote:(UIView*)viewGesture{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = NO;
    viewGesture.userInteractionEnabled = NO;
    
    [viewGesture addGestureRecognizer: singleTap];
}



///////////////////////////////////////////////  FALAS ///////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////



//Gerenciador das falas
-(void)pulaFalaMascote{
    
    //Para não dar erro de NULL na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    
    if(self.contadorDeFalas == contadorMaximo){
        NSString *proxExercicio = [[Biblioteca sharedManager]exercicioAtual].nomeView;
        [[EfeitoTransicao sharedManager]chamaViewTransicaoExercicio:self:proxExercicio];
    }
    
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
        
        //Pega a fala atual de acordo com o contador e passa para o label
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex: self.contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        self.contadorDeFalas +=1;
    }
}


//Introdução
-(void)chamaMetodosFala0 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Explica definição de harmonia
-(void)chamaMetodosFala1 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Vitrola
-(void)chamaMetodosFala2 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Animação da vitrola
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.vitrola];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.notasDeHarmonia];
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect novaPosicao1 = CGRectMake(self.vitrola.frame.origin.x+30,
                                                      self.vitrola.frame.origin.y-50,
                                                      self.vitrola.frame.size.width,
                                                      self.vitrola.frame.size.height);
                         
                         CGRect novaPosicao2 = CGRectMake(self.notasDeHarmonia.frame.origin.x+30,
                                                          self.notasDeHarmonia.frame.origin.y-50,
                                                          self.notasDeHarmonia.frame.size.width,
                                                          self.notasDeHarmonia.frame.size.height);
                         
                         self.vitrola.frame = novaPosicao1;
                         self.notasDeHarmonia.frame = novaPosicao2;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//TocaTreco mostra diferença
-(void)chamaMetodosFala3 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Remove animação da vitrola
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.vitrola];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.notasDeHarmonia];

    
    //Verifica se as imagens colidiram e add em uma lista que verificará se todas tiveram colisao
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoNotasHarmonia:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoNotaMelodia:)
                                   userInfo: nil
                                    repeats: YES];
    
    self.tocaTreco.hidden = NO;
    self.notasHarmonia.hidden = NO;
    self.notaMelodia.hidden = NO;
    self.tocaTreco.userInteractionEnabled = YES;
    
    //Verifica o passar fala, passando a qtd de objetos que colidem
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote :self.viewGesturePassaFala:self.listaLiberaFala:2];
    
}

//Complemento de fala
-(void)chamaMetodosFala4 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento de fala
-(void)chamaMetodosFala5 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Tocatreco e instrumentos
-(void)chamaMetodosFala6 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Para som
    self.audioPlayer.stop;
    
    //Verifica se as imagens colidiram e add em uma lista que verificará se todas tiveram colisao
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoViolao:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoFlauta:)
                                   userInfo: nil
                                    repeats: YES];
    
    //Mostra os instrumentos e habilita interação
    self.tocaTreco.userInteractionEnabled = YES;
    self.violao.hidden = NO;
    self.flauta.hidden = NO;
    
    //Verifica o passar fala, passando a qtd de objetos que colidem
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote :self.viewGesturePassaFala:self.listaLiberaFala:2];
}

//Fala de fixacao
-(void)chamaMetodosFala7 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala8 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde tocatreco e para som
    self.audioPlayer.stop;
    self.tocaTreco.hidden = YES;

    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala final
-(void)chamaMetodosFala9 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}



//==========================================================Colisões/Ações=========================================================//

-(void) checkColisaoNotasHarmonia:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.notasHarmonia.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.notasHarmonia.hidden = true;
        self.notasHarmonia.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject:self.estadoAux1];
        
        [theTimer invalidate];
        [self acaoColisaoNotasHarmonia];
    }
    
}

- (void)acaoColisaoNotasHarmonia{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"harmoniaPiano" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
}

-(void) checkColisaoNotaMelodia:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.notaMelodia.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.notaMelodia.hidden = true;
        self.notaMelodia.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject: self.estadoAux2];
        
        [theTimer invalidate];
        [self acaoColisaoNotaMelodia];
    }
    
}

- (void)acaoColisaoNotaMelodia{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"escalaPiano3AOitava" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
}

-(void) checkColisaoViolao:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.violao.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.violao.hidden = true;
        self.violao.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject: self.estadoAux2];
        
        [theTimer invalidate];
        [self acaoColisaoViolao];
    }
    
}

- (void)acaoColisaoViolao{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"acordesViolao" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
}

-(void) checkColisaoFlauta:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.flauta.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.flauta.hidden = true;
        self.flauta.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject: self.estadoAux2];
        
        [theTimer invalidate];
        [self acaoColisaoFlauta];
    }
    
}

- (void)acaoColisaoFlauta{
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"escalaFlauta" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
}



@end
