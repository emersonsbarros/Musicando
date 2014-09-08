//
//  Mod2Aula4Exe1ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod2Aula4Exe1ViewController.h"

@interface Mod2Aula4Exe1ViewController ()

@end

@implementation Mod2Aula4Exe1ViewController

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


-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    [[ExercicioTransicao sharedManager]finalizaExercicio:self];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    ///Add barra,Mascote,View de Retornar Pagina ao Xib
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
    //[self.listaImangesColisao addObject: self.melodia];
    //[self.listaImangesColisao addObject: self.ritmo];
    //[self.listaImangesColisao addObject: self.harmonia];
    
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
            case 8:
                [self chamaMetodosFala8];
                break;
            case 9:
                [self chamaMetodosFala9];
                break;
            case 10:
                [self chamaMetodosFala10];
                break;
            case 11:
                [self chamaMetodosFala11];
                break;
            case 12:
                [self chamaMetodosFala12];
                break;
            case 13:
                [self chamaMetodosFala13];
                break;
            case 14:
                [self chamaMetodosFala14];
                break;
            case 15:
                [self chamaMetodosFala15];
                break;
            case 16:
                [self chamaMetodosFala16];
                break;
            case 17:
                [self chamaMetodosFala17];
                break;
            case 18:
                [self chamaMetodosFala18];
                break;
            case 19:
                [self chamaMetodosFala19];
                break;
            case 20:
                [self chamaMetodosFala20];
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

//Notas como blocos
-(void)chamaMetodosFala1 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Mostra
    self.notaBloco1.hidden = NO;
    self.notaBloco2.hidden = NO;
    self.notaBloco3.hidden = NO;

    
    [UIView animateWithDuration:3.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.notaBloco1.frame = CGRectMake(self.notaBloco1.frame.origin.x,
                                                                 self.notaBloco1.frame.origin.y+400,
                                                                 self.notaBloco1.frame.size.width,
                                                                 self.notaBloco1.frame.size.height);
                         
                         self.notaBloco2.frame = CGRectMake(self.notaBloco2.frame.origin.x,
                                                            self.notaBloco2.frame.origin.y+400,
                                                            self.notaBloco2.frame.size.width,
                                                            self.notaBloco2.frame.size.height);
                         
                         self.notaBloco3.frame = CGRectMake(self.notaBloco3.frame.origin.x,
                                                            self.notaBloco3.frame.origin.y+400,
                                                            self.notaBloco3.frame.size.width,
                                                            self.notaBloco3.frame.size.height);
                         
                     }
                     completion:^(BOOL finished){
                     }];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala sobre escala
-(void)chamaMetodosFala2 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde imagem dos blocos
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade: self.notaBloco1];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade: self.notaBloco2];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade: self.notaBloco3];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala3 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala4 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala5 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala6 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Esplicando que são valores
-(void)chamaMetodosFala7 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Semibreve
-(void)chamaMetodosFala8 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade: self.notaSemibreve];

    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Minima
-(void)chamaMetodosFala9 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade: self.notaMinima];

    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala10 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Seminima
-(void)chamaMetodosFala11 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade: self.notaSeminima];

    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala12 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala13 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Colcheia
-(void)chamaMetodosFala14 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade: self.notaColcheia];

    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala15 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Semicolcheia
-(void)chamaMetodosFala16 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade: self.notaSemicolheia];

    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala17 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fusa
-(void)chamaMetodosFala18 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade: self.notaFusa];

    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Semifusa
-(void)chamaMetodosFala19 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade: self.notaSemifusa];

    
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Mostra todas
-(void)chamaMetodosFala20 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}


@end
