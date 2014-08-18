//
//  GameOverViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 17/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercicio.h"

@interface GameOverViewController : UIViewController


+(GameOverViewController*)sharedManager;

- (IBAction)btnHome:(id)sender;
- (IBAction)btnRetornar:(id)sender;

@property GameOverViewController *gameOverParaUmaCena;

@property Exercicio *exercAtualGameOver;
-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer;
-(void)addBarraSuperioAoXibOculto:(UIViewController*)viewAtual :(Exercicio*)exer;

@end
