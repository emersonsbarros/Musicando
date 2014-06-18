//
//  Glossario.m
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Glossario.h"

@implementation Glossario

//Singleton
+(Glossario*)sharedManager{
    static Glossario *glossario = nil;
    if(!glossario){
        glossario = [[super allocWithZone:nil]init];
    }
    return glossario;
}


-(id)init{
    self = [super init];
    if(self){
        self.listaDeTopicos = [[NSMutableArray alloc]init];
        
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

@end
