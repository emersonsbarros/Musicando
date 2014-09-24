//
//  ComponenteScroll.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 03/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ComponenteScroll.h"

@implementation ComponenteScroll

//Sington
+(ComponenteScroll*)sharedManager{
    static ComponenteScroll *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
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


//////////////////////////////////////////////////////////////////////



-(void)addComponetesPartituraScroll:(UIScrollView*)scroll{
    
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensColunaPentagrama) {
        [scroll addSubview:t];
    }
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensTracoPentagrama) {
        [scroll addSubview:t];
    }
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaArmadurasClave) {
        [scroll addSubview:t];
    }
    
    [scroll addSubview:[DesenhaPartitura sharedManager].textoNomePartitura];
    [scroll addSubview:[DesenhaPartitura sharedManager].textoNomeInstrumento];
    [scroll addSubview:[DesenhaPartitura sharedManager].tipoClave];
    [scroll addSubview:[DesenhaPartitura sharedManager].textoNumeroTempo];
    [scroll addSubview:[DesenhaPartitura sharedManager].textoUnidadeTempo];
    
    for (Nota *t in [[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]) {
        [scroll addSubview:t.imagemNota];
    }
    for (Nota *t in [[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]) {
        [scroll addSubview:t.imagemAcidente];
    }
    
    for (Nota *t in [[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]) {
        if([t.pontoNota isEqualToString:@"1"]){
            [scroll addSubview:t.imagePontoNota];
        }
    }
    
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaTracoNotas) {
        [scroll addSubview:t];
    }
    
}
////

-(void)iniciaTimerDeslocaScrollPartituraHorizontal{

    
    [self.scrollPartitura setContentSize:CGSizeMake(self.scrollPartitura.bounds.size.width*([[[Sinfonia sharedManager]numeroCompassos] floatValue]), self.scrollPartitura.bounds.size.height)];
    
    [self addComponetesPartituraScroll:self.scrollPartitura];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(atualizaBarraScrollPartituraHorizontal:) userInfo:nil repeats:YES];
    
}

-(void)atualizaBarraScrollPartituraHorizontal:(NSTimer*)timer{
    if([Sinfonia sharedManager].compassoAtual < [Sinfonia sharedManager].numeroTotalCompassos){
        if (([Sinfonia sharedManager].compassoAtual % 2 == 0)&&([Sinfonia sharedManager].compassoAtual != self.auxContadorScroll)){
            self.auxContadorScroll = [Sinfonia sharedManager].compassoAtual;
            CGPoint bottomOffset = CGPointMake([[Sinfonia sharedManager]contadorScrollDesloca],0);
            [self.scrollPartitura setContentOffset:bottomOffset animated:YES];
            [Sinfonia sharedManager].contadorScrollDesloca += 500;
        }
    }else{
        [timer invalidate];
    }
}


//////////


-(void)iniciaTimerDeslocaScrollPartituraVertical{
    
    [self.scrollPartitura setContentSize:CGSizeMake(self.scrollPartitura.bounds.size.width, self.scrollPartitura.bounds.size.height* ([[[Sinfonia sharedManager]numeroCompassos] floatValue]))];
    
    
    [self addComponetesPartituraScroll:self.scrollPartitura];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(atualizaBarraScrollPartituraVertical:) userInfo:nil repeats:YES];
    
}

-(void)atualizaBarraScrollPartituraVertical:(NSTimer*)timer{
    if([Sinfonia sharedManager].compassoAtual < [Sinfonia sharedManager].numeroTotalCompassos){
        if (([Sinfonia sharedManager].compassoAtual % 8 == 0)&&([Sinfonia sharedManager].compassoAtual != self.auxContadorScroll)){
            self.auxContadorScroll = [Sinfonia sharedManager].compassoAtual;
            CGPoint bottomOffset = CGPointMake(0,[[Sinfonia sharedManager]contadorScrollDesloca]);
            [self.scrollPartitura setContentOffset:bottomOffset animated:YES];
            [Sinfonia sharedManager].contadorScrollDesloca += 500;
        }
    }else{
        [timer invalidate];
    }
}

///////
-(void)removeViewDoScroll{
    
    [Sinfonia sharedManager].compassoAtual = 0;
    [Sinfonia sharedManager].contadorScrollDesloca = 500;
    [Sinfonia sharedManager].controleVelocidaTranNota = 0.5;
    [self.scrollPartitura setContentOffset:CGPointMake(0,0) animated:YES];
    
    
    for (UIView *subView in self.scrollPartitura.subviews){
        [subView removeFromSuperview];
    }
    
}


-(void)recebeScroll:(UIScrollView*)scroll{
    
    self.scrollPartitura = scroll;
    self.scrollPartitura.delegate = self;
    
}


-(void)resetaScroll{
    
    [self.scrollPartitura setContentOffset:CGPointMake(0,0) animated:YES];
    
}

@end
