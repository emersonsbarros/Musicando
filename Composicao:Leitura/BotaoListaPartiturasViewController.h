//
//  BotaoListaPartiturasViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 05/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListaPartiturasViewController.h"


@interface BotaoListaPartiturasViewController : UIViewController

//botao para abrir lista partitura
- (IBAction)btnTabelaPartituras:(id)sender;

//View que aparece quando abre quando aperta o botao
@property ListaPartiturasViewController *bar;

@end
