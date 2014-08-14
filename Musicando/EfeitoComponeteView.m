//
//  EfeitoComponeteView.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 12/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EfeitoComponeteView.h"

@implementation EfeitoComponeteView


//Singleton
+(EfeitoComponeteView*)sharedManager{
    static EfeitoComponeteView *mascote = nil;
    if(!mascote){
        mascote = [[super allocWithZone:nil] init];
    }
    return mascote;
}

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


//Add os componetes para uma view de exercicio
-(void)addComponetesViewExercicio:(UIViewController*)controller :(Exercicio*)exer{
    
    [[TocaTrecoViewController sharedManager]addBarraSuperioAoXib:controller:exer];
    [[BarraSuperiorViewController sharedManager]addBarraSuperioAoXib:controller:exer];
    [[MascoteViewController sharedManager]addBarraSuperioAoXib:controller:exer];
    [[RetornaPaginaViewController sharedManager]addBarraSuperioAoXib:controller:exer];
    
    
    for(UIView *view in controller.view.subviews){
        if(view.tag == 1000){
            [controller.view insertSubview:[MascoteViewController sharedManager].view atIndex:1];
            break;
        }else{
            [controller.view insertSubview:[MascoteViewController sharedManager].view atIndex:0];
        }
    }
    
    for(UIView *view in controller.view.subviews){
        if(view.tag == 2222){
            [controller.view insertSubview:[TocaTrecoViewController sharedManager].view atIndex:0];
            break;
        }
    }
    
    //UIView *toca = (UIView*)[[TocaTrecoViewController sharedManager].view viewWithTag:2223];
    //[controller.view insertSubview:toca aboveSubview:[BarraSuperiorViewController sharedManager].view];
    
    
}





@end



