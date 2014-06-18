//
//  Aula.m
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import "Aula.h"

@implementation Aula

- (id)init: (NSString*)nome{
    self = [super init];
    if (self){
        
        [self setNome: nome];
        [self setListaDeExercicios: [[NSMutableArray alloc] init]];
        
    }
    return self;
}

@end
