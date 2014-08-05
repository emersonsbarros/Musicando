//
//  Mod2Aula7Exe5ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod2Aula7Exe5ViewController.h"

@interface Mod2Aula7Exe5ViewController ()

@end

@implementation Mod2Aula7Exe5ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Add barra Superior ao Xib
    [[EfeitoBarraSuperior sharedManager]addBarraSuperioAoXib:self:[Biblioteca sharedManager].exercicioAtual];
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
    //[self.listaImangesColisao addObject: self.melodia];
    //[self.listaImangesColisao addObject: self.ritmo];
    //[self.listaImangesColisao addObject: self.harmonia];
    
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
                
            default:
                break;
        }
        
        //Pega a fala atual de acordo com o contador e passa para o label
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex: self.contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        self.contadorDeFalas +=1;
    }
}

//Intro
-(void)chamaMetodosFala0 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala1 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala2 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala3 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala4 {
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote:self.viewGesturePassaFala];
    [[EfeitoMascote sharedManager]chamaAddBrilho: self.imagemDoMascote:5.0f:self.viewGesturePassaFala];
}

@end
