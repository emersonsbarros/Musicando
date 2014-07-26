//
//  EfeitoBarraSuperior.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 23/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EfeitoBarraSuperior.h"

@implementation EfeitoBarraSuperior



//Singleton
+(EfeitoBarraSuperior*)sharedManager{
    static EfeitoBarraSuperior *mascote = nil;
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


-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer{
    
    self.textoAulaAtual = exer.nome ;
    
    BarraSuperiorViewController *bar = [[BarraSuperiorViewController alloc]init];
    bar.view.layer.zPosition = +5;
    [viewAtual addChildViewController:bar];
    //[bar didMoveToParentViewController:self];
    [viewAtual.view addSubview:bar.view];
}




@end
