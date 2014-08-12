//
//  EfeitoComponeteView.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 12/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exercicio.h"
#import "BarraSuperiorViewController.h"
#import "MascoteViewController.h"
#import "RetornaPaginaViewController.h"

@interface EfeitoComponeteView : NSObject


+(EfeitoComponeteView*)sharedManager;

-(void)addComponetesViewExercicio:(UIViewController*)controller :(Exercicio*)exer;

@end
