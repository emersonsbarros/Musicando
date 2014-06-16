//
//  ModuloViewController.m
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 16/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ModuloViewController.h"

@interface ModuloViewController ()

@end

@implementation ModuloViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //Seta com o Singleton
        self.bibliotecaDosModulos = [Biblioteca sharedManager];
        
        self.iniciante = [[Modulo alloc] init: @"Iniciante"];
        self.intermediario = [[Modulo alloc] init: @"Intermediário"];
        self.avancado = [[Modulo alloc] init: @"Avançado"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



//Actions - Botões de Módulo
- (IBAction)actionBtoIniciante:(id)sender {
    [self.bibliotecaDosModulos.listaDeModulos addObject: self.iniciante];
    
}

- (IBAction)actionBtoIntermediario:(id)sender {
    [self.bibliotecaDosModulos.listaDeModulos addObject: self.iniciante];
    
}

- (IBAction)actionBtoAvancado:(id)sender {
    [self.bibliotecaDosModulos.listaDeModulos addObject: self.iniciante];
    
}
@end
