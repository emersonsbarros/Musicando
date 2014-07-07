//
//  Mod1Aula2Exe1ViewController.h
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import "Biblioteca.h"
#import "Conversa.h"
#import "Fala.h"
#import <UIKit/UIKit.h>

@interface Mod1Aula2Exe1ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imagemDoMascote;
@property (weak, nonatomic) IBOutlet UILabel *lblFalaDoMascote;
@property Biblioteca *testaBiblio;
@property Conversa *testaConversa;
@property Fala *testaFala;
@property (strong, nonatomic) IBOutlet UIButton *outBtoFala;
- (IBAction)btoFala:(id)sender;

@end
