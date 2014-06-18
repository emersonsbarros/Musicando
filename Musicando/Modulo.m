//
//  Modulo.m
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import "Modulo.h"

@implementation Modulo

- (id)init: (NSString*)nome{
    self = [super init];
    if (self){
        
        [self setNome: nome];
        [self setListaDeAulas: [[NSMutableArray alloc] init]];
    
    }
    return self;
}

@end
