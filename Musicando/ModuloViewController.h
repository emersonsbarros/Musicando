//
//  ModuloViewController.h
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 16/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Biblioteca.h"
#import "Modulo.h"
#import <QuartzCore/QuartzCore.h>
#import "AulasViewController.h"


@interface ModuloViewController : UIViewController

//Biblioteca
@property Biblioteca *bibliotecaDosModulos;

@property (weak, nonatomic) IBOutlet UIImageView *imgFundo;

-(void)chamaStoryBoardAulas:(id)sender;

@end
