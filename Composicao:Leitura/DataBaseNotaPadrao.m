//
//  DataBaseNotaPadrao.m
//  DesenhoPartitura
//
//  Created by VINICIUS RESENDE FIALHO on 24/06/14.
//  Copyright (c) 2014 Vinicius Resende Fialho. All rights reserved.
//

#import "DataBaseNotaPadrao.h"

@implementation DataBaseNotaPadrao

///////////////////////////////////// Sington ///////////////////////////////////////

+(DataBaseNotaPadrao*)sharedManager{
    static DataBaseNotaPadrao *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

-(id)init{
    self = [super init];
    if(self){
        self.listaNotasPadroes = [[NSMutableArray alloc]init];
        [self addNotasPadroesDoApplicativo];
    }
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////

    
//Notas/Pausas Padroes da Partitura
-(void)addNotasPadroesDoApplicativo {
    
    
    //Nota Dó
    Nota *notaDo4 = [[Nota alloc]init];
    notaDo4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Do4tempo.png"]];
    notaDo4.nomeNota = @"C";
    notaDo4.tipoNota = @"whole";
    
    Nota *notaDo2 = [[Nota alloc]init];
    notaDo2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Do1tempo.png"]];
    notaDo2.nomeNota = @"C";
    notaDo2.tipoNota = @"half";
    
    Nota *notaDo1 = [[Nota alloc]init];
    notaDo1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Do1tempo.png"]];
    notaDo1.nomeNota = @"C";
    notaDo1.tipoNota = @"quarter";
    
    Nota *notaDo12 = [[Nota alloc]init];
    notaDo12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Do1:2tempo-01.png"]];
    notaDo12.nomeNota = @"C";
    notaDo12.tipoNota = @"eighth";
    

    //Nota Re
    Nota *notaRe4 = [[Nota alloc]init];
    notaRe4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Re4tempo.png"]];
    notaRe4.nomeNota = @"D";
    notaRe4.tipoNota = @"whole";
    
    Nota *notaRe2 = [[Nota alloc]init];
    notaRe2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Re1tempo.png"]];
    notaRe2.nomeNota = @"D";
    notaRe2.tipoNota = @"half";
    
    Nota *notaRe1 = [[Nota alloc]init];
    notaRe1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Re1tempo.png"]];
    notaRe1.nomeNota = @"D";
    notaRe1.tipoNota = @"quarter";
    
    Nota *notaRe12 = [[Nota alloc]init];
    notaRe12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Re1:2tempo.png"]];
    notaRe12.nomeNota = @"D";
    notaRe12.tipoNota = @"eighth";
    
    
    //Nota Mi
    Nota *notaMi4 = [[Nota alloc]init];
    notaMi4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mi1:2tempo.png"]];
    notaMi4.nomeNota = @"E";
    notaMi4.tipoNota = @"whole";
    
    Nota *notaMi2 = [[Nota alloc]init];
    notaMi2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mi1tempo.png"]];
    notaMi2.nomeNota = @"E";
    notaMi2.tipoNota = @"half";
    
    Nota *notaMi1 = [[Nota alloc]init];
    notaMi1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mi1tempo.png"]];
    notaMi1.nomeNota = @"E";
    notaMi1.tipoNota = @"quarter";
    
    Nota *notaMi12 = [[Nota alloc]init];
    notaMi12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Mi1:2tempo.png"]];
    notaMi12.nomeNota = @"E";
    notaMi12.tipoNota = @"eighth";

    
    //Nota fA
    Nota *notaFa4 = [[Nota alloc]init];
    notaFa4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fa4tempo.png"]];
    notaFa4.nomeNota = @"F";
    notaFa4.tipoNota = @"whole";
    
    Nota *notaFa2 = [[Nota alloc]init];
    notaFa2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Fa1tempo.png"]];
    notaFa2.nomeNota = @"F";
    notaFa2.tipoNota = @"half";
    
    Nota *notaFa1 = [[Nota alloc]init];
    notaFa1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Fa1tempo.png"]];
    notaFa1.nomeNota = @"F";
    notaFa1.tipoNota = @"quarter";
    
    Nota *notaFa12 = [[Nota alloc]init];
    notaFa12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Fa1:2tempo.png"]];
    notaFa12.nomeNota = @"F";
    notaFa12.tipoNota = @"eighth";
    
    
    
    //Nota Sol
    Nota *notaSol4 = [[Nota alloc]init];
    notaSol4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sol4tempo.png"]];
    notaSol4.nomeNota = @"G";
    notaSol4.tipoNota = @"whole";
    
    Nota *notaSol2 = [[Nota alloc]init];
    notaSol2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sol1tempo.png"]];
    notaSol2.nomeNota = @"G";
    notaSol2.tipoNota = @"half";
    
    Nota *notaSol1 = [[Nota alloc]init];
    notaSol1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sol1tempo.png"]];
    notaSol1.nomeNota = @"G";
    notaSol1.tipoNota = @"quarter";
    
    Nota *notaSol12 = [[Nota alloc]init];
    notaSol12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Sol1:2tempo.png"]];
    notaSol12.nomeNota = @"G";
    notaSol12.tipoNota = @"eighth";
    
    
    
    //Nota La
    Nota *notaLa4 = [[Nota alloc]init];
    notaLa4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"La1:2tempo.png"]];
    notaLa4.nomeNota = @"A";
    notaLa4.tipoNota = @"whole";
    
    Nota *notaLa2 = [[Nota alloc]init];
    notaLa2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"la1tempo.png"]];
    notaLa2.nomeNota = @"A";
    notaLa2.tipoNota = @"half";
    
    Nota *notaLa1 = [[Nota alloc]init];
    notaLa1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"la1tempo.png"]];
    notaLa1.nomeNota = @"A";
    notaLa1.tipoNota = @"quarter";
    
    Nota *notaLa12 = [[Nota alloc]init];
    notaLa12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"La1:2tempo.png"]];
    notaLa12.nomeNota = @"A";
    notaLa12.tipoNota = @"eighth";
    
    
    
    //Nota Si
    Nota *notaSi4 = [[Nota alloc]init];
    notaSi4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Si4tempo.png"]];
    notaSi4.nomeNota = @"B";
    notaSi4.tipoNota = @"whole";
    
    Nota *notaSi2 = [[Nota alloc]init];
    notaSi2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Si1tempo.png"]];
    notaSi2.nomeNota = @"B";
    notaSi2.tipoNota = @"half";
    
    Nota *notaSi1 = [[Nota alloc]init];
    notaSi1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Si1tempo.png"]];
    notaSi1.nomeNota = @"B";
    notaSi1.tipoNota = @"quarter";
    
    Nota *notaSi12 = [[Nota alloc]init];
    notaSi12.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Si1:2tempo.png"]];
    notaSi12.nomeNota = @"B";
    notaSi12.tipoNota = @"eighth";
    
    
    
    [self.listaNotasPadroes addObject:notaDo4];
    [self.listaNotasPadroes addObject:notaDo2];
    [self.listaNotasPadroes addObject:notaDo1];
    [self.listaNotasPadroes addObject:notaDo12];
    
    [self.listaNotasPadroes addObject:notaRe4];
    [self.listaNotasPadroes addObject:notaRe2];
    [self.listaNotasPadroes addObject:notaRe1];
    [self.listaNotasPadroes addObject:notaRe12];

    
    [self.listaNotasPadroes addObject:notaMi4];
    [self.listaNotasPadroes addObject:notaMi2];
    [self.listaNotasPadroes addObject:notaMi1];
    [self.listaNotasPadroes addObject:notaMi12];

    
    [self.listaNotasPadroes addObject:notaFa4];
    [self.listaNotasPadroes addObject:notaFa2];
    [self.listaNotasPadroes addObject:notaFa1];
    [self.listaNotasPadroes addObject:notaFa12];
    
    [self.listaNotasPadroes addObject:notaSol4];
    [self.listaNotasPadroes addObject:notaSol2];
    [self.listaNotasPadroes addObject:notaSol1];
    [self.listaNotasPadroes addObject:notaSol12];

    
    [self.listaNotasPadroes addObject:notaLa4];
    [self.listaNotasPadroes addObject:notaLa2];
    [self.listaNotasPadroes addObject:notaLa1];
    [self.listaNotasPadroes addObject:notaLa12];

    
    [self.listaNotasPadroes addObject:notaSi4];
    [self.listaNotasPadroes addObject:notaSi2];
    [self.listaNotasPadroes addObject:notaSi1];
    [self.listaNotasPadroes addObject:notaSi12];


    
    
    Nota *notaPausa1 = [[Nota alloc]init];
    notaPausa1.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4-2Pausa.png"]];
    notaPausa1.nomeNota = @"semibrevePausa";
    notaPausa1.tipoNota = @"whole";
    
    Nota *notaPausa2 = [[Nota alloc]init];
    notaPausa2.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"4-2Pausa.png"]];
    notaPausa2.nomeNota = @"minimaPausa";
    notaPausa2.tipoNota = @"half";
    
    
    Nota *notaPausa3 = [[Nota alloc]init];
    notaPausa3.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"seminimaPausa.png"]];
    notaPausa3.nomeNota = @"seminimaPausa";
    notaPausa3.tipoNota = @"quarter";
    
    
    Nota *notaPausa4 = [[Nota alloc]init];
    notaPausa4.imagemNota = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"colcheiaPausa.png"]];
    notaPausa4.nomeNota = @"colcheiaPausa";
    notaPausa4.tipoNota = @"eighth";
    
    

    
    [self.listaNotasPadroes addObject:notaPausa1];
    [self.listaNotasPadroes addObject:notaPausa2];
    [self.listaNotasPadroes addObject:notaPausa3];
    [self.listaNotasPadroes addObject:notaPausa4];
 
}


//Retorna a nota pelo seu nome
-(Nota*)retornaNotaPadrao:(NSString*)nomeNota{
    
    Nota *nota;
    
    for(int i=0;i<self.listaNotasPadroes.count;i++){
        nota = [[self listaNotasPadroes] objectAtIndex:i];
        if([[nota tipoNota]isEqualToString:nomeNota]){
            return  nota;
        }
    }
    
    return NULL;
}


-(UIImage*)retornaNotaPadraoCrianca:(NSString*)tipoNomeNota{

    Nota *nota;
    
    for(int i=0;i<self.listaNotasPadroes.count;i++){
        nota = [[self listaNotasPadroes] objectAtIndex:i];
        NSString *tempo  = [EscolhaUsuarioPartitura sharedManager].notaEscolhaUsuarioEdicao.tipoNota;
    
        if(([[nota nomeNota] isEqualToString:tipoNomeNota]) &&([[nota tipoNota] isEqualToString:tempo])){
            return  nota.imagemNota.image;
        }
    }
    
    return NULL;
}

@end
