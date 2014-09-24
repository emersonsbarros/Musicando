//
//  IncializaProjeto.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 03/09/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "InicializaProjeto.h"

@implementation InicializaProjeto


//////////////Sington

+(InicializaProjeto*)sharedManager{
    static InicializaProjeto *unicoInstrumento = nil;
    if(!unicoInstrumento){
        unicoInstrumento = [[super allocWithZone:nil]init];
    }
    return unicoInstrumento;
}

-(id)init{
    self = [super init];
    if(self){
        self.listaMusicXml = [[NSMutableArray alloc]init];
        [self adicionaMusicXMLAoProjeto];
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}

//////////////////////////////////////////////////////////////////


-(void)adicionaMusicXMLAoProjeto{
    
    self.listaMusicXml = [[NSMutableArray alloc]init];
    //[self.listaPartituras addObject:@"Video_Games_ENDING"];
    [self.listaMusicXml addObject:@"5th_Symphony"];
    [self.listaMusicXml addObject:@"asa"];
    //[self.listaPartituras addObject:@"atireiGato"];
    [self.listaMusicXml addObject:@"Bachviolao"];
    [self.listaMusicXml addObject:@"Beethoven-Fur Elise"];
    //[self.listaPartituras addObject:@"caribe"];
    [self.listaMusicXml addObject:@"cavaleiros"];
    [self.listaMusicXml addObject:@"chefao"];
    [self.listaMusicXml addObject:@"et"];
    [self.listaMusicXml addObject:@"fantasma"];
    [self.listaMusicXml addObject:@"ghost"];
    //[self.listaPartituras addObject:@"harry_potter_theme_song"];
    [self.listaMusicXml addObject:@"heyjude"];
    [self.listaMusicXml addObject:@"indiana"];
    //[self.listaPartituras addObject:@"kokiri-forest"];
    [self.listaMusicXml addObject:@"lepo"];
    //[self.listaPartituras addObject:@"mario"];
    //[self.listaPartituras addObject:@"lepo"];
    [self.listaMusicXml addObject:@"Mozart-Marcha Turca"];
    [self.listaMusicXml addObject:@"natal"];
    [self.listaMusicXml addObject:@"ninar"];
    //[self.listaPartituras addObject:@"nokia"];
    [self.listaMusicXml addObject:@"palmeiras"];
    [self.listaMusicXml addObject:@"parabens"];
    //[self.listaPartituras addObject:@"simpson"];
    //[self.listaPartituras addObject:@"Song_of_Storms"];
    [self.listaMusicXml addObject:@"ticofuba"];
    [self.listaMusicXml addObject:@"titanic"];
    //[self.listaPartituras addObject:@"vitoria"];

}









@end
