//
//  Mod1Aula3Exe1ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula3Exe1ViewController.h"

@interface Mod1Aula3Exe1ViewController ()

@end

@implementation Mod1Aula3Exe1ViewController

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
    //[self.listaImangesColisao addObject: self.notaMelodia];
    //[self.listaImangesColisao addObject: self.notasHarmonia];
    //[self.listaImangesColisao addObject: self.violao];
    //[self.listaImangesColisao addObject: self.flauta];
    
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

//Intro sobre música
-(void)chamaMetodosFala0 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Animação e silêncio
-(void)chamaMetodosFala1 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Animação
    self.imgSilencio.hidden = NO;
    self.imgSom.hidden = NO;
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.imgSilencio.frame = CGRectMake(self.imgSilencio.frame.origin.x,
                                                             self.imgSilencio.frame.origin.y+200,
                                                             self.imgSilencio.frame.size.width,
                                                             self.imgSilencio.frame.size.height);
                         
                         self.imgSom.frame = CGRectMake(self.imgSom.frame.origin.x,
                                                        self.imgSom.frame.origin.y+200,
                                                        self.imgSom.frame.size.width,
                                                        self.imgSom.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         
                     }];

    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala sobre tocatreco
-(void)chamaMetodosFala2 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:2.0f:self.viewGesturePassaFala];
}

//Chama animação do tocatreco
-(void)chamaMetodosFala3 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Mostra view de exercitar
    self.viewDeExercitar.hidden = NO;
    self.imgSilencio.hidden = YES;
    self.imgSom.hidden = YES;
    
    //Animações nota caindo
    [self animacaoNotaEntrandoNoTocador];
    [self animacaoNotaSaindoDoTocador];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:2.0f:self.viewGesturePassaFala];
}

//Fala sobre animação
-(void)chamaMetodosFala4 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Para a música
    self.audioPlayer.stop;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Mostra explicação nota e pausa
-(void)chamaMetodosFala5 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [self animacaoExplicandoNotaPausa];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Exercício
-(void)chamaMetodosFala6 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde as views de explicação
    self.imgNota.hidden = YES;
    self.imgNota2.hidden = YES;
    self.imgSeta.hidden = YES;
    self.tocaTreco.hidden = YES;
    
    self.outBtoInstrumentos.hidden = NO;
    self.outBtoCoral.hidden = NO;
    self.outBtoNotasPausas.hidden = NO;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala final
-(void)chamaMetodosFala7 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde view de exercitar e para a música
    //Remove animação da vitrola
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.alternativaCorreta];
    self.viewDeExercitar.hidden = YES;
    self.audioPlayer.stop;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:3.0f:self.viewGesturePassaFala];
}


//Assim que o mascote sobe aparece desce a nota
-(void)animacaoNotaEntrandoNoTocador{
    

    //Mostra objetos que vao entrar
    self.imgNota.hidden = NO;
    self.imgNota2.hidden = NO;
    
    
    [UIView animateWithDuration:3.0
                     animations:^(void){
                         
                         //Notas entrando no tocador
                         self.imgNota.frame = CGRectMake(self.imgNota.frame.origin.x, 300, self.imgNota.frame.size.width, self.imgNota.frame.size.height);
                         self.imgNota2.frame = CGRectMake(self.imgNota2.frame.origin.x, 400, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
                     } completion:^(BOOL finished){
                         self.imgNota.hidden = YES;
                         self.imgNota2.hidden = YES;
                     }];
    
}

//Assim que a nota cai no tocador, um bloquinho sai do tocador
-(void)animacaoNotaSaindoDoTocador{
    
    //Para teste
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"notasPausas" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         
                         //Notas e pausas andam pela esteira
                         self.imgBlocoDo.frame = CGRectMake(800, self.imgBlocoDo.frame.origin.y, self.imgBlocoDo.frame.size.width, self.imgBlocoDo.frame.size.height);
                         self.imgBlocoPausa.frame = CGRectMake(750, self.imgBlocoPausa.frame.origin.y, self.imgBlocoPausa.frame.size.width, self.imgBlocoPausa.frame.size.height);
                     } completion:^(BOOL finished){
                         self.audioPlayer.play;
                         self.imgBlocoDo.hidden = YES;
                         self.imgBlocoPausa.hidden = YES;
                     }];
    
}

//Assim que o mascote sobe aparece desce a nota
-(void)animacaoExplicandoNotaPausa{
    
    self.imgNota.frame = CGRectMake(290, 35, self.imgNota.frame.size.width, self.imgNota.frame.size.height);
    self.imgNota.hidden = NO;
    self.imgSeta.hidden = NO;
    
    [UIView animateWithDuration:1.0
                     animations:^(void){
                         
                         //Notas entrando no tocador
                         self.imgNota.frame = CGRectMake(self.imgNota.frame.origin.x, 70, self.imgNota.frame.size.width, self.imgNota.frame.size.height);
                         self.imgSeta.frame = CGRectMake(self.imgNota.frame.origin.x+60, 70, self.imgSeta.frame.size.width, self.imgSeta.frame.size.height);
                     
                     } completion:^(BOOL finished){
                     }];
    
}


//Opções
- (IBAction)intrumentos:(id)sender {
    NSLog(@"Instrumentos");
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"instrumentos" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    self.audioPlayer.play;
}

- (IBAction)coral:(id)sender {
    NSLog(@"Coral");
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"coral" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    self.audioPlayer.play;
}

- (IBAction)notasPausas:(id)sender {
    NSLog(@"ACERTOU! Notas e pausas");
    
    //Animação de resposta certa
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.alternativaCorreta];
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.alternativaCorreta.alpha = 0.3;
                     }
                     completion:^(BOOL finished){
                         
                     }];

    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"notasPausas" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    self.audioPlayer.play;
\
}


@end
