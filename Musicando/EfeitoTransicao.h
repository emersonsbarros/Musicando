//
//  EfeitoTransicao.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 10/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EfeitoTransicao : NSObject


+(EfeitoTransicao*)sharedManager;
-(void)chamaTransicaoPaginaEsquerda:(UIViewController*)controller;
-(void)chamaTransicaoPaginaDireita:(UIViewController*)controller;
-(void)chamaTransicaoPaginaTopo:(UIViewController*)controller;


@end
