//
//  Mod1Aula3Exe2ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula3Exe2ViewController.h"

@interface Mod1Aula3Exe2ViewController ()

@end

@implementation Mod1Aula3Exe2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Add barra,Mascote,View de Retornar Pagina ao Xib
    [[EfeitoComponeteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    SEL selectors1 = @selector(pulaFalaMascote);
    [[MascoteViewController sharedManager]addGesturePassaFalaMascote:self.viewGesturePassaFala :selectors1:self];
    [[RetornaPaginaViewController sharedManager]addGesturePassaFalaMascote:[RetornaPaginaViewController sharedManager].viewRetornaPagina:selectors1:self];

    
    //Sombreando view dos ritmos
//    self.viewDosRitmos.layer.shadowColor = [[UIColor blackColor] CGColor];
//    self.viewDosRitmos.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
//    self.viewDosRitmos.layer.shadowRadius = 3.0f;
//    self.viewDosRitmos.layer.shadowOpacity = 1.0f;
//    [self.viewDosRitmos setBackgroundColor: [UIColor whiteColor]];
    
    [self iniciarComponentes];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


-(void)iniciarComponentes{
    
    
    //Inicia lista de imagens para colisão
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    
    //Adiciona imagens para colisao
    //[self.listaImangesColisao addObject: self.notaMelodia];
    //[self.listaImangesColisao addObject: self.notasHarmonia];
    //[self.listaImangesColisao addObject: self.violao];
    //[self.listaImangesColisao addObject: self.flauta];
    
    //Adiciona gesture ARRASTAR em todas imagens dessa lista
    [[EfeitoImagem sharedManager]addGesturePainImagens: self.listaImangesColisao];
    
    //Lista para saber se as colisoes na tela foram feitas p/ ir na prox fala
    self.listaLiberaFala = [[NSMutableArray alloc]init];
    //seta com alguma coisa para add uma coisa nao nula
    self.estadoAux1 = @"0";
    
    
    //Biblioteca
    self.lblFalaDoMascote = [MascoteViewController sharedManager].lblFalaDoMascote;
    self.testaBiblio = [MascoteViewController sharedManager].testaBiblio;
    self.testaConversa = [MascoteViewController sharedManager].testaConversa;
    self.imagemDoMascote = [MascoteViewController sharedManager].imagemDoMascote2;
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote];
    
    [self pulaFalaMascote];
    
    
}


///////////////////////////////////////////////  FALAS ///////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////



//Gerenciador das falas
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

//Intro sobre ritmo
-(void)chamaMetodosFala0 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Explicação ritmo
-(void)chamaMetodosFala1 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Animação batimentos do coração
-(void)chamaMetodosFala2 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Chama animação de batidas do coração
    [self animacaoBatidasDoCoracao];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento de fala sobre ritmos
-(void)chamaMetodosFala3 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Para som das batidas
    [[self audioPlayer]stop];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade: self.imgBatidasDoCoracao];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Exemplo de música em vários ritmos
-(void)chamaMetodosFala4 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Mostra view de exercitar
    self.viewDosRitmos.hidden = NO;
    self.imgBatidasDoCoracao.hidden = YES;
    [self primeiraAnimacao];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento de fala
-(void)chamaMetodosFala5 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Para som das batidas
    [[self audioPlayer]stop];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Animação dos tocatrecos
-(void)chamaMetodosFala6 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Para som das batidas
    [[self audioPlayer]stop];
    
    //Esconde botões de ritmo
    self.outBtoClassico.hidden = YES;
    self.outBtoRock.hidden = YES;
    self.outBtoSamba.hidden = YES;
    
    //Mostra toca trecos
    self.outTocaTreco1.hidden = NO;
    self.outTocaTreco2.hidden = NO;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Exercício
-(void)chamaMetodosFala7 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    self.outBtoMaestro.hidden = NO;
    self.outBtoMicrofone.hidden = NO;
    self.outBtoTempoVelocidade.hidden = NO;
    
    self.outTocaTreco1.hidden = YES;
    self.outTocaTreco2.hidden = YES;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Completa fala
-(void)chamaMetodosFala8 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala final
-(void)chamaMetodosFala9 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Mostra view de exercitar
    self.viewDosRitmos.hidden = YES;
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.alternativaCorreta];
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}






//================Métodos de animação e gameficação do exercício

-(void)animacaoBatidasDoCoracao{
    
    //Animação da vitrola
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgBatidasDoCoracao];
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect novaPosicao = CGRectMake(self.imgBatidasDoCoracao.frame.origin.x+10,
                                                         self.imgBatidasDoCoracao.frame.origin.y+20,
                                                         self.imgBatidasDoCoracao.frame.size.width,
                                                         self.imgBatidasDoCoracao.frame.size.height);
                         self.imgBatidasDoCoracao.frame = novaPosicao;
                     }
                     completion:^(BOOL finished){
                     }];
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"coracaoBatendo" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    [[self audioPlayer]play];
    
}


//Primeira animação
-(void)primeiraAnimacao{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         //Muda local do mascote e label
                        self.viewDosRitmos.frame = CGRectMake(200, self.viewDosRitmos.frame.origin.y, self.viewDosRitmos.frame.size.width, self.viewDosRitmos.frame.size.height);
                     } completion:^(BOOL finished){
                     }];
    
}

//TESTE
//Animação para aumentar e diminiuir o botão dos ritmos ao tocar
-(void)animacaoAumentarBtoRitmo:(UIButton*)botaoApertado{
    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         
                         //Aumenta o tamanho do botão
                         self.outBtoClassico.frame = CGRectMake(self.outBtoClassico.frame.origin.x, self.outBtoClassico.frame.origin.y, self.outBtoClassico.frame.size.width+100, self.outBtoClassico.frame.size.height+100);
                         NSLog(@"Aumentou");
                    } completion:^(BOOL finished){
                    }];
    
}
//Animação toca treco
-(void)animacaoTocaTreco:(float)duracao{
    
    if (self.outTocaTreco1.tag == 100){
         self.imgNota1.frame = CGRectMake(self.imgNota1.frame.origin.x, 70, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
        self.imgNota2.frame = CGRectMake(self.imgNota2.frame.origin.x, 70, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(self.imgNota3.frame.origin.x, 70, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
        
    }else if(self.outTocaTreco2.tag == 100){
        self.imgNota1.frame = CGRectMake(self.imgNota1.frame.origin.x, 300, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
        self.imgNota2.frame = CGRectMake(self.imgNota2.frame.origin.x, 300, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(self.imgNota3.frame.origin.x, 300, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
    }
    
    self.imgNota1.hidden = NO;
    self.imgNota2.hidden = NO;
    self.imgNota3.hidden = NO;
    
    [UIView animateWithDuration:duracao
                     animations:^(void){
                         
                         //Aumenta o tamanho do botão
                         self.imgNota1.frame = CGRectMake(900, self.imgNota1.frame.origin.y, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
                         self.imgNota2.frame = CGRectMake(950, self.imgNota2.frame.origin.y, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
                         self.imgNota3.frame = CGRectMake(1000, self.imgNota3.frame.origin.y, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);

                     } completion:^(BOOL finished){
                     }];
    
    self.outTocaTreco1.tag = 0;
    self.outTocaTreco2.tag = 0;
}


- (IBAction)btoClassico:(id)sender {
    [self animacaoAumentarBtoRitmo: self.outBtoClassico];
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"happybirthdayClassico" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    [[self audioPlayer]play];
}

- (IBAction)btoRock:(id)sender {
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"happybirthdayRock" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    [[self audioPlayer]play];
}

- (IBAction)btoSamba:(id)sender {
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"happybirthdaySamba" withExtension:@"mp3"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    [[self audioPlayer]play];
}

- (IBAction)tempoVelocidade:(id)sender {
    NSLog(@"ACERTOU! Tempo e velocidade");
    
    //Animação da vitrola
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.alternativaCorreta];
    [UIView animateWithDuration:1.0
                          delay:0.0
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         self.alternativaCorreta.alpha = 0.3;
                     }
                     completion:^(BOOL finished){
                         
                     }];
}

- (IBAction)maestro:(id)sender {
    NSLog(@"Maestro");
}

- (IBAction)microfone:(id)sender {
    NSLog(@"Microfone");

}

- (IBAction)tocaTreco1:(id)sender {
    self.outTocaTreco1.tag = 100;
    [self animacaoTocaTreco: 1.0];
    
}

- (IBAction)tocaTreco2:(id)sender {
    self.outTocaTreco2.tag = 100;
    [self animacaoTocaTreco: 3.0];
}

@end
