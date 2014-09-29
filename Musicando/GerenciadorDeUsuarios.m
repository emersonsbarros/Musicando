//
//  GerenciadorDeUsuarios.m
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "GerenciadorDeUsuarios.h"

@implementation GerenciadorDeUsuarios

//Singleton
+(GerenciadorDeUsuarios*)sharedManager{
    static GerenciadorDeUsuarios *gerenciadorDeUsuarios = nil;
    if(!gerenciadorDeUsuarios){
        gerenciadorDeUsuarios = [[super allocWithZone:nil]init];
    }
    return gerenciadorDeUsuarios;
}


-(id)init{
    self = [super init];
    if(self){
        self.listaDeUsuarios = [[NSMutableArray alloc]init];
        
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

@end
