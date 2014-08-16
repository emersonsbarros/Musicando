//
//  BarraSuperiorViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 22/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarraSuperiorViewController.h"
#import "BibliotecaViewController.h"
#import "Exercicio.h"
#import "Conversa.h"

@interface BarraSuperiorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *btnHome;
- (IBAction)btnActionHome:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *txtAulaAtual;
@property (weak, nonatomic) IBOutlet UILabel *txtNumeroAulas;
@property (weak, nonatomic) IBOutlet UILabel *txtNumeroAulaAtual;

@property NSString *textoAulaAtual;
@property NSString *textoNumeroAulas;
@property NSString *textoNumeroAulasAtual;

-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer;

-(void)atualizaExericioBarra;

+(BarraSuperiorViewController*)sharedManager;

@end
