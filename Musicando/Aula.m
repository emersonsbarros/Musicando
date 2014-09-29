//
//  Aula.m
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import "Aula.h"

@implementation Aula

- (id)init{
    self = [super init];
    if (self){
        [self setListaDeExercicios: [[NSMutableArray alloc] init]];
        
    }
    return self;
}

@end
