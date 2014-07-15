//
//  EfeitoImagem.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EfeitoImagem : NSObject {
    
}

+(EfeitoImagem*)sharedManager;

-(void)addGesturePainImagem:(UIImageView*)img;
-(void)addGesturePainImagens:(NSMutableArray*)listaImangesColisao;

@end
