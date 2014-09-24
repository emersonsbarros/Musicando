//
//  PlayerPartituraEdicaoViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 07/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "PlayerPartituraEdicaoViewController.h"

@interface PlayerPartituraEdicaoViewController ()

@end

@implementation PlayerPartituraEdicaoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear: animated];
    
    [self.timerAutualizaQtNotas invalidate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //aciona timer para atualizar a quantidade de notas inseridas
    self.timerAutualizaQtNotas = [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target: self
                                   selector: @selector(atualizaQtdNotas)
                                   userInfo: nil
                                    repeats: YES];
    
}

////////////////////////////////// METODOS //////////////////////////////////////////


//metodo que atualiza a qt de notas inseridas
-(void)atualizaQtdNotas{
    
    self.txtQtd.text = [NSString stringWithFormat:@"%d",[DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count];

}


////////////////////////////////// Player //////////////////////////////////////////

//Toca todas as notas do usario
- (IBAction)tocarTodasNoras:(id)sender {
    
    [[ComponenteScrollEdicao sharedManager]tocaPartituraEdicao];
}

//Limpa as notas da tela
- (IBAction)limparNotasPartituraEdicao:(id)sender {
    
    [[ComponenteScrollEdicao sharedManager]limparPartituraEdicao];

}


@end
