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




/////////////////////////// Exercicios ///////////////////////////


//exercicio
-(void)addComponentesViewMascote:(UIViewController*)viewAtual :(Exercicio*)exerc{
    
    MascoteViewController *bar = [[MascoteViewController alloc]init];
    bar.view.layer.zPosition =+11;
    [viewAtual addChildViewController:bar];
    bar.view.frame = CGRectMake(420, 520, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual.view addSubview:bar.view];

    
}

-(void)addComponentesViewBarra:(UIViewController*)viewAtual :(Exercicio*)exerc{
    
    BarraSuperiorViewController *bar2 = [[BarraSuperiorViewController alloc]init];
    bar2.view.layer.zPosition = +5;
    [viewAtual addChildViewController:bar2];
    [viewAtual.view addSubview:bar2.view];

}


//Add os componetes para uma view de exercicio
-(void)addComponetesViewExercicio:(UIViewController*)controller :(Exercicio*)exer{
    
    [[TocaTrecoViewController sharedManager]addBarraSuperioAoXib:controller:exer];
    [[BarraSuperiorViewController sharedManager]addBarraSuperioAoXib:controller:exer];
    [[MascoteViewController sharedManager]addBarraSuperioAoXib:controller:exer];
    [[RetornaPaginaViewController sharedManager]addBarraSuperioAoXib:controller:exer];
    
    [[BarraSuperiorViewController sharedManager]atualizaExericioBarra];
    [[MascoteViewController sharedManager]atualizaExericioMascote];
    
    [MascoteViewController sharedManager].imagemDoMascote2.alpha = 1.0;
     
    for(UIView *view in controller.view.subviews){
        if(view.tag == 1000){
            [controller.view insertSubview:[MascoteViewController sharedManager].view atIndex:1];
            break;
        }else{
            [controller.view insertSubview:[MascoteViewController sharedManager].view atIndex:0];
        }
    }
    
    for(UIView *view in controller.view.subviews){
        if(view.tag == 2222){
            [controller.view insertSubview:[TocaTrecoViewController sharedManager].view atIndex:0];
            break;
        }
    }
    
}

//Add uma view atraves do id storyboard
//-(void)addComponentesViewEdicaoPartitura:(UIViewController*)viewAtual :(Exercicio*)exerc{
//
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
//    UIViewController *bar = [sb instantiateViewControllerWithIdentifier:@"ComposicaoPartitura"];
//    [viewAtual.view addSubview:bar.view];
//
//
//    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensTracoPentagrama) {
//       t.frame = CGRectMake(t.frame.origin.x-150,t.frame.origin.y-150,t.frame.size.width,t.frame.size.height);
//    }
//
//}


@end



