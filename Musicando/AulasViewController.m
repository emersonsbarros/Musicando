//
//  AulasViewController.m
//  Musicando
//
//  Created by VINICIUS RESENDE FIALHO on 18/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "AulasViewController.h"

@interface AulasViewController ()

@end

@implementation AulasViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.listaAulas = [[NSMutableArray alloc]init];
    self.listaExercicios = [[NSMutableArray alloc]init];
    
    [self carregaAulas];
    
}

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    
    [self retiraViewExericios];
    
    for (UIView *subView in self.listaAulas){
        [subView removeFromSuperview];
    }
    
    [self.listaExercicios removeAllObjects];
    [self.listaAulas removeAllObjects];
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)chamaStoryBoardExercicio:(id)sender{
    
    [self retiraViewExericios];
    for (UIView *subView in self.listaAulas){
        [subView removeFromSuperview];
    }
    [self.listaExercicios removeAllObjects];
    [self.listaAulas removeAllObjects];
    
    
    
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

////////////////////////// Metodos Carrega Exercicios e aulas ///////////////////////////

//Cria os botões das aulas e adiciona-os na view
-(void)carregaAulas{
    
    
    int contadorDistanciaEntreBotoes = 80;
    
    for(Aula *aula in [Biblioteca sharedManager].moduloAtual.listaDeAulas){
        
        aula.layer.zPosition = 0;
        [aula addTarget:self action:@selector(chamaExercicios:) forControlEvents:UIControlEventTouchUpInside];
        
        aula.frame = CGRectMake(contadorDistanciaEntreBotoes, 100, 100, 150);
        [aula setBackgroundImage:[aula capa] forState:UIControlStateNormal];
        
        aula.descricaoBotao =  [[UILabel alloc] initWithFrame: CGRectMake(-45,110,200,100)];
        aula.descricaoBotao.text = [aula nome];
        aula.descricaoBotao.font = [UIFont fontWithName:@"Papyrus" size:20];
        aula.descricaoBotao.textAlignment = NSTextAlignmentCenter;
        [aula addSubview:aula.descricaoBotao];
        
        [[self view] addSubview:aula];
        
        [self.listaAulas addObject:aula];
        
        contadorDistanciaEntreBotoes += 200;
        
    }
    
}


//Animação e mostra a view dos exercícios
-(void)chamaExercicios:(id)sender{
    
    Aula *button = sender;
    self.aulaAtual = button;
    [Biblioteca sharedManager].aulaAtual = button;
    
    for (UIView *subView in self.listaAulas){
        [[ExercicioImagem sharedManager]hiddenYesEmDegrade:subView];
    }
    
    [self carregaExercicios];
    self.viewExercicios.layer.zPosition = +1;
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.viewExercicios];
    
}

//Cria os botões dos exercícios e adiciona-os na view
-(void)carregaExercicios{
    
    int contadorDistanciaEntreBotoes = 110;
    int contadorDistanciaQuebraLinhas = 20;
    int indice=1;
    
    for(Exercicio *exerc in [[[Biblioteca sharedManager] aulaAtual] listaDeExercicios]){
        
        exerc.layer.zPosition = +3;
        [exerc addTarget:self action:@selector(chamaStoryBoardExercicio:) forControlEvents:UIControlEventTouchUpInside];
        
        [exerc setTitle:@"" forState:UIControlStateNormal];
        exerc.frame = CGRectMake(contadorDistanciaEntreBotoes, contadorDistanciaQuebraLinhas, 100, 100);
        [exerc setBackgroundImage:[exerc capa] forState:UIControlStateNormal];
        
        exerc.descricaoBotao =  [[UILabel alloc] initWithFrame: CGRectMake(-45,75,200,100)];
        exerc.descricaoBotao.text = [exerc nome];
        exerc.descricaoBotao.font = [UIFont fontWithName:@"Papyrus" size:20];
        exerc.descricaoBotao.textColor = [UIColor whiteColor];
        exerc.descricaoBotao.textAlignment = NSTextAlignmentCenter;
        exerc.descricaoBotao.numberOfLines = 3;
        
        [exerc addSubview:exerc.descricaoBotao];
        [[self viewExercicios] addSubview: exerc];
        
        [self.listaExercicios addObject:exerc];
        [self.listaExercicios addObject:exerc.descricaoBotao];
        
        contadorDistanciaEntreBotoes += 200;
        
        
        if(indice % 4 == 0){
            contadorDistanciaQuebraLinhas += 200;
            contadorDistanciaEntreBotoes = 110;
        }
        
        indice += 1;
    }
}

-(void)retiraViewExericios{
    
    
    CATransition *  tran=[CATransition animation];
    tran.type = @"pageCurl";
    tran.subtype = kCATransitionFromRight;
    tran.duration=1.5;
    tran.delegate=self;
    [self.viewExercicios.layer addAnimation:tran forKey:@"ads"];
    self.viewExercicios.hidden = YES;
    
    for (UIView *subView in self.listaExercicios){
        if(subView.tag != 1){
            [subView removeFromSuperview];
        }
    }
    
    for (UIView *subView in self.listaAulas){
        [[ExercicioImagem sharedManager]hiddenNoEmDegrade:subView];
    }
    
    [self.listaExercicios removeAllObjects];
}

- (IBAction)btnVoltarAulas:(id)sender {
    [self retiraViewExericios];
}

/////////////////////////////////////////////////////////////////////////////////////////




@end
