//
//  ListaInstrumentoViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ListaInstrumentoViewController.h"

@interface ListaInstrumentoViewController ()

@end

@implementation ListaInstrumentoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



////////////////////////////METODOS////////////////////////////////////


//Seta um intrumento na Escolha de usuario para tocar
- (IBAction)tocar:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"Piano";
}


- (IBAction)tocarViolao:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"ViolaoNylon";
}


- (IBAction)tocarFlauta:(id)sender {
    [EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura = @"FlautaDoce";
}




@end
