//
//  Mod2Aula3Exe2ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod2Aula3Exe2ViewController.h"

@interface Mod2Aula3Exe2ViewController ()
@end

@implementation Mod2Aula3Exe2ViewController

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
    [self.listaImangesColisao addObject: self.notaDo];
    [self.listaImangesColisao addObject: self.notaRe];
    [self.listaImangesColisao addObject: self.notaMi];
    [self.listaImangesColisao addObject: self.notaFa];
    [self.listaImangesColisao addObject: self.notaSol];
    [self.listaImangesColisao addObject: self.notaLa];
    [self.listaImangesColisao addObject: self.notaSi];

    
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

//Apresenta escada de tons
-(void)chamaMetodosFala1 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    self.escadaDeTons.hidden = NO;
    self.mascote2.hidden = NO;
    
    self.notaDo.hidden = NO;
    self.notaRe.hidden = NO;
    self.notaMi.hidden = NO;
    self.notaFa.hidden = NO;
    self.notaSol.hidden = NO;
    self.notaLa.hidden = NO;
    self.notaSi.hidden = NO;
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Sobre mascote
-(void)chamaMetodosFala2 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento e toca escala
-(void)chamaMetodosFala3 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.mascote2.frame = CGRectMake(800,
                                                          15,
                                                          self.mascote2.frame.size.width,
                                                          self.mascote2.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         
                         //self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"happybirthdaySamba" withExtension:@"mp3"];
                         //self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
                         //
                         //[[self audioPlayer]play];
                         
                     }];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala4 {
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    [[ExercicioPlayer sharedManager] stopAudio];
    
    self.escadaDeTons.hidden = YES;
    self.mascote2.hidden = YES;

    self.notaDo.hidden = YES;
    self.notaRe.hidden = YES;
    self.notaMi.hidden = YES;
    self.notaFa.hidden = YES;
    self.notaSol.hidden = YES;
    self.notaLa.hidden = YES;
    self.notaSi.hidden = YES;
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

@end
