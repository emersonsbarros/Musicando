//
//  MascoteViewController.m
//  Musicando
//
//  Created by VINICIUS RESENDE FIALHO on 08/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "MascoteViewController.h"

@interface MascoteViewController ()

@end

@implementation MascoteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//Singleton
+(MascoteViewController*)sharedManager{
    static MascoteViewController *mascote = nil;
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

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    
    self.imagemDoMascote2.alpha = 1.0;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imgFundoTexto.layer.zPosition =0;
    
    self.contadorDeFalas = 0;
    self.testaBiblio = [Biblioteca sharedManager];
    self.testaConversa = self.testaBiblio.exercicioAtual.mascote.listaDeConversas.firstObject;
    self.imagemDoMascote2.image = [[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image;
    
       
    
}

-(void)pulaFalaMascote{
    NSLog(@"ddf");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addGesturePassaFalaMascote:(UIView*)viewGesture :(SEL)metodoPassaFala :(UIViewController*)cont{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:cont action:metodoPassaFala];
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = NO;
    viewGesture.userInteractionEnabled = NO;
    [viewGesture addGestureRecognizer:singleTap];
}

-(void)addBarraSuperioAoXib:(UIViewController*)viewAtual :(Exercicio*)exer{
    
    MascoteViewController *bar = [[MascoteViewController alloc]init];
    bar.view.layer.zPosition = 0;
    [viewAtual addChildViewController:bar];
    bar.view.frame = CGRectMake(420, 520, bar.view.frame.size.width,bar.view.frame.size.height);
    [viewAtual.view addSubview:bar.view];
    
}


@end
