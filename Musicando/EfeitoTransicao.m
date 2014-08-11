//
//  EfeitoTransicao.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 10/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EfeitoTransicao.h"

@implementation EfeitoTransicao


//Singleton
+(EfeitoTransicao*)sharedManager{
    static EfeitoTransicao *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(void)chamaTransicaoPaginaEsquerda:(UIViewController*)controller{
    CATransition *  tran=[CATransition animation];
    tran.type = @"pageCurl";
    tran.subtype = kCATransitionFromLeft;
    tran.duration=1.5;
    tran.delegate=self;
    [controller.view.layer addAnimation:tran forKey:@"ads"];
}

-(void)chamaTransicaoPaginaDireita:(UIViewController*)controller{
    CATransition *  tran=[CATransition animation];
    tran.type = @"pageCurl";
    tran.subtype = kCATransitionFromRight;
    tran.duration=1.5;
    tran.delegate=self;
    [controller.view.layer addAnimation:tran forKey:@"ads"];
}

-(void)chamaTransicaoPaginaTopo:(UIViewController*)controller{
    CATransition *  tran=[CATransition animation];
    tran.type = @"pageCurl";
    tran.subtype = kCATransitionFromTop;
    tran.duration=1.5;
    tran.delegate=self;
    [controller.view.layer addAnimation:tran forKey:@"ads"];
}



@end
