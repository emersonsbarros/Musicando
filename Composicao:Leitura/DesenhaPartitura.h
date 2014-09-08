//
//  DesenhaPartitura.h
//  DesenhoPartitura
//
//  Created by VINICIUS RESENDE FIALHO on 13/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sinfonia.h"
#import <QuartzCore/QuartzCore.h>
#import "ComponenteScroll.h"

@interface DesenhaPartitura : NSObject {
    
    NSString *codeValue2;
    float tamanhoHorizontal;
    float tamanhoVertical;
    float posNotaReal;
    
}

//Imagens Armadura
@property  NSMutableArray *listaArmadurasClave;

//Imagens Linhas Pentagramas|Compasso
@property  NSMutableArray *listaImagensTracoPentagrama;
@property  NSMutableArray *listaImagensColunaPentagrama;
//Imagens
@property  NSMutableArray *listaTracoNotas;
@property  NSMutableArray *listaTracoNotasH;


//Label formula Compasso
@property  UITextView *textoNumeroTempo;
@property  UITextView *textoUnidadeTempo;
//Label cabecalho Partitura
@property  UILabel *textoNomeInstrumento;
@property  UILabel *textoNomePartitura;


@property  UIImageView *tipoClave;

@property Nota *notaAtualEdicao;;


@property int acrecentaDistanciaArmaduraHorizontal;

//Sington
+(DesenhaPartitura*)sharedManager;

//Desenha
-(void)metodosDesenhaPartitura;
-(void)desenhaContornoPartituraParaEdicao:(int)qtLinhas;




@end




