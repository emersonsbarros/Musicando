//
//  BarraNotasPausasViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 06/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBaseNotaPadrao.h"
#import "Nota.h"
#import "EscolhaUsuarioPartitura.h"

@interface BarraNotasPausasViewController : UIViewController

//Nota que é escolhida pelo usuario colocar na partitura
@property Nota *notaEscolhaEdicao;

@end
