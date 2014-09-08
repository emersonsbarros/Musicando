//
//  ViewController.m
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 13/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [InicializaProjeto sharedManager];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

//////////////////////////////// METODOS NOTAS CAINDO /////////////////////////

-(void)lacoCaindoNotas{
    
    float duracao = 1.0;
    float delay = 0.0;
    float posX = -100;
    CGFloat posY= 400;
    NSString *nomeNota;
    
    for(int i=0;i<13;i++){
        UIImageView *notaCaindo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"notaParaRosto.png"]];
        UIImageView *carinha = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"notaCaraPausaSom.png"]];
        carinha.frame = CGRectMake(carinha.frame.origin.x+13,
                                   carinha.frame.origin.y+130,
                                   30,
                                   30);
        [notaCaindo addSubview:carinha];
        
        //Add sprite as imagem da mão e comeca (tem uma parar no EfeitoImagem caso necesario)
        UIImage *image1 = [UIImage imageNamed:@"notaCaraPausaSom.png"];
        UIImage *image2 = [UIImage imageNamed:@"notaCaraTocaSom.png"];
        NSArray *imageArray = [NSArray arrayWithObjects:image1,image2,nil];
        [[ExercicioImagem sharedManager]addAnimacaoSprite:imageArray:carinha];
        
        notaCaindo.frame = CGRectMake(posX,500,notaCaindo.frame.size.width+40,notaCaindo.frame.size.height+70);
        [[self listaImagensCai]addObject:notaCaindo];
        [self.view addSubview:notaCaindo];
        
        switch (i) {
            case 1:
                nomeNota = @"C";
                break;
            case 2:
                nomeNota = @"D";
                break;
            case 3:
                nomeNota = @"E";
                break;
            case 4:
                nomeNota = @"F";
                break;
            case 5:
                nomeNota = @"G";
                break;
            case 6:
                nomeNota = @"A";
                break;
            default:
                break;
        }
        
        posY = 600;
        
        
        [self animacaoCaindoNotas:notaCaindo:duracao:posX:posY:delay:nomeNota];
        posX += 100;
        delay += 0.1;
        
        
    }
    
}



-(void)animacaoCaindoNotas:(UIImageView*)notaCaindo :(float)duracao :(CGFloat)posX :(CGFloat)posY :(float)tempoDemrora :(NSString*)nomeNota{
    //UIViewAnimationOptionAutoreverse ,UIViewAnimationOptionCurveEaseInOut,UIViewAnimationOptionTransitionCrossDissolv
    
    [UIView animateWithDuration:duracao
                          delay:tempoDemrora
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         [notaCaindo.layer removeAnimationForKey:@"1"];
                         CGRect moveGalo = CGRectMake(posX,
                                                      posY,
                                                      notaCaindo.frame.size.width,
                                                      notaCaindo.frame.size.height);
                         notaCaindo.frame = moveGalo;
                     }
                     completion:^(BOOL finished){
                         notaCaindo.hidden = YES;
                     }];
    
    
}

@end
