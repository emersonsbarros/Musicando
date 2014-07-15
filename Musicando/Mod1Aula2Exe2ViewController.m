//
//  Mod1Aula2Exe2ViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula2Exe2ViewController.h"

@interface Mod1Aula2Exe2ViewController ()

@end

@implementation Mod1Aula2Exe2ViewController

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
    
    self.listaImagensColisao = [[NSMutableArray alloc]init];
    [self.listaImagensColisao addObject:self.imgApito];
    [self.listaImagensColisao addObject:self.imgTeclaPiano];
    [self.listaImagensColisao addObject:self.imgTelefone];
    [self.listaImagensColisao addObject:self.imgLeao];
    [self.listaImagensColisao addObject:self.imgGraficoGrave];
    [self.listaImagensColisao addObject:self.imgGraficoAgudo];
    
    //////////////Codigos Mutaveis////////////////
    //Guarda a lista de conversas e falas do mascote
    self.contadorDeFalas = 0;
    self.testaBiblio = [Biblioteca sharedManager];
    self.testaConversa = self.testaBiblio.exercicioAtual.mascote.listaDeConversas.firstObject;
    [self pulaFalaMascote];
    //Imagem do mascote
    self.imagemDoMascote2.image = [[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image;
    [self.view addSubview: self.imagemDoMascote2];
    [self.view addSubview: self.lblFalaDoMascote];
    [self addGesturePassaFalaMascote:self.viewGesturePassaFala];
    
    
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote2];

    
}

-(void)chamaMetodosFala1{
    
}

-(void) checkColisaoPiano:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgTeclaPiano.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgTeclaPiano.hidden = true;
        self.imgTeclaPiano.frame = self.imgTeclaPiano.frame;
        self.lblVisorTocaTreco.text = @"Grave";
        [theTimer invalidate];
    }
    
}

-(void) checkColisaoTelefone:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgTelefone.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgTelefone.hidden = true;
        self.imgTelefone.frame = self.imgTelefone.frame;
        self.lblVisorTocaTreco.text = @"Agudo";
        [theTimer invalidate];
    }
    
}

-(void) checkColisaoLeao:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgLeao.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgLeao.hidden = true;
        self.imgLeao.frame = self.imgLeao.frame;
        self.lblVisorTocaTreco.text = @"Grave";
        [theTimer invalidate];
    }
    
}

-(void) checkColisaoApito:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgApito.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgApito.hidden = true;
        self.imgApito.frame = self.imgApito.frame;
        self.lblVisorTocaTreco.text = @"Agudo";
        [theTimer invalidate];
    }
    
}

-(void)chamaMetodosFala2{
    self.imgTocaTreco.hidden = NO;
    self.imgTeclaPiano.hidden = NO;
    self.imgTelefone.hidden = NO;
    self.imgLeao.hidden = NO;
    self.imgApito.hidden = NO;
    self.lblVisorTocaTreco.hidden = NO;
    
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImagensColisao];
    
    self.imgTocaTreco.userInteractionEnabled = YES;
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoPiano:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoTelefone:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoLeao:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoApito:)
                                   userInfo: nil
                                    repeats: YES];

    
}

-(void)chamaMetodosFala3{
    self.imgTocaTreco.hidden = YES;
    self.imgTeclaPiano.hidden = YES;
    self.imgTelefone.hidden = YES;
    self.imgLeao.hidden = YES;
    self.imgApito.hidden = YES;
    self.lblVisorTocaTreco.hidden = YES;
    self.lblVisorTocaTreco.text =@"";
    
    //colocar um grafico passando infinatamente na tela, com altos e baixos picos
}

-(void) checkColisaoGraficoAgudo:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgGraficoAgudo.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgGraficoAgudo.hidden = true;
        self.lblVisorTocaTreco.text = @"Agudo";
        [theTimer invalidate];
    }
    
}

-(void) checkColisaoGraficoGrave:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
    id presentationLayer2 = self.imgGraficoGrave.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgGraficoGrave.hidden = true;
        self.lblVisorTocaTreco.text = @"Grave";
        [theTimer invalidate];
    }
    
}

-(void)chamaMetodosFala4{
    self.imgTocaTreco.hidden = NO;
    self.lblVisorTocaTreco.hidden = NO;
    self.imgGraficoAgudo.hidden = NO;
    self.imgGraficoGrave.hidden = NO;
    self.posOriginalGrave = self.imgGraficoGrave.frame;
    self.posOriginalAgudo = self.imgGraficoAgudo.frame;
    
    
    
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoGraficoAgudo:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoGraficoGrave:)
                                   userInfo: nil
                                    repeats: YES];
}

-(void)chamaMetodosFala5{
    self.imgTocaTreco.hidden = YES;
    self.lblVisorTocaTreco.hidden = YES;
    self.imgGraficoGrave.frame = self.posOriginalGrave;
    self.imgGraficoAgudo.frame = self.posOriginalAgudo;
    self.imgGraficoAgudo.hidden =NO;
    self.imgGraficoGrave.hidden=NO;
    
}

-(void)chamaMetodosFala6{
    self.imgGraficoAgudo.hidden =YES;
    self.imgGraficoGrave.hidden=YES;
}

-(void)chamaMetodosFala7{
    //pontos pretos e figuras
}

-(void)chamaMetodosFala8{
    //passar varias imagens infinatamente de lado, com timbre de varios instrumentos.
}

-(void)chamaMetodosFala9{
    
}

-(void)chamaMetodosFala10{
    self.imgTocaTreco.hidden = NO;
}

-(void)chamaMetodosFala11{
    self.imgTocaTreco.hidden = YES;
}

-(void)chamaMetodosFala12{
    
}

-(void)chamaMetodosFala13{
    
}


-(void)pulaFalaMascote{
    int contadorMaximo = self.testaConversa.listaDeFalas.count;
    
    if(self.contadorDeFalas < contadorMaximo){
        switch (self.contadorDeFalas) {
            case 0:
                [self chamaMetodosFala1];
                break;
            case 1:
                [self chamaMetodosFala2];
                break;
            case 2:
                [self chamaMetodosFala3];
                break;
            case 3:
                [self chamaMetodosFala4];
                break;
            case 4:
                [self chamaMetodosFala5];
                break;
            case 5:
                [self chamaMetodosFala6];
                break;
            case 6:
                [self chamaMetodosFala7];
                break;
            case 7:
                [self chamaMetodosFala8];
                break;
            case 8:
                [self chamaMetodosFala9];
                break;
            case 9:
                [self chamaMetodosFala10];
                break;
            case 10:
                [self chamaMetodosFala11];
                break;
            case 11:
                [self chamaMetodosFala12];
                break;
            case 12:
                [self chamaMetodosFala13];
                break;
            default:
                break;
        }
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:self.contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        self.contadorDeFalas +=1;
    }
}

-(void)addGesturePassaFalaMascote:(UIView*)imgMascote{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    singleTap.numberOfTouchesRequired = 1;
    imgMascote.userInteractionEnabled = YES;
    [imgMascote addGestureRecognizer:singleTap];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
