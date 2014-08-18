//
//  GameOverViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 17/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "GameOverViewController.h"

@interface GameOverViewController ()

@end

@implementation GameOverViewController

//Singleton
+(GameOverViewController*)sharedManager{
    static GameOverViewController *mascote = nil;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnHome:(id)sender {
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"biblioteca"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];
    
}

- (IBAction)btnRetornar:(id)sender {
        
    id object = [[NSClassFromString([self.exercAtualGameOver nomeView]) alloc]initWithNibName:[self.exercAtualGameOver nomeView] bundle:nil];
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [self.view.window.layer addAnimation:transition forKey:kCATransition];
    
    [self presentViewController:object animated:NO completion:nil];
    
}

-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer{
    
    self.exercAtualGameOver = exer;
    
    GameOverViewController *bar = [[GameOverViewController alloc]init];
    bar.view.layer.zPosition = +5;
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
    
}

-(void)addBarraSuperioAoXibOculto:(UIViewController*)viewAtual :(Exercicio*)exer{
    
    self.exercAtualGameOver = exer;
    self.gameOverParaUmaCena = [[GameOverViewController alloc]init];
    self.gameOverParaUmaCena.view.layer.zPosition = +15;
    self.gameOverParaUmaCena.view.hidden = YES;
    self.gameOverParaUmaCena.view.tag = 9999;
    [viewAtual addChildViewController:self.gameOverParaUmaCena];
    [viewAtual.view addSubview:self.gameOverParaUmaCena.view];
    
}



@end



