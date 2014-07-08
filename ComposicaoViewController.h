//
//  ComposicaoViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 08/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sinfonia.h"
#import "DataBaseInstrumento.h"
#import "DesenhaPartitura.h"
#import "DataBaseNotaPadrao.h"
#import "NotaEdicaoGesture.h"

@interface ComposicaoViewController : UIViewController <UIScrollViewDelegate> {
    Nota *nota;
    NSMutableArray *listaNotasEdicao;
    int posicaoX;
    int espacamentoEntreNotas;
    int limiteDeNotas;
    NSMutableArray *listaSons;
    Nota *notaParaEdicao;
    
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollEdicao;


//Botoes notas
- (IBAction)semibreveBotao:(id)sender;
- (IBAction)minimaBotao:(id)sender;
- (IBAction)seminimaBotao:(id)sender;
- (IBAction)colcheiaBotao:(id)sender;
- (IBAction)semicolcheiaBotao:(id)sender;
- (IBAction)fusaBotao:(id)sender;
- (IBAction)semifusaBotao:(id)sender;

//Botoes Pausa
- (IBAction)pausaSemibreveBotao:(id)sender;
- (IBAction)pausaMinimaBotao:(id)sender;
- (IBAction)pausaSeminimaBotao:(id)sender;
- (IBAction)pausaColcheiaBotao:(id)sender;
- (IBAction)pausaSemicolcheiaBotao:(id)sender;
- (IBAction)pausaFusaBotao:(id)sender;
- (IBAction)pausaSemifusaBotao:(id)sender;




- (IBAction)tocarTodasNoras:(id)sender;
- (IBAction)limparNotasPartituraEdicao:(id)sender;
@end
