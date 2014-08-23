//
//  JogoEdicaoPartituraViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 17/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "JogoEdicaoPartituraViewController.h"

@interface JogoEdicaoPartituraViewController ()

@end

@implementation JogoEdicaoPartituraViewController


- (BOOL)prefersStatusBarHidden {
    return YES;
}

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    [[EfeitoTransicao sharedManager]finalizaExercicio:self];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.viewSimulador.layer.zPosition = 10;
    
    self.contadorPontos = 0;
    
    //Add barra,Mascote,View de Retornar Pagina ao Xib
    [[EfeitoComponeteView sharedManager]addComponentesViewMascote:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    [self addGesturePassaFalaMascote:self.viewGesturePassaFala];
    
    
    //Biblioteca
    self.lblFalaDoMascote = [MascoteViewController sharedManager].lblFalaDoMascote;
    self.testaBiblio = [MascoteViewController sharedManager].testaBiblio;
    self.testaConversa = [MascoteViewController sharedManager].testaConversa;
    self.imagemDoMascote = [MascoteViewController sharedManager].imagemDoMascote2;
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote];
    
    for(UIView *mascote in self.view.subviews){
        if(mascote.tag == 1002 ){
            mascote.hidden = NO;
        }
    }
    [MascoteViewController sharedManager].contadorDeFalas = 0;
    
    [self pulaFalaMascote];
    
    [self inciaComponetes];

}


-(void)addGesturePassaFalaMascote:(UIView*)viewGesture{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = NO;
    viewGesture.userInteractionEnabled = NO;
    [viewGesture addGestureRecognizer:singleTap];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)chamaMetodosFala0{
  
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:1.0f:self.viewGesturePassaFala];
    
    
}

-(void)chamaMetodosFala1{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    for(UIView *mascote in self.view.subviews){
        if(mascote.tag == 1002 ){
            mascote.hidden = YES;
        }
    }
   
}

//Gerencia o passa de falas
-(void)pulaFalaMascote{
    //Usa pra não dar erro de nulo na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    
    [[BarraSuperiorViewController sharedManager]txtNumeroAulaAtual].text = [NSString stringWithFormat:@"%d",1+[MascoteViewController sharedManager].contadorDeFalas];
    
    if([MascoteViewController sharedManager].contadorDeFalas < contadorMaximo){
        switch ([MascoteViewController sharedManager].contadorDeFalas) {
            case 0:
                [self chamaMetodosFala0];
                break;
            case 1:
                [self chamaMetodosFala1];
                break;
            default:
                break;
        }
        
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:[MascoteViewController sharedManager].contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        [MascoteViewController sharedManager].contadorDeFalas += 1;
        
    }
}



//////////////////// JOGO /////////////////////

-(void)inciaComponetes{

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    self.compor = [sb instantiateViewControllerWithIdentifier:@"ComposicaoPartitura"];
    [self addChildViewController:self.compor];
    [self.view addSubview:self.compor.view];
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensTracoPentagrama) {
        t.frame = CGRectMake(t.frame.origin.x-150,t.frame.origin.y-150,t.frame.size.width,t.frame.size.height);
    }
    
    [[GameOverViewController sharedManager]addBarraSuperioAoXib:self:[Biblioteca sharedManager].exercicioAtual];
    
    [self.view addSubview:self.outBtnHome];
    
    [self comecaRodada];
}

-(void)comecaRodada{
    
    for(UIView *gameover in self.view.subviews){
        if(gameover.tag == 3333 ){
            gameover.hidden = YES;
        }
    }
    
    [self simular];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.3
                                     target: self
                                   selector: @selector(verificaNotaCerta:)
                                   userInfo: nil
                                    repeats: YES];
}

-(void)simular{
    
    int sorteTempo = arc4random()%5;
    int sorteTipo = arc4random()%2;
    int sorteNomeNota = arc4random()%7;
    
    switch (sorteTipo) {
        case 0:
            self.lblTipo.text = @"Pausa";
            break;
        case 1:
            self.lblTipo.text = @"Nota";
            break;
        default:
            break;
    }
    
    switch (sorteNomeNota) {
        case 0:
            self.lblnomeNota.text = @"Dó";
            break;
        case 1:
            self.lblnomeNota.text = @"Ré";
            break;
        case 2:
            self.lblnomeNota.text = @"Mi";
            break;
        case 3:
            self.lblnomeNota.text = @"Fá";
            break;
        case 4:
            self.lblnomeNota.text = @"Sol";
            break;
        case 5:
            self.lblnomeNota.text = @"Lá";
            break;
        case 6:
            self.lblnomeNota.text = @"Si";
            break;
        default:
            break;
    }
    
    switch (sorteTempo) {
        case 0:
            self.lblTempoNota.text = @"0.25";
            break;
        case 1:
            self.lblTempoNota.text = @"0.5";
            break;
        case 2:
            self.lblTempoNota.text = @"1";
            break;
        case 3:
            self.lblTempoNota.text = @"2";
            break;
        case 4:
            self.lblTempoNota.text = @"4";
            break;
        default:
            break;
    }
    
    
    self.nomeNota = self.lblnomeNota.text;
    self.tempoNota = self.lblTempoNota.text;
    self.tipo = self.lblTipo.text;
    
    self.notaSimulada = [[Nota alloc]init];
    
    
    if([self.lblTipo.text isEqual:@"Nota"]){
        if([self.lblnomeNota.text isEqualToString:@"Dó"]){
            self.notaSimulada.nomeNota = @"C";
        }else if([self.lblnomeNota.text isEqualToString:@"Ré"]){
            self.notaSimulada.nomeNota = @"D";
        }else if([self.lblnomeNota.text isEqualToString:@"Mi"]){
            self.notaSimulada.nomeNota = @"E";
        }else if([self.lblnomeNota.text isEqualToString:@"Fá"]){
            self.notaSimulada.nomeNota = @"F";
        }else if([self.lblnomeNota.text isEqualToString:@"Sol"]){
            self.notaSimulada.nomeNota = @"G";
        }else if([self.lblnomeNota.text isEqualToString:@"Lá"]){
            self.notaSimulada.nomeNota = @"A";
        }else if([self.lblnomeNota.text isEqualToString:@"Si"]){
            self.notaSimulada.nomeNota = @"B";
        }
        self.notaSimulada.oitava = @"4";
    }else{
        self.lblnomeNota.text = @"";
        self.notaSimulada.nomeNota = @"";
        self.notaSimulada.oitava = @"";
    }
    
    
    if([self.lblTempoNota.text isEqualToString:@"4"]){
        self.notaSimulada.tipoNota = @"whole";
    }else if([self.lblTempoNota.text isEqualToString:@"2"]){
        self.notaSimulada.tipoNota = @"half";
    }else if([self.lblTempoNota.text isEqualToString:@"1"]){
        self.notaSimulada.tipoNota = @"quarter";
    }else if([self.lblTempoNota.text isEqualToString:@"0.5"]){
        self.notaSimulada.tipoNota = @"eighth";
    }else if([self.lblTempoNota.text isEqualToString:@"0.25"]){
        self.notaSimulada.tipoNota = @"16th";
    }
    
    self.notaSimulada.tom = @"";
    
}



-(void)verificaNotaCerta:(NSTimer*)tempo{

    self.notaUsuario = [DesenhaPartitura sharedManager].notaAtualEdicao;
    
    if(self.notaUsuario.nomeNota != NULL){
        NSLog(@"n = %@",self.notaSimulada.nomeNota);
        NSLog(@"n = %@",self.notaSimulada.oitava);
        NSLog(@"n = %@",self.notaSimulada.tipoNota);
        
        
        NSLog(@"dd = %@",self.notaUsuario.nomeNota);
        NSLog(@"dd = %@",self.notaUsuario.oitava);
        NSLog(@"dd = %@",self.notaUsuario.tipoNota);
        if(([self.notaSimulada.nomeNota isEqualToString:self.notaUsuario.nomeNota]) &&
           ([self.notaSimulada.oitava isEqualToString:self.notaUsuario.oitava]) &&
           ([self.notaSimulada.tipoNota isEqualToString:self.notaUsuario.tipoNota])){
            
            [DesenhaPartitura sharedManager].notaAtualEdicao = [[Nota alloc]init];
            
            [self comecaRodada];
            
            self.contadorPontos += 1;
            self.lblPontuacao.text = [NSString stringWithFormat:@"%d",self.contadorPontos];
            
            
            [tempo invalidate];
        }else{
            [DesenhaPartitura sharedManager].notaAtualEdicao = [[Nota alloc]init];

            for(UIView *gameover in self.view.subviews){
                if(gameover.tag == 3333 ){
                    gameover.hidden = NO;
                }
            }
            
            [tempo invalidate];
        }
        
        
        
    }
}





- (IBAction)btnHome:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"biblioteca"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
}


@end



