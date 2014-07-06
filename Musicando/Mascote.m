//
//  Mascote.m
//  ProjetoFinal
//
//  Created by EMERSON DE SOUZA BARROS on 27/05/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mascote.h"

@implementation Mascote


//Singleton
+(Mascote*)sharedManager{
    static Mascote *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil]init];
    }
    return mascote;
}


-(id)init{
    self = [super init];
    if(self){
        self.listaDeConversas = [[NSMutableArray alloc]init];
        self.imagem = [UIImage imageNamed:@"mascote.png"];
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


@end
