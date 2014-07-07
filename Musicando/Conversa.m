//
//  Conversa.m
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Conversa.h"

@implementation Conversa

-(id)init{
    self = [super init];
    if(self){
        self.listaDeFalas = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
