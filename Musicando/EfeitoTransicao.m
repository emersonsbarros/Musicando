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
    [controller.view.layer addAnimation:tran forKey:@"PaginaEsquerda"];
}

-(void)chamaTransicaoPaginaDireita:(UIViewController*)controller{
    CATransition *  tran=[CATransition animation];
    tran.type = @"pageCurl";
    tran.subtype = kCATransitionFromRight;
    tran.duration=1.5;
    tran.delegate=self;
    [controller.view.layer addAnimation:tran forKey:@"PaginaDireita"];
}

-(void)chamaTransicaoPaginaTopo:(UIViewController*)controller{
    CATransition *  tran=[CATransition animation];
    tran.type = @"pageCurl";
    tran.subtype = kCATransitionFromTop;
    tran.duration=1.5;
    tran.delegate=self;
    [controller.view.layer addAnimation:tran forKey:@"PaginaTopo"];
}


//Remove todas animacoes do ViewController
-(void)finalizaExercicio:(UIViewController*)contr{
    for(UIView *img in contr.view.subviews){
        img.alpha = 1;
        [img.layer removeAllAnimations];
        [img removeFromSuperview];
    }
    //[player stop];
    [contr.view removeFromSuperview];
}

-(void)chamaOProximoExercicio:(UIViewController*)viewAntiga :(NSString*)nomeDaViewAtual{
    
    Exercicio *prox = [self retornaIndiceExercicioModuloBasico:nomeDaViewAtual];
    id object = [[NSClassFromString(prox.nomeView) alloc]initWithNibName:[prox nomeView] bundle:nil];
    [Biblioteca sharedManager].exercicioAtual = prox;
    [BarraSuperiorViewController sharedManager].txtAulaAtual.text = prox.nome;
    
    CATransition* transition = [CATransition animation];
    transition.duration = 1.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [viewAntiga.view.window.layer addAnimation:transition forKey:kCATransition];
    [viewAntiga presentViewController:object animated:NO completion:nil];
    
}

-(NSString*)retornaONomeDaProximaAula:(NSString*)nomeDaViewAtual{
    Exercicio *prox = [self retornaIndiceExercicioModuloBasico:nomeDaViewAtual];
    return prox.nome;
}

-(void)chamaViewTransicaoExercicio:(UIViewController*)viewProxAula :(NSString*)nomeDaViewAtual{
    TransicaoExercicioViewController *trans = [[TransicaoExercicioViewController alloc]init];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 1.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [viewProxAula.view.window.layer addAnimation:transition forKey:kCATransition];
    [viewProxAula presentViewController:trans animated:NO completion:nil];
    
    
    for(UIView *view in viewProxAula.view.subviews){
        [view removeFromSuperview];
    }
    
    viewProxAula = nil;
    
}

-(Exercicio*)retornaIndiceExercicioModuloBasico:(NSString*)nomeView{
    
    NSMutableArray *aux = [[NSMutableArray alloc]init];
    
    for(Modulo *mod in [Biblioteca sharedManager].listaDeModulos){
        for(Aula *aulas in mod.listaDeAulas){
            for(Exercicio *exerRetorna in aulas.listaDeExercicios){
                [aux addObject:exerRetorna];
            }
        }
    }
    
    for(int i=0;i<aux.count-1;i++){
        Exercicio *exerRetorna = [aux objectAtIndex:i];
        if([exerRetorna.nomeView isEqualToString:nomeView]){
            exerRetorna = [aux objectAtIndex:i+1];
            return exerRetorna;
        }
    }
    
    return NULL;
}


@end
