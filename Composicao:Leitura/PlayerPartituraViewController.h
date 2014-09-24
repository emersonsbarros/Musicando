//
//  PlayerPartituraViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 03/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sinfonia.h"
#import "ComponenteScroll.h"
#import "EscolhaUsuarioPartitura.h"

@interface PlayerPartituraViewController : UIViewController

//Timer
@property NSTimer *timerNomeNota;
@property NSTimer *timerTempoAndamento;

//texto que mostra as notas tocadas
@property (weak, nonatomic) IBOutlet UILabel *textoDescricaoNota;

//texto que mostra a velocidade do andamento
@property (weak, nonatomic) IBOutlet UILabel *textoDescricaoVelocidade;


@end
