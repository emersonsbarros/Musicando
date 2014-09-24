//
//  ComponenteScroll.h
//  Musicando
//
//  Created by Vinicius Resende Fialho on 03/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sinfonia.h"
#import "DesenhaPartitura.h"

@interface ComponenteScroll : NSObject <UIScrollViewDelegate>



+(ComponenteScroll*)sharedManager;

@property int auxContadorScroll;
@property UIScrollView *scrollPartitura;
-(void)iniciaTimerDeslocaScrollPartituraVertical;
-(void)iniciaTimerDeslocaScrollPartituraHorizontal;

-(void)removeViewDoScroll;
-(void)resetaScroll;
-(void)recebeScroll:(UIScrollView*)scroll;


@end
