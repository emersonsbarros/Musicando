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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(void)chamaExercicios:(id)sender{
    Aula *button = sender;
    self.aulaAtual = button;
    [Biblioteca sharedManager].aulaAtual = button;
  
    [UIView animateWithDuration:1.0
                     animations:^(void){
                         self.posOriginalAula = button.frame;
                         CGRect move = CGRectMake(470, 70, 100, 150);
                         self.aulaAtual.frame = move;
                     } completion:^(BOOL finished){
                         self.viewExercicios.hidden = NO;
                         [self carregaExercicios];
                         [self efeitoDescer];
                     }];

}

-(void)efeitoDescer{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTouchesRequired = 1;
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:singleTap];
    
}

-(void)tapDetected{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         self.aulaAtual.frame = self.posOriginalAula;
                         self.viewExercicios.hidden = YES;
                     } completion:^(BOOL finished){
                       
                     }];
}


-(void)chamaStoryBoardExercicio:(id)sender{
    
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

-(void)carregaExercicios{
    
    int contadorDistanciaEntreBotoes = 80;
    
    for(Exercicio *exerc in self.aulaAtual.listaDeExercicios){
        
        [exerc addTarget:self
                 action:@selector(chamaStoryBoardExercicio:)
        forControlEvents:UIControlEventTouchUpInside];
        
        [exerc setTitle:@"" forState:UIControlStateNormal];
        exerc.frame = CGRectMake(contadorDistanciaEntreBotoes, 20.0, 100, 100);
         [exerc setBackgroundImage:[exerc capa] forState:UIControlStateNormal];
        
        exerc.descricaoBotao =  [[UILabel alloc] initWithFrame: CGRectMake(-45,60,200,100)];
        exerc.descricaoBotao.text = [exerc nome];
        exerc.descricaoBotao.textAlignment = NSTextAlignmentCenter;
        [exerc addSubview:exerc.descricaoBotao];

        [[self viewExercicios] addSubview: exerc];
        
        contadorDistanciaEntreBotoes += 200;
        
    }
}

-(void)carregaAulas{
    
    int contadorDistanciaEntreBotoes = 80;
    
    for(Aula *aula in [Biblioteca sharedManager].moduloAtual.listaDeAulas){
        
        [aula addTarget:self
                 action:@selector(chamaExercicios:)
                forControlEvents:UIControlEventTouchUpInside];
        
        aula.frame = CGRectMake(contadorDistanciaEntreBotoes, 100, 100, 150);
        [aula setBackgroundImage:[aula capa] forState:UIControlStateNormal];
        
        aula.descricaoBotao =  [[UILabel alloc] initWithFrame: CGRectMake(-45,110,200,100)];
        aula.descricaoBotao.text = [aula nome];
        aula.descricaoBotao.textAlignment = NSTextAlignmentCenter;
        [aula addSubview:aula.descricaoBotao];
        aula.layer.zPosition = -10;
        
        [[self view] addSubview:aula];
        
        contadorDistanciaEntreBotoes += 200;
        
    }

}

/////////////////////////////////////////////////////////////////////////////////////////

- (void)viewDidLoad{
    
    [super viewDidLoad];
    [self carregaAulas];

}

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    
    //[self bibliotecaDosModulos].moduloAtual = NULL;
    [Biblioteca sharedManager].moduloAtual = NULL;
    [self.viewExercicios.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
    [self.view.subviews makeObjectsPerformSelector: @selector(removeFromSuperview)];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
