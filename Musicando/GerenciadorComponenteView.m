//
//  EfeitoComponeteView.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 12/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "GerenciadorComponenteView.h"

@implementation GerenciadorComponenteView


//////////////////Singleton
+(GerenciadorComponenteView*)sharedManager{
    static GerenciadorComponenteView *mascote = nil;
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


////////////////////////// Leitura e Edicao ////////////////////////////////////


//Leitura
-(void)addComponentesPlayerPartitura:(UIViewController*)viewAtual{
    
    PlayerPartituraViewController *bar = [[PlayerPartituraViewController alloc]init];
    bar.view.frame = CGRectMake(460, 670, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}


-(void)addComponentesBotaoNomePartitura:(UIViewController*)viewAtual{
    
    BotaoListaPartiturasViewController *bar = [[BotaoListaPartiturasViewController alloc]init];
    bar.view.frame = CGRectMake(910, 670, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

-(void)addComponentesListaPartituras:(UIViewController*)viewAtual{
    
    ListaPartiturasViewController *bar = [[ListaPartiturasViewController alloc]init];
    bar.view.frame = CGRectMake(630, 0, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}


-(void)addComponentesEscolhaInstrumentoPartitura:(UIViewController*)viewAtual{
    
    ListaInstrumentoViewController *bar = [[ListaInstrumentoViewController alloc]init];
    bar.view.frame = CGRectMake(120, 670, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

-(void)addComponentesBotaoHome:(UIViewController*)viewAtual :(float)posX :(float)posY{
    
    BotaoHomeViewController *bar = [[BotaoHomeViewController alloc]init];
    bar.view.frame = CGRectMake(posX, posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

-(void)addComponentesBotaoEstudio:(UIViewController*)viewAtual :(float)posX :(float)posY{
    
    BotaoEstudioViewController *bar = [[BotaoEstudioViewController alloc]init];
    bar.view.frame = CGRectMake(posX, posY, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}


//Edicao
-(void)addComponentesBarraMenuNotasPausa:(UIViewController*)viewAtual{
    
    BarraNotasPausasViewController *bar = [[BarraNotasPausasViewController alloc]init];
    bar.view.frame = CGRectMake(101,5, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}

-(void)addComponentesPlayerEdicao:(UIViewController*)viewAtual{
    
    PlayerPartituraEdicaoViewController *bar = [[PlayerPartituraEdicaoViewController alloc]init];
    bar.view.frame = CGRectMake(518,670, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}





@end



