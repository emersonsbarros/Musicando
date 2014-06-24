//
//  Mod1Aula1Exe1ViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 19/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mod1Aula1Exe1ViewController : UIViewController


@property UILabel *lblTextoDeApresentacao;
@property (weak, nonatomic) IBOutlet UILabel *lblTeste;
- (IBAction)btoStart:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *outBtoStart;

@end
