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

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Add barra Superior ao Xib
    [[EfeitoBarraSuperior sharedManager]addBarraSuperioAoXib:self:[Biblioteca sharedManager].exercicioAtual];
    
    [self iniciarComponentes];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


-(void)iniciarComponentes{
    
    //Habilita o gesture do mascote com a UIView que fica por cima dele
    [self addGesturePassaFalaMascote: self.viewGesturePassaFala];
    
    //Inicia lista de imagens para colisão
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    
    //Adiciona imagens para colisao
    [self.listaImangesColisao addObject: self.melodia];
    [self.listaImangesColisao addObject: self.ritmo];
    [self.listaImangesColisao addObject: self.harmonia];
    
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
    [self.view addSubview: self.telao];
    [self.view addSubview: self.lblSaidaTocaTreco];
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

//Gerenciador das falas
-(void)pulaFalaMascote{
    
    //Para não dar erro de NULL na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    
    if(self.contadorDeFalas == contadorMaximo){
        NSString *proxExercicio = [[Biblioteca sharedManager]exercicioAtual].nomeView;
        [[Biblioteca sharedManager]chamaViewTransicaoExercicio:self:proxExercicio];
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
                
            default:
                break;
        }
        
        //Pega a fala atual de acordo com o contador e passa para o label
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex: self.contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        self.contadorDeFalas +=1;
    }
}


//Intro
-(void)chamaMetodosFala0 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Explicação
-(void)chamaMetodosFala1 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala2 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
 
}

//TocaTreco
-(void)chamaMetodosFala3 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
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
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote :self.viewGesturePassaFala:self.listaLiberaFala: 3];
}

//Complemento
-(void)chamaMetodosFala4 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];

    self.audioPlayer.stop;
    self.tocaTreco.hidden = YES;
    self.melodia.hidden = YES;
    self.ritmo.hidden = YES;
    self.harmonia.hidden = YES;
    self.telao.hidden = YES;
    self.lblSaidaTocaTreco.hidden = YES;
    
     [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Animacao pilares
-(void)chamaMetodosFala5 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
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
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala6 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    self.teto.hidden = YES;
    self.pilar1.hidden = YES;
    self.pilar2.hidden = YES;
    self.pilar3.hidden = YES;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala final
-(void)chamaMetodosFala7 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
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
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
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
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
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
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [[self audioPlayer]play];
    self.lblSaidaTocaTreco.text = @"Harmonia";
}



@end
