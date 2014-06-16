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

@interface ModuloViewController : UIViewController


//Outlets - botões de módulo
@property (weak, nonatomic) IBOutlet UIButton *btoModuloIniciante;
@property (weak, nonatomic) IBOutlet UIButton *btoModuloIntermediario;
@property (weak, nonatomic) IBOutlet UIButton *btoModuloAvancado;

//Actions - botões de módulo
- (IBAction)actionBtoIniciante:(id)sender;
- (IBAction)actionBtoIntermediario:(id)sender;
- (IBAction)actionBtoAvancado:(id)sender;



//Biblioteca
@property Biblioteca *bibliotecaDosModulos;

//Módulos
@property Modulo *iniciante;
@property Modulo *intermediario;
@property Modulo *avancado;


@end
