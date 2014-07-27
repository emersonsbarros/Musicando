//
//  Mod1Aula2Exe1ViewController.m
//  Musicando
//
//  Created by Emerson Barros on 06/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "Mod1Aula2Exe1ViewController.h"

@interface Mod1Aula2Exe1ViewController ()

@end

@implementation Mod1Aula2Exe1ViewController

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

- (void)viewDidLoad{
    [super viewDidLoad];
    
    //Add barra Superior ao Xib
    [[EfeitoBarraSuperior sharedManager]addBarraSuperioAoXib:self:[Biblioteca sharedManager].exercicioAtual];
    
    //Habilita o gesture do mascote com a UIView que fica por cima dele
    //Coloquei essa view para colocar o gesture de pular fala, pois com animation atrapalha
    [self addGesturePassaFalaMascote:self.viewGesturePassaFala];
    
    
    self.listaImagensCai = [[NSMutableArray alloc]init];
    self.listaImagensColisao = [[NSMutableArray alloc]init];
    [self.listaImagensColisao addObject:self.imgColher];
    
    
    //Lista para saber se as colisoes na tela foram feitas p/ ir na prox fala
    self.listaLiberaFala = [[NSMutableArray alloc]init];
    //seta com alguma coisa para add uma coisa nao nula
    self.estadoAux1 = @"0";
    self.estadoAux2 = @"0";
    self.estadoAux3 = @"0";
    
    
    //Biblioteca
    self.contadorDeFalas = 0;
    self.testaBiblio = [Biblioteca sharedManager];
    self.testaConversa = self.testaBiblio.exercicioAtual.mascote.listaDeConversas.firstObject;
    //Usar sempre que quiser pular uma fala,no caso tem que passar para pegar a primeira fala
    [self pulaFalaMascote];
    //Imagem do mascote
    self.imagemDoMascote2.image = [[[[Biblioteca sharedManager] exercicioAtual] mascote] imagem].image;
    //Add animacao de pular o mascote
    [[EfeitoMascote sharedManager]chamaAnimacaoMascotePulando:self.imagemDoMascote2];

    //Animcao para cair notas
    [self lacoCaindoNotas];
}

-(void) checkColisaoColher:(NSTimer *) theTimer{
    id presentationLayer1 = self.imgPanela.layer.presentationLayer;
    id presentationLayer2 = self.imgColher.layer.presentationLayer;
    BOOL nowIntersecting = CGRectIntersectsRect([presentationLayer1 frame], [presentationLayer2 frame]);
    
    if (nowIntersecting){
        //self.imgVibracao.hidden = NO;
        [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgVibracao];
        self.imgColher.frame =  CGRectMake(self.imgColher.frame.origin.x,
                                            self.imgColher.frame.origin.y-200,
                                            self.imgColher.frame.size.width,
                                            self.imgColher.frame.size.height);
        if(self.estadoAux1 == NULL)self.estadoAux1 = @"1";
        [self.listaLiberaFala addObject:self.estadoAux1];
            
    }else{
        //self.imgVibracao.hidden = YES;
        [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgVibracao];
    }
    
}


-(void)chamaMetodosFala1{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
   [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
}

-(void)chamaMetodosFala2{
    //Remove todas as animacoes que estao na lista, no caso estou tirando as notas que caiem
    [[EfeitoImagem sharedManager]removeTodasAnimacoesViewLista:self.listaImagensCai];
    
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    //colcoar animacao de ondas
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgColher];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgPanela];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgOuvindo];

    
    //self.imgColher.transform = CGAffineTransformRotate(self.imgColher.transform, ((-30 * M_PI) / 180.0));
    
    [[EfeitoImagem sharedManager]addGesturePainImagens:self.listaImagensColisao];
    
    self.imgPanela.userInteractionEnabled = YES;
    

    [NSTimer scheduledTimerWithTimeInterval: 0.5
                                     target: self
                                   selector: @selector(checkColisaoColher:)
                                   userInfo: nil
                                    repeats: YES];
    
    //Metodo que verifica o passar fala, nele tem que passar a qt de objetos que colidirá nessa fala, no caso 3
    [[EfeitoImagem sharedManager]chamaVerficadorPassaFala:self.imagemDoMascote2 :self.viewGesturePassaFala:self.listaLiberaFala:1];
    
}


-(void)explodeSatelite{
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgExplosao];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgSatelite];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgGestureAstronauta];
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * 2 * 1 ];
    rotationAnimation.duration = 10.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 4;
    [self.imgAstronauta.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [UIView animateWithDuration:5.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(-250,
                                                      500,
                                                      self.imgAstronauta.frame.size.width,
                                                      self.imgAstronauta.frame.size.height);
                         self.imgAstronauta.frame = moveGalo;
                         
                         
    }
                     completion:^(BOOL finished){
                       [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
                     }];
}

-(void)mostrarMaoAstronauta:(NSTimer *) theTimer{
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgGestureAstronauta];
    
    //Add sprite as imagem da mão e comeca (tem uma parar no EfeitoImagem caso necesario)
    UIImage *image1 = [UIImage imageNamed:@"gesturePassaFalaMascote.png"];
    UIImage *image2 = [UIImage imageNamed:@"gesturePassaFalaMascoteTap.png"];
    NSArray *imageArray = [NSArray arrayWithObjects:image1,image2,nil];
    [[EfeitoImagem sharedManager]addAnimacaoSprite:imageArray:self.imgGestureAstronauta];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(explodeSatelite)];
    singleTap.numberOfTouchesRequired = 1;
    self.imgSatelite.userInteractionEnabled = YES;
    [self.imgSatelite addGestureRecognizer:singleTap];
    
}

-(void)chamaMetodosFala3{
    
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];

    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgColher];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgPanela];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgOuvindo];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgVibracao];
    
    
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgAstronauta];
    [[EfeitoImagem sharedManager]hiddenNoEmDegrade:self.imgSatelite];
    
    [NSTimer scheduledTimerWithTimeInterval: 7.0
                                     target: self
                                   selector: @selector(mostrarMaoAstronauta:)
                                   userInfo: nil
                                    repeats: NO];
    
}

-(void)chamaMetodosFala4{
    [[EfeitoMascote sharedManager]removeBrilho:self.imagemDoMascote2:self.viewGesturePassaFala];
    
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgExplosao];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgAstronauta];
    [[EfeitoImagem sharedManager]hiddenYesEmDegrade:self.imgSatelite];

    
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
    txtBase.text = @"Som";
    txtBase.font = [UIFont fontWithName:@"HelveticaNeue" size:36];
    txtBase.frame = CGRectMake(200,5,100,300);
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
                         
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar2.frame.origin.x,
                                                      self.pilar2.frame.origin.y+500,
                                                      self.pilar2.frame.size.width,
                                                      self.pilar2.frame.size.height);
                         self.pilar2.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar3.frame.origin.x,
                                                      self.pilar3.frame.origin.y+500,
                                                      self.pilar3.frame.size.width,
                                                      self.pilar3.frame.size.height);
                         self.pilar3.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
                         
                     }];
    
    [UIView animateWithDuration:2.0
                          delay:0.0
                        options:  UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         CGRect moveGalo = CGRectMake(self.pilar4.frame.origin.x,
                                                      self.pilar4.frame.origin.y+500,
                                                      self.pilar4.frame.size.width,
                                                      self.pilar4.frame.size.height);
                         self.pilar4.frame = moveGalo;
                         
                     }
                     completion:^(BOOL finished){
            
                     }];    
    
    [UIView animateWithDuration:3.0
                          delay:3.0
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
                         [[EfeitoMascote sharedManager]chamaAddBrilho:self.imagemDoMascote2:1.0f:self.viewGesturePassaFala];
                     }];
    
}



-(void)pulaFalaMascote{
    int contadorMaximo = self.testaConversa.listaDeFalas.count;
    
    if(self.contadorDeFalas == contadorMaximo){
        NSString *proxExercicio = [[Biblioteca sharedManager]exercicioAtual].nomeView;
        [[Biblioteca sharedManager]chamaViewTransicaoExercicio:self:proxExercicio];
    }

    if(self.contadorDeFalas < contadorMaximo){
        switch (self.contadorDeFalas) {
            case 0:
                [self chamaMetodosFala1];
                break;
            case 1:
                [self chamaMetodosFala2];
                break;
            case 2:
                [self chamaMetodosFala3];
                break;
            case 3:
                [self chamaMetodosFala4];
                break;
            case 4:
                break;
                
            default:
                break;
        }
        
        self.testaFala = [self.testaConversa.listaDeFalas objectAtIndex:self.contadorDeFalas];
        self.lblFalaDoMascote.text = self.testaFala.conteudo;
        
        self.contadorDeFalas +=1;
    }
}

-(void)addGesturePassaFalaMascote:(UIView*)imgMascote{
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pulaFalaMascote)];
    singleTap.numberOfTouchesRequired = 1;
    imgMascote.userInteractionEnabled = YES;
    [imgMascote addGestureRecognizer:singleTap];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//////////////////////////////// METODOS NOTAS CAINDO /////////////////////////

-(void)lacoCaindoNotas{
    
    float duracao = 3.0;
    float delay = 0.0;
    float posX = -100;
    CGFloat posY=0;
    NSString *nomeNota;
    
    for(int i=0;i<13;i++){
        UIImageView *notaCaindo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"notaParaRosto.png"]];
        UIImageView *carinha = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"notaCaraPausaSom.png"]];
        carinha.frame = CGRectMake(carinha.frame.origin.x+13,
                                   carinha.frame.origin.y+130,
                                   30,
                                   30);
        [notaCaindo addSubview:carinha];
        
        //Add sprite as imagem da mão e comeca (tem uma parar no EfeitoImagem caso necesario)
        UIImage *image1 = [UIImage imageNamed:@"notaCaraPausaSom.png"];
        UIImage *image2 = [UIImage imageNamed:@"notaCaraTocaSom.png"];
        NSArray *imageArray = [NSArray arrayWithObjects:image1,image2,nil];
        [[EfeitoImagem sharedManager]addAnimacaoSprite:imageArray:carinha];
        
        notaCaindo.frame = CGRectMake(posX,-100,notaCaindo.frame.size.width+40,notaCaindo.frame.size.height+70);
        [[self listaImagensCai]addObject:notaCaindo];
        [self.view addSubview:notaCaindo];
        
        switch (i) {
            case 1:
                nomeNota = @"C";
                break;
            case 2:
                nomeNota = @"D";
                break;
            case 3:
                nomeNota = @"E";
                break;
            case 4:
                nomeNota = @"F";
                break;
            case 5:
                nomeNota = @"G";
                break;
            case 6:
                nomeNota = @"A";
                break;
            default:
                break;
        }

        posY = 340;
        
        
        [self animacaoCaindoNotas:notaCaindo:duracao:posX:posY:delay:nomeNota];
        posX += 100;
        delay += 0.5;
        
        
    }
    
}



-(void)animacaoCaindoNotas:(UIImageView*)notaCaindo :(float)duracao :(CGFloat)posX :(CGFloat)posY :(float)tempoDemrora :(NSString*)nomeNota{
    //UIViewAnimationOptionAutoreverse ,UIViewAnimationOptionCurveEaseInOut,UIViewAnimationOptionTransitionCrossDissolv
    
    [UIView animateWithDuration:duracao
                          delay:tempoDemrora
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse | UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                         [notaCaindo.layer removeAnimationForKey:@"1"];
                         CGRect moveGalo = CGRectMake(posX,
                                                      posY,
                                                      notaCaindo.frame.size.width,
                                                      notaCaindo.frame.size.height);
                         notaCaindo.frame = moveGalo;
                     }
                     completion:^(BOOL finished){
                         notaCaindo.hidden = YES;
                     }];
    
    
}

@end
