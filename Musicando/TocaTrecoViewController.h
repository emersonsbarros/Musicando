//
//  TocaTrecoViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 13/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exercicio.h"

@interface TocaTrecoViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *imgTocaTreco;
@property (weak, nonatomic) IBOutlet UIImageView *fundoTelaTocaTreco;


+(TocaTrecoViewController*)sharedManager;

-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer;

@end
