//
//  Mod2Aula1Exe3ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod2Aula1Exe3ViewController.h"

@interface Mod2Aula1Exe3ViewController ()

@end

@implementation Mod2Aula1Exe3ViewController

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
    
    
    
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    //Add imagens que faram colisao
    //[self.listaImangesColisao addObject:self.imgFitaFuracao];
    //Add gesture arrastar em todas imagens dessa lista
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImangesColisao];
    
    
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

-(void)chamaMetodosFala0{
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgEscalaOriginal];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];

}


-(void)chamaMetodosFala1{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgEscalaOriginal];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgEscalaAntiga];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
}


-(void)chamaMetodosFala2{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgEscalaAntiga];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgMonge];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgIdeiasmonge];
    
    [UIView animateWithDuration:3.0
                          delay:2.0
                        options:   UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.imgIdeiasmonge.alpha = 1.0;
                     }completion:^(BOOL finished){
                         
                     }];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
}


-(void)chamaMetodosFala3{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgMonge];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgIdeiasmonge];
    
    

    [self lacoCaindoNotas];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}


-(void)chamaMetodosFala4{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
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



//////////////////////////////// METODOS NOTAS CAINDO /////////////////////////

-(void)lacoCaindoNotas{
    
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote2];
    
    float duracao = 1.0;
    float delay = 0.0;
    float posX = 30;
    CGFloat posY= 400;
    NSString *nomeNota;
    NSArray *listaNomes = [NSArray arrayWithObjects:@"Dó", @"Ré", @"Mi", @"Fa", @"Sol", @"Lá", @"Si", nil];
    
    for(int i=0;i<7;i++){
        UILabel *carinha = [[UILabel alloc]init];
        carinha.text = [listaNomes objectAtIndex:i];
        carinha.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
        [carinha sizeToFit];
        carinha.textAlignment = NSTextAlignmentCenter;
        
        carinha.frame = CGRectMake(posX,200,carinha.frame.size.width+40,carinha.frame.size.height+70);
        [[self listaImagensCai]addObject:carinha];
        [self.view addSubview:carinha];
        
        
        posY = 350;
        
        
        [self animacaoCaindoNotas:carinha:duracao:posX:posY:delay:nomeNota];
        posX += 150;
        delay += 0.1;
        
        
    }
    
}


-(void)animacaoCaindoNotas:(UIView*)notaCaindo :(float)duracao :(CGFloat)posX :(CGFloat)posY :(float)tempoDemrora :(NSString*)nomeNota{
    //UIViewAnimationOptionAutoreverse ,UIViewAnimationOptionCurveEaseInOut,UIViewAnimationOptionTransitionCrossDissolv
    
    [UIView animateWithDuration:duracao
                          delay:tempoDemrora
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         [notaCaindo.layer removeAnimationForKey:@"1"];
                         CGRect moveGalo = CGRectMake(posX,
                                                      posY,
                                                      notaCaindo.frame.size.width,
                                                      notaCaindo.frame.size.height);
                         notaCaindo.frame = moveGalo;
                     }
                     completion:^(BOOL finished){
                         notaCaindo.hidden = YES;
                     }];
    
    
}


@end
