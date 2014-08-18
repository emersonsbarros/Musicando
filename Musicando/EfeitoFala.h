//
//  EfeitoFala.h
//  Musicando
//
//  Created by Emerson Barros on 18/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EfeitoFala : NSObject

+(EfeitoFala*)sharedManager;

- (void)incializar;
- (void)falar :(NSString*)texto;

@end
