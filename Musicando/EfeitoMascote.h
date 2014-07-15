//
//  EfeitoMascote.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 14/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EfeitoMascote : NSObject{
    
    
}

+(EfeitoMascote*)sharedManager;

//Animacao do Mascote Pulando
-(void)animacaoMascotePulando:(UIImageView*)imagemMascote;

-(void)chamaAnimacaoMascotePulando:(UIImageView*)imagemDoMascote2;



@end
