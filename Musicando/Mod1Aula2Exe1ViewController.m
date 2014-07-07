//
//  Mod1Aula2Exe1ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula2Exe1ViewController.h"

@interface Mod1Aula2Exe1ViewController ()

@end

@implementation Mod1Aula2Exe1ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Guarda a lista de conversas e falas do mascote
    self.testaBiblio = [Biblioteca sharedManager];
    self.testaConversa = self.testaBiblio.exercicioAtual.mascote.listaDeConversas.lastObject;
    self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex: 0];
    self.lblFalaDoMascote.text = self.testaFala.conteudo;
    
    //Imagem do mascote
    self.imagemDoMascote.image = [[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image;
    
    [self.view addSubview: self.imagemDoMascote];
    [self.view addSubview: self.lblFalaDoMascote];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//Carrega componentes para tela
-(void)carregarComponentesVisuais{
    
    //Teste para trocar o objeto de fala atual
    self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex: 1];
    self.lblFalaDoMascote.text = self.testaFala.conteudo;
}






//==================================== Teste de Animação
-(void)animacaoAparecerTexto:(id)sender{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         self.imagemDoMascote.frame = CGRectMake(300, 300, self.imagemDoMascote.frame.size.width, self.imagemDoMascote.frame.size.height);
                         self.lblFalaDoMascote.frame = CGRectMake(400, 300, self.lblFalaDoMascote.frame.size.width, self.lblFalaDoMascote.frame.size.height);
                     } completion:^(BOOL finished){
                         
                     }];
    
}


- (IBAction)btoFala:(id)sender {
    [self carregarComponentesVisuais];
    [self.outBtoFala addTarget:self action:@selector(animacaoAparecerTexto:) forControlEvents:UIControlEventTouchUpInside];
}
@end
