//
//  EscolhaUsuarioPartitura.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EscolhaUsuarioPartitura.h"

@implementation EscolhaUsuarioPartitura

//////////////Sington

+(EscolhaUsuarioPartitura*)sharedManager{
    static EscolhaUsuarioPartitura *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

-(id)init{
    self = [super init];
    if(self){
        self.nomeXmlPartitura = @"asa";
        self.nomeInstrumentoPartitura = @"Piano";
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//////////////////////////////////////////////////////////////////





@end
