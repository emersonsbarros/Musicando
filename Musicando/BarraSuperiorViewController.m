//
//  BarraSuperiorViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 22/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "BarraSuperiorViewController.h"

@interface BarraSuperiorViewController ()

@end

@implementation BarraSuperiorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//Singleton
+(BarraSuperiorViewController*)sharedManager{
    static BarraSuperiorViewController *mascote = nil;
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


- (BOOL)prefersStatusBarHidden {
    return YES;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.txtAulaAtual.text = [[EfeitoBarraSuperior sharedManager]textoAulaAtual];
    self.txtNumeroAulas.text = [[EfeitoBarraSuperior sharedManager]textoNumeroAulas];
    self.txtNumeroAulaAtual.text = @"1";
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnActionHome:(id)sender {
//    BibliotecaViewController *myViewController = [[UIStoryboard storyboardWithName:@"Main_iPad" bundle:NULL] instantiateViewControllerWithIdentifier:@"biblioteca"];
//    [self transitionFromViewController:self toViewController:myViewController duration:0.0 options:1 animations:NULL completion:NULL];
    
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
//    BibliotecaViewController *initViewController = [storyBoard instantiateInitialViewController];
//    [self.window setRootViewController:initViewController];


    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    //UINavigationController *vc = [sb instantiateViewControllerWithIdentifier:@"biblioteca"];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"biblioteca"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];

}
@end
