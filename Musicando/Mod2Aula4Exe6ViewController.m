
//
//  Mod2Aula4Exe5ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//


//1-arrumar audios imagens sem merge
//2-arrumar o xib de transicao para ipad

//3-colocar esses macetes de decorar em notas, igual os de pausa
//4-colocar exercicio de ligar em notas,igual os de pausa

//5-diminuir barra de menu
//6-arrumar estudio
//7-dar um removeall dentro do array que carrega modulos,exercicios,aulas nesse metodo
//-(void)viewDidDisappear:(BOOL)animated {
//
//[super viewDidDisappear:animated];
//
//}
//8-arrumar nagegabilidade, tirar erro
//9-colocar mais exercicios estilo o que vc colocou de multipla escolha e tentar mais exercicio daquele estilo infantil que a gente achou na net
//10-dar uma geral e uma testada em todas os exercicios feitos, afim de tirar bugs ou erros
//que o usuario possa cometer
//11- fazer mini jogos! obs: na parte de criacao de exercicio pegar aquele id do comeco do init
//e mudar todas para 0, exeto os de jogo que fica como 1, melhor para poder puchar deppois!
//12-adicionar por cima na parte da jornada aquele mapa as posicoes de todos os exercicios

//Nova ideia = fazer um joguinho de aventura, nesses estilo de mapa, onde o heroi vai adando na tela e tem que resolver mini-desafios, nao precisa ser necessariamente relacionada a musica e partitura(exemplo teria no meio da sala o manuscrito, vc teria que puchar uma sequencia de caixas certa para pode chegar até ele, e assim que ele resolve-se esse pequeno enigma, ele achava uma manuscrito e vinha essas aulas que a gente fez até agora.



#import "Mod2Aula4Exe6ViewController.h"

@interface Mod2Aula4Exe6ViewController ()

@end

@implementation Mod2Aula4Exe6ViewController

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
    [[ExercicioTransicao sharedManager]finalizaExercicio:self];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    ///Add barra,Mascote,View de Retornar Pagina ao Xib
    [[GerenciadorComponenteView sharedManager]addComponetesViewExercicio:self:[Biblioteca sharedManager].exercicioAtual];
    self.viewGesturePassaFala = [MascoteViewController sharedManager].viewGesturePassaFala;
    
    //Cria Seletor e manda ele como paramentro para outros View Controllers poderem usar
    SEL selectors1 = @selector(pulaFalaMascote);
    [[MascoteViewController sharedManager]addGesturePassaFalaMascote:self.viewGesturePassaFala :selectors1:self];
    [[RetornaPaginaViewController sharedManager]addGesturePassaFalaMascote:[RetornaPaginaViewController sharedManager].viewRetornaPagina:selectors1:self];

    
    //Lista para cair animcao/colisao
    self.listaImangesColisao = [[NSMutableArray alloc]init];
    //Add imagens que faram colisao
    [self.listaImangesColisao addObject:self.imgColisao12Tempos];
    [self.listaImangesColisao addObject:self.imgColisao14Tempos];
    [self.listaImangesColisao addObject:self.imgColisao18Tempos];
    [self.listaImangesColisao addObject:self.imgColisao1Tempos];
    [self.listaImangesColisao addObject:self.imgColisao2Tempos];
    [self.listaImangesColisao addObject:self.imgColisao4Tempos];
    [self.listaImangesColisao addObject:self.imgColisao32Tempos];
    
    //Add gesture arrastar em todas imagens dessa lista
    [[ExercicioImagem sharedManager]addGesturePainImagens:self.listaImangesColisao];
    
    
    //Lista para saber se as colisoes na tela foram feitas p/ ir na prox fala
    self.listaLiberaFala = [[NSMutableArray alloc]init];
    //seta com alguma coisa para add uma coisa nao nula
    self.estadoAux1 = @"0";
    
    
    //Biblioteca
    self.lblFalaDoMascote = [MascoteViewController sharedManager].lblFalaDoMascote;
    self.testaBiblio = [MascoteViewController sharedManager].testaBiblio;
    self.testaConversa = [MascoteViewController sharedManager].testaConversa;
    self.imagemDoMascote2 = [MascoteViewController sharedManager].imagemDoMascote2;
    [[ExercicioMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote2];
    
    [self pulaFalaMascote];
    
}

////////////////////////// COLISAO ///////////////////////////////////////

-(void)checkColisao4Tempos:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPonto4tempos.layer.presentationLayer;
    id presentationLayer2 = self.imgColisao4Tempos.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgColisao4Tempos.frame = CGRectMake(self.imgPonto4tempos.frame.origin.x,
                                        self.imgPonto4tempos.frame.origin.y+50,
                                        self.imgColisao4Tempos.frame.size.width,
                                        self.imgColisao4Tempos.frame.size.height);
        [[ExercicioImagem sharedManager]tiraGestureObjeto:self.imgColisao4Tempos];
        [self.listaLiberaFala addObject:self.estadoAux1];
        [theTimer invalidate];
    }
    
}


-(void)checkColisao2Tempos:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPonto2tempos.layer.presentationLayer;
    id presentationLayer2 = self.imgColisao2Tempos.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgColisao2Tempos.frame = CGRectMake(self.imgPonto2tempos.frame.origin.x,
                                                  self.imgPonto2tempos.frame.origin.y+50,
                                                  self.imgColisao2Tempos.frame.size.width,
                                                  self.imgColisao2Tempos.frame.size.height);
        [[ExercicioImagem sharedManager]tiraGestureObjeto:self.imgColisao2Tempos];
        [self.listaLiberaFala addObject:self.estadoAux1];
        [theTimer invalidate];
    }
    
}


-(void)checkColisao1Tempos:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPonto1tempos.layer.presentationLayer;
    id presentationLayer2 = self.imgColisao1Tempos.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgColisao1Tempos.frame = CGRectMake(self.imgPonto1tempos.frame.origin.x,
                                                  self.imgPonto1tempos.frame.origin.y+50,
                                                  self.imgColisao1Tempos.frame.size.width,
                                                  self.imgColisao1Tempos.frame.size.height);
        [[ExercicioImagem sharedManager]tiraGestureObjeto:self.imgColisao1Tempos];
        [self.listaLiberaFala addObject:self.estadoAux1];
        [theTimer invalidate];
    }
    
}


-(void)checkColisao1_2Tempos:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPonto12tempos.layer.presentationLayer;
    id presentationLayer2 = self.imgColisao12Tempos.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgColisao12Tempos.frame = CGRectMake(self.imgPonto12tempos.frame.origin.x,
                                                  self.imgPonto12tempos.frame.origin.y+50,
                                                  self.imgColisao12Tempos.frame.size.width,
                                                  self.imgColisao12Tempos.frame.size.height);
        [[ExercicioImagem sharedManager]tiraGestureObjeto:self.imgColisao12Tempos];
        [self.listaLiberaFala addObject:self.estadoAux1];
        [theTimer invalidate];
    }
    
}


-(void)checkColisao1_4Tempos:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPonto14tempos.layer.presentationLayer;
    id presentationLayer2 = self.imgColisao14Tempos.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgColisao14Tempos.frame = CGRectMake(self.imgPonto14tempos.frame.origin.x,
                                                  self.imgPonto14tempos.frame.origin.y+50,
                                                  self.imgColisao14Tempos.frame.size.width,
                                                  self.imgColisao14Tempos.frame.size.height);
        [[ExercicioImagem sharedManager]tiraGestureObjeto:self.imgColisao14Tempos];
        [self.listaLiberaFala addObject:self.estadoAux1];
        [theTimer invalidate];
    }
    
}


-(void)checkColisao1_8Tempos:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPonto18tempos.layer.presentationLayer;
    id presentationLayer2 = self.imgColisao18Tempos.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgColisao18Tempos.frame = CGRectMake(self.imgPonto18tempos.frame.origin.x,
                                                  self.imgPonto18tempos.frame.origin.y+50,
                                                  self.imgColisao18Tempos.frame.size.width,
                                                  self.imgColisao18Tempos.frame.size.height);
        [[ExercicioImagem sharedManager]tiraGestureObjeto:self.imgColisao18Tempos];
        [self.listaLiberaFala addObject:self.estadoAux1];
        [theTimer invalidate];
    }
    
}


-(void)checkColisao1_32Tempos:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPonto116tempos.layer.presentationLayer;
    id presentationLayer2 = self.imgColisao32Tempos.layer.presentationLayer;
    
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        self.imgColisao32Tempos.frame = CGRectMake(self.imgPonto116tempos.frame.origin.x,
                                                  self.imgPonto116tempos.frame.origin.y+50,
                                                  self.imgColisao32Tempos.frame.size.width,
                                                  self.imgColisao32Tempos.frame.size.height);
        [[ExercicioImagem sharedManager]tiraGestureObjeto:self.imgColisao32Tempos];
        [self.listaLiberaFala addObject:self.estadoAux1];
        [theTimer invalidate];
    }
    
}


///////////////////////////////////////////////////////////////////////


//Gerencia o passa de falas
-(void)pulaFalaMascote{
    //Usa pra não dar erro de nulo na ultima fala
    int contadorMaximo = (int)self.testaConversa.listaDeFalas.count;
    
    [[BarraSuperiorViewController sharedManager]txtNumeroAulaAtual].text = [NSString stringWithFormat:@"%d",1+[MascoteViewController sharedManager].contadorDeFalas];
    
    if([MascoteViewController sharedManager].contadorDeFalas == contadorMaximo){
        NSString *proxExercicio = [[Biblioteca sharedManager]exercicioAtual].nomeView;
        [[ExercicioTransicao sharedManager]chamaViewTransicaoExercicio:self:proxExercicio];
    }
    if([MascoteViewController sharedManager].contadorDeFalas < contadorMaximo){
        switch ([MascoteViewController sharedManager].contadorDeFalas) {
            case 0:
                [self performSelector:@selector(chamaMetodosFala0) withObject:NULL afterDelay:0.2];
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
            case 10:
                [self chamaMetodosFala10];
                break;
            case 11:
                [self chamaMetodosFala11];
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
    
    UILabel *txtPilar2 = [[UILabel alloc]init];
    txtPilar2.text = @"Duracao";
    txtPilar2.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtPilar2.frame = CGRectMake(-20,150,100,300);
    [txtPilar2 sizeToFit];
    txtPilar2.textAlignment = NSTextAlignmentCenter;
    [txtPilar2 setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
    [self.pilar3 addSubview:txtPilar2];
    
    UILabel *txtBase = [[UILabel alloc]init];
    txtBase.text = @"Pausa Musical";
    txtBase.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtBase.frame = CGRectMake(170,5,100,300);
    [txtBase sizeToFit];
    txtBase.textAlignment = NSTextAlignmentCenter;
    [self.base addSubview:txtBase];
    
    self.base.hidden = NO;
    self.pilar3.hidden = NO;
    
    [UIView animateWithDuration:3.0
                          delay:4.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.base.frame.origin.x,
                                                      self.base.frame.origin.y+170,
                                                      self.base.frame.size.width,
                                                      self.base.frame.size.height);
                         self.base.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         self.caminhoDoAudio = [[NSBundle mainBundle] URLForResource:@"barulhoBasePilar" withExtension:@"wav"];
                         
                         [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
                         [[ExercicioPlayer sharedManager]playAudios];
                        

                         [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
                     }];
    
    [UIView animateWithDuration:3.0
                          delay:1.0
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
                         [[ExercicioPlayer sharedManager]initPlayer:self.caminhoDoAudio];
                         [[ExercicioPlayer sharedManager]playAudios];
                     }];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala1{
    
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.pilar3];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.base];
    
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.imgPausa2TemposIntro];
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.imgPausa4TemposIntro];
    
    
   [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];}

-(void)chamaMetodosFala2{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.imgPentagrama];
    
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala3{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala4{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.imgPausa2TemposIntro];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.imgPausa4TemposIntro];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.imgPentagrama];
    
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.imgPausa1Tempo];
    
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala5{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.imgPausa0012Tempo];
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.imgPausa0125Tempo];
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.imgPausa025Tempo];
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.imgPausa05Tempo];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.lbl12Tempo];
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.lbl14Tempo];
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.lbl16Tempo];
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.lbl18Tempo];
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.lbl1Tempo];

    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala6{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala7{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala8{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.imgPentagrama];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala9{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.imgPausa0012Tempo];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.imgPausa0125Tempo];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.imgPausa025Tempo];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.imgPausa05Tempo];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.lbl12Tempo];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.lbl14Tempo];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.lbl16Tempo];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.lbl18Tempo];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.lbl1Tempo];
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.imgPentagrama];

    
    [[ExercicioImagem sharedManager]hiddenNoEmDegrade:self.viewAssociaNomeNotas];
    
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisao4Tempos:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisao2Tempos:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisao1Tempos:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisao1_2Tempos:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisao1_4Tempos:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisao1_8Tempos:)
                                   userInfo: nil
                                    repeats: YES];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisao1_32Tempos:)
                                   userInfo: nil
                                    repeats: YES];
    
    
    [[ExercicioImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:7];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala10{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[ExercicioImagem sharedManager]hiddenYesEmDegrade:self.viewAssociaNomeNotas];
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala11{
    [[ExercicioMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    
    [[ExercicioMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

