//
//  ComponenteScrollEdicao.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ComponenteScrollEdicao.h"

#define n64th 0.0620
#define n32th 0.120
#define n16th 0.20
#define eighth 0.4
#define quarter 1.0
#define half 1.5
#define whole 3.5

@implementation ComponenteScrollEdicao

//Sington
+(ComponenteScrollEdicao*)sharedManager{
    static ComponenteScrollEdicao *unicoInstrumento = nil;
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

-(void)addGesturePrintarNotasTela{
    
    limiteDeNotas = 100;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addNotaNaTela:)];
    singleTap.numberOfTouchesRequired = 1;
    self.scrollPartitura.userInteractionEnabled = YES;
    [self.scrollPartitura addGestureRecognizer:singleTap];
    
}



-(void)addNotaNaTela:(id)sender{
    UITapGestureRecognizer *touch = (UITapGestureRecognizer*)sender;
    CGPoint touchPoint = [touch locationInView:self.scrollPartitura];
    
    float posx = touchPoint.x;
    float posy = touchPoint.y;
    
    Nota *not = [[DesenhaPartituraEdicao sharedManager] retornaPosicaoNotaEdicao:posx:posy];
    
    if((not != NULL)&&([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count <= limiteDeNotas)){
        [DesenhaPartitura sharedManager].notaAtualEdicao = not;
        
        listaSons = [[NSMutableArray alloc]init];
        [listaSons addObject:not];
        
        [[Sinfonia sharedManager]tocarUmaNota:listaSons:[EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura];
        
        [[DesenhaPartituraEdicao sharedManager].listaNotasEdicao addObject:not];
        
        for(Nota *img in [DesenhaPartituraEdicao sharedManager].listaNotasEdicao){
            [[Sinfonia sharedManager]desapareceEfeito:img];
        }
        
        [[self scrollPartitura]addSubview:[not imagemNota]];
        
        //self.txtQtd.text = [NSString stringWithFormat:@"%d",self.listaNotasEdicao.count];
        
        [[self scrollPartitura] setContentSize:CGSizeMake((self.scrollPartitura.bounds.size.width+[DesenhaPartituraEdicao sharedManager].posicaoX)-700, self.scrollPartitura.bounds.size.height)];
        
        if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count > 5){
            [[DesenhaPartituraEdicao sharedManager] aumentarLinhasPentagrama];
            CGPoint bottomOffset = CGPointMake(([DesenhaPartituraEdicao sharedManager].posicaoX-650),0);
            [[self scrollPartitura] setContentOffset:bottomOffset animated:YES];
        }
    }else{
        NSLog(@"Passou do limite de notas");
    }
    
}

-(void)atualizaPosicaoTocando{
    
    Nota *notaAtual = [[DesenhaPartituraEdicao sharedManager].listaNotasEdicao objectAtIndex:self.contadorIndiceNota];
    self.posNotaTocando = notaAtual.imagemNota.frame.origin.x;
    
    
    NSString *tempoNota = notaAtual.tipoNota;
    float tempo = 0.0;
    
    if([tempoNota isEqualToString:@"64th"]){
        tempo = n64th;
    }else if([tempoNota isEqualToString:@"32th"]){
        tempo = n32th;
    }else if([tempoNota isEqualToString:@"16th"]){
        tempo = n16th;
    }else if([tempoNota isEqualToString:@"eighth"]){
        tempo = eighth;
    }else if([tempoNota isEqualToString:@"quarter"]){
        tempo = quarter;
    }else if([tempoNota isEqualToString:@"half"]){
        tempo = half;
    }else if([tempoNota isEqualToString:@"whole"]){
        tempo = whole;
    }else{
    }
    
    
    if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count-1 != self.contadorIndiceNota){
        CGPoint bottomOffset = CGPointMake((self.posNotaTocando-350),0);
        [[self scrollPartitura] setContentOffset:bottomOffset animated:YES];
        
        self.contadorIndiceNota++;
        [NSTimer scheduledTimerWithTimeInterval:tempo
                                         target: self
                                       selector: @selector(atualizaPosicaoTocando)
                                       userInfo: nil
                                        repeats: NO];
    }
    
}

/////////////////////////////////////////////////////////////////////

-(void)iniciaEdicaoPartitura{
    [[ComponenteScrollEdicao sharedManager]desenhaLinhasPengrama];
    [[ComponenteScrollEdicao sharedManager]addGesturePrintarNotasTela];

}

-(void)desenhaLinhasPengrama{
    
    for (UIImageView *t in [DesenhaPartituraEdicao sharedManager].listaImagensTracoPentagrama) {
        [[self scrollPartitura]addSubview:t];
    }
    
    [DesenhaPartituraEdicao sharedManager].listaNotasEdicao = [[NSMutableArray alloc]init];

}

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

-(void)tocaPartituraEdicao{
    
    if([Sinfonia sharedManager].estadoBotaoPlay){
        
        [[Sinfonia sharedManager]desapareceEfeito:[[DesenhaPartituraEdicao sharedManager].listaNotasEdicao lastObject]];
        
        self.contadorIndiceNota = 0;
        self.posOriginalScroll = self.scrollPartitura.contentOffset;
        if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count != 0)[self atualizaPosicaoTocando];
        
        if([[DesenhaPartituraEdicao sharedManager].listaNotasEdicao lastObject] != NULL)[[Sinfonia sharedManager]tocarTodasNotasEdicao:[DesenhaPartituraEdicao sharedManager].listaNotasEdicao:[EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura];
    }

}

-(void)limparPartituraEdicao{
    
    if([Sinfonia sharedManager].estadoBotaoLimpar){
        
        if([DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count != 0){
            
            for (UIView *subView in self.scrollPartitura.subviews)
            {
                for(int i=0;i<[DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count;i++){
                    Nota *coord = [[DesenhaPartituraEdicao sharedManager].listaNotasEdicao  objectAtIndex:i];
                    
                    if ([subView isEqual:coord.imagemNota])
                    {
                        [subView removeFromSuperview];
                    }
                    
                }
            }
            
            
            
            [DesenhaPartituraEdicao sharedManager].listaNotasEdicao = [[NSMutableArray alloc]init];
            
            //self.txtQtd.text = [NSString stringWithFormat:@"%d",[DesenhaPartituraEdicao sharedManager].listaNotasEdicao.count];
            
            CGPoint bottomOffset = CGPointMake(0,0);
            [[self scrollPartitura] setContentOffset:bottomOffset animated:YES];
            [DesenhaPartituraEdicao sharedManager].posicaoX = 150;
        }
    }
    
}

@end
