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
        
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}



-(void)chamaAnimacaoMascotePulando:(UIImageView*)imagemDoMascote2{
    [self performSelector:@selector(animacaoMascotePulando:) withObject:imagemDoMascote2 afterDelay:0.0f];
}

-(void)animacaoMascotePulando:(UIImageView*)imagemMascote{
    [UIView animateWithDuration:0.5
                          delay:1.0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(imagemMascote.frame.origin.x,
                                                      imagemMascote.frame.origin.y-40,
                                                      imagemMascote.frame.size.width,
                                                      imagemMascote.frame.size.height);
                         imagemMascote.frame = moveGalo;
                     }
                     completion:NULL];
}

//-(void)animacaoMascoteSaindoParaOLadoDireito{
//
//    [UIView animateWithDuration:1.0
//                     animations:^(void){
//                         CGRect moveGalo = CGRectMake(self.imagemDoMascote2.frame.origin.x+150,
//                                                      self.imagemDoMascote2.frame.origin.y,
//                                                      self.imagemDoMascote2.frame.size.width,
//                                                      self.imagemDoMascote2.frame.size.height);
//                         self.imagemDoMascote2.frame = moveGalo;
//                     } completion:^(BOOL finished){
//
//                     }];
//}



@end
