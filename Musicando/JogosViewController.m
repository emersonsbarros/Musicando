//
//  JogosViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 24/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "JogosViewController.h"

@interface JogosViewController ()

@end

@implementation JogosViewController

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
    
    
    [self performSelector:@selector(chamaSpriteTelevisao) withObject:NULL afterDelay:0.2];
    
    
    self.listaExercicios = [[NSMutableArray alloc]init];
    
    [self adicionaJogosTelevisao];
    

}

-(void)chamaSpriteTelevisao{
    UIImage *image1 = [UIImage imageNamed:@"frame-1.gif"];
    UIImage *image2 = [UIImage imageNamed:@"frame-2.gif"];
    UIImage *image3 = [UIImage imageNamed:@"frame-3.gif"];
    UIImage *image4 = [UIImage imageNamed:@"frame-4.gif"];
    UIImage *image5 = [UIImage imageNamed:@"frame-5.gif"];
    UIImage *image6 = [UIImage imageNamed:@"frame-6.gif"];
    UIImage *image7 = [UIImage imageNamed:@"frame-7.gif"];
    UIImage *image8 = [UIImage imageNamed:@"frame-8.gif"];
    UIImage *image9 = [UIImage imageNamed:@"frame-9.gif"];
    
    NSArray *imageArray2 = [NSArray arrayWithObjects:image1,image2,image3,image4,image5,image6,image7,image8,image9,nil];
   [[ExercicioImagem sharedManager]addAnimacaoSprite:imageArray2:self.imgFrameTv];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)retiraViewExericios{
    
    for (UIView *subView in self.listaExercicios){
        [subView removeFromSuperview];
    }
    
    [self.listaExercicios removeAllObjects];
}

-(void)chamaStoryBoardExercicio:(id)sender{
    
    [self retiraViewExericios];
 
    
    Exercicio *button = sender;
    id object = [[NSClassFromString([button nomeView]) alloc]initWithNibName:[button nomeView] bundle:nil];
    
    [Biblioteca sharedManager].exercicioAtual = button;
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    
    [self presentViewController:object animated:NO completion:nil];
    
}

-(void)adicionaJogosTelevisao{
    
    NSMutableArray *aux = [[NSMutableArray alloc]init];
    NSMutableArray *jogos = [[NSMutableArray alloc]init];
    
    for(Modulo *mod in [Biblioteca sharedManager].listaDeModulos){
        for(Aula *aulas in mod.listaDeAulas){
            for(Exercicio *exerRetorna in aulas.listaDeExercicios){
                    [aux addObject:exerRetorna];
            }
        }
    }
    
    for(Exercicio *jog in aux){
        if(jog.idView == 666){
            [jogos addObject:jog];
        }
    }
    
    int contadorDistanciaEntreBotoes = 50;
    int contadorDistanciaQuebraLinhas = 54;
    int indice=1;
    
    for(Exercicio *exerc in jogos){
        
        exerc.layer.zPosition = +3;
        [exerc addTarget:self action:@selector(chamaStoryBoardExercicio:) forControlEvents:UIControlEventTouchUpInside];
        
        [exerc setTitle:@"" forState:UIControlStateNormal];
        exerc.frame = CGRectMake(contadorDistanciaEntreBotoes, contadorDistanciaQuebraLinhas, 100, 100);
        [exerc setBackgroundImage:[exerc capa] forState:UIControlStateNormal];
        
        exerc.descricaoBotao =  [[UILabel alloc] initWithFrame: CGRectMake(-25,80,150,100)];
        exerc.descricaoBotao.numberOfLines = 2;
        exerc.descricaoBotao.minimumScaleFactor = 0.5 ;
        exerc.descricaoBotao.text = [exerc nome];
        exerc.descricaoBotao.font = [UIFont fontWithName:@"Papyrus" size:25];
        exerc.descricaoBotao.textColor = [UIColor blackColor];
        exerc.descricaoBotao.textAlignment = NSTextAlignmentCenter;
        
        [exerc addSubview:exerc.descricaoBotao];
        [[self viewTelevisao] addSubview: exerc];
        
        [self.listaExercicios addObject:exerc.descricaoBotao];
        [self.listaExercicios addObject:exerc];
        
        contadorDistanciaEntreBotoes += 170;
        
        
        if(indice % 3 == 0){
            contadorDistanciaQuebraLinhas += 200;
            contadorDistanciaEntreBotoes = 54;
        }
        
        indice += 1;
    }
}


//// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"SaiSalaJogos"]){
        [self retiraViewExericios];
    }
}


-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    
    [self retiraViewExericios];
    
}

@end




