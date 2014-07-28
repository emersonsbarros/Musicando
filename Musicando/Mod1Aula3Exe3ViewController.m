//
//  Mod1Aula3Exe3ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula3Exe3ViewController.h"

@interface Mod1Aula3Exe3ViewController ()
@end

@implementation Mod1Aula3Exe3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Add barra Superior ao Xib
    [[EfeitoBarraSuperior sharedManager]addBarraSuperioAoXib:self:[Biblioteca sharedManager].exercicioAtual];

    //Sombreando view de exercitar
//    self.viewDeExercitar.layer.shadowColor = [[UIColor blackColor] CGColor];
//    self.viewDeExercitar.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
//    self.viewDeExercitar.layer.shadowRadius = 3.0f;
//    self.viewDeExercitar.layer.shadowOpacity = 1.0f;
//    [self.viewDeExercitar setBackgroundColor: [UIColor whiteColor]];
//    
    [self iniciarComponentes];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}



-(void)iniciarComponentes{
    
    //Habilita o gesture do mascote com a UIView que fica por cima dele
    [self addGesturePassaFalaMascote: self.viewGesturePassaFala];
    
    //Inicia lista de imagens para colisão
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    
    //Adiciona imagens para colisao
    //[self.listaImangesColisao addObject: self.notaMelodia];
    //[self.listaImangesColisao addObject: self.notasHarmonia];
    //[self.listaImangesColisao addObject: self.violao];
    //[self.listaImangesColisao addObject: self.flauta];
    
    //Adiciona gesture ARRASTAR em todas imagens dessa lista
    [[EfeitoImagem sharedManager]addGesturePainImagens: self.listaImangesColisao];
    
    //Inicia lista para liberar falas e auxiliares
    self.listaLiberaFala = [[NSMutableArray alloc]init];
    self.estadoAux1 = @"0";
    self.estadoAux2 = @"0";
    self.estadoAux3 = @"0";
    
    //Inicia auxiliares da biblioteca
    self.contadorDeFalas = 0;
    self.testaBiblio = [Biblioteca sharedManager];
    self.testaConversa = self.testaBiblio.exercicioAtual.mascote.listaDeConversas.firstObject;
    
    //Usar sempre que quiser pular uma fala
    [self pulaFalaMascote];
    
    //Imagem do mascote
    self.imagemDoMascote.image = [[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image;
    [self.view addSubview: self.imagemDoMascote];
    [self.view addSubview: self.lblFalaDoMascote];
    
    //Mascote começa a pular
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando: self.imagemDoMascote];
}

//Adiciona gesture ao passar de fala a view que fica por cima do mascote
-(void)addGesturePassaFalaMascote:(UIView*)viewGesture{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    
    singleTap.numberOfTouchesRequired = 1;
    singleTap.enabled = NO;
    viewGesture.userInteractionEnabled = NO;
    
    [viewGesture addGestureRecognizer: singleTap];
}



///////////////////////////////////////////////  FALAS ///////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////



//Gerenciador das falas
-(void)pulaFalaMascote{
    
    //Para não dar erro de NULL na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    

    if(self.contadorDeFalas == contadorMaximo){
        NSString *proxExercicio = [[Biblioteca sharedManager]exercicioAtual].nomeView;
        [[Biblioteca sharedManager]chamaViewTransicaoExercicio:self:proxExercicio];
    }
    
    if(self.contadorDeFalas < contadorMaximo){
        switch (self.contadorDeFalas) {
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
                
            default:
                break;
        }
        
        //Pega a fala atual de acordo com o contador e passa para o label
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex: self.contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        self.contadorDeFalas +=1;
    }
}

//Intro sobre melodia
-(void)chamaMetodosFala0 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Intro melodia
-(void)chamaMetodosFala1 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Definição melodia
-(void)chamaMetodosFala2 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Exemplo coma animação da vitrola
-(void)chamaMetodosFala3 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Mostra vitrola e chama animação
    self.vitrola.hidden = NO;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento de fala
-(void)chamaMetodosFala4 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Exemplo toca treco
-(void)chamaMetodosFala5 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde vitrolda, mostra view de exercitar
    self.vitrola.hidden = YES;
    [self primeiraAnimacao];
    self.viewDeExercitar.hidden = NO;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Complemento
-(void)chamaMetodosFala6 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Para som
    self.audioPlayer.stop;

    
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Exercício
-(void)chamaMetodosFala7 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Mostra views do teste
    self.outTocaTreco1.hidden = YES;
    self.outTocaTreco2.hidden = YES;
    self.imgNota1.hidden = YES;
    self.imgNota2.hidden = YES;
    self.imgNota3.hidden = YES;
    self.imgNota4.hidden = YES;
    self.imgNota5.hidden = YES;
    
    self.outViolaco.hidden = NO;
    self.outFlauta.hidden = NO;
    self.outPiano.hidden = NO;
    
    
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

//Fala Final
-(void)chamaMetodosFala8 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    
    //Esconde o teste e para som
    self.viewDeExercitar.hidden = YES;
    self.audioPlayer.stop;
    
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}


//===ANIMAÇÕES


//Traz a view de exercitar
-(void)primeiraAnimacao{
    
    [UIView animateWithDuration:1.0
                     animations:^(void){
                         //Muda local do mascote e label
                         self.viewDeExercitar.frame = CGRectMake(100, self.viewDeExercitar.frame.origin.y, self.viewDeExercitar.frame.size.width, self.viewDeExercitar.frame.size.height);
                     } completion:^(BOOL finished){
                     }];
}


//Animação toca treco
-(void)animacaoTocaTreco{
    
    if (self.outTocaTreco1.tag == 100){
        NSLog(@"Primeiro tocatreco");
        self.imgNota2.frame = CGRectMake(84, 110, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(143, 110, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
        self.imgNota4.frame = CGRectMake(204, 110, self.imgNota4.frame.size.width, self.imgNota4.frame.size.height);
        
        self.imgNota2.hidden = NO;
        self.imgNota3.hidden = NO;
        self.imgNota4.hidden = NO;
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"escalaPiano3AOitava" withExtension:@"wav"];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
        
    }else if(self.outTocaTreco2.tag == 100){
        NSLog(@"Primeiro tocatreco");
        self.imgNota1.frame = CGRectMake(84, 322, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
        self.imgNota2.frame = CGRectMake(84, 364, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
        self.imgNota3.frame = CGRectMake(143, 364, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
        self.imgNota4.frame = CGRectMake(204, 364, self.imgNota4.frame.size.width, self.imgNota4.frame.size.height);
        self.imgNota5.frame = CGRectMake(204, 322, self.imgNota5.frame.size.width, self.imgNota5.frame.size.height);
        
        self.imgNota1.hidden = NO;
        self.imgNota2.hidden = NO;
        self.imgNota3.hidden = NO;
        self.imgNota4.hidden = NO;
        self.imgNota5.hidden = NO;
        
        
        self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"harmoniaPiano" withExtension:@"wav"];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    }
    


    
    [UIView animateWithDuration:2.0
                     animations:^(void){
                         
                         //Aumenta o tamanho do botão
                         self.imgNota1.frame = CGRectMake(1000, self.imgNota1.frame.origin.y, self.imgNota1.frame.size.width, self.imgNota1.frame.size.height);
                         self.imgNota2.frame = CGRectMake(1050, self.imgNota2.frame.origin.y, self.imgNota2.frame.size.width, self.imgNota2.frame.size.height);
                         self.imgNota3.frame = CGRectMake(1100, self.imgNota3.frame.origin.y, self.imgNota3.frame.size.width, self.imgNota3.frame.size.height);
                         self.imgNota4.frame = CGRectMake(1150, self.imgNota4.frame.origin.y, self.imgNota4.frame.size.width, self.imgNota3.frame.size.height);
                         self.imgNota5.frame = CGRectMake(1200, self.imgNota5.frame.origin.y, self.imgNota5.frame.size.width, self.imgNota3.frame.size.height);
                         
                     } completion:^(BOOL finished){
                         
                         self.audioPlayer.play;
                         
                     }];
    
    self.outTocaTreco1.tag = 0;
    self.outTocaTreco2.tag = 0;
}


- (IBAction)tocaTreco1:(id)sender {
    NSLog(@"TocaTreco1 acionado");
    self.outTocaTreco1.tag = 100;
    [self animacaoTocaTreco];

}

- (IBAction)tocaTreco2:(id)sender {
    NSLog(@"TocaTreco2 acionado");
    self.outTocaTreco2.tag = 100;
    [self animacaoTocaTreco];
}

- (IBAction)violao:(id)sender {
    NSLog(@"Violão acionado");
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"acordesViolao" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    self.audioPlayer.play;

}

- (IBAction)flauta:(id)sender {
    NSLog(@"ACERTOU! Flauta acionada");
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"escalaFlauta" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    self.audioPlayer.play;
}

- (IBAction)piano:(id)sender {
    NSLog(@"Piano acionado");
    
    self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"escalaPiano3AOitava" withExtension:@"wav"];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: self.caminhoDoAudio error: nil];
    self.audioPlayer.play;

}
@end
