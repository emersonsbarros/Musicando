//
//  JogoBlocosSomViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 16/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "JogoBlocosSomViewController.h"

@interface JogoBlocosSomViewController ()


@end


@implementation JogoBlocosSomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear: animated];
    [[EfeitoTransicao sharedManager]finalizaExercicio:self];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Add barra,Mascote,View de Retornar Pagina ao Xib
    [[EfeitoComponeteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    [self addGesturePassaFalaMascote:self.viewGesturePassaFala];
    
    //Biblioteca
    self.lblFalaDoMascote = [MascoteViewController sharedManager].lblFalaDoMascote;
    self.testaBiblio = [MascoteViewController sharedManager].testaBiblio;
    self.testaConversa = [MascoteViewController sharedManager].testaConversa;
    self.imagemDoMascote2 = [MascoteViewController sharedManager].imagemDoMascote2;
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote2];
    
    
    [self pulaFalaMascote];


}


-(void)addGesturePassaFalaMascote:(UIView*)viewGesture{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = NO;
    viewGesture.userInteractionEnabled = NO;
    [viewGesture addGestureRecognizer:singleTap];
    
}

-(void)chamaMetodosFala0{
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala1{
    
    for(UIView *view in self.view.subviews){
        if((view.tag == 1001)||(view.tag == 21)){
        }else [view removeFromSuperview];
    }
    
    NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"musicaJogoBlocos" ofType:@"mp3"]];
    [[EfeitoPlayer sharedManager]playAudio:musicFile:-1];
    
    self.viewJogo.hidden = NO;
    [self chamaJogo];
}

//Gerencia o passa de falas
-(void)pulaFalaMascote{
    //Usa pra não dar erro de nulo na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    
    [[BarraSuperiorViewController sharedManager]txtNumeroAulaAtual].text = [NSString stringWithFormat:@"%d",1+[MascoteViewController sharedManager].contadorDeFalas];
    
    if([MascoteViewController sharedManager].contadorDeFalas < contadorMaximo){
        switch ([MascoteViewController sharedManager].contadorDeFalas) {
            case 0:
                [self chamaMetodosFala0];
                break;
            case 1:
                [self chamaMetodosFala1];
                break;
            default:
                break;
        }
        
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:[MascoteViewController sharedManager].contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        [MascoteViewController sharedManager].contadorDeFalas += 1;
        
    }
}


/////////////////// JOGO ///////////////////////

-(void)chamaJogo{
    
    self.imgBocaTocaTreco = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bocaTocaTreco.png"]];
    self.imgBocaTocaTreco.frame = CGRectMake(0,554, 383,214 );
    self.imgBocaTocaTreco.layer.zPosition = 2;
    [self.view addSubview:self.imgBocaTocaTreco];
    
    self.contadorBlocos = 0;
    self.lblQtdBloco.text = @"0";
    
    self.usuarioIntensidade = @"";
    self.usuarioTimbre = @"";
    self.usuarioDuracao = @"";
    self.usuarioAltura = @"";
    
    self.tempo = 30;
    self.listaBlocosTocaTreco = [[NSMutableArray alloc]init];
    
    [self criaBlocoBranco];

}

-(void)zeraTempo:(NSTimer*)tempo{
    
    self.tempoAtual = tempo;
    
    if(self.tempo>0){
        self.tempo -= 1;
        self.lblTempoRestante.text = [NSString stringWithFormat:@"%d",self.tempo];
    }else{
        [tempo invalidate];
        [[GameOverViewController sharedManager]addBarraSuperioAoXib:self :[Biblioteca sharedManager].exercicioAtual];
        [[EfeitoPlayer sharedManager]stopAudio];
    }
}

-(void)decrementaTempo{
    
    if(self.contadorBlocos % 8 == 0){
        if(self.tempo>20){
            self.tempo -=5;
        }
    }
    
    [NSTimer scheduledTimerWithTimeInterval: 1.0
                                     target: self
                                   selector: @selector(zeraTempo:)
                                   userInfo: nil
                                    repeats: YES];
    
}

-(void)criaBlocoBranco{
    
    self.numeroCorAtual = 0;
    self.tempo = 60;
    
    [self sorteEstrutura];
    
    self.borderLayer = [CALayer layer];
    self.imgBlocoModelagem = [[UIImageView alloc]init];
    [self.viewModelagem addSubview:self.imgBlocoModelagem];
    CGRect pos = CGRectMake(70, 80, 50, 50);
    self.imgBlocoModelagem.frame = pos;
    CGRect borderFrame = CGRectMake(70, 80, (self.imgBlocoModelagem.frame.size.width), (self.imgBlocoModelagem.frame.size.height));
    [self.borderLayer setBackgroundColor:[[UIColor grayColor] CGColor]];
    [self.borderLayer setFrame:borderFrame];
    [self.borderLayer setCornerRadius:8];
    [self.borderLayer setBorderWidth:3];
    [self.borderLayer setBorderColor:[[UIColor grayColor] CGColor]];
    [self.imgBlocoModelagem.layer addSublayer:self.borderLayer];
    
    [self addGesturesAoBloco];

}

-(void)sorteEstrutura{
 
    [self decrementaTempo];
    
    int sorteAltura = arc4random()%2;
    
    int sorteDuracao = arc4random()%2;
    
    int sorteIntensidade = arc4random()%2;
    
    int sorteTimbre = arc4random()%3;
    
    
    switch (sorteAltura) {
        case 0:
            self.lblAltura.text = @"Agudo";
            break;
        case 1:
            self.lblAltura.text = @"Grave";
            break;
        default:
            break;
    }
    
    switch (sorteDuracao) {
        case 0:
            self.lblDuracao.text = @"2 Tempos";
            break;
        case 1:
            self.lblDuracao.text = @"1 Tempo";
            break;
        default:
            break;
    }
    
    switch (sorteIntensidade) {
        case 0:
            self.lblIntensidade.text = @"Alto";
            break;
        case 1:
            self.lblIntensidade.text = @"Baixo";
            break;
        default:
            break;
    }
    
    switch (sorteTimbre) {
        case 0:
            self.lblTimbre.text = @"Violao";
            break;
        case 1:
            self.lblTimbre.text = @"Piano";
            break;
        case 2:
            self.lblTimbre.text = @"Flauta";
            break;
        default:
            break;
    }
    
    self.nomeAltura = self.lblAltura.text;
    self.nomeDuracao = self.lblDuracao.text;
    self.nomeIntensidade = self.lblIntensidade.text;
    self.nomeTimbre = self.lblTimbre.text;
    
}

-(void)ajustaTamanhoBorda:(CGRect)borderFrame{
    self.borderLayer.frame = CGRectMake(borderFrame.origin.x,
                                        borderFrame.origin.y ,
                                        borderFrame.size.width,
                                        borderFrame.size.height);
}

-(void)aumentaBloco:(UIPinchGestureRecognizer*)recognizer{
    
    if (recognizer.state != UIGestureRecognizerStateCancelled) {
        if (recognizer.numberOfTouches == 2) {

                CGPoint touch0 = [recognizer locationOfTouch:0 inView:recognizer.view];
                CGPoint touch1 = [recognizer locationOfTouch:1 inView:recognizer.view];
                CGFloat tangent = fabsf((touch1.y - touch0.y) / (touch1.x - touch0.x));
                CGFloat direcao = recognizer.scale;
            
                if(tangent <= 0.2679491924){
                    if(direcao > 1){
                        self.imgBlocoModelagem.frame = CGRectMake(self.imgBlocoModelagem.frame.origin.x,
                                                                  self.imgBlocoModelagem.frame.origin.y,
                                                                  260,
                                                                  self.imgBlocoModelagem.frame.size.height);
                        self.usuarioDuracao = @"2 Tempos";
                    }else{
                        self.imgBlocoModelagem.frame = CGRectMake(self.imgBlocoModelagem.frame.origin.x,
                                                                  self.imgBlocoModelagem.frame.origin.y,
                                                                  200,
                                                                  self.imgBlocoModelagem.frame.size.height);
                        self.usuarioDuracao = @"1 Tempo";
                    }
                    [self ajustaTamanhoBorda:self.imgBlocoModelagem.frame];
    
                }else if(tangent >= 3.7320508076){
                    if(direcao > 1){
                        self.imgBlocoModelagem.frame = CGRectMake(self.imgBlocoModelagem.frame.origin.x,
                                                                  self.imgBlocoModelagem.frame.origin.y,
                                                                  self.imgBlocoModelagem.frame.size.width,
                                                                  260);
                        self.usuarioAltura = @"Grave";
                    }else{
                        self.imgBlocoModelagem.frame = CGRectMake(self.imgBlocoModelagem.frame.origin.x,
                                                                  self.imgBlocoModelagem.frame.origin.y,
                                                                  self.imgBlocoModelagem.frame.size.width,
                                                                  200);
                        self.usuarioAltura = @"Agudo";
                    }
                    [self ajustaTamanhoBorda:self.imgBlocoModelagem.frame];
                }
    
        }
    }
    
}

-(void)trocaCor:(UITapGestureRecognizer*)recognizer{
    
    self.numeroCorAtual += 1;
    
    switch (self.numeroCorAtual) {
        case 1:
            [self.borderLayer setBackgroundColor:[[UIColor redColor] CGColor]];
            self.usuarioTimbre = @"Piano";
            break;
        case 2:
            [self.borderLayer setBackgroundColor:[[UIColor yellowColor] CGColor]];
            self.usuarioTimbre = @"Violao";
            break;
        case 3:
            [self.borderLayer setBackgroundColor:[[UIColor greenColor] CGColor]];
            self.usuarioTimbre = @"Flauta";
            break;
        default:
            self.numeroCorAtual = 0;
            [self trocaCor:recognizer];
            break;
    }
    
}

-(void)trocaAumentaVolume:(UITapGestureRecognizer*)recognizer{
    [self.borderLayer setBorderColor:[[UIColor blackColor] CGColor]];
    self.usuarioIntensidade = @"Alto";
}

-(void)trocaDiminuiVolume:(UITapGestureRecognizer*)recognizer{
    [self.borderLayer setBorderColor:[[UIColor whiteColor] CGColor]];
    self.usuarioIntensidade = @"Baixo";
}

-(void)addGesturesAoBloco{
    
    UITapGestureRecognizer *singleTap0 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(trocaCor:)];
    singleTap0.numberOfTouchesRequired = 1;
    singleTap0.enabled = YES;
    self.viewModelagem.userInteractionEnabled = YES;
    [self.viewModelagem addGestureRecognizer:singleTap0];
    
    
    UIPinchGestureRecognizer *singleTap = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(aumentaBloco:)];
    self.viewModelagem.userInteractionEnabled = YES;
    [self.viewModelagem addGestureRecognizer:singleTap];
    
    
    UISwipeGestureRecognizer *singleTap2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(trocaAumentaVolume:)];
    singleTap2.numberOfTouchesRequired = 1;
    singleTap2.direction = UISwipeGestureRecognizerDirectionUp;
    self.imgBlocoModelagem.userInteractionEnabled = YES;
    [self.imgBlocoModelagem addGestureRecognizer:singleTap2];
    
    
    UISwipeGestureRecognizer *singleTap3 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(trocaDiminuiVolume:)];
    singleTap3.numberOfTouchesRequired = 1;
    singleTap3.direction = UISwipeGestureRecognizerDirectionDown;
    self.imgBlocoModelagem.userInteractionEnabled = YES;
    [self.imgBlocoModelagem addGestureRecognizer:singleTap3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)copiaBlocoParaTocaTreco{
    
    [self.imgBlocoModelagem removeFromSuperview];
    
    self.imgBlocoCai = [[UIImageView alloc]init];
    CGRect pos = CGRectMake(-10,-113, 223, 139);
    self.imgBlocoCai.frame = pos;
    self.imgBlocoCai.frame = CGRectMake(self.imgBlocoCai.frame.origin.x,
                                        self.imgBlocoCai.frame.origin.y,
                                        self.imgBlocoModelagem.frame.size.width,
                                        self.imgBlocoModelagem.frame.size.height);
    [self.imgBlocoCai.layer addSublayer:self.borderLayer];
    self.imgBlocoCai.layer.zPosition = 0;
    [self.view addSubview:self.imgBlocoCai];

    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgBlocoCai.frame.origin.x,
                                                      self.imgBlocoCai.frame.origin.y+700,
                                                      self.imgBlocoCai.frame.size.width,
                                                      self.imgBlocoCai.frame.size.height);
                         self.imgBlocoCai.frame = moveGalo;
                     }
                     completion:^(BOOL finished){
                         [self tocaBloco];
                         [self.tempoAtual invalidate];
                         [self.imgBlocoCai removeFromSuperview];
                     }];
}

-(void)verficaPlacarUsuario{
    
    if(([self.nomeAltura isEqualToString:self.usuarioAltura]) &&
       ([self.nomeDuracao isEqualToString:self.usuarioDuracao]) &&
       ([self.nomeIntensidade isEqualToString:self.usuarioIntensidade]) &&
       ([self.nomeTimbre isEqualToString:self.usuarioTimbre])){
        self.contadorBlocos +=1;
    }else{
        [[EfeitoPlayer sharedManager]stopAudio];
        [[GameOverViewController sharedManager]addBarraSuperioAoXib:self :[Biblioteca sharedManager].exercicioAtual];
        self.contadorBlocos = 0;
    }
    
    self.lblQtdBloco.text = [NSString stringWithFormat:@"%d",self.contadorBlocos];
}


-(void)tocaBloco{
    
    NSString *nomeIntrumento;
    NSString *oitava;
    NSString *duracao;
    float volume ;
    
    if([self.usuarioTimbre isEqualToString:@"Piano"]){
        nomeIntrumento = @"Piano";
    }else if([self.usuarioTimbre isEqualToString:@"Violao"]){
        nomeIntrumento = @"natural";
    }else{
        nomeIntrumento = @"FlautaDoce";
    }
   
    
    if([self.usuarioAltura isEqualToString:@"Grave"]){
        oitava = @"4";
    }else{
        oitava = @"5";
    }
    
    if([self.usuarioDuracao isEqualToString:@"2 Tempos"]){
        duracao = @"half";
    }else{
        duracao = @"quarter";
    }
    
    if([self.usuarioIntensidade isEqualToString:@"Alto"]){
        volume = 10.0;
    }else{
        volume = 5.0;
    }
    
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"D";
    aux.oitava = oitava;
    aux.tom = @"";
    aux.tipoNota = duracao;
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:nomeIntrumento];
    [self.listaBlocosTocaTreco addObject:aux];
    
    
    self.usuarioIntensidade = @"";
    self.usuarioTimbre = @"";
    self.usuarioDuracao = @"";
    self.usuarioAltura = @"";

}



- (IBAction)btnFazerBloco:(id)sender {
        if((![self.usuarioAltura isEqualToString:@""]) &&
           (![self.usuarioDuracao isEqualToString:@""]) &&
           (![self.usuarioIntensidade isEqualToString:@""]) &&
           (![self.usuarioTimbre isEqualToString:@""])){
            
            [self verficaPlacarUsuario];
            [self copiaBlocoParaTocaTreco];
            [self criaBlocoBranco];
            
        }
}


- (IBAction)btnTocar:(id)sender {
    [[Sinfonia sharedManager]tocarUmaNota:self.listaBlocosTocaTreco:@"Piano"];
}

@end









