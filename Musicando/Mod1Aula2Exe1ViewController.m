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
    
    self.listaImagensColisao = [[NSMutableArray alloc]init];
    [self.listaImagensColisao addObject:self.imgColher];
    
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
    [self addGesturePassaFalaMascote: self.viewGesturePassaFala];

    
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote2];


}

-(void) checkColisaoColher:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPanela.layer.presentationLayer;
    id presentationLayer2 = self.imgColher.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgVibracao.hidden = NO;
        self.imgColher.frame =  CGRectMake(self.imgColher.frame.origin.x,
                                            self.imgColher.frame.origin.y-200,
                                            self.imgColher.frame.size.width,
                                            self.imgColher.frame.size.height);
    }else{
        self.imgVibracao.hidden = YES;
    }
    
}


-(void)chamaMetodosFala1{
   

}

-(void)chamaMetodosFala2{
    
    //colcoar animacao de ondas
    self.imgColher.hidden = NO;
    self.imgPanela.hidden = NO;
    self.imgOuvindo.hidden = NO;
    
    //self.imgColher.transform = CGAffineTransformRotate(self.imgColher.transform, ((-30 * M_PI) / 180.0));
    
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImagensColisao];
    
    self.imgPanela.userInteractionEnabled = YES;
    

    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoColher:)
                                   userInfo: nil
                                    repeats: YES];
    
}


-(void)explodeSatelite{
    self.imgSatelite.hidden = YES;
    self.imgExplosao.hidden = NO;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * 2 * 1 ];
    rotationAnimation.duration = 10.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 4;
    [self.imgAstronauta.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [UIView animateWithDuration:5.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(-250,
                                                      500,
                                                      self.imgAstronauta.frame.size.width,
                                                      self.imgAstronauta.frame.size.height);
                         self.imgAstronauta.frame = moveGalo;
                         
                         
    }
                     completion:^(BOOL finished){
                       
                     }];
}

-(void)chamaMetodosFala3{
    self.imgColher.hidden = YES;
    self.imgPanela.hidden = YES;
    self.imgOuvindo.hidden = YES;
    self.imgVibracao.hidden = YES;
    
    self.imgAstronauta.hidden = NO;
    self.imgSatelite.hidden = NO;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(explodeSatelite)];
    singleTap.numberOfTouchesRequired = 1;
    self.imgSatelite.userInteractionEnabled = YES;
    [self.imgSatelite addGestureRecognizer:singleTap];
}

-(void)chamaMetodosFala4{
    self.imgExplosao.hidden = YES;
    self.imgAstronauta.hidden = YES;
    self.imgSatelite.hidden = YES;
    
    self.pilar1.hidden = NO;
    self.pilar2.hidden = NO;
    self.pilar3.hidden = NO;
    self.pilar4.hidden = NO;
    
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar1.frame.origin.x,
                                                      self.pilar1.frame.origin.y+500,
                                                      self.pilar1.frame.size.width,
                                                      self.pilar1.frame.size.height);
                         self.pilar1.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar2.frame.origin.x,
                                                      self.pilar2.frame.origin.y+500,
                                                      self.pilar2.frame.size.width,
                                                      self.pilar2.frame.size.height);
                         self.pilar2.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar3.frame.origin.x,
                                                      self.pilar3.frame.origin.y+500,
                                                      self.pilar3.frame.size.width,
                                                      self.pilar3.frame.size.height);
                         self.pilar3.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar4.frame.origin.x,
                                                      self.pilar4.frame.origin.y+500,
                                                      self.pilar4.frame.size.width,
                                                      self.pilar4.frame.size.height);
                         self.pilar4.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
            
                     }];    
    
    [UIView animateWithDuration:3.0
                          delay:3.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.base.hidden = NO;
                         CGRect moveGalo = CGRectMake(self.base.frame.origin.x,
                                                      self.base.frame.origin.y+170,
                                                      self.base.frame.size.width,
                                                      self.base.frame.size.height);
                         self.base.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
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
