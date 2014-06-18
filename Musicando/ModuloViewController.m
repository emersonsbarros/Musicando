//
//  ModuloViewController.m
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 16/06/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "ModuloViewController.h"

@interface ModuloViewController ()

@end

@implementation ModuloViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Seta com o Singleton
      
    
    }
    return self;
}

-(void)chamaStoryBoardAulas:(id)sender{
    [self performSegueWithIdentifier:@"chamaAulas" sender:sender];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bibliotecaDosModulos = [Biblioteca sharedManager];
    
    for(Modulo *mod in [[self bibliotecaDosModulos ]listaDeModulos]){
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self
                   action:@selector(chamaStoryBoardAulas:)
         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"" forState:UIControlStateNormal];
         button.frame = CGRectMake(80.0, 210.0, 100, 150);
        [button setImage:[mod capa] forState:UIControlStateNormal];
        [self.view addSubview:button];
        
        UILabel *label =  [[UILabel alloc] initWithFrame: CGRectMake(80,210.0+120,100,100)];
        label.text = [mod nome];
        [self.view addSubview:label];
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
