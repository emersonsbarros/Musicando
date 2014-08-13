
//
//  TocaTrecoViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 13/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "TocaTrecoViewController.h"

@interface TocaTrecoViewController ()

@end

@implementation TocaTrecoViewController

//Singleton
+(TocaTrecoViewController*)sharedManager{
    static TocaTrecoViewController *mascote = nil;
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


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer{
    
    TocaTrecoViewController *bar = [[TocaTrecoViewController alloc]init];
    bar.view.layer.zPosition = 0;
    bar.view.frame = CGRectMake(0, 0, bar.view.frame.size.width,bar.view.frame.size.height);
    
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
    
}


@end
