//
//  PlayerPartituraViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 03/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "PlayerPartituraViewController.h"

@interface PlayerPartituraViewController ()

@end

@implementation PlayerPartituraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    
    [self.timerTempoAndamento invalidate];
    [self.timerNomeNota invalidate];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Aciona o timer das labels nome notas e tempo do andamento
    self.timerNomeNota = [NSTimer scheduledTimerWithTimeInterval:0.001
                                     target:self
                                   selector:@selector(atualizaTextoDescricaoNota)
                                   userInfo:nil repeats:YES];
    
    self.timerTempoAndamento = [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(atualizaAlteraTempo)
                                   userInfo:nil repeats:YES];
    
}

////////////////////////////////// METODOS //////////////////////////////////////////

//Faz a contrucao da partitura no scroll, pode ser Horizontal ou Vertical
-(void)addItensDesenhoPartituraAoScroll{
    
    [[DesenhaPartitura sharedManager]metodosDesenhaPartitura];
    
    
}

//Pegas as 2 opcpoes setadas pelo usuario e chama o metodo de tocar partittura
-(void)tocarPartitura{
    [[Sinfonia sharedManager] metodoIniciaSinfonia:[EscolhaUsuarioPartitura sharedManager].nomeXmlPartitura:[EscolhaUsuarioPartitura sharedManager].nomeInstrumentoPartitura];
    //chama o metodo de construcao
    [self addItensDesenhoPartituraAoScroll];
}


////////////////////////////////// PLAYER //////////////////////////////////////////

//Da um pause na partitura
- (IBAction)botaoPause:(id)sender {
//[[Sinfonia sharedManager]pausePlayerPartitura];
    
}



//Da um stop na partitura
- (IBAction)botaoStop:(id)sender {
    [[Sinfonia sharedManager]pararPlayerPartitura];
    //Chama o foco de volta para o comeco do scroll
    [[ComponenteScroll sharedManager]resetaScroll];
    
}


//Da um play na partitura
- (IBAction)botaoPlay:(id)sender {
//[[Sinfonia sharedManager]tocarPlayerPartitura];
    
    //remove todos os compontes anteriores
    [[ComponenteScroll sharedManager] removeViewDoScroll];
    [self tocarPartitura];
    
}


//Altera a velocidade do andamento em uma semibreve
- (IBAction)botaoAlteraVelocidade:(id)sender {
    UIStepper *stepper = (UIStepper *) sender;
    
    stepper.maximumValue = 0.95;
    stepper.minimumValue = 0;
    stepper.stepValue = 0.05;
    
    stepper.continuous = YES;
    stepper.autorepeat =YES;
    
    [Sinfonia sharedManager].controleVelocidaTranNota = stepper.value;
    
}


//Timer que atualiza os nomes de notas das partituras
-(void)atualizaTextoDescricaoNota{
    self.textoDescricaoNota.text = [[Sinfonia sharedManager]textoDescricaoNota];
}

//Timer que atualiza o tempo de andamento
-(void)atualizaAlteraTempo{
    self.textoDescricaoVelocidade.text = [NSString stringWithFormat:@"%0.2f",[[Sinfonia sharedManager]controleVelocidaTranNota]];
}



@end
