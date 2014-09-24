//
//  ComposicaoPartituraViewController.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 08/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Sinfonia.h"
#import "GerenciadorComponenteView.h"
#import "ComponenteScrollEdicao.h"
#import "DesenhaPartituraEdicao.h"

@interface ComposicaoPartituraViewController : UIViewController <UIScrollViewDelegate> {
    

}

//Scroll que recebe a partituras
@property (weak, nonatomic) IBOutlet UIScrollView *scrollEdicao;





@end
