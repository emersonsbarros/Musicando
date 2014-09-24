//
//  LeituraPartituraViewController.h
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


@interface LeituraPartituraViewController : UIViewController <UIScrollViewDelegate> {
    
}

@property int auxContadorScroll;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

- (IBAction)botaoPlay:(id)sender;
- (IBAction)botaoStop:(id)sender;
- (IBAction)botaoPause:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *textoDescricaoNota;
@property (weak, nonatomic) IBOutlet UILabel *textoDescricaoVelocidade;

- (IBAction)botaoAlteraVelocidade:(id)sender;


@end
