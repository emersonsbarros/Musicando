//
//  EfeitoMascote.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface EfeitoMascote : NSObject{
    
    
}

//////////METODOS//////////
+(EfeitoMascote*)sharedManager;

//Animacao do Mascote Pulando
-(void)chamaAnimacaoMascotePulando:(UIImageView*)imagemDoMascote2;

//Remove e coloca brilho e autoriza o passar de Fala
-(void)chamaAddBrilho:(UIImageView*)imgBrilha :(float)tempoParaComecar :(UIView*)passaFala;
-(void)removeBrilho:(UIImageView*)imgBrilha :(UIView*)passaFala;


//////////ATRIBUTOS////////
//serve para guardar 2 variaveis para poder pegar no metodo,
//já que não dá pra passar 2 paramentro separados no performSelector
@property NSMutableArray *listaAuxBrilho;

@end
