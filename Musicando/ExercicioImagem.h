//
//  EfeitoImagem.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "ExercicioMascote.h"

@interface ExercicioImagem : NSObject {
    
}

+(ExercicioImagem*)sharedManager;


//Add o gesture de arrastar para uma imagem
-(void)addGesturePainImagem:(UIImageView*)img;
//Add o gesture de arrastar para uma lista Imagens
-(void)addGesturePainImagens:(NSMutableArray*)listaImangesColisao;
//Tira gesture
-(void)tiraGestureObjeto:(UIView*)viewGesture;

//Remove as animacoes de uma imagem
-(void)removeTodasAnimacoesView:(UIView*)img;
//Remove as animacoes de uma lista de imagens
-(void)removeTodasAnimacoesViewLista:(NSMutableArray*)listaImg;



//chama o nstimer para verficar sempre se todas colisoes necessarias foram feitas para poder passar de fala,
//atraves de variveis que esperam um estado = 1 para poder passar.
-(void)chamaVerficadorPassaFala:(UIImageView*)imagemMascote :(UIView*)viewGesturePassaFala :(NSMutableArray*)lista :(int)qtdColisao;
//Aux para passar sem parametros no metodo, por causa do nstimer
@property int qtdColisoes;
@property NSMutableArray *listaLiberaFala;
@property UIImageView *imgMascoteAux;
@property UIView *viewGesturePassaFala;


//Adiciona e remove a animcao de um sprite
-(void)addAnimacaoSprite:(NSArray*)listaSprite :(UIImageView*)imgAddAnimacao;
-(void)removeAnimacaoSprite:(NSString*)nomeAnimacao :(UIImageView*)imgAddAnimacao;
-(void)addAnimacaoSprite:(NSArray*)listaSprite :(UIImageView*)imgAddAnimacao :(float)tempoTransicao :(float)qtdRepeticoes;

//Hidden em degrade
-(void)hiddenYesEmDegrade:(UIView*)imgHidden;
-(void)hiddenNoEmDegrade:(UIView*)imgHidden;

@end



