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
        // Custom initialization
    }
    return self;
}

-(void)chamaStoryBoardAulas:(id)sender{
    Aula *button = (Aula*) sender;
    self.aulaAtual = button;
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         self.posOriginalAula = button.frame;
                         CGRect moveColher = CGRectMake(470, 10, 100, 150);
                         self.aulaAtual.frame = moveColher;
                     } completion:^(BOOL finished){
                         self.viewExercicios.hidden = NO;
                         [self carregaExercicios];
                         [self efeitoDescer:self.aulaAtual];
                     }];

}

-(void)tapDetected{
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         self.aulaAtual.frame = self.posOriginalAula;
                         self.viewExercicios.hidden = YES;
                     } completion:^(BOOL finished){
                       
                     }];
}

-(void)efeitoDescer:(Aula*)button{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTap.numberOfTouchesRequired = 1;
    button.userInteractionEnabled = YES;
    [button addGestureRecognizer:singleTap];

}

-(void)chamaStoryBoardExercicio:(id)sender{
    Exercicio *button = (Exercicio*) sender;
    [self presentViewController:[[UIViewController alloc]initWithNibName:[button nomeView] bundle:nil] animated:YES completion:NULL];
}

-(void)carregaExercicios{
    
    int contadorDistanciaEntreBotoes = 80;
    for(Exercicio *exerc in self.aulaAtual.listaDeExercicios){
        
        [exerc addTarget:self
                 action:@selector(chamaStoryBoardExercicio:)
        forControlEvents:UIControlEventTouchUpInside];
        
        [exerc setTitle:@"" forState:UIControlStateNormal];
        exerc.frame = CGRectMake(contadorDistanciaEntreBotoes, 210.0, 100, 150);
        [exerc setImage:[exerc capa] forState:UIControlStateNormal];
        
        exerc.descricaoBotao =  [[UILabel alloc] initWithFrame: CGRectMake(30,100,200,100)];
        exerc.descricaoBotao.text = [exerc nome];
        [exerc addSubview:exerc.descricaoBotao];

        [[self viewExercicios] addSubview:exerc];
        
        contadorDistanciaEntreBotoes += 200;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [super viewDidLoad];
    self.bibliotecaDosModulos = [Biblioteca sharedManager];
    
    
    int contadorDistanciaEntreBotoes = 80;

    for(Aula *aula in [self bibliotecaDosModulos].moduloAtual.listaDeAulas){
        
        [aula addTarget:self
                action:@selector(chamaStoryBoardAulas:)
                forControlEvents:UIControlEventTouchUpInside];
        
        [aula setTitle:@"" forState:UIControlStateNormal];
        aula.frame = CGRectMake(contadorDistanciaEntreBotoes, 210.0, 100, 150);
        [aula setImage:[aula capa] forState:UIControlStateNormal];
      
        aula.descricaoBotao =  [[UILabel alloc] initWithFrame: CGRectMake(30,100,200,100)];
        aula.descricaoBotao.text = [aula nome];
        [aula addSubview:aula.descricaoBotao];
        aula.layer.zPosition = -10;
            
        [[self view] addSubview:aula];
    
        
        contadorDistanciaEntreBotoes += 200;
     
    }
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
