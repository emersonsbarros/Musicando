//
//  Partitura.m
//  DesenhoPartitura
//
//  Created by Vinicius Resende Fialho on 07/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "Partitura.h"

@implementation Partitura

-(id)init{
    self = [super init];
    if(self){
        self.listaNotasPartitura = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
