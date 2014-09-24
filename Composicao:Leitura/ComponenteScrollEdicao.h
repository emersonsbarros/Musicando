//
//  ComponenteScrollEdicao.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sinfonia.h"
#import "NotaEdicaoGesture.h"
#import "DesenhaPartituraEdicao.h"



@interface ComponenteScrollEdicao : NSObject <UIScrollViewDelegate> {
    int posicaoX ;
     int espacamentoEntreNotas;
     int limiteDeNotas;
    NSMutableArray *listaSons;
}


+(ComponenteScrollEdicao*)sharedManager;


@property UIScrollView *scrollPartitura;

-(void)recebeScroll:(UIScrollView*)scroll;
-(void)desenhaLinhasPengrama;


@property float posNotaTocando;
@property int contadorIndiceNota;
@property CGPoint posOriginalScroll;
-(void)addGesturePrintarNotasTela;

-(void)tocaPartituraEdicao;
    -(void)limparPartituraEdicao;

@end
