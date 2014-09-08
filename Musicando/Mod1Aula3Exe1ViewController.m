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

- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    [[ExercicioTransicao sharedManager]finalizaExercicio:self];
    
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
    
    //Add barra,Mascote,View de Retornar Pagina ao Xib
    [[GerenciadorComponenteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    SEL selectors1 = @selector(pulaFalaMascote);
    [[MascoteViewController sharedManager]addGesturePassaFalaMascote:self.viewGesturePassaFala :selectors1:self];
    [[RetornaPaginaViewController sharedManager]addGesturePassaFalaMascote:[RetornaPaginaViewController sharedManager].viewRetornaPagina:selectors1:self];
    
    //Inicia lista de imagens para colisão
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    //Adiciona imagens para colisao
    //[self.listaImangesColisao addObject: self.notaMelodia];
    //[self.listaImangesColisao addObject: self.notasHarmonia];
    //[self.listaImangesColisao addObject: self.violao];
    //[self.listaImangesColisao addObject: self.flauta];
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


///////////////////////////////////////////////  FALAS ///////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////



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

//Intro sobre música
-(void)chamaMetodosFala0 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Animação e silêncio
-(void)chamaMetodosFala1 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
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

    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala sobre tocatreco
-(void)chamaMetodosFala2 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:2.0f:self.viewGesturePassaFala];
}

//Chama animação do tocatreco
-(void)chamaMetodosFala3 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Mostra view de exercitar
    self.viewDeExercitar.hidden = NO;
    self.imgSilencio.hidden = YES;
    self.imgSom.hidden = YES;
    
    //Animações nota caindo
    [self animacaoNotaEntrandoNoTocador];
    [self animacaoNotaSaindoDoTocador];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:2.0f:self.viewGesturePassaFala];
}

//Fala sobre animação
-(void)chamaMetodosFala4 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Para a música
    [[ExercicioPlayer sharedManager]stopAudio];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Mostra explicação nota e pausa
-(void)chamaMetodosFala5 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [self animacaoExplicandoNotaPausa];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Exercício
-(void)chamaMetodosFala6 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde as views de explicação
    self.imgNota.hidden = YES;
    self.imgNota2.hidden = YES;
    self.imgSeta.hidden = YES;
    self.tocaTreco.hidden = YES;
    
    self.outBtoInstrumentos.hidden = NO;
    self.outBtoCoral.hidden = NO;
    self.outBtoNotasPausas.hidden = NO;
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala final
-(void)chamaMetodosFala7 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde view de exercitar e para a música
    //Remove animação da vitrola
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.alternativaCorreta];
    self.viewDeExercitar.hidden = YES;
    [[ExercicioPlayer sharedManager]stopAudio];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:3.0f:self.viewGesturePassaFala];
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
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];

    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         
                         //Notas e pausas andam pela esteira
                         self.imgBlocoDo.frame = CGRectMake(800, self.imgBlocoDo.frame.origin.y, self.imgBlocoDo.frame.size.width, self.imgBlocoDo.frame.size.height);
                         self.imgBlocoPausa.frame = CGRectMake(750, self.imgBlocoPausa.frame.origin.y, self.imgBlocoPausa.frame.size.width, self.imgBlocoPausa.frame.size.height);
                     } completion:^(BOOL finished){
                        [[ExercicioPlayer sharedManager]playAudios];
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
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    [[ExercicioPlayer sharedManager]playAudios];
}

- (IBAction)coral:(id)sender {
    NSLog(@"Coral");
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"coral" withExtension:@"mp3"];
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    [[ExercicioPlayer sharedManager]playAudios];
}

- (IBAction)notasPausas:(id)sender {
    NSLog(@"ACERTOU! Notas e pausas");
    
    //Animação de resposta certa
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.alternativaCorreta];
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.alternativaCorreta.alpha = 0.3;
                     }
                     completion:^(BOOL finished){
                         
                     }];

    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"notasPausas" withExtension:@"mp3"];
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    [[ExercicioPlayer sharedManager]playAudios];

}


@end
