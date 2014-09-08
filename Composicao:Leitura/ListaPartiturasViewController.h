//
//  ListaPartiturasViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 04/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InicializaProjeto.h"
#import "EscolhaUsuarioPartitura.h"

@interface ListaPartiturasViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

//sington para a o botao lista partitura possa pegar as propriedades dele
+(ListaPartiturasViewController*)sharedManager;


//View que contem tudo em relacao a lista
@property (weak, nonatomic) IBOutlet UIView *viewTabelaPartituras;
@property (weak, nonatomic) IBOutlet UITableView *tabelaNomePartituras;
//Auxiliar para poder alternar o hidden da view acima
@property BOOL auxTabelaHidden;


//Aux que recebe todas as partituras xml
@property NSMutableArray *listaPartituras;






@end
