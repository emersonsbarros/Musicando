//
//  Mod1Aula3Exe3ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula3Exe3ViewController.h"

@interface Mod1Aula3Exe3ViewController ()
@end

@implementation Mod1Aula3Exe3ViewController

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
    
    //Sombreando view de exercitar
//    self.viewDeExercitar.layer.shadowColor = [[UIColor blackColor] CGColor];
//    self.viewDeExercitar.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
//    self.viewDeExercitar.layer.shadowRadius = 3.0f;
//    self.viewDeExercitar.layer.shadowOpacity = 1.0f;
//    [self.viewDeExercitar setBackgroundColor: [UIColor whiteColor]];
//    
    [self iniciarComponentes];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}



-(void)iniciarComponentes{
    
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
            case 8:
                [self chamaMetodosFala8];
                break;
                
            default:
                break;
        }
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:[MascoteViewController sharedManager].contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        [MascoteViewController sharedManager].contadorDeFalas += 1;
    }
}

//Introdução
-(void)chamaMetodosFala0 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Introdução
-(void)chamaMetodosFala1 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Definição de melodia
-(void)chamaMetodosFala2 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Animação da vitrola
-(void)chamaMetodosFala3 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Animação da vitrola
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.vitrola];
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.notasDeMelodia];
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect novaPosicao1 = CGRectMake(self.vitrola.frame.origin.x+30,
                                                          self.vitrola.frame.origin.y-50,
                                                          self.vitrola.frame.size.width,
                                                          self.vitrola.frame.size.height);
                         
                         CGRect novaPosicao2 = CGRectMake(self.notasDeMelodia.frame.origin.x+30,
                                                          self.notasDeMelodia.frame.origin.y-50,
                                                          self.notasDeMelodia.frame.size.width,
                                                          self.notasDeMelodia.frame.size.height);
                         
                         self.vitrola.frame = novaPosicao1;
                         self.notasDeMelodia.frame = novaPosicao2;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento de fala
-(void)chamaMetodosFala4 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Remove animação da vitrola
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.vitrola];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.notasDeMelodia];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Exemplo do toca treco
-(void)chamaMetodosFala5 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde vitrola, mostra view de exercitar
    [self primeiraAnimacao];
    self.viewDeExercitar.hidden = NO;
    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento de fala
-(void)chamaMetodosFala6 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Para som
    [[ExercicioPlayer sharedManager]stopAudio];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Exercício
-(void)chamaMetodosFala7 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Para som
    [[ExercicioPlayer sharedManager]stopAudio];
    
    //Mostra views do teste
    self.outTocaTreco1.hidden = YES;
    self.outTocaTreco2.hidden = YES;
    self.imgNota1.hidden = YES;
    self.imgNota2.hidden = YES;
    self.imgNota3.hidden = YES;
    self.imgNota4.hidden = YES;
    self.imgNota5.hidden = YES;
    
    self.outViolaco.hidden = NO;
    self.outFlauta.hidden = NO;
    self.outPiano.hidden = NO;
    
    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala Final
-(void)chamaMetodosFala8 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde o teste e para som
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.alternativaCorreta];
    self.viewDeExercitar.hidden = YES;
    [[ExercicioPlayer sharedManager]stopAudio];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}



//////////////////////////////////////////  ANIMAÇÕES E AÇÕES /////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////


//Traz a view de exercitar
-(void)primeiraAnimacao{
    
    [UIView animateWithDuration:1.0
                     animations:^(void){
                         //Muda local do mascote e label
                         self.viewDeExercitar.frame = CGRectMake(100, self.viewDeExercitar.frame.origin.y, self.viewDeExercitar.frame.size.width, self.viewDeExercitar.frame.size.height);
                     } completion:^(BOOL finished){
                     }];
}


//Animação toca treco
-(void)animacaoTocaTreco{
    
    if (self.outTocaTreco1.tag == 100){
        NSLog(@"Primeiro tocatreco");
        self.imgNota2.frame = CGRectMake(84, 110, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(143, 110, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
        self.imgNota4.frame = CGRectMake(204, 110, self.imgNota4.frame.size.width, self.imgNota4.frame.size.height);
        
        self.imgNota2.hidden = NO;
        self.imgNota3.hidden = NO;
        self.imgNota4.hidden = NO;
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"escalaPiano3AOitava" withExtension:@"wav"];
        [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
       
        
    }else if(self.outTocaTreco2.tag == 100){
        NSLog(@"Primeiro tocatreco");
        self.imgNota1.frame = CGRectMake(84, 322, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
        self.imgNota2.frame = CGRectMake(84, 364, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(143, 364, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
        self.imgNota4.frame = CGRectMake(204, 364, self.imgNota4.frame.size.width, self.imgNota4.frame.size.height);
        self.imgNota5.frame = CGRectMake(204, 322, self.imgNota5.frame.size.width, self.imgNota5.frame.size.height);
        
        self.imgNota1.hidden = NO;
        self.imgNota2.hidden = NO;
        self.imgNota3.hidden = NO;
        self.imgNota4.hidden = NO;
        self.imgNota5.hidden = NO;
        
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"harmoniaPiano" withExtension:@"wav"];
        [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    }
    


    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         
                         //Aumenta o tamanho do botão
                         self.imgNota1.frame = CGRectMake(1000, self.imgNota1.frame.origin.y, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
                         self.imgNota2.frame = CGRectMake(1050, self.imgNota2.frame.origin.y, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
                         self.imgNota3.frame = CGRectMake(1100, self.imgNota3.frame.origin.y, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
                         self.imgNota4.frame = CGRectMake(1150, self.imgNota4.frame.origin.y, self.imgNota4.frame.size.width, self.imgNota3.frame.size.height);
                         self.imgNota5.frame = CGRectMake(1200, self.imgNota5.frame.origin.y, self.imgNota5.frame.size.width, self.imgNota3.frame.size.height);
                         
                     } completion:^(BOOL finished){
                         
                          [[ExercicioPlayer sharedManager]playAudios];
                         
                     }];
    
    self.outTocaTreco1.tag = 0;
    self.outTocaTreco2.tag = 0;
}


- (IBAction)tocaTreco1:(id)sender {
    NSLog(@"TocaTreco1 acionado");
    self.outTocaTreco1.tag = 100;
    [self animacaoTocaTreco];

}

- (IBAction)tocaTreco2:(id)sender {
    NSLog(@"TocaTreco2 acionado");
    self.outTocaTreco2.tag = 100;
    [self animacaoTocaTreco];
}

- (IBAction)violao:(id)sender {
    NSLog(@"Violão acionado");
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"acordesViolao" withExtension:@"wav"];
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    [[ExercicioPlayer sharedManager]playAudios];

}

- (IBAction)flauta:(id)sender {
    NSLog(@"ACERTOU! Flauta acionada");
    
    //Animação da vitrola
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.alternativaCorreta];
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.alternativaCorreta.alpha = 0.3;
                     }
                     completion:^(BOOL finished){
                         
                     }];

    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"escalaFlauta" withExtension:@"wav"];
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    [[ExercicioPlayer sharedManager]playAudios];
}

- (IBAction)piano:(id)sender {
    NSLog(@"Piano acionado");
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"escalaPiano3AOitava" withExtension:@"wav"];
    [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
    [[ExercicioPlayer sharedManager]playAudios];

}
@end
