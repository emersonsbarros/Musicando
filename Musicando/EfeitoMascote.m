//
//  EfeitoMascote.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EfeitoMascote.h"

@implementation EfeitoMascote

//Singleton
+(EfeitoMascote*)sharedManager{
    static EfeitoMascote *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaAuxBrilho = [[NSMutableArray alloc]init];
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}




//////////////// Mascote Bilho/PassaFala ////////////////

//Add animacao brilho e coloca a acao de passar fala
-(void)mascoteBrilha:(NSMutableArray*)lista{
    
    UIView *passaFala = [lista objectAtIndex:1];
    UIImageView *imgBrilha = [lista objectAtIndex:0];
    
    for (UIGestureRecognizer *gestureRecognizer in passaFala.gestureRecognizers) {
        gestureRecognizer.enabled = YES;
        passaFala.userInteractionEnabled = YES;
        
    }
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         [UIView keyPathsForValuesAffectingValueForKey:@"1"];

                         imgBrilha.alpha = 0.5;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    
}

//remove brilho e remove a acao de passar fala
-(void)removeBrilho:(UIImageView*)imgBrilha :(UIView*)passaFala{
    [self.listaAuxBrilho removeAllObjects];
    imgBrilha.alpha = 1.0;
    [imgBrilha.layer removeAnimationForKey:@"1"];
    for (UIGestureRecognizer *gestureRecognizer in passaFala.gestureRecognizers) {
            gestureRecognizer.enabled = NO;
            passaFala.userInteractionEnabled = NO;
    }
}

//chama o seletor e add esses parametros na lista auxiliar
-(void)chamaAddBrilho:(UIImageView*)imgBrilha :(float)tempoParaComecar :(UIView*)passaFala{
    [self.listaAuxBrilho addObject:imgBrilha];
    [self.listaAuxBrilho addObject:passaFala];
    [self performSelector:@selector(mascoteBrilha:) withObject:self.listaAuxBrilho afterDelay:tempoParaComecar];
    
}




///////////////////////// Animacao Mascote Pulando ///////////////////////

//Chama o seletor
-(void)chamaAnimacaoMascotePulando:(UIImageView*)imagemDoMascote2{
    [self performSelector:@selector(animacaoMascotePulando:) withObject:imagemDoMascote2 afterDelay:0.1f];
}
//faz a animcao do mascote pulando
-(void)animacaoMascotePulando:(UIImageView*)imagemMascote{
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                        CGRect moveGalo = CGRectMake(imagemMascote.frame.origin.x,
                                                      imagemMascote.frame.origin.y-40,
                                                      imagemMascote.frame.size.width,
                                                      imagemMascote.frame.size.height);
                         imagemMascote.frame = moveGalo;

                     }
                     completion:^(BOOL finished){
                         
                     }];
    

//
//    [UIView animateWithDuration:4.0 animations:^(void) {
//        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//        [UIView setAnimationRepeatCount:HUGE_VALF];
//        CGRect moveGalo = CGRectMake(imagemMascote.frame.origin.x,
//                                    imagemMascote.frame.origin.y-40,
//                                    imagemMascote.frame.size.width,
//                                imagemMascote.frame.size.height);
//        imagemMascote.frame = moveGalo;
//    }];

}


////////////////////// Animacao Mascote Saindo Pra direita ///////////////////////

//faz animacao do mascote saindo da tela
-(void)animacaoMascoteSaindoParaOLadoDireito:(UIImageView*)imagemMascote{
    [UIView animateWithDuration:0.5
                          delay:1.0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(imagemMascote.frame.origin.x+150,
                                                     imagemMascote.frame.origin.y,
                                                     imagemMascote.frame.size.width,
                                                     imagemMascote.frame.size.height);
                         
                        imagemMascote.frame = moveGalo;
                     }
                     completion:NULL];
    
    
}




@end
