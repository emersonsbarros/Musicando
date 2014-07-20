//
//  Mod1Aula3Exe3ViewController.h
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mod1Aula3Exe3ViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIView *viewDeExercitar;
@property (strong, nonatomic) IBOutlet UIImageView *imgDoMascote;
@property (strong, nonatomic) IBOutlet UILabel *lblTextoMascote;
@property (strong, nonatomic) IBOutlet UIButton *outBtoStartIntro;

//Botões p/ exercitar
@property (strong, nonatomic) IBOutlet UIButton *outTocaTreco1;
@property (strong, nonatomic) IBOutlet UIButton *outTocaTreco2;
@property (strong, nonatomic) IBOutlet UIButton *outViolaco;
@property (strong, nonatomic) IBOutlet UIButton *outFlauta;
@property (strong, nonatomic) IBOutlet UIButton *outPiano;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota1;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota2;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota3;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota4;
@property (strong, nonatomic) IBOutlet UIImageView *imgNota5;


- (IBAction)tocaTreco1:(id)sender;
- (IBAction)tocaTreco2:(id)sender;
- (IBAction)violao:(id)sender;
- (IBAction)flauta:(id)sender;
- (IBAction)piano:(id)sender;

- (IBAction)btoStartIntro:(id)sender;


@end
