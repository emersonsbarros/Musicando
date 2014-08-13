//
//  EfeitoNotaAnimada.m
//  Musicando
//
//  Created by VINICIUS RESENDE FIALHO on 12/08/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "EfeitoNotaAnimada.h"

@implementation EfeitoNotaAnimada

//Singleton
+(EfeitoNotaAnimada*)sharedManager{
    static EfeitoNotaAnimada *mascote = nil;
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




-(void)tocaNotaPulando:(NSString*)nomeNota{
    Nota *aux = [[Nota alloc]init];
    aux.nomeNota = nomeNota;
    aux.oitava = @"5";
    aux.tom = @"";
    aux.tipoNota = @"quarter";
    self.listaSons = [[NSMutableArray alloc]init];
    [self.listaSons addObject:aux];
    [[Sinfonia sharedManager]tocarUmaNota:self.listaSons:@"Piano"];
}

-(NSMutableArray*)addFormaAleatoria{
    
    NSMutableArray *storeArray = [[NSMutableArray alloc] init];
    BOOL record = NO;
    int x;
    
    for (int i=0; [storeArray count] < 13; i++) //Loop for generate different random values
    {
        x = arc4random() % 13;//generating random number
        if(i==0)//for first time
        {
            [storeArray addObject:[NSNumber numberWithInt:x]];
        }
        else
        {
            for (int j=0; j<= [storeArray count]-1; j++)
            {
                if (x ==[[storeArray objectAtIndex:j] intValue])
                    record = YES;
            }
            
            if (record == YES)
            {
                record = NO;
            }
            else
            {
                [storeArray addObject:[NSNumber numberWithInt:x]];
            }
        }
    }
    
    return storeArray;
    
}

-(void)animacaoCaiNotaIdaVolta:(UIViewController*)controler{
    
    self.duracao = 3.0;
    self.delay = 0.0;
    self.posX = -100;
    CGFloat posY=70;
    NSString *nomeNota;
    NSMutableArray *contaAl = [self addFormaAleatoria];
    self.listaImagensCai = [[NSMutableArray alloc]init];
    
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
        
        notaCaindo.frame = CGRectMake(self.posX,70,notaCaindo.frame.size.width+40,notaCaindo.frame.size.height+70);
        [[self listaImagensCai]addObject:notaCaindo];
        [controler.view addSubview:notaCaindo];
        
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
        if(i<5) posY = 540;
        else posY = 340;
        
        
        self.posX += 100;
        [self animacaoCaindoNotas:notaCaindo:self.duracao:self.posX:posY:self.delay:nomeNota];
        self.delay = [[contaAl objectAtIndex:i]floatValue];
        
    }
}

-(void)animacaoCaiNotaOndas:(UIViewController*)controler{
    
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
        [controler.view addSubview:notaCaindo];
        
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


-(void)removeAnimacao{
    for(UIImageView *img in self.listaImagensCai){
        img.hidden = YES;
        [img.layer removeAllAnimations];
    }
}


@end
