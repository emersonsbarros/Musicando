//
//  EscadaDeNotasViewController.m
//  Musicando
//
//  Created by EMERSON DE SOUZA BARROS on 13/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EscadaDeNotasViewController.h"

@interface EscadaDeNotasViewController ()

@end

@implementation EscadaDeNotasViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = NO;
    skView.showsNodeCount = YES;
    skView.backgroundColor = [UIColor whiteColor];
    
    //Create and configure the scene.
    SKScene * cenaPrincipal = [EscadaDeNotasPrincipal sceneWithSize: skView.bounds.size];
    cenaPrincipal.scaleMode = SKSceneScaleModeAspectFill;
    
    //Present the scene.
    [skView presentScene: cenaPrincipal];
}

- (BOOL)shouldAutorotate{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskLandscape;
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
