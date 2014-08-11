//
//  EfeitoImagem.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EfeitoImagem.h"

@implementation EfeitoImagem

//Singleton
+(EfeitoImagem*)sharedManager{
    static EfeitoImagem *mascote = nil;
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

//////////////////////////// Metodos Add Gesture  /////////////////////////////
//Adiciona o arrastar a uma imagem
-(void)addGesturePainImagem:(UIImageView*)img{
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    img.userInteractionEnabled = YES;
    [img addGestureRecognizer:panRecognizer];
    img.layer.zPosition = -10;
}

//Adiciona o arrastar a uma lista imagens
-(void)addGesturePainImagens:(NSMutableArray*)listaImangesColisao{
    for(UIImageView *img in listaImangesColisao){
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        img.userInteractionEnabled = YES;
        [img addGestureRecognizer:panRecognizer];
        img.layer.zPosition = -10;
    }
}

//Delete gesture
-(void)tiraGestureObjeto:(UIView*)viewGesture{
    for (UIGestureRecognizer *gestureRecognizer in viewGesture.gestureRecognizers) {
        gestureRecognizer.enabled = NO;
        viewGesture.userInteractionEnabled = NO;
    }
}

//Metodos para deixar mais maroto o gesture de arrastar
- (void)pan:(UIPanGestureRecognizer *)gesture {
    
    static CGPoint originalCenter;
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        originalCenter = gesture.view.center;
        [self pauseLayer:gesture.view.layer];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translate = [gesture translationInView:gesture.view.superview];
        gesture.view.center = CGPointMake(originalCenter.x + translate.x, originalCenter.y + translate.y);
    }
    else if (gesture.state == UIGestureRecognizerStateEnded ||
             gesture.state == UIGestureRecognizerStateFailed ||
             gesture.state == UIGestureRecognizerStateCancelled)
    {
        [self resumeLayer:gesture.view.layer];
    }
    
}

-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}

/////////////////////////// verica todas as colisoes ///////////////////////////////

//-(void) checkCollision:(NSTimer *) theTimer{
//    CGRect pos = CGRectMake(0, 0, 0, 0);
//
//    for(UIImageView *img in self.listaImangesColisao){
//        id presentationLayer1 = self.imgTocaTreco.layer.presentationLayer;
//        id presentationLayer2 = img.layer.presentationLayer;
//
//        BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
//
//        if (nowIntersecting){
//            if([img isEqual:self.imgFitaGalo]){
//                [self btnAnimal];
//                self.imgFitaGalo.hidden = true;
//                self.imgFitaGalo.frame = pos;
//
//            }
//            if([img isEqual:self.imgFitaCarro]){
//                [self btnCarro];
//                self.imgFitaCarro.hidden = true;
//                self.imgFitaCarro.frame = pos;
//
//            }
//            if([img isEqual:self.imgFitaFuracao]){
//                [self btnVento];
//                self.imgFitaFuracao.hidden = true;
//                self.imgFitaFuracao.frame = pos;
//
//            }
//
//        }
//    }
//
//}



/////////////////////////// Remove Animacoes ///////////////////////////////
//Remove todas animacoes do ViewController
-(void)finalizaExercicio:(UIViewController*)contr :(AVAudioPlayer*)player{
    for(UIView *img in contr.view.subviews){
        img.alpha = 1;
        [img.layer removeAllAnimations];
    }
    [player stop];
    [contr.view removeFromSuperview];
  
}

//Remove img
-(void)removeTodasAnimacoesView:(UIView*)img{
    [UIView animateWithDuration:1.0
                          delay:0
                        options: UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         img.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         img.hidden = YES;
                         [img.layer removeAllAnimations];
                     }];
    
}
//Remove lista img
-(void)removeTodasAnimacoesViewLista:(NSMutableArray*)listaImg{
    
    for(UIImageView *img in listaImg){
        [UIView animateWithDuration:1.0
                              delay:0
                            options: UIViewAnimationOptionTransitionCrossDissolve
                         animations:^{
                             img.alpha = 0.0;
                         }
                         completion:^(BOOL finished){
                             img.hidden = YES;
                             [img.layer removeAllAnimations];
                         }];

        //[img.layer removeAllAnimations];
    }
}



/////////////////////////// Remove Animacoes ///////////////////////////////
-(void)verficaPulaFala:(NSTimer *) theTimer{
    
    if(self.listaLiberaFala.count == self.qtdColisoes){
        [[EfeitoMascote sharedManager]chamaAddBrilho:self.imgMascoteAux:0.0f:self.viewGesturePassaFala];
        [self.listaLiberaFala removeAllObjects];
        [theTimer invalidate];
    }
}

-(void)chamaVerficadorPassaFala:(UIImageView*)imagemMascote :(UIView*)viewGesturePassaFala :(NSMutableArray*)lista :(int)qtdColisao{
    self.imgMascoteAux = imagemMascote;
    self.viewGesturePassaFala = viewGesturePassaFala;
    self.listaLiberaFala = lista;
    self.qtdColisoes = qtdColisao;
    [NSTimer scheduledTimerWithTimeInterval: 0.2 target:self selector: @selector(verficaPulaFala:) userInfo: nil repeats: YES];
}




/////////////////////////// Sprites Imagens ////////////////////////////////
//Add o Sprites de uma imagem
-(void)addAnimacaoSprite:(NSArray*)listaSprite :(UIImageView*)imgAddAnimacao{
    
    imgAddAnimacao.animationImages = listaSprite;
    CAKeyframeAnimation *animationSequence = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animationSequence.calculationMode = kCAAnimationDiscrete;
    animationSequence.autoreverses = YES;
    animationSequence.duration = 1.0;
    animationSequence.repeatCount = HUGE_VALF;
    animationSequence.values = [self animationCGImagesArray:imgAddAnimacao];
    [imgAddAnimacao.layer addAnimation:animationSequence forKey:@"contents"];

}

-(void)addAnimacaoSprite:(NSArray*)listaSprite :(UIImageView*)imgAddAnimacao :(float)tempoTransicao :(float)qtdRepeticoes{
    
    imgAddAnimacao.animationImages = listaSprite;
    CAKeyframeAnimation *animationSequence = [CAKeyframeAnimation animationWithKeyPath: @"contents"];
    animationSequence.calculationMode = kCAAnimationDiscrete;
    animationSequence.autoreverses = NO;
    animationSequence.duration = tempoTransicao;
    animationSequence.repeatCount = qtdRepeticoes;
    animationSequence.values = [self animationCGImagesArray:imgAddAnimacao];
    [imgAddAnimacao.layer addAnimation:animationSequence forKey:@"contents"];
    
}

//Remove o sprite de uma imagem
-(void)removeAnimacaoSprite:(NSString*)nomeAnimacao :(UIImageView*)imgAddAnimacao{
    [imgAddAnimacao.layer removeAnimationForKey:@"contents"];
}

//Aux que converte para CGImage, unico jeito para dar certo
-(NSArray*)animationCGImagesArray:(UIImageView*)imgAddAnimacao {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[imgAddAnimacao.animationImages count]];
    for (UIImage *image in imgAddAnimacao.animationImages) {
        [array addObject:(id)[image CGImage]];
    }
    return [NSArray arrayWithArray:array];
}

//////////////////////// Hidden em degrade ///////////////////////

-(void)hiddenYesEmDegrade:(UIView*)imgHidden{
    [UIView animateWithDuration:1.0
                          delay:0
                        options: UIViewAnimationOptionCurveEaseInOut |UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         imgHidden.alpha = 0.0;
                     }
                     completion:^(BOOL finished){
                         imgHidden.hidden = YES;
                     }];

}

-(void)hiddenNoEmDegrade:(UIView*)imgHidden{
    imgHidden.alpha = 0.0;
    imgHidden.hidden = NO;
    [UIView animateWithDuration:1.0
                          delay:0
                        options: UIViewAnimationOptionCurveEaseInOut |UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         imgHidden.alpha = 1.0;
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
}





@end
