//
//  Mod1Aula3Exe5ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula3Exe5ViewController.h"

@interface Mod1Aula3Exe5ViewController ()
@end

@implementation Mod1Aula3Exe5ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
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
    [self.listaImangesColisao addObject: self.harmonia];
    [self.listaImangesColisao addObject: self.teclado];
    [self.listaImangesColisao addObject: self.piano];

    
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
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote];
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
                
            default:
                break;
        }
        
        //Pega a fala atual de acordo com o contador e passa para o label
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex: self.contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        self.contadorDeFalas +=1;
    }
}

//Explica Harmonia
-(void)chamaMetodosFala0 {
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Diferença entre Melodia
-(void)chamaMetodosFala1 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//TocaTreco e notas
-(void)chamaMetodosFala2 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Verifica se as imagens colidiram e add em uma lista que verificará se todas tiveram colisao
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoHarmonia:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoMelodia:)
                                   userInfo: nil
                                    repeats: YES];
    
    //Mostra os instrumentos e habilita interação
    self.tocaTreco.userInteractionEnabled = YES;
    self.tocaTreco.hidden = NO;
    self.harmonia.hidden = NO;
    self.melodia.hidden = NO;
    
    //Verifica o passar fala, passando a qtd de objetos que colidem*/
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote :self.viewGesturePassaFala:self.listaLiberaFala:2];
}

-(void)chamaMetodosFala3 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    self.harmonia.hidden = YES;
    self.melodia.hidden = YES;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//TocaTreco e Instrumentos
-(void)chamaMetodosFala4 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Verifica se as imagens colidiram e add em uma lista que verificará se todas tiveram colisao
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoTeclado:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPiano:)
                                   userInfo: nil
                                    repeats: YES];
    
    //Mostra os instrumentos e habilita interação
    self.tocaTreco.userInteractionEnabled = YES;
    self.tocaTreco.hidden = NO;
    self.piano.hidden = NO;
    self.teclado.hidden = NO;
    
    //Verifica o passar fala, passando a qtd de objetos que colidem
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote :self.viewGesturePassaFala:self.listaLiberaFala:2];
}

-(void)chamaMetodosFala5 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    self.tocaTreco.hidden = YES;
    self.piano.hidden = YES;
    self.teclado.hidden = YES;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}



//==========================================================Colisões/Ações=========================================================//

-(void) checkColisaoHarmonia:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.harmonia.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.harmonia.hidden = true;
        self.harmonia.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject: self.estadoAux1];
        
        [theTimer invalidate];
        [self acaoColisaoHarmonia];
    }
    
}

- (void)acaoColisaoHarmonia{
    //self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"galo" withExtension:@"wav"];
    //self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    //[[self audioPlayer]play];
}

-(void) checkColisaoMelodia:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.melodia.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.melodia.hidden = true;
        self.melodia.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject: self.estadoAux2];
        
        [theTimer invalidate];
        [self acaoColisaoMelodia];
    }
    
}

- (void)acaoColisaoMelodia{
    //self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"galo" withExtension:@"wav"];
    //self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    //[[self audioPlayer]play];
}


-(void) checkColisaoTeclado:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.teclado.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.teclado.hidden = true;
        self.teclado.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject: self.estadoAux2];
        
        [theTimer invalidate];
        [self acaoColisaoTeclado];
    }
    
}

- (void)acaoColisaoTeclado{
    //self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"galo" withExtension:@"wav"];
    //self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    //[[self audioPlayer]play];
}

-(void) checkColisaoPiano:(NSTimer *) theTimer{
    id presentationLayer1 = self.tocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.piano.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.piano.hidden = true;
        self.piano.frame = self.tocaTreco.frame;
        [self.listaLiberaFala addObject: self.estadoAux2];
        
        [theTimer invalidate];
        [self acaoColisaoPiano];
    }
    
}

- (void)acaoColisaoPiano{
    //self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"galo" withExtension:@"wav"];
    //self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    //[[self audioPlayer]play];
}



@end
