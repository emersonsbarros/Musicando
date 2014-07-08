//
//  LeituraViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 08/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Sinfonia.h"
#import "DataBaseInstrumento.h"
#import "DesenhaPartitura.h"
#import <QuartzCore/QuartzCore.h>

@interface LeituraViewController : UIViewController <UIScrollViewDelegate> {
    
}

//Atributos do Scroll da Imagem Partitura
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property int auxContadorScroll;


- (IBAction)botaoPause:(id)sender;
- (IBAction)botaoStop:(id)sender;
- (IBAction)botaoPlay:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *textoDescricaoNota;

@property (weak, nonatomic) IBOutlet UILabel *textoDescricaoVelocidade;

- (IBAction)botaoAlteraVelocidade:(id)sender;

@end
