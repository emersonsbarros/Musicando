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
   
    self.txtAulaAtual.text = self.textoAulaAtual;
    self.txtNumeroAulas.text = self.textoNumeroAulas;
    self.txtNumeroAulaAtual.text = @"1";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnActionHome:(id)sender {

    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"biblioteca"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:NULL];

}

-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer{
    
    Conversa *conv = [[[exer mascote ]listaDeConversas]objectAtIndex:0];

    self.textoAulaAtual = exer.nome;
    self.textoNumeroAulas = [NSString stringWithFormat:@"%d",conv.listaDeFalas.count];
    
    BarraSuperiorViewController *bar = [[BarraSuperiorViewController alloc]init];
    bar.view.layer.zPosition = +5;
    [viewAtual addChildViewController:bar];
    [viewAtual.view addSubview:bar.view];
}





@end
