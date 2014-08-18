//
//  Mod2Aula1Exe1ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//
#import "EfeitoFala.h"
#import "Mod2Aula1Exe1ViewController.h"

@interface Mod2Aula1Exe1ViewController ()

@end

@implementation Mod2Aula1Exe1ViewController

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




- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Add barra,Mascote,View de Retornar Pagina ao Xib
    [[EfeitoComponeteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    SEL selectors1 = @selector(pulaFalaMascote);
    [[MascoteViewController sharedManager]addGesturePassaFalaMascote:self.viewGesturePassaFala :selectors1:self];
    [[RetornaPaginaViewController sharedManager]addGesturePassaFalaMascote:[RetornaPaginaViewController sharedManager].viewRetornaPagina:selectors1:self];

    
    //Lista para cair animcao/colisao
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    //Add imagens que faram colisao
    //[self.listaImangesColisao addObject:self.imgFitaFuracao];
 
    //Add gesture arrastar em todas imagens dessa lista
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImangesColisao];
    
    
    //Lista para saber se as colisoes na tela foram feitas p/ ir na prox fala
    self.listaLiberaFala = [[NSMutableArray alloc]init];
    //seta com alguma coisa para add uma coisa nao nula
    self.estadoAux1 = @"0";
    
    
    //Biblioteca
    self.lblFalaDoMascote = [MascoteViewController sharedManager].lblFalaDoMascote;
    self.testaBiblio = [MascoteViewController sharedManager].testaBiblio;
    self.testaConversa = [MascoteViewController sharedManager].testaConversa;
    self.imagemDoMascote2 = [MascoteViewController sharedManager].imagemDoMascote2;
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote2];
    
    [self pulaFalaMascote];

}


//Gerencia o passa de falas
-(void)pulaFalaMascote{
    //Usa pra não dar erro de nulo na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    
    [[BarraSuperiorViewController sharedManager]txtNumeroAulaAtual].text = [NSString stringWithFormat:@"%d",1+[MascoteViewController sharedManager].contadorDeFalas];
    
    if([MascoteViewController sharedManager].contadorDeFalas == contadorMaximo){
        NSString *proxExercicio = [[Biblioteca sharedManager]exercicioAtual].nomeView;
        [[EfeitoTransicao sharedManager]chamaViewTransicaoExercicio:self:proxExercicio];
    }
    
    if([MascoteViewController sharedManager].contadorDeFalas < contadorMaximo){
        switch ([MascoteViewController sharedManager].contadorDeFalas) {
            case 0:
                [self chamaMetodosFala0];
                break;
            case 1:
                [self chamaMetodosFala1];
                break;
            case 2:
                [self chamaMetodosFala2];
                break;
            case 3:
                [self chamaMetodosFala3];
                break;
            case 4:
                [self chamaMetodosFala4];
                break;
            case 5:
                [self chamaMetodosFala5];
                break;
            case 6:
                [self chamaMetodosFala6];
                break;
            case 7:
                [self chamaMetodosFala7];
                break;
            case 8:
               [self chamaMetodosFala8];
                break;
            case 9:
                [self chamaMetodosFala9];
                break;
            default:
                break;
        }
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:[MascoteViewController sharedManager].contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        [MascoteViewController sharedManager].contadorDeFalas += 1;
    }
}

-(void)chamaMetodosFala0{
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPassaroParitura];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala1{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala2{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPassaroParitura];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.viewPiano];
    
    
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:7];

}

-(void)chamaMetodosFala3{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.viewPiano];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.pilar1];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.pilar2];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.pilar3];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.pilar4];
    
    UILabel *txtPilar1 = [[UILabel alloc]init];
    txtPilar1.text = @"Altura";
    txtPilar1.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtPilar1.frame = CGRectMake(0,150,100,300);
    [txtPilar1 sizeToFit];
    txtPilar1.textAlignment = NSTextAlignmentCenter;
    [txtPilar1 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.pilar1 addSubview:txtPilar1];
    
    UILabel *txtPilar2 = [[UILabel alloc]init];
    txtPilar2.text = @"Duracao";
    txtPilar2.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtPilar2.frame = CGRectMake(-20,150,100,300);
    [txtPilar2 sizeToFit];
    txtPilar2.textAlignment = NSTextAlignmentCenter;
    [txtPilar2 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.pilar2 addSubview:txtPilar2];
    
    UILabel *txtPilar3 = [[UILabel alloc]init];
    txtPilar3.text = @"Intensidade";
    txtPilar3.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtPilar3.frame = CGRectMake(-40,150,100,300);
    [txtPilar3 sizeToFit];
    txtPilar3.textAlignment = NSTextAlignmentCenter;
    [txtPilar3 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.pilar3 addSubview:txtPilar3];
    
    
    UILabel *txtPilar4 = [[UILabel alloc]init];
    txtPilar4.text = @"Timbre";
    txtPilar4.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtPilar4.frame = CGRectMake(0,150,100,300);
    [txtPilar4 sizeToFit];
    txtPilar4.textAlignment = NSTextAlignmentCenter;
    [txtPilar4 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.pilar4 addSubview:txtPilar4];
    
    UILabel *txtBase = [[UILabel alloc]init];
    txtBase.text = @"Nota Musical";
    txtBase.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtBase.frame = CGRectMake(150,5,100,300);
    [txtBase sizeToFit];
    txtBase.textAlignment = NSTextAlignmentCenter;
    [self.base addSubview:txtBase];
    
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar1.frame.origin.x,
                                                      self.pilar1.frame.origin.y+500,
                                                      self.pilar1.frame.size.width,
                                                      self.pilar1.frame.size.height);
                         self.pilar1.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"barulhoPilarCaindo" withExtension:@"mp3"];
                         self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
                         [[self audioPlayer]play];
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:2.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar2.frame.origin.x,
                                                      self.pilar2.frame.origin.y+500,
                                                      self.pilar2.frame.size.width,
                                                      self.pilar2.frame.size.height);
                         self.pilar2.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"barulhoPilarCaindo" withExtension:@"mp3"];
                         self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
                         [[self audioPlayer]play];
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:4.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar3.frame.origin.x,
                                                      self.pilar3.frame.origin.y+500,
                                                      self.pilar3.frame.size.width,
                                                      self.pilar3.frame.size.height);
                         self.pilar3.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"barulhoPilarCaindo" withExtension:@"mp3"];
                         self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
                         [[self audioPlayer]play];
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:6.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar4.frame.origin.x,
                                                      self.pilar4.frame.origin.y+500,
                                                      self.pilar4.frame.size.width,
                                                      self.pilar4.frame.size.height);
                         self.pilar4.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"barulhoPilarCaindo" withExtension:@"mp3"];
                         self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
                         [[self audioPlayer]play];
                     }];
    
    [UIView animateWithDuration:3.0
                          delay:9.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.base.hidden = NO;
                         CGRect moveGalo = CGRectMake(self.base.frame.origin.x,
                                                      self.base.frame.origin.y+170,
                                                      self.base.frame.size.width,
                                                      self.base.frame.size.height);
                         self.base.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"barulhoBasePilar" withExtension:@"wav"];
                         self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
                         [[self audioPlayer]play];
                         [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
                     }];
}

-(void)chamaMetodosFala4{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.pilar1];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.pilar2];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.pilar3];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.pilar4];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.base];
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgEscada];
    
   [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.viewEscada];
    self.outDo.hidden = YES;
    self.outRe.hidden = YES;
    self.outMi.hidden = YES;
    self.outFa.hidden = YES;
    self.outSo.hidden = YES;
    self.outLa.hidden = YES;
    self.outSi.hidden = YES;
    
    
   [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    

}

-(void)chamaMetodosFala5{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
    
}


-(void)chamaMetodosFala6{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    self.outDo.hidden = NO;
    self.outRe.hidden = NO;
    self.outMi.hidden = NO;
    self.outFa.hidden = NO;
    self.outSo.hidden = NO;
    self.outLa.hidden = NO;
    self.outSi.hidden = NO;
    
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:7];;
    
}

-(void)chamaMetodosFala7{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
    
}

-(void)chamaMetodosFala8{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
   
    UIButton *button = (UIButton *)[self.viewEscada viewWithTag:11];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:button];
    UIButton *button2 = (UIButton *)[self.viewEscada viewWithTag:12];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:button2];
    UIButton *button3 = (UIButton *)[self.viewEscada viewWithTag:13];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:button3];
    UIButton *button4 = (UIButton *)[self.viewEscada viewWithTag:14];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:button4];
    UIButton *button5 = (UIButton *)[self.viewEscada viewWithTag:15];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:button5];
    UIButton *button6 = (UIButton *)[self.viewEscada viewWithTag:16];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:button6];
    UIButton *button7 = (UIButton *)[self.viewEscada viewWithTag:17];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:button7];
    
   [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
}

-(void)chamaMetodosFala9{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.viewEscada];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgBandeira];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.lblPadraoAmericano];
    
    [UIView animateWithDuration:4.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.imgBandeira.frame.origin.x+680,
                                                      self.imgBandeira.frame.origin.y,
                                                      self.imgBandeira.frame.size.width,
                                                      self.imgBandeira.frame.size.height);
                         self.imgBandeira.frame = moveGalo;
                         
                     }
                     completion:(NULL)];
    
    
    [UIView animateWithDuration:4.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.lblPadraoAmericano.frame.origin.x-680,
                                                      self.lblPadraoAmericano.frame.origin.y,
                                                      self.lblPadraoAmericano.frame.size.width,
                                                      self.lblPadraoAmericano.frame.size.height);
                         self.lblPadraoAmericano.frame = moveGalo;
                         
                     }
                     completion:(NULL)];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:5.0f:self.viewGesturePassaFala];
    
    
}

//Add gesture passar de fala a view que fica por cima do mascote, usei por cauda do problema da animacao
-(void)addGesturePassaFalaMascote:(UIView*)viewGesture{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = NO;
    viewGesture.userInteractionEnabled = NO;
    [viewGesture addGestureRecognizer:singleTap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)pulaMascoteNotas:(UIButton*)btn{
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(btn.frame.origin.x,
                                                      btn.frame.origin.y-40,
                                                      btn.frame.size.width,
                                                      btn.frame.size.height);
                         btn.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
}


- (IBAction)btnDo:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    if(btn.tag ==1){
        [self pulaMascoteNotas:btn];
    }
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"C";
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
    [self.listaLiberaFala addObject:self.estadoAux1];
}

- (IBAction)btnRe:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    if(btn.tag ==2){
        [self pulaMascoteNotas:btn];
    }
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"D";
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
    [self.listaLiberaFala addObject:self.estadoAux1];
}

- (IBAction)btnMi:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    if(btn.tag ==3){
        [self pulaMascoteNotas:btn];
    }
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"E";
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
    [self.listaLiberaFala addObject:self.estadoAux1];
}

- (IBAction)btnFa:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    if(btn.tag ==4){
        [self pulaMascoteNotas:btn];
    }
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"F";
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
    [self.listaLiberaFala addObject:self.estadoAux1];
}

- (IBAction)btnSo:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    if(btn.tag ==5){
        [self pulaMascoteNotas:btn];
    }
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"G";
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
    [self.listaLiberaFala addObject:self.estadoAux1];
}

- (IBAction)btnLa:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    if(btn.tag ==6){
        [self pulaMascoteNotas:btn];
    }
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"A";
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
    [self.listaLiberaFala addObject:self.estadoAux1];
}

- (IBAction)btnSi:(id)sender {
    
    UIButton *btn = (UIButton*)sender;
    if(btn.tag ==7){
        [self pulaMascoteNotas:btn];
    }
    
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = @"B";
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
    [self.listaLiberaFala addObject:self.estadoAux1];
}


@end
