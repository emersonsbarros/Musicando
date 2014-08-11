//
//  EfeitoBarraSuperior.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 23/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EfeitoBarraSuperior.h"
#import "Conversa.h"

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
    Conversa *conv = [[[exer mascote ]listaDeConversas]objectAtIndex:0];
    self.textoNumeroAulas = [NSString stringWithFormat:@"%d",conv.listaDeFalas.count];
        
    BarraSuperiorViewController *bar = [[BarraSuperiorViewController alloc]init];
    bar.view.layer.zPosition = +5;
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}


-(void)retornaViewDoExercicio:(UIViewController*)viewController{
    for(UIView *img in viewController.view.subviews){
        if((img.tag == 1000)||(img.tag == 1001)||(img.tag == 1002)||(img.tag == 1003)) {
        }else {
            img.hidden = YES;
        }
    }
}







@end
