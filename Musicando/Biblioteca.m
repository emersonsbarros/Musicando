//
//  Biblioteca.m
//  BaseProjetoFinal
//
//  Created by Emerson Barros on 09/06/14.
//  Copyright (c) 2014 Emerson Barros. All rights reserved.
//

#import "Biblioteca.h"

@implementation Biblioteca

-(id)init{
    self = [super init];
    if(self){
        self.listaDeModulos = [[NSMutableArray alloc]init];
        self.mascote = [[Mascote alloc] init];
        [self instanciaAulasDoProjeto];
    }
    return self;
}


+(id)allocWithZone:(struct _NSZone *)zone{
    return [self sharedManager];
}


+(Biblioteca*)sharedManager{
    static Biblioteca *biblioteca = nil;
    if(!biblioteca){
        biblioteca = [[super allocWithZone:nil] init];
    }
    return biblioteca;
}





//MÓDULOS-----------------------------------------

/*
 PADRÃO DE NOMENCLATURA DOS OBJETOS
 
 MODULO-AULA-EXERCICIO
 Exemplo: MÓDULO 1 - AULA 1 - EXERCÍCIO 1 = mod1Aula1Exe1
 */

//------------------------------------------------


//INICIANTE
-(void)instanciaModuloIniciante{
  
////////////////////////////////// Aula 1 //////////////////////////////////////
    

//Exercícios
    Exercicio *mod1Aula1Exe1 = [[Exercicio alloc] init:101 nome:@"Introdução a Música" nomeView:@"Mod1Aula1Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas do Mascote
    //Falas
    Fala *mod1Aula1Exe1fala1 = [[Fala alloc] init];
    mod1Aula1Exe1fala1.conteudo = @"Bem vindo ao Musicando, eu sou o Lálá e aqui você aprenderá como funciona a Música e os segredos das Partituras.";
    
    Fala *mod1Aula1Exe1fala2 = [[Fala alloc] init];
    mod1Aula1Exe1fala2.conteudo = @"Você terminará essa jornada sabendo o que são e como usar as partituras, e sobre a importância da música nas nossas vidas. Então vamos lá!";
    
    Fala *mod1Aula1Exe1fala3 = [[Fala alloc] init];
    mod1Aula1Exe1fala3.conteudo = @"A música é a manifestação artística e cultural de um povo, usada pra expressar os sentimentos. Tudo pode ser transformada nela. Duvida? Vou te mostrar!";
    
    Fala *mod1Aula1Exe1fala4 = [[Fala alloc] init];
    mod1Aula1Exe1fala4.conteudo = @"Esse é o TocaTreco, uma máquina que faz todo tipo o som, de objetos jogados nele e ainda podemos misturá-los.";
    
    Fala *mod1Aula1Exe1fala5 = [[Fala alloc] init];
    mod1Aula1Exe1fala5.conteudo = @"Arraste esses itens para a entrada do nosso TocaTreco e veja a mágica.";
    
    Fala *mod1Aula1Exe1fala6 = [[Fala alloc] init];
    mod1Aula1Exe1fala6.conteudo = @"Muito Bem! Abaixe agora a alavanca e a música acontecerá de uma forma inusitada.";
    
    Fala *mod1Aula1Exe1fala7 = [[Fala alloc] init];
    mod1Aula1Exe1fala7.conteudo = @"É isso mesmo! Eu não falei que qualquer coisa pode se tornar música? E ainda existem pessoas que conseguem criá-la utilizando objetos bem esquisitos. Vamos ver?";
    
    Fala *mod1Aula1Exe1fala8 = [[Fala alloc] init];
    mod1Aula1Exe1fala8.conteudo = @"Arraste novamente os itens esquisitos acima no TocaTreco e veja a música rolar. É de supreender!";
    
    Fala *mod1Aula1Exe1fala9 = [[Fala alloc] init];
    mod1Aula1Exe1fala9.conteudo = @"Ah como eu amo a música! Ela é muito importante não só no lazer, ajuda também em terapias, estimula o aprendizado e até na melhora de algumas de doenças.";
    
    Fala *mod1Aula1Exe1fala10 = [[Fala alloc] init];
    mod1Aula1Exe1fala10.conteudo = @"Vamos começar nossa jornada! Como o grande professor Suzuki falava: \"Não precisa nascer com o dom para música, todos podem aprender com a vontade!\"";
    
    
    //Conversa
    Conversa *mod1Aula1Exe1conversa1 = [[Conversa alloc] init];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala1];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala2];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala3];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala4];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala5];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala6];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala7];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala8];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala9];
    [[mod1Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala10];
    
    [[[mod1Aula1Exe1 mascote] listaDeConversas] addObject:mod1Aula1Exe1conversa1];
    
////////////////////////////// JOGO 1 ////////////////////////////////////
    
    Exercicio *mod1Aula1Exe1Jogo = [[Exercicio alloc] init:666 nome:@"Jogo música" nomeView:@"JogoScrollMusicalViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"iconeJogoMusica.png"]];
    
    
    //Falas do Mascote
    Fala *mod1Aula1Exe1Jogofala1 = [[Fala alloc] init];
    mod1Aula1Exe1Jogofala1.conteudo = @"A música é muito importante e sempre chega aos nosso ouvidos, agora ajude ao nosso Mascote Lálá a chegar ao maximo de casas possiveis, mais cuidado á fortes ventos atrapalhando, não deixe eles te pegarem!";
    
    Fala *mod1Aula1Exe1Jogofala2 = [[Fala alloc] init];
    mod1Aula1Exe1Jogofala2.conteudo = @"";
    
    
    //Conversa
    Conversa *mod1Aula1Exe1Jogoconversa1 = [[Conversa alloc] init];
    [[mod1Aula1Exe1Jogoconversa1 listaDeFalas] addObject: mod1Aula1Exe1Jogofala1];
    [[mod1Aula1Exe1Jogoconversa1 listaDeFalas] addObject: mod1Aula1Exe1Jogofala2];
    [[[mod1Aula1Exe1Jogo mascote] listaDeConversas] addObject:mod1Aula1Exe1Jogoconversa1];
    
//Aula de musicalização
    Aula *mod1Aula1 = [[Aula alloc]init];
    mod1Aula1.nome = @"musicalização";
    mod1Aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula1 listaDeExercicios]addObject: mod1Aula1Exe1];
    [[mod1Aula1 listaDeExercicios]addObject: mod1Aula1Exe1Jogo];
    
    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
//Exercícios
    Exercicio *mod1Aula2Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução ao Som" nomeView:@"Mod1Aula2Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas do Mascote
    Fala *mod1Aula2Exe1fala1 = [[Fala alloc] init];
    mod1Aula2Exe1fala1.conteudo = @"Vamos começar a aprender um pouco sobre o Som. Ele é considerado a vibração de um corpo que se propaga em ondas no ar. Meio complicado? Vou te mostrar um exemplo!";
    
    Fala *mod1Aula2Exe1fala2 = [[Fala alloc] init];
    mod1Aula2Exe1fala2.conteudo = @"Pegue a colher e bata na panela, veja as vibrações emitidas pelo objeto!";
    
    Fala *mod1Aula2Exe1fala3 = [[Fala alloc] init];
    mod1Aula2Exe1fala3.conteudo = @"Como você observou, todas as vibrações penetram em nossos ouvidos e provocacam algum som. Porém alguns lugares não propagam o som, como o vácuo do espaço que tem ausência de ar.";
    
    Fala *mod1Aula2Exe1fala4 = [[Fala alloc] init];
    mod1Aula2Exe1fala4.conteudo = @"Agora falando mais detalhadamente, o som pode ser divido em 4 pilares: Altura, Duraçãoo, Intesidade e Timbre...";
    
    //Conversa
    Conversa *mod1Aula2Exe1conversa1 = [[Conversa alloc] init];
    [[mod1Aula2Exe1conversa1 listaDeFalas] addObject: mod1Aula2Exe1fala1];
    [[mod1Aula2Exe1conversa1 listaDeFalas] addObject: mod1Aula2Exe1fala2];
    [[mod1Aula2Exe1conversa1 listaDeFalas] addObject: mod1Aula2Exe1fala3];
    [[mod1Aula2Exe1conversa1 listaDeFalas] addObject: mod1Aula2Exe1fala4];
    [[[mod1Aula2Exe1 mascote] listaDeConversas] addObject: mod1Aula2Exe1conversa1];
    
//----------------------------------------------------------------------------------------------------------//

//Exercícios
    Exercicio *mod1Aula2Exe2 = [[Exercicio alloc] init:102 nome:@"Pilares do Som" nomeView:@"Mod1Aula2Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas do Mascote
    Fala *mod1Aula2Exe2fala1 = [[Fala alloc] init];
    mod1Aula2Exe2fala1.conteudo = @"O primeiro pilar que vamos aprender é a Altura. Esse pilar mede a quantidade de vibrações de um objeto, ou seja o quanto ele é agudo ou grave.";
    
    Fala *mod1Aula2Exe2fala2 = [[Fala alloc] init];
    mod1Aula2Exe2fala2.conteudo = @"Arraste esses objetos no TocaTreco e observe o que ele responde sobre a vibração do objeto.";
    
    Fala *mod1Aula2Exe2fala3 = [[Fala alloc] init];
    mod1Aula2Exe2fala3.conteudo = @"Como você viu, dependendo da quantidade de vibrações a altura do objeto pode produzir um som agudo ou grave. Quanto maior, maior o nível de agudo.";
    
    Fala *mod1Aula2Exe2fala4 = [[Fala alloc] init];
    mod1Aula2Exe2fala4.conteudo = @"Observe esses gráficos acima, os arraste para o TocaTreco captar a vibração e veja novamente a resposta para cada um.";
    
    Fala *mod1Aula2Exe2fala5 = [[Fala alloc] init];
    mod1Aula2Exe2fala5.conteudo = @"Quanto mais ondas tiver em um trecho, maior será o agudo e a frequência. Acima temos um gráfico com frequência 2 e outro 1. Logo a primeira figura é mais aguda.";
    
    Fala *mod1Aula2Exe2fala6 = [[Fala alloc] init];
    mod1Aula2Exe2fala6.conteudo = @"Vamos aprender agora outro Pilar. O timbre é a capacidade que nos faz descobrir a origem de algum som, e está relacionado a forma das ondas do gráfico.";
    
    Fala *mod1Aula2Exe2fala7 = [[Fala alloc] init];
    mod1Aula2Exe2fala7.conteudo = @"Toque nos pontos pretos acima e tente associá-los ao seu respectivo instrumento, arrastando-os para em cima dos pontos.";
    
    Fala *mod1Aula2Exe2fala8 = [[Fala alloc] init];
    mod1Aula2Exe2fala8.conteudo = @"Como eu havia falado no começo, o que faz diferenciar o timbre na frequência é o formato das ondas, como você observa nas imagens a cima.";
    
    Fala *mod1Aula2Exe2fala9 = [[Fala alloc] init];
    mod1Aula2Exe2fala9.conteudo = @"Mais um pilar é importante falar, se o som aumentar alguém vai reclamar! E é exatamente dessa rima que vem a chamada Intensidade, ou melhor o Volume.";
    
    Fala *mod1Aula2Exe2fala10 = [[Fala alloc] init];
    mod1Aula2Exe2fala10.conteudo = @"A Intesidade é o volume do som, sendo que quanto maior a intensidade, maior o volume do som. Arraste um som descolado no TocaTreco e aumente a intesidade.";
    
    Fala *mod1Aula2Exe2fala11 = [[Fala alloc] init];
    mod1Aula2Exe2fala11.conteudo = @"A intensidade na frequência é representada pela amplitude que está desenhada no gráfico acima, quanto maior o seu comprimento, maior será o volume.";
    
    Fala *mod1Aula2Exe2fala12 = [[Fala alloc] init];
    mod1Aula2Exe2fala12.conteudo = @"Por fim chegamos ao nosso último pilar, a duração que é nada mais que o tempo em que o som é feito.";
    
    Fala *mod1Aula2Exe2fala13 = [[Fala alloc] init];
    mod1Aula2Exe2fala13.conteudo = @"A animação acima descreve bem como a duração funciona. Toque nos animais, veja a tartaruga fazendo um som mais longo e a lebre fazendo o som mais rápido. Os dois possuem duração, mas com tempos diferentes!";

    
//Conversa
    Conversa *mod1Aula2Exe2conversa1 = [[Conversa alloc] init];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala1];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala2];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala3];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala4];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala5];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala6];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala7];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala8];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala9];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala10];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala11];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala12];
    [[mod1Aula2Exe2conversa1 listaDeFalas] addObject: mod1Aula2Exe2fala13];
    
    [[[mod1Aula2Exe2 mascote] listaDeConversas] addObject: mod1Aula2Exe2conversa1];


    
////////////////////////////// JOGO 2 ////////////////////////////////////
    
    Exercicio *mod1Aula2Exe1Jogo = [[Exercicio alloc] init:666 nome:@"Jogo Som" nomeView:@"JogoBlocosSomViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"iconeJogoSom.png"]];

    //Falas do Mascote
    //Falas
    Fala *mod1Aula2Exe1Jogofala1 = [[Fala alloc] init];
    mod1Aula2Exe1Jogofala1.conteudo = @"O TocaTreco está louco para tocar, mais para isso você deve preparar algo no forno para ele, agora que você já sabe os pilares do som, mãos á massa e construa seu proprio som!";
    
    
    //Conversa
    Conversa *mod1Aula2Exe1Jogoconversa1 = [[Conversa alloc] init];
    [[mod1Aula2Exe1Jogoconversa1 listaDeFalas] addObject: mod1Aula2Exe1Jogofala1];
    [[mod1Aula2Exe1Jogoconversa1 listaDeFalas] addObject: mod1Aula2Exe1Jogofala1];
    
    [[[mod1Aula2Exe1Jogo mascote] listaDeConversas] addObject:mod1Aula2Exe1Jogoconversa1];
//----------------------------------------------------------------------------------------------------------//
    
//Aula de Som
    Aula *mod1Aula2 = [[Aula alloc]init];
    mod1Aula2.nome = @"Som";
    mod1Aula2.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula2 listaDeExercicios]addObject: mod1Aula2Exe1];
    [[mod1Aula2 listaDeExercicios]addObject: mod1Aula2Exe2];
    [[mod1Aula2 listaDeExercicios]addObject: mod1Aula2Exe1Jogo];
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
//Exercícios
//INTRODUÇÃO musical
    Exercicio *mod1Aula3Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução musical" nomeView:@"Mod1Aula3Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];

//Falas
    Fala *mod1Aula3Exe1fala1 = [[Fala alloc] init];
    mod1Aula3Exe1fala1.conteudo = @"Já temos uma ideia de como a música está presente em nossa vida e também o que é o som. Vamos aprender agora como a música é formada e quais são seus componentes.";
    
    Fala *mod1Aula3Exe1fala2 = [[Fala alloc] init];
    mod1Aula3Exe1fala2.conteudo = @"Numa mistura de SILÊNCIOS e SONS, a música nasce como a soma desses dois. Díficil de imaginar?";
    
    Fala *mod1Aula3Exe1fala3 = [[Fala alloc] init];
    mod1Aula3Exe1fala3.conteudo = @"Veja como TocaTreco cria música com essa junção!";
    
    Fala *mod1Aula3Exe1fala4 = [[Fala alloc] init];
    mod1Aula3Exe1fala4.conteudo = @"É simples assim! Ao entrar sons + pausas o TocaTreco faz a música. E com qualquer instrumento, também funcionará assim.";
    
    Fala *mod1Aula3Exe1fala5 = [[Fala alloc] init];
    mod1Aula3Exe1fala5.conteudo = @"Pra fixarmos cada elemento, vamos para definição de cada um!";
    
    Fala *mod1Aula3Exe1fala6 = [[Fala alloc] init];
    mod1Aula3Exe1fala6.conteudo = @"O pequeno mascote apontado representa o SOM, e o intervalo entre um som e outro são os silêncios, ou as chamadas as pausas.";
    
    Fala *mod1Aula3Exe1fala7 = [[Fala alloc] init];
    mod1Aula3Exe1fala7.conteudo = @"Vamos memorizar com um teste. Qual desses conjuntos na tela pode \"representar\" a definição de música?";
    
    Fala *mod1Aula3Exe1fala8 = [[Fala alloc] init];
    mod1Aula3Exe1fala8.conteudo = @"Agora já sabemos melhor o que é a música, o que acha de entramos no \"mundo\" dos ritmos?";
    
    //Conversa
    Conversa *mod1Aula3Exe1conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala1];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala2];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala3];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala4];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala5];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala6];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala7];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala8];
    [[[mod1Aula3Exe1 mascote] listaDeConversas] addObject: mod1Aula3Exe1conversa1];
    
//RITMO
    Exercicio *mod1Aula3Exe2 = [[Exercicio alloc] init:102 nome:@"Ritmo" nomeView:@"Mod1Aula3Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];

//Falas
    Fala *mod1Aula3Exe2fala1 = [[Fala alloc] init];
    mod1Aula3Exe2fala1.conteudo = @"Quando ouvimos falar sobre RITMO, talvez a primeira coisa que venha na nossa mente é estilo como rock ou samba. Mas você já parou pra pensar, o que diferencia cada um?";
    
    Fala *mod1Aula3Exe2fala2 = [[Fala alloc] init];
    mod1Aula3Exe2fala2.conteudo = @"O ritmo é o movimento dos sons regulados pela sua maior ou menor duração. Pode ser considerado um condutor dos sons conforme o tempo e velocidade que são tocados. Ainda díficil de entender?";
    
    Fala *mod1Aula3Exe2fala3 = [[Fala alloc] init];
    mod1Aula3Exe2fala3.conteudo = @"Os batimentos cardíacos para seu bom funcionamento necessitam sempre estar coordenados com velocidade e tempo para que o fluxo seja bombeado e o movimento do coração seja executado constantemente. Isso também é ritmo, e através dele esse processo acontece!";
    
    Fala *mod1Aula3Exe2fala4 = [[Fala alloc] init];
    mod1Aula3Exe2fala4.conteudo = @"Voltando ao ritmos ligamos à estilos musicais, realmente eles tem uma relação. Uns são mais rápidos como Rock, outros mais suaves como Clássico. Veja um exemplo de alguns deles...";
    
    Fala *mod1Aula3Exe2fala5 = [[Fala alloc] init];
    mod1Aula3Exe2fala5.conteudo = @"Você já deve ter ouvido a música \"Parabéns pra você\" pelo menos uma dezena de vezes na vida, mas talvez nunca percebeu que ela pode ser apresentar de várias maneiras dependendo do ritmo. Duvida? Clique em cada um acima e veja a diferença.";
    
    Fala *mod1Aula3Exe2fala6 = [[Fala alloc] init];
    mod1Aula3Exe2fala6.conteudo = @"Percebe que a diferença acontece diretamente na execução, podem parecer até músicas diferente. E em tese realmente são, pois de acordo com o RITMO a velocidade e tempo da música é alterada.";
    
    Fala *mod1Aula3Exe2fala7 = [[Fala alloc] init];
    mod1Aula3Exe2fala7.conteudo = @"Veja mais uma vez essa diferença de velocidade e tempo no TocaTreco. Clique em cada um, e veja a saída da música.";
    
    Fala *mod1Aula3Exe2fala8 = [[Fala alloc] init];
    mod1Aula3Exe2fala8.conteudo = @"Para exercitar depois de tudo que te mostrei, qual dessas figuras você acha que corresponde definição e ao que interfere o ritmo na música?";
    
    Fala *mod1Aula3Exe2fala9 = [[Fala alloc] init];
    mod1Aula3Exe2fala9.conteudo = @"Sempre que ouvir falar de RITMO lembre dele como um maestro do tempo e velocidade na música. E por ele existem os estilos. Rápido, devagar, alegre, sonolento. Seja qual for desempenha um papel importante na música.";
    
    Fala *mod1Aula3Exe2fala10 = [[Fala alloc] init];
    mod1Aula3Exe2fala10.conteudo = @"Quem sabe daqui algum tempo você mesmo não cria seu próprio Ritmo? Vamos continuar, porque a melodia vem chegando...";
    
//Conversa
    Conversa *mod1Aula3Exe2conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala1];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala2];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala3];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala4];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala5];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala6];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala7];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala8];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala9];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala10];
    [[[mod1Aula3Exe2 mascote] listaDeConversas] addObject: mod1Aula3Exe2conversa1];

//MELODIA
    Exercicio *mod1Aula3Exe3 = [[Exercicio alloc] init:102 nome:@"Melodia" nomeView:@"Mod1Aula3Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];

//Falas
    Fala *mod1Aula3Exe3fala1 = [[Fala alloc] init];
    mod1Aula3Exe3fala1.conteudo = @"Já descobrimos como a música é formada e como o ritmo a coordena, mas você chegou a pensar de onde vem esse sentido musical, será realmente que acontece só com vários sons ou pausas tocadas?";
    
    Fala *mod1Aula3Exe3fala2 = [[Fala alloc] init];
    mod1Aula3Exe3fala2.conteudo = @"Agora é hora de saber onde esse elementos se encaixam...";
    
    Fala *mod1Aula3Exe3fala3 = [[Fala alloc] init];
    mod1Aula3Exe3fala3.conteudo = @"Melodia são sons emitidos SEPARADAMENTE, uma sucessão que dá sentido e fluidez na música. Isso mesmo, sempre que uma nota por vez é tocada em sequência de acordo com o ritmo, surge a melodia!";
    
    Fala *mod1Aula3Exe3fala4 = [[Fala alloc] init];
    mod1Aula3Exe3fala4.conteudo = @"Imagine uma fila de notas e pausas sendo lideradas pelo ritmo e uma à uma são tocadas, criando esse sentido.";
    
    Fala *mod1Aula3Exe3fala5 = [[Fala alloc] init];
    mod1Aula3Exe3fala5.conteudo = @"O conceito é simples, veja em seguida um exemplo nos TocaTrecos.";
    
    Fala *mod1Aula3Exe3fala6 = [[Fala alloc] init];
    mod1Aula3Exe3fala6.conteudo = @"O primeiro TocaTreco representa bem a melodia, com cada nota sendo tocada. Já o segundo contém a harmonia, porém já acresenta outros elementos que veremos mais pra frente.";
    
    Fala *mod1Aula3Exe3fala7 = [[Fala alloc] init];
    mod1Aula3Exe3fala7.conteudo = @"Você deve memorizar que a melodia é fluidez de sons contínuos e assim conseguirá diferenciar quando ela aparece.";
    
    Fala *mod1Aula3Exe3fala8 = [[Fala alloc] init];
    mod1Aula3Exe3fala8.conteudo = @"Para fixar, sabendo que a melodia ocorre equando notas são tocadas individualmente. Qual dos instrumentos abaixo tem essa característica?";
    
    Fala *mod1Aula3Exe3fala9 = [[Fala alloc] init];
    mod1Aula3Exe3fala9.conteudo = @"Notas em fila ou sons simultâneos, a melodia aparece em toda música. Porém ela ainda terá o auxilio de outros \"colegas\". Vamos para a Harmonia!";
    
//Conversa
    Conversa *mod1Aula3Exe3conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala1];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala2];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala3];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala4];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala5];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala6];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala7];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala8];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala9];
    [[[mod1Aula3Exe3 mascote] listaDeConversas] addObject: mod1Aula3Exe3conversa1];

//HARMONIA
    Exercicio *mod1Aula3Exe4 = [[Exercicio alloc] init:102 nome:@"Harmonia" nomeView:@"Mod1Aula3Exe4ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
//Falas
    Fala *mod1Aula3Exe4fala1 = [[Fala alloc] init];
    mod1Aula3Exe4fala1.conteudo = @"Agora vamos falar um pouco sobre harmonia, que é um dos chamados \"elementos constitutivos e fundamentais\" da música!";
    
    Fala *mod1Aula3Exe4fala2 = [[Fala alloc] init];
    mod1Aula3Exe4fala2.conteudo = @"Para nossa felicidade, a harmonia é justamente o contrário da melodia. São sons tocados ao mesmo tempo, contíunos, que também dão fluidez a música tocada.";
    
    Fala *mod1Aula3Exe4fala3 = [[Fala alloc] init];
    mod1Aula3Exe4fala3.conteudo = @"Imagine sons interligados, mas diferente da melodia, temos blocos de notas que ocupam o mesmo \"tempo\" na música.";
    
    Fala *mod1Aula3Exe4fala4 = [[Fala alloc] init];
    mod1Aula3Exe4fala4.conteudo = @"Quer ver a diferença? Arraste a nota separada, que representa a melodia e depois a harmonia, que são vários sons juntos. Ouça cada uma!";
    
    Fala *mod1Aula3Exe4fala5 = [[Fala alloc] init];
    mod1Aula3Exe4fala5.conteudo = @"Notou que na harmonia parece vários sons juntos e já na melodia dá a impressão de apenas uma sequência, cada um tocada de uma vez?";
    
    Fala *mod1Aula3Exe4fala6 = [[Fala alloc] init];
    mod1Aula3Exe4fala6.conteudo = @"vamos para os instrumentos. Assim como mostrei na melodia existem técnicas de tocar instrumentos, que exemplificam bem a harmonia.";
    
    Fala *mod1Aula3Exe4fala7 = [[Fala alloc] init];
    mod1Aula3Exe4fala7.conteudo = @"Arraste cada um e veja a diferença entre os acordes harmoniosos do violão para a escala feita na flauta.";
    
    Fala *mod1Aula3Exe4fala8 = [[Fala alloc] init];
    mod1Aula3Exe4fala8.conteudo = @"Existem outros instrumentos que mostram a diferença. Guarde pra você que a harmonia é relacionada a CONJUNTO e a melodia a UNIDADE.";
    
    Fala *mod1Aula3Exe4fala9 = [[Fala alloc] init];
    mod1Aula3Exe4fala9.conteudo = @"Sempre que ouvir músicas, você vai perceber que não haverá apenas harmonia e melodia, as duas trabalham em conjunto.";
    
    Fala *mod1Aula3Exe4fala10 = [[Fala alloc] init];
    mod1Aula3Exe4fala10.conteudo = @"Por isso vamos agora saber melhor o que é Polifonia...";
    
    //Conversa
    Conversa *mod1Aula3Exe4conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala1];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala2];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala3];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala4];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala5];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala6];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala7];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala8];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala9];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala10];
    [[[mod1Aula3Exe4 mascote] listaDeConversas] addObject: mod1Aula3Exe4conversa1];
 
//POLIFONIA
    Exercicio *mod1Aula3Exe5 = [[Exercicio alloc] init:102 nome:@"Polifonia" nomeView:@"Mod1Aula3Exe5ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod1Aula3Exe5fala1 = [[Fala alloc] init];
    mod1Aula3Exe5fala1.conteudo = @"Você pode não saber, mas já vem aprendendo um pouco sobre o que é polifonia...";
    
    Fala *mod1Aula3Exe5fala2 = [[Fala alloc] init];
    mod1Aula3Exe5fala2.conteudo = @"A definição é simples. Basta somar a MELODIA com a HARMONIA, que acabou de aprender. É isso mesmo! A polifonia ocorre sempre que temos a melodia e harmonia ao mesmo tempo.";
    
    Fala *mod1Aula3Exe5fala3 = [[Fala alloc] init];
    mod1Aula3Exe5fala3.conteudo = @"Vamos ao TocaTreco ver o que acontece!";
    
    Fala *mod1Aula3Exe5fala4 = [[Fala alloc] init];
    mod1Aula3Exe5fala4.conteudo = @"O pequeno mascote representa a melodia, já as outras notas representam a harmonia. Arraste-os ao TocaTreco!";
    
    Fala *mod1Aula3Exe5fala5 = [[Fala alloc] init];
    mod1Aula3Exe5fala5.conteudo = @"Quando o TocaTreco toca as duas, ocorre a tal polifonia. Juntando os sons indivuais numa escala e conjuntos de sons num acorde.";
    
    Fala *mod1Aula3Exe5fala6 = [[Fala alloc] init];
    mod1Aula3Exe5fala6.conteudo = @"Assim como na harmonia conseguimos perceber a polifonia em instrumentos. O teclado elétrico é um deles, que pode fazer uma batida eletrônica enquanto toca sua melodia.";
    
    Fala *mod1Aula3Exe5fala7 = [[Fala alloc] init];
    mod1Aula3Exe5fala7.conteudo = @"Vamos ver, arraste para o TocaTreco e veja como ele faz essa mistura.";
    
    Fala *mod1Aula3Exe5fala8 = [[Fala alloc] init];
    mod1Aula3Exe5fala8.conteudo = @"Viu que não tem segredo?";
    
    Fala *mod1Aula3Exe5fala9 = [[Fala alloc] init];
    mod1Aula3Exe5fala9.conteudo = @"Talvez não seja tão comum e veja poucas vezes durante o aprendizado. Mas agora já sabe o que é, e quando surge a Polifonia. Até a próxima!";

    
    //Conversa
    Conversa *mod1Aula3Exe5conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala1];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala2];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala3];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala4];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala5];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala6];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala7];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala8];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala9];
    [[[mod1Aula3Exe5 mascote] listaDeConversas] addObject: mod1Aula3Exe5conversa1];

    
//Aula de Música
    Aula *mod1Aula3 = [[Aula alloc]init];
    mod1Aula3.nome = @"Música";
    mod1Aula3.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe1];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe2];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe3];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe4];
    [[mod1Aula3 listaDeExercicios]addObject: mod1Aula3Exe5];

    
    
////////////////////////////////// Aula 4 //////////////////////////////////////
    
//Exercícios
//PERCEPÇÃO musical
    Exercicio *mod1Aula4Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução a Percepção musical" nomeView:@"Mod1Aula4Exe1ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"logoPrata.png"]];

//Falas
    Fala *mod1Aula4Exe1fala1 = [[Fala alloc] init];
    mod1Aula4Exe1fala1.conteudo = @"Aprendemos importantes elementos da música. Para continuar a aprender, veremos porque é bom praticar sua percepção musical.";
    
    Fala *mod1Aula4Exe1fala2 = [[Fala alloc] init];
    mod1Aula4Exe1fala2.conteudo = @"Não é nada de outro mundo. Percepção musical, é quando identificamos os elementos que fazem parte da música. Você lembra do ritmo, melodia e harmonia que dão fluidez e controlam o tempo da música?";
    
    Fala *mod1Aula4Exe1fala3 = [[Fala alloc] init];
    mod1Aula4Exe1fala3.conteudo = @"Justamente quando você \"percebe\" cada um deles na música, é a chamada da Percepção musical.";

    
    Fala *mod1Aula4Exe1fala4 = [[Fala alloc] init];
    mod1Aula4Exe1fala4.conteudo = @"Aqui temos elementos que representam o RITMO, MELODIA e HARMONIA. Veja o que acontece no placar lá em cima, quando você arrastá-los para o TocaTreco.";
    
    
    Fala *mod1Aula4Exe1fala5 = [[Fala alloc] init];
    mod1Aula4Exe1fala5.conteudo = @"Viu? O TocaTreco consegue identificar o que cada elemento representa com sua \"percepção musical\".";
    
    Fala *mod1Aula4Exe1fala6 = [[Fala alloc] init];
    mod1Aula4Exe1fala6.conteudo = @"Você deve se atentar à sempre perceber esses três elementos. Assim como no som, imagine-os como pilares. Juntos formam os elementos fundamentais da música.";
    
    Fala *mod1Aula4Exe1fala7 = [[Fala alloc] init];
    mod1Aula4Exe1fala7.conteudo = @"Não tem segredo. Quanto mais você ouvir, aprender e praticar a música, melhor sua percepção musical será!";
    
    Fala *mod1Aula4Exe1fala8 = [[Fala alloc] init];
    mod1Aula4Exe1fala8.conteudo = @"Agora começaremos a entrar no mundo da notação musical, o que será que nos aguarda?";
    
//Conversa
    Conversa *mod1Aula4Exe1conversa1 = [[Conversa alloc] init];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala1];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala2];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala3];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala4];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala5];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala6];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala7];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala8];
    [[[mod1Aula4Exe1 mascote] listaDeConversas] addObject: mod1Aula4Exe1conversa1];

    
//Aula de Percepção musical
    Aula *mod1Aula4 = [[Aula alloc]init];
    mod1Aula4.nome = @"Percepção musical";
    mod1Aula4.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula4 listaDeExercicios]addObject: mod1Aula4Exe1];

    
///////////////////////////// Modulo Inciante //////////////////////////////////
    
    //Cria o modulo Iniciante
    Modulo *moduloIniciante = [[Modulo alloc]init];
    moduloIniciante.nome = @"Iniciante";
    moduloIniciante.capa = [UIImage imageNamed:@"elevador.png"];
    [[moduloIniciante listaDeAulas]addObject: mod1Aula1];
    [[moduloIniciante listaDeAulas]addObject: mod1Aula2];
    [[moduloIniciante listaDeAulas]addObject: mod1Aula3];
    [[moduloIniciante listaDeAulas]addObject: mod1Aula4];
    
    //Adiciona o Modulo dentro da biblioteca
    [[self listaDeModulos]addObject: moduloIniciante];
    
}




-(void)instanciaModuloIntermediario{

////////////////////////////////// Aula 1 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula1Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução à Notas" nomeView:@"Mod2Aula1Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];


    //Falas do Mascote
    //Falas
    Fala *mod1Aula1Exe1fala1 = [[Fala alloc] init];
    mod1Aula1Exe1fala1.conteudo = @"Entrando no mundo das partituras, vamos começar a aprender sobre Notas!";
    
    Fala *mod1Aula1Exe1fala2 = [[Fala alloc] init];
    mod1Aula1Exe1fala2.conteudo = @"Lembra aquela nossa aula sobre som? A nota musical pode ser chamanda assim, porém ela retorna uma frequência única. Vamos a prática!";
    
    Fala *mod1Aula1Exe1fala3 = [[Fala alloc] init];
    mod1Aula1Exe1fala3.conteudo = @"Toque nas teclas do Piano acima e veja que cada tecla corresponde a uma nota musical, com frequência constante, com som único e sem alterações.";
    
    Fala *mod1Aula1Exe1fala4 = [[Fala alloc] init];
    mod1Aula1Exe1fala4.conteudo = @"Assim como o som, a nota tem a sua duração, o seu timbre depedendo do intrumento, a intensidade do volume e a altura, que é quando o som é grave ou agudo!";
    
    Fala *mod1Aula1Exe1fala5 = [[Fala alloc] init];
    mod1Aula1Exe1fala5.conteudo = @"Para dividir essas notas com os 4 pilares aprendidos até agora, criaram escalas pra ajudar na aprendizagem e evitar erros de interpretação. Podemos imagina-lá como uma escada.";
    
    Fala *mod1Aula1Exe1fala6 = [[Fala alloc] init];
    mod1Aula1Exe1fala6.conteudo = @"Essa escala é divida em 7 notas, cada uma com seus respectivos pilares que as fazem diferenciar uma da outra, vamos ao exemplo!";
    
    Fala *mod1Aula1Exe1fala7 = [[Fala alloc] init];
    mod1Aula1Exe1fala7.conteudo = @"Toque em cada imagem do mascote de baixo para cima e veja como uma se difere da outra. Observe que quanto mais alto fica na escada, mais a nota fica aguda.";
    
    Fala *mod1Aula1Exe1fala8 = [[Fala alloc] init];
    mod1Aula1Exe1fala8.conteudo = @"Ao passar de cada degrau da escada, a nossa nota fica cada vez mais aguda e menos grave assim alterando a altura,]. Logo juntando com os outros 3 pilares essas notas formam uma escala.";
    
    Fala *mod1Aula1Exe1fala9 = [[Fala alloc] init];
    mod1Aula1Exe1fala9.conteudo = @"Essas notas divididas dentro de uma escala ganham o nome aqui no Brasil de DÓ – RÉ – MI – FÁ – SOL – LÁ – SI";
    
    Fala *mod1Aula1Exe1fala10 = [[Fala alloc] init];
    mod1Aula1Exe1fala10.conteudo = @"É interessante falar que em outros países essas notas podem ganhar outro nome, como nos EUA que usam os termos C – D – E – F – G – A – B para dividir as notas.";
    
    //Conversa
    Conversa *mod2Aula1Exe1conversa1 = [[Conversa alloc] init];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala1];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala2];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala3];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala4];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala5];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala6];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala7];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala8];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala9];
    [[mod2Aula1Exe1conversa1 listaDeFalas] addObject: mod1Aula1Exe1fala10];
    
    [[[mod2Aula1Exe1 mascote] listaDeConversas] addObject:mod2Aula1Exe1conversa1];

    
    
////////////////////////////Exercicios
Exercicio *mod2Aula1Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando as Notas" nomeView:@"Mod2Aula1Exe2ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"logoPrata.png"]];

    //Falas do Mascote
    //Falas
    Fala *mod1Aula1Exe2fala1 = [[Fala alloc] init];
    mod1Aula1Exe2fala1.conteudo = @"Vamos gravar bem o nome e a ordem dessas divisões da escala.";
    
    Fala *mod1Aula1Exe2fala2 = [[Fala alloc] init];
    mod1Aula1Exe2fala2.conteudo = @"Repita comigo DÓ – RÉ – MI – FÁ – SOL – LÁ – SI e acompanhe o áudio.";
    
    Fala *mod1Aula1Exe2fala3 = [[Fala alloc] init];
    mod1Aula1Exe2fala3.conteudo = @"Encontre dentro da sopa de letras o nome das 7 notas aprendidas até agora!";
    
    Fala *mod1Aula1Exe2fala4 = [[Fala alloc] init];
    mod1Aula1Exe2fala4.conteudo = @"É isso ai! Agora que você já tem uma noção, tente colocar as notas das plaquinhas acima na ordem correta em que aprendemos até aqui. Pra isso arraste para os pontos pretos acima cada uma.";
    
    Fala *mod1Aula1Exe2fala5 = [[Fala alloc] init];
    mod1Aula1Exe2fala5.conteudo = @"Ah não... temos um problema, o TocaTreco está maluco, jogando notas que não existem. Sua função é não deixar sair notas com os nomes errados, sempre que aparecer um nome diferente faca um gesto igual a imagem acima!";
    
    Fala *mod1Aula1Exe2fala6 = [[Fala alloc] init];
    mod1Aula1Exe2fala6.conteudo = @"Ufa! Você conseguiu arrumar o TocaTreco, imagine a chiadeira dele fazendo notas que não existem!";

    
    //Conversa
    Conversa *mod2Aula1Exe2conversa1 = [[Conversa alloc] init];
    [[mod2Aula1Exe2conversa1 listaDeFalas] addObject: mod1Aula1Exe2fala1];
    [[mod2Aula1Exe2conversa1 listaDeFalas] addObject: mod1Aula1Exe2fala2];
    [[mod2Aula1Exe2conversa1 listaDeFalas] addObject: mod1Aula1Exe2fala3];
    [[mod2Aula1Exe2conversa1 listaDeFalas] addObject: mod1Aula1Exe2fala4];
    [[mod2Aula1Exe2conversa1 listaDeFalas] addObject: mod1Aula1Exe2fala5];
    [[mod2Aula1Exe2conversa1 listaDeFalas] addObject: mod1Aula1Exe2fala6];
    
    [[[mod2Aula1Exe2 mascote] listaDeConversas] addObject:mod2Aula1Exe2conversa1];

////////////////////////////Exercicios
    
  Exercicio *mod2Aula1Exe3 = [[Exercicio alloc] init:203 nome:@"História das Notas" nomeView:@"Mod2Aula1Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
    //Falas do Mascote
    //Falas
    
    Fala *mod2Aula1Exe3fala0 = [[Fala alloc] init];
    mod2Aula1Exe3fala0.conteudo = @"Bem, agora vamos falar um pouco sobre a história das notas musicais. Muitos tentaram chegar a um padrão, mas somente no fim dos anos 1000 que chegou-se ao que nós usamos hoje!";

    Fala *mod2Aula1Exe3fala1 = [[Fala alloc] init];
    mod2Aula1Exe3fala1.conteudo = @"A princípio as notas foram criadas por um Monge chamado Guido de Arezzo, que tirou de uma letra de música em Latim os nomes em homenagem ao Santo João.";
    
    Fala *mod2Aula1Exe3fala2 = [[Fala alloc] init];
    mod2Aula1Exe3fala2.conteudo = @"Ele percebeu que com a criação de uma simples escala musical, facilitaría o aprendizado dos alunos e diminuía possiveis erros de interpretações de obras.";
    
    Fala *mod2Aula1Exe3fala3 = [[Fala alloc] init];
    mod2Aula1Exe3fala3.conteudo = @"Porém só bem depois no século XVII foi revisto os nomes das notas, e a nota DÓ foi criada e colocada no lugar do UT!";
    
    Fala *mod2Aula1Exe3fala4 = [[Fala alloc] init];
    mod2Aula1Exe3fala4.conteudo = @"Realmente as historias por parte da música me deixam muito curioso, ainda veremos mais ao longo da nossa Jornada!";
    
    
    
    //Conversa
    Conversa *mod2Aula1Exe3conversa1 = [[Conversa alloc] init];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala0];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala1];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala2];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala3];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala4];
    
    [[[mod2Aula1Exe3 mascote] listaDeConversas] addObject:mod2Aula1Exe3conversa1];
    
    
////////////////////////////Exercicios
    
    Exercicio *mod2Aula1Exe4 = [[Exercicio alloc] init:666 nome:@"Arremesse notas" nomeView:@"GameBlocosViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"iconeJogoArremessaNotas.png"]];
    
    //Falas do Mascote
    //Falas
    Fala *mod2Aula1Exe4fala1 = [[Fala alloc] init];
    mod2Aula1Exe4fala1.conteudo = @"Já vimos até aqui quais são as sete notas musicais, mas quero ver se você aprendeu mesmo. Seu próximo objetivo é arremessar as notas com nome certo no TocaTreco e as erradas no chão. Qualquer erro pode ser fatal, vamos lá!";
    
    
    //Conversa
    Conversa *mod2Aula1Exe4conversa1 = [[Conversa alloc] init];
    [[mod2Aula1Exe4conversa1 listaDeFalas] addObject: mod2Aula1Exe4fala1];
    [[mod2Aula1Exe4conversa1 listaDeFalas] addObject: mod2Aula1Exe4fala1];
    [[[mod2Aula1Exe4 mascote] listaDeConversas] addObject: mod2Aula1Exe4conversa1];
    
////////////////////////////////
    
//Aula de Notas
    Aula *mod2Aula1 = [[Aula alloc]init];
    mod2Aula1.nome = @"Notas";
    mod2Aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe1];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe2];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe3];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe4];

    
    
    
    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula2Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Pausas" nomeView:@"Mod2Aula2Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    

//Falas do Mascote
    //Falas
    Fala *mod2Aula2Exe1fala1 = [[Fala alloc] init];
    mod2Aula2Exe1fala1.conteudo = @"Começando a falar sobre Pausas, elas são silêncios com determinada duração! Logo elas são diferentes de Sons ou Notas já que só possuem apenas um pilar: a duração.";
    
    Fala *mod2Aula2Exe1fala2 = [[Fala alloc] init];
    mod2Aula2Exe1fala2.conteudo = @"A Pausa é um assunto bem simples, mas de muita importância, já que junto as notas constroem um Ritmo. Arraste as 2 músicas no TocaTreco e observe com a pausa e sem a pausa como ritmo fica.";
    
    Fala *mod2Aula2Exe1fala3 = [[Fala alloc] init];
    mod2Aula2Exe1fala3.conteudo = @"Dentro do mundo da música as pausas podem se dividir em diversos tempos, ou seja o tempo de silêncio que ela pode ter.";
    
    Fala *mod2Aula2Exe1fala4 = [[Fala alloc] init];
    mod2Aula2Exe1fala4.conteudo = @"Toque nos pontos pretos e veja o que acontece. Depois associe aos 3 elementos: Pausa, Som e Nota.";
    
    Fala *mod2Aula2Exe1fala5 = [[Fala alloc] init];
    mod2Aula2Exe1fala5.conteudo = @"Muito bem! Agora vamos aprofundar um pouco mais, pois daqui a pouco virá o Pentagrama!";
    
    
//Conversa
    Conversa *mod2Aula2Exe1conversa1 = [[Conversa alloc] init];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala1];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala2];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala3];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala4];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala5];
 
    
    [[[mod2Aula2Exe1 mascote] listaDeConversas] addObject:mod2Aula2Exe1conversa1];

//////////////////////////// EXERCICIOS 2 ////////////////////////
    
//PRATICANDO AS PAUSAS
    Exercicio *mod2Aula2Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando Pausas" nomeView:@"Mod2Aula2Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
    //Falas
    Fala *mod2Aula2Exe2fala1 = [[Fala alloc] init];
    mod2Aula2Exe2fala1.conteudo = @"Vamos exercitar o que aprendemos sobre pausas?";
    
    Fala *mod2Aula2Exe2fala2 = [[Fala alloc] init];
    mod2Aula2Exe2fala2.conteudo = @"Estamos numa biblioteca, ambiente que precisa do máximo SILÊNCIO. Mas parece que nosso TocaTreco pifou e está fazendo o maior barulho...";
    
    Fala *mod2Aula2Exe2fala3 = [[Fala alloc] init];
    mod2Aula2Exe2fala3.conteudo = @"Sua tarefa é arrastar as pausas para o TocaTreco até que ele pare ou antes da bibliotecária chegar. É melhor começar!";
    
    Fala *mod2Aula2Exe2fala4 = [[Fala alloc] init];
    mod2Aula2Exe2fala4.conteudo = @"Agora sim o silêncio permanece, graças a sua ajuda!";
    
    Fala *mod2Aula2Exe2fala5 = [[Fala alloc] init];
    mod2Aula2Exe2fala5.conteudo = @"Mas vamos continuar nessa jornada e seguir para a próxima aula...";
    
    //Conversa
    Conversa *mod2Aula2Exe2conversa1 = [[Conversa alloc] init];
    [[mod2Aula2Exe2conversa1 listaDeFalas] addObject: mod2Aula2Exe2fala1];
    [[mod2Aula2Exe2conversa1 listaDeFalas] addObject: mod2Aula2Exe2fala2];
    [[mod2Aula2Exe2conversa1 listaDeFalas] addObject: mod2Aula2Exe2fala3];
    [[mod2Aula2Exe2conversa1 listaDeFalas] addObject: mod2Aula2Exe2fala4];
    [[mod2Aula2Exe2conversa1 listaDeFalas] addObject: mod2Aula2Exe2fala5];
    [[[mod2Aula2Exe2 mascote] listaDeConversas] addObject: mod2Aula2Exe2conversa1];
    
//Aula de Pausas
    Aula *mod2Aula2 = [[Aula alloc]init];
    mod2Aula2.nome = @"Pausas";
    mod2Aula2.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula2 listaDeExercicios]addObject: mod2Aula2Exe1];
    [[mod2Aula2 listaDeExercicios]addObject: mod2Aula2Exe2];
    
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
//Exercicios
    
//INTRODUÇÃO AO PENTAGRAMA
    Exercicio *mod2Aula3Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução ao Pentagrama" nomeView:@"Mod2Aula3Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula3Exe1fala1 = [[Fala alloc] init];
    mod2Aula3Exe1fala1.conteudo = @"Já aprendemos o que são as notas, pausas e onde elas se encaixam. Mas afinal, onde escrevemos esses sinais? Será que basta desenhá-los no papel e só? Vamos descobrir essas e outras repostas a seguir...";
    
    Fala *mod2Aula3Exe1fala2 = [[Fala alloc] init];
    mod2Aula3Exe1fala2.conteudo = @"Existe um \"molde\" para se organizar e ler todos os sinais que já aprendemos e que ainda vamos ver. É chamado de PAUTA ou PENTAGRAMA.";
    
    Fala *mod2Aula3Exe1fala3 = [[Fala alloc] init];
    mod2Aula3Exe1fala3.conteudo = @"O PENTAGRAMA é este conjunto de cinco linhas e quatro espaços, deitados horizontalmente. Daqui pra frente tudo relacionado a notação da música terá a presença dele.";
    
    Fala *mod2Aula3Exe1fala4 = [[Fala alloc] init];
    mod2Aula3Exe1fala4.conteudo = @"Contamos as linhas e os espaços SEMPRE de baixo pra cima.";
    
    Fala *mod2Aula3Exe1fala5 = [[Fala alloc] init];
    mod2Aula3Exe1fala5.conteudo = @"Algumas vezes o PENTAGRAMA não é sulficiente para mostrar uma nota ou outro símbolo, aí aparecem as linhas e espaços SUPLEMENTARES que seguem a mesma regra das outras e servem de auxílio.";
    
    Fala *mod2Aula3Exe1fala6 = [[Fala alloc] init];
    mod2Aula3Exe1fala6.conteudo = @"Para sabermos qual é cada nota dependerá sempre da LINHA ou ESPAÇO que ocupar no PENTAGRAMA.";
    
    Fala *mod2Aula3Exe1fala7 = [[Fala alloc] init];
    mod2Aula3Exe1fala7.conteudo = @"Veja esse exemplo, há uma nota na segunda linha. Pra nós ela representará o SOL, arraste ao TocaTreco e veja seu som!";
    
    Fala *mod2Aula3Exe1fala8 = [[Fala alloc] init];
    mod2Aula3Exe1fala8.conteudo = @"Agora temos uma nota no terceiro espaço representando o LÁ. Arraste novamente e veja o som!";

    Fala *mod2Aula3Exe1fala9 = [[Fala alloc] init];
    mod2Aula3Exe1fala9.conteudo = @"Não há segredo, de acordo com a linha ou espaço que estiver representará um único som ou pausa.";
    
    Fala *mod2Aula3Exe1fala10 = [[Fala alloc] init];
    mod2Aula3Exe1fala10.conteudo = @"Algumas aulas a diante você perceberá que de acordo com o que o músico deseja tocar ou o próprio instrumento a ordem das notas pode ser deslocada, mas sempre seguirá o mesmo conceito.";
    
    Fala *mod2Aula3Exe1fala11 = [[Fala alloc] init];
    mod2Aula3Exe1fala11.conteudo = @"Agora vamos treinar um pouco do que vimos até aqui...";

//Conversa
    Conversa *mod2Aula3Exe1conversa1 = [[Conversa alloc] init];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala1];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala2];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala3];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala4];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala5];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala6];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala7];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala8];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala9];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala10];
    [[mod2Aula3Exe1conversa1 listaDeFalas] addObject: mod2Aula3Exe1fala11];
    [[[mod2Aula3Exe1 mascote] listaDeConversas] addObject: mod2Aula3Exe1conversa1];
    

//EXERCITANDO PENTAGRAMA
    Exercicio *mod2Aula3Exe2 = [[Exercicio alloc] init:202 nome:@"Exercitando" nomeView:@"Mod2Aula3Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula3Exe2fala1 = [[Fala alloc] init];
    mod2Aula3Exe2fala1.conteudo = @"Vamos exercitar o que aprendemos sobre o pentagrama.";
    
    Fala *mod2Aula3Exe2fala2 = [[Fala alloc] init];
    mod2Aula3Exe2fala2.conteudo = @"Essa é a escada dos tons e infelizmente ela está apenas com o primeiro degrau.";
    
    Fala *mod2Aula3Exe2fala3 = [[Fala alloc] init];
    mod2Aula3Exe2fala3.conteudo = @"Sua missão será reconstruir, arrastando cada nota para as linhas do pentagrama.";
    
    Fala *mod2Aula3Exe2fala4 = [[Fala alloc] init];
    mod2Aula3Exe2fala4.conteudo = @"Finalmente minha \"outra\" versão vai conseguir subir e tocar a escada de tons!";
    
    Fala *mod2Aula3Exe2fala5 = [[Fala alloc] init];
    mod2Aula3Exe2fala5.conteudo = @"Depois de ter aprendido um pouco sobre o pentagrama, que tal conhecermos melhor sua história?";
    
//Conversa
    Conversa *mod2Aula3Exe2conversa1 = [[Conversa alloc] init];
    [[mod2Aula3Exe2conversa1 listaDeFalas] addObject: mod2Aula3Exe2fala1];
    [[mod2Aula3Exe2conversa1 listaDeFalas] addObject: mod2Aula3Exe2fala2];
    [[mod2Aula3Exe2conversa1 listaDeFalas] addObject: mod2Aula3Exe2fala3];
    [[mod2Aula3Exe2conversa1 listaDeFalas] addObject: mod2Aula3Exe2fala4];
    [[mod2Aula3Exe2conversa1 listaDeFalas] addObject: mod2Aula3Exe2fala5];
    [[[mod2Aula3Exe2 mascote] listaDeConversas] addObject: mod2Aula3Exe2conversa1];
    
    
//HISTÓRIA DO PENTAGRAMA
    Exercicio *mod2Aula3Exe3 = [[Exercicio alloc] init:202 nome:@"Pentagrama, como surgiu?" nomeView:@"Mod2Aula3Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula3Exe3fala1 = [[Fala alloc] init];
    mod2Aula3Exe3fala1.conteudo = @"Mas de onde será que surgiu o PENTAGRAMA? Vamos voltar ao século XI e descobrir...";
    
    Fala *mod2Aula3Exe3fala2 = [[Fala alloc] init];
    mod2Aula3Exe3fala2.conteudo = @"O pentagrama que conhecemos hoje tem origem nos cantos gregorianos, criado pelo monge Guido D’Arezzo.";
    
    Fala *mod2Aula3Exe3fala3 = [[Fala alloc] init];
    mod2Aula3Exe3fala3.conteudo = @"A notação existente usada até então foi substituida por UMA linha, onde eram escritas as notas.";
    
    Fala *mod2Aula3Exe3fala4 = [[Fala alloc] init];
    mod2Aula3Exe3fala4.conteudo = @"A quantidade de linhas foi variando até o século XVII.";

    Fala *mod2Aula3Exe3fala5 = [[Fala alloc] init];
    mod2Aula3Exe3fala5.conteudo = @"Até que o sistema se normalizou nas cinco linhas que são usadas atualmente.";
    
//Conversa
    Conversa *mod2Aula3Exe3conversa1 = [[Conversa alloc] init];
    [[mod2Aula3Exe3conversa1 listaDeFalas] addObject: mod2Aula3Exe3fala1];
    [[mod2Aula3Exe3conversa1 listaDeFalas] addObject: mod2Aula3Exe3fala2];
    [[mod2Aula3Exe3conversa1 listaDeFalas] addObject: mod2Aula3Exe3fala3];
    [[mod2Aula3Exe3conversa1 listaDeFalas] addObject: mod2Aula3Exe3fala4];
    [[mod2Aula3Exe3conversa1 listaDeFalas] addObject: mod2Aula3Exe3fala5];
    [[[mod2Aula3Exe3 mascote] listaDeConversas] addObject: mod2Aula3Exe3conversa1];
    
    
////////////////////////////Exercicios
    
    Exercicio *mod2Aula3Exe4 = [[Exercicio alloc] init:666 nome:@"Arrume a Escala de Notas" nomeView:@"EscadaDeNotasViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"iconeJogoEscala.png"]];
    
    //Falas do Mascote
    //Falas
    Fala *mod2Aula3Exe4fala1 = [[Fala alloc] init];
    mod2Aula3Exe4fala1.conteudo = @"Estou duvidando se você decorou mesmo as posições da notas no pentagrama. Meu desafio será que você arrume a escala a cada 20 segundos...";
    
    
    //Conversa
    Conversa *mod2Aula3Exe4conversa1 = [[Conversa alloc] init];
    [[mod2Aula3Exe4conversa1 listaDeFalas] addObject: mod2Aula3Exe4fala1];
    [[mod2Aula3Exe4conversa1 listaDeFalas] addObject: mod2Aula3Exe4fala1];
    [[[mod2Aula3Exe4 mascote] listaDeConversas] addObject: mod2Aula3Exe4conversa1];
    
////////////////////////////////
    
//Aula de Pentagrama
    Aula *mod2Aula3 = [[Aula alloc]init];
    mod2Aula3.nome = @"Pentagrama";
    mod2Aula3.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe1];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe2];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe3];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe4];


////////////////////////////////// Aula 4 //////////////////////////////////////
 
    
//Exercicios
//INTRO SIMBOLOGIA DAS NOTAS
    Exercicio *mod2Aula4Exe1 = [[Exercicio alloc] init:201 nome:@"Simbologia das notas" nomeView:@"Mod2Aula4Exe1ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula4Exe1fala1 = [[Fala alloc] init];
    mod2Aula4Exe1fala1.conteudo = @"Já vimos e aprendemos sobre as notas, pausas e o tal do pentagrama onde elas são desenhadas...";
    
    Fala *mod2Aula4Exe1fala2 = [[Fala alloc] init];
    mod2Aula4Exe1fala2.conteudo = @"Até aqui as notas são bloquinhos, que colocados no pentagrama tem seu som único.";
    
    Fala *mod2Aula4Exe1fala3 = [[Fala alloc] init];
    mod2Aula4Exe1fala3.conteudo = @"E conforme subimos as linhas do pentagrama parece que o volume aumenta numa escala...";
    
    Fala *mod2Aula4Exe1fala4 = [[Fala alloc] init];
    mod2Aula4Exe1fala4.conteudo = @"Mas está na hora de saber quais as verdadeiras figuras que representam cada uma.";
    
    Fala *mod2Aula4Exe1fala5 = [[Fala alloc] init];
    mod2Aula4Exe1fala5.conteudo = @"Começaremos pelas notas, já que elas não têm a mesma duração..";
    
    Fala *mod2Aula4Exe1fala6 = [[Fala alloc] init];
    mod2Aula4Exe1fala6.conteudo = @"Como saber qual é o tempo de cada uma?";
    
    Fala *mod2Aula4Exe1fala7 = [[Fala alloc] init];
    mod2Aula4Exe1fala7.conteudo = @"Existem formas diferentes para representar cada tempo numa nota.";
    
    Fala *mod2Aula4Exe1fala8 = [[Fala alloc] init];
    mod2Aula4Exe1fala8.conteudo = @"São chamados de valores ou figuras. Começaremos pela nota de 4 tempos.";
    
    Fala *mod2Aula4Exe1fala9 = [[Fala alloc] init];
    mod2Aula4Exe1fala9.conteudo = @"Este círculo é a semibreve, quando ela aparece no pentagrama, significa que deve ser tocada por 4 tempos.";
    
    Fala *mod2Aula4Exe1fala10 = [[Fala alloc] init];
    mod2Aula4Exe1fala10.conteudo = @"Agora vamos pra figura de nota que representa 2 tempos.";
    
    Fala *mod2Aula4Exe1fala11 = [[Fala alloc] init];
    mod2Aula4Exe1fala11.conteudo = @"Sempre que este círculo com uma aste aparecer, representa a mínima.";
    
    Fala *mod2Aula4Exe1fala12 = [[Fala alloc] init];
    mod2Aula4Exe1fala12.conteudo = @"Na sequência, aqui está figura da nota de um 1 tempo.";
    
    Fala *mod2Aula4Exe1fala13 = [[Fala alloc] init];
    mod2Aula4Exe1fala13.conteudo = @"Percebe que a nota agora de 1 tempo tem o círculo preenchido?";
    
    Fala *mod2Aula4Exe1fala14 = [[Fala alloc] init];
    mod2Aula4Exe1fala14.conteudo = @"Esta figura representa a semínima!";
    
    Fala *mod2Aula4Exe1fala15 = [[Fala alloc] init];
    mod2Aula4Exe1fala15.conteudo = @"Quando precisamos de uma nota de 1/2 tempo, temos uma figura parecidada com a anterior, só que com um risco a mais.";
    
    Fala *mod2Aula4Exe1fala16 = [[Fala alloc] init];
    mod2Aula4Exe1fala16.conteudo = @"Chamamos de colcheia!";
    
    Fala *mod2Aula4Exe1fala17 = [[Fala alloc] init];
    mod2Aula4Exe1fala17.conteudo = @"Para 1/4 de tempo a 'Semicolcheia' é a figura que usamos.";
    
    Fala *mod2Aula4Exe1fala18 = [[Fala alloc] init];
    mod2Aula4Exe1fala18.conteudo = @"Percebe que segue o mesmo desenho da anterior, mas novamente com um risco a mais?";

    Fala *mod2Aula4Exe1fala19 = [[Fala alloc] init];
    mod2Aula4Exe1fala19.conteudo = @"Temos ainda a nota de 1/8, sendo chamada de fusa.";
    
    Fala *mod2Aula4Exe1fala20 = [[Fala alloc] init];
    mod2Aula4Exe1fala20.conteudo = @"E por fim a semifusa que é a nota de 1/16.";

    Fala *mod2Aula4Exe1fala21 = [[Fala alloc] init];
    mod2Aula4Exe1fala21.conteudo = @"Pra relembrar, essas são todas as figuras de notas e pausas junto ao seu tempo de duração.";
    
    //Conversa
    Conversa *mod2Aula4Exe1conversa1 = [[Conversa alloc] init];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala1];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala2];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala3];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala4];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala5];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala6];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala7];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala8];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala9];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala10];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala11];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala12];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala13];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala14];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala15];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala16];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala17];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala18];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala19];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala20];
    [[mod2Aula4Exe1conversa1 listaDeFalas] addObject: mod2Aula4Exe1fala21];
    [[[mod2Aula4Exe1 mascote] listaDeConversas] addObject: mod2Aula4Exe1conversa1];
    
    
//APRESENTANDO IMAGEM DAS NOTAS
    Exercicio *mod2Aula4Exe2 = [[Exercicio alloc] init:202 nome:@"Apresentando a Imagem das notas" nomeView:@"Mod2Aula4Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula4Exe2fala1 = [[Fala alloc] init];
    mod2Aula4Exe2fala1.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe2fala2 = [[Fala alloc] init];
    mod2Aula4Exe2fala2.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe2fala3 = [[Fala alloc] init];
    mod2Aula4Exe2fala3.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe2fala4 = [[Fala alloc] init];
    mod2Aula4Exe2fala4.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe2fala5 = [[Fala alloc] init];
    mod2Aula4Exe2fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula4Exe2conversa1 = [[Conversa alloc] init];
    [[mod2Aula4Exe2conversa1 listaDeFalas] addObject: mod2Aula4Exe2fala1];
    [[mod2Aula4Exe2conversa1 listaDeFalas] addObject: mod2Aula4Exe2fala2];
    [[mod2Aula4Exe2conversa1 listaDeFalas] addObject: mod2Aula4Exe2fala3];
    [[mod2Aula4Exe2conversa1 listaDeFalas] addObject: mod2Aula4Exe2fala4];
    [[mod2Aula4Exe2conversa1 listaDeFalas] addObject: mod2Aula4Exe2fala5];
    [[[mod2Aula4Exe2 mascote] listaDeConversas] addObject: mod2Aula4Exe2conversa1];
 
    
//TREINAMENTO IMAGEM NOTAS
    Exercicio *mod2Aula4Exe3 = [[Exercicio alloc] init:202 nome:@"Treinando com Imagem das notas" nomeView:@"Mod2Aula4Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula4Exe3fala1 = [[Fala alloc] init];
    mod2Aula4Exe3fala1.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe3fala2 = [[Fala alloc] init];
    mod2Aula4Exe3fala2.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe3fala3 = [[Fala alloc] init];
    mod2Aula4Exe3fala3.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe3fala4 = [[Fala alloc] init];
    mod2Aula4Exe3fala4.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe3fala5 = [[Fala alloc] init];
    mod2Aula4Exe3fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula4Exe3conversa1 = [[Conversa alloc] init];
    [[mod2Aula4Exe3conversa1 listaDeFalas] addObject: mod2Aula4Exe3fala1];
    [[mod2Aula4Exe3conversa1 listaDeFalas] addObject: mod2Aula4Exe3fala2];
    [[mod2Aula4Exe3conversa1 listaDeFalas] addObject: mod2Aula4Exe3fala3];
    [[mod2Aula4Exe3conversa1 listaDeFalas] addObject: mod2Aula4Exe3fala4];
    [[mod2Aula4Exe3conversa1 listaDeFalas] addObject: mod2Aula4Exe3fala5];
    [[[mod2Aula3Exe3 mascote] listaDeConversas] addObject: mod2Aula4Exe3conversa1];

    
//TREINAMENTO
    Exercicio *mod2Aula4Exe4 = [[Exercicio alloc] init:202 nome:@"Treinamento" nomeView:@"Mod2Aula4Exe4ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
    //Falas
    Fala *mod2Aula4Exe4fala1 = [[Fala alloc] init];
    mod2Aula4Exe4fala1.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe4fala2 = [[Fala alloc] init];
    mod2Aula4Exe4fala2.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe4fala3 = [[Fala alloc] init];
    mod2Aula4Exe4fala3.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe4fala4 = [[Fala alloc] init];
    mod2Aula4Exe4fala4.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe4fala5 = [[Fala alloc] init];
    mod2Aula4Exe4fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula4Exe4conversa1 = [[Conversa alloc] init];
    [[mod2Aula4Exe4conversa1 listaDeFalas] addObject: mod2Aula4Exe4fala1];
    [[mod2Aula4Exe4conversa1 listaDeFalas] addObject: mod2Aula4Exe4fala2];
    [[mod2Aula4Exe4conversa1 listaDeFalas] addObject: mod2Aula4Exe4fala3];
    [[mod2Aula4Exe4conversa1 listaDeFalas] addObject: mod2Aula4Exe4fala4];
    [[mod2Aula4Exe4conversa1 listaDeFalas] addObject: mod2Aula4Exe4fala5];
    [[[mod2Aula4Exe4 mascote] listaDeConversas] addObject: mod2Aula4Exe4conversa1];

    
//NOVAS IMGS DE NOTAS
    Exercicio *mod2Aula4Exe5 = [[Exercicio alloc] init:202 nome:@"Novas imagens de Notas" nomeView:@"Mod2Aula4Exe5ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula4Exe5fala1 = [[Fala alloc] init];
    mod2Aula4Exe5fala1.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe5fala2 = [[Fala alloc] init];
    mod2Aula4Exe5fala2.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe5fala3 = [[Fala alloc] init];
    mod2Aula4Exe5fala3.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe5fala4 = [[Fala alloc] init];
    mod2Aula4Exe5fala4.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe5fala5 = [[Fala alloc] init];
    mod2Aula4Exe5fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula4Exe5conversa1 = [[Conversa alloc] init];
    [[mod2Aula4Exe5conversa1 listaDeFalas] addObject: mod2Aula4Exe5fala1];
    [[mod2Aula4Exe5conversa1 listaDeFalas] addObject: mod2Aula4Exe5fala2];
    [[mod2Aula4Exe5conversa1 listaDeFalas] addObject: mod2Aula4Exe5fala3];
    [[mod2Aula4Exe5conversa1 listaDeFalas] addObject: mod2Aula4Exe5fala4];
    [[mod2Aula4Exe5conversa1 listaDeFalas] addObject: mod2Aula4Exe5fala5];
    [[[mod2Aula4Exe5 mascote] listaDeConversas] addObject: mod2Aula4Exe5conversa1];
    

//SÍMBOLO DAS PAUSAS
    Exercicio *mod2Aula4Exe6 = [[Exercicio alloc] init:202 nome:@"Simbologia das Pausas" nomeView:@"Mod2Aula4Exe6ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula4Exe6fala1 = [[Fala alloc] init];
    mod2Aula4Exe6fala1.conteudo = @"Lembra da nossa introdução sobre Pausas e que a pausa só possui um pilar que é a duração? Então agora é hora de \"dar nome aos bois\"!";
    
    Fala *mod2Aula4Exe6fala2 = [[Fala alloc] init];
    mod2Aula4Exe6fala2.conteudo = @"As pausas assim como as notas recebem um tipo de imagem que corresponde a sua duração, por exemplo a primeira que vemos é a de 4 tempos e depois a de 2.";
    
    Fala *mod2Aula4Exe6fala3 = [[Fala alloc] init];
    mod2Aula4Exe6fala3.conteudo =  @"Só que nesse caso a diferença não está entre as formas da imagem, mais sim no posicionamento no pentagrama, repare que a pausa de 2 tempos fica encostada na linha de baixo e a de 4 tempos na linha cima";
    
    Fala *mod2Aula4Exe6fala4 = [[Fala alloc] init];
    mod2Aula4Exe6fala4.conteudo =  @"Uma maneira fácil de lembrar a posição certa de cada uma, é que a pausa de duração mais alta fica a cima da de menor tempo. Pois seu pilar duração é maior.";

    Fala *mod2Aula4Exe6fala5 = [[Fala alloc] init];
    mod2Aula4Exe6fala5.conteudo = @"Depois vem a imagem de 1 tempo que tem uma imagem única, como se fosse um raio!";
    
    
    Fala *mod2Aula4Exe6fala6 = [[Fala alloc] init];
    mod2Aula4Exe6fala6.conteudo = @"Agora vai diminuindo os tempos e aparecendo novas imagens, onde segue essa ordem acima!";
    
    Fala *mod2Aula4Exe6fala7 = [[Fala alloc] init];
    mod2Aula4Exe6fala7.conteudo = @"É interessante reparar que depois da nota de 1/2 tempo a imagem se mantém. Porém vai adicionamos \"traços\" ao lado da imagem e a quantidade delas está relacionado ao quanto voçê divide esse 1/2 tempo.";
    
    Fala *mod2Aula4Exe6fala8 = [[Fala alloc] init];
    mod2Aula4Exe6fala8.conteudo = @"Por exemplo, se aparecer 2 \"traços\" ao lado, você está dividindo esse 1/2 tempo em 2, logo vira 1/4 ou 0.25 e assim sucessivamente.";
    
    Fala *mod2Aula4Exe6fala9 = [[Fala alloc] init];
    mod2Aula4Exe6fala9.conteudo = @"Lembrando que as Pausas sempre ficam no meio do Pentagrama, porque elas tem somente o pilar de duração e não o de altura. Assim não se preocupe com seu nome na da escala!";
    
    Fala *mod2Aula4Exe6fala10 = [[Fala alloc] init];
    mod2Aula4Exe6fala10.conteudo = @"Vamos treinar um pouco. Ligue essas imagens de Pausa ao seu respectivo tempo!";
    
    Fala *mod2Aula4Exe6fala11 = [[Fala alloc] init];
    mod2Aula4Exe6fala11.conteudo = @"Muito bem! Agora que você já sabe a simbologia das notas e pausas!";
    
    Conversa *mod2Aula4Exe6conversa1 = [[Conversa alloc] init];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala1];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala2];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala3];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala4];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala5];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala6];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala7];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala8];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala9];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala10];
    [[mod2Aula4Exe6conversa1 listaDeFalas] addObject: mod2Aula4Exe6fala11];
    
    [[[mod2Aula4Exe6 mascote] listaDeConversas] addObject:mod2Aula4Exe6conversa1];
    
    
//RESUMO FINAL
    Exercicio *mod2Aula4Exe7 = [[Exercicio alloc] init:202 nome:@"Resumo final" nomeView:@"Mod2Aula4Exe7ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];

    //Falas
    Fala *mod2Aula4Exe7fala1 = [[Fala alloc] init];
    mod2Aula4Exe7fala1.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe7fala2 = [[Fala alloc] init];
    mod2Aula4Exe7fala2.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe7fala3 = [[Fala alloc] init];
    mod2Aula4Exe7fala3.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe7fala4 = [[Fala alloc] init];
    mod2Aula4Exe7fala4.conteudo = @"FALA";
    
    Fala *mod2Aula4Exe7fala5 = [[Fala alloc] init];
    mod2Aula4Exe7fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula4Exe7conversa1 = [[Conversa alloc] init];
    [[mod2Aula4Exe7conversa1 listaDeFalas] addObject: mod2Aula4Exe7fala1];
    [[mod2Aula4Exe7conversa1 listaDeFalas] addObject: mod2Aula4Exe7fala2];
    [[mod2Aula4Exe7conversa1 listaDeFalas] addObject: mod2Aula4Exe7fala3];
    [[mod2Aula4Exe7conversa1 listaDeFalas] addObject: mod2Aula4Exe7fala4];
    [[mod2Aula4Exe7conversa1 listaDeFalas] addObject: mod2Aula4Exe7fala5];
    [[[mod2Aula4Exe7 mascote] listaDeConversas] addObject: mod2Aula4Exe7conversa1];
    
////////////////////// JOGO PARTITURA //////////////////////////
    
    Exercicio *mod2Aula4Exe7Jogo = [[Exercicio alloc] init:666 nome:@"Jogo Partitura" nomeView:@"JogoEdicaoPartituraViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"iconeJogoPartitura.png"]];
    
    //Falas
    Fala *mod2Aula4Exe7Jogofala1 = [[Fala alloc] init];
    mod2Aula4Exe7Jogofala1.conteudo = @"Agora vamos testar seu conhecimento! Vou mostrar algumas notas e depois você terá que escolher o desenho de tempo na barra acima e sua respectiva linha no pentagrama ";
    
    Fala *mod2Aula4Exe7Jogofala2 = [[Fala alloc] init];
    mod2Aula4Exe7Jogofala2.conteudo = @"----------";
    
    
    //Conversa
    Conversa *mod2Aula4Exe7Jogoconversa1 = [[Conversa alloc] init];
    [[mod2Aula4Exe7Jogoconversa1 listaDeFalas] addObject: mod2Aula4Exe7Jogofala1];
    [[mod2Aula4Exe7Jogoconversa1 listaDeFalas] addObject: mod2Aula4Exe7Jogofala2];
    [[[mod2Aula4Exe7Jogo mascote] listaDeConversas] addObject: mod2Aula4Exe7Jogoconversa1];

    
////////////////////// JOGO PEGAR NOTAS //////////////////////////

    Exercicio *mod2Aula4Exe8Jogo = [[Exercicio alloc] init:666 nome:@"Pegue notas e pausas" nomeView:@"PegarNotasEPausasViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"iconeJogoPegaSimbolos.png"]];
    
    //Falas
    Fala *mod2Aula4Exe8Jogofala1 = [[Fala alloc] init];
    mod2Aula4Exe8Jogofala1.conteudo = @"Já te mostrei todos os símbolos, sua missão agora é coletar apenas o que for pedido na tela. E se deixar passar, já era! ";
    
    
    //Conversa
    Conversa *mod2Aula4Exe8Jogoconversa1 = [[Conversa alloc] init];
    [[mod2Aula4Exe8Jogoconversa1 listaDeFalas] addObject: mod2Aula4Exe8Jogofala1];
    [[mod2Aula4Exe8Jogoconversa1 listaDeFalas] addObject: mod2Aula4Exe8Jogofala1];
    [[[mod2Aula4Exe8Jogo mascote] listaDeConversas] addObject: mod2Aula4Exe8Jogoconversa1];


    
//Aula de Notação nota/pausa
    Aula *mod2Aula4 = [[Aula alloc]init];
    mod2Aula4.nome = @"Notação nota/pausa";
    mod2Aula4.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe1];
//    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe2];
//    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe3];
//    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe4];
//    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe5];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe6];
//    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe7];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe7Jogo];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe8Jogo];

    
////////////////////////////////// Aula 5 //////////////////////////////////////
    
//Exercicios
//INTRODUÇÃO OITAVAS
    Exercicio *mod2Aula5Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Oitavas" nomeView:@"Mod2Aula5Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula5Exe1fala1 = [[Fala alloc] init];
    mod2Aula5Exe1fala1.conteudo = @"FALA";
    
    Fala *mod2Aula5Exe1fala2 = [[Fala alloc] init];
    mod2Aula5Exe1fala2.conteudo = @"FALA";
    
    Fala *mod2Aula5Exe1fala3 = [[Fala alloc] init];
    mod2Aula5Exe1fala3.conteudo = @"FALA";
    
    Fala *mod2Aula5Exe1fala4 = [[Fala alloc] init];
    mod2Aula5Exe1fala4.conteudo = @"FALA";
    
    Fala *mod2Aula5Exe1fala5 = [[Fala alloc] init];
    mod2Aula5Exe1fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula5Exe1conversa1 = [[Conversa alloc] init];
    [[mod2Aula5Exe1conversa1 listaDeFalas] addObject: mod2Aula5Exe1fala1];
    [[mod2Aula5Exe1conversa1 listaDeFalas] addObject: mod2Aula5Exe1fala2];
    [[mod2Aula5Exe1conversa1 listaDeFalas] addObject: mod2Aula5Exe1fala3];
    [[mod2Aula5Exe1conversa1 listaDeFalas] addObject: mod2Aula5Exe1fala4];
    [[mod2Aula5Exe1conversa1 listaDeFalas] addObject: mod2Aula5Exe1fala5];
    [[[mod2Aula5Exe1 mascote] listaDeConversas] addObject: mod2Aula5Exe1conversa1];
    
//Aula de Oitavas
    Aula *mod2Aula5 = [[Aula alloc]init];
    mod2Aula5.nome = @"Oitavas";
    mod2Aula5.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula5 listaDeExercicios]addObject: mod2Aula5Exe1];
    
    
////////////////////////////////// Aula 6 //////////////////////////////////////
    
//Exercicios
//INTRODUÇÃO AS CLAVES
    Exercicio *mod2Aula6Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Claves" nomeView:@"Mod2Aula4Exe6ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula6Exe1fala1 = [[Fala alloc] init];
    mod2Aula6Exe1fala1.conteudo = @"FALA";
    
    Fala *mod2Aula6Exe1fala2 = [[Fala alloc] init];
    mod2Aula6Exe1fala2.conteudo = @"FALA";
    
    Fala *mod2Aula6Exe1fala3 = [[Fala alloc] init];
    mod2Aula6Exe1fala3.conteudo = @"FALA";
    
    Fala *mod2Aula6Exe1fala4 = [[Fala alloc] init];
    mod2Aula6Exe1fala4.conteudo = @"FALA";
    
    Fala *mod2Aula6Exe1fala5 = [[Fala alloc] init];
    mod2Aula6Exe1fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula6Exe1conversa1 = [[Conversa alloc] init];
    [[mod2Aula6Exe1conversa1 listaDeFalas] addObject: mod2Aula6Exe1fala1];
    [[mod2Aula6Exe1conversa1 listaDeFalas] addObject: mod2Aula6Exe1fala2];
    [[mod2Aula6Exe1conversa1 listaDeFalas] addObject: mod2Aula6Exe1fala3];
    [[mod2Aula6Exe1conversa1 listaDeFalas] addObject: mod2Aula6Exe1fala4];
    [[mod2Aula6Exe1conversa1 listaDeFalas] addObject: mod2Aula6Exe1fala5];
    [[[mod2Aula6Exe1 mascote] listaDeConversas] addObject: mod2Aula6Exe1conversa1];
    
//Aula de Claves
    Aula *mod2Aula6 = [[Aula alloc]init];
    mod2Aula6.nome = @"Claves";
    mod2Aula6.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula6 listaDeExercicios]addObject: mod2Aula6Exe1];
    
    
    
////////////////////////////////// Aula 7 //////////////////////////////////////
    
//Exercicios
//INTRODUÇÃO AO COMPASSO
    Exercicio *mod2Aula7Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução ao Compasso" nomeView:@"Mod2Aula7Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];

//Falas
    Fala *mod2Aula7Exe1fala1 = [[Fala alloc] init];
    mod2Aula7Exe1fala1.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe1fala2 = [[Fala alloc] init];
    mod2Aula7Exe1fala2.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe1fala3 = [[Fala alloc] init];
    mod2Aula7Exe1fala3.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe1fala4 = [[Fala alloc] init];
    mod2Aula7Exe1fala4.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe1fala5 = [[Fala alloc] init];
    mod2Aula7Exe1fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula7Exe1conversa1 = [[Conversa alloc] init];
    [[mod2Aula7Exe1conversa1 listaDeFalas] addObject: mod2Aula7Exe1fala1];
    [[mod2Aula7Exe1conversa1 listaDeFalas] addObject: mod2Aula7Exe1fala2];
    [[mod2Aula7Exe1conversa1 listaDeFalas] addObject: mod2Aula7Exe1fala3];
    [[mod2Aula7Exe1conversa1 listaDeFalas] addObject: mod2Aula7Exe1fala4];
    [[mod2Aula7Exe1conversa1 listaDeFalas] addObject: mod2Aula7Exe1fala5];
    [[[mod2Aula7Exe1 mascote] listaDeConversas] addObject: mod2Aula7Exe1conversa1];
    
    
//NÚMERO DE COMPASSO
    Exercicio *mod2Aula7Exe2 = [[Exercicio alloc] init:201 nome:@"Número de Compasso" nomeView:@"Mod2Aula7Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
//Falas
    Fala *mod2Aula7Exe2fala1 = [[Fala alloc] init];
    mod2Aula7Exe2fala1.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe2fala2 = [[Fala alloc] init];
    mod2Aula7Exe2fala2.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe2fala3 = [[Fala alloc] init];
    mod2Aula7Exe2fala3.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe2fala4 = [[Fala alloc] init];
    mod2Aula7Exe2fala4.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe2fala5 = [[Fala alloc] init];
    mod2Aula7Exe2fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula7Exe2conversa1 = [[Conversa alloc] init];
    [[mod2Aula7Exe2conversa1 listaDeFalas] addObject: mod2Aula7Exe2fala1];
    [[mod2Aula7Exe2conversa1 listaDeFalas] addObject: mod2Aula7Exe2fala2];
    [[mod2Aula7Exe2conversa1 listaDeFalas] addObject: mod2Aula7Exe2fala3];
    [[mod2Aula7Exe2conversa1 listaDeFalas] addObject: mod2Aula7Exe2fala4];
    [[mod2Aula7Exe2conversa1 listaDeFalas] addObject: mod2Aula7Exe2fala5];
    [[[mod2Aula7Exe2 mascote] listaDeConversas] addObject: mod2Aula7Exe2conversa1];
    
    
//UNIDADE DE TEMPO
    Exercicio *mod2Aula7Exe3 = [[Exercicio alloc] init:201 nome:@"Unidade de Tempo" nomeView:@"Mod2Aula7Exe3ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"logoPrata.png"]];
    
    //Falas
    Fala *mod2Aula7Exe3fala1 = [[Fala alloc] init];
    mod2Aula7Exe3fala1.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe3fala2 = [[Fala alloc] init];
    mod2Aula7Exe3fala2.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe3fala3 = [[Fala alloc] init];
    mod2Aula7Exe3fala3.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe3fala4 = [[Fala alloc] init];
    mod2Aula7Exe3fala4.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe3fala5 = [[Fala alloc] init];
    mod2Aula7Exe3fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula7Exe3conversa1 = [[Conversa alloc] init];
    [[mod2Aula7Exe3conversa1 listaDeFalas] addObject: mod2Aula7Exe3fala1];
    [[mod2Aula7Exe3conversa1 listaDeFalas] addObject: mod2Aula7Exe3fala2];
    [[mod2Aula7Exe3conversa1 listaDeFalas] addObject: mod2Aula7Exe3fala3];
    [[mod2Aula7Exe3conversa1 listaDeFalas] addObject: mod2Aula7Exe3fala4];
    [[mod2Aula7Exe3conversa1 listaDeFalas] addObject: mod2Aula7Exe3fala5];
    [[[mod2Aula7Exe3 mascote] listaDeConversas] addObject: mod2Aula7Exe3conversa1];
    
    
//FÓRMULA DE COMPASSO
    Exercicio *mod2Aula7Exe4 = [[Exercicio alloc] init:201 nome:@"Fórmula de Compasso" nomeView:@"Mod2Aula7Exe4ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"logoPrata.png"]];
    
    //Falas
    Fala *mod2Aula7Exe4fala1 = [[Fala alloc] init];
    mod2Aula7Exe3fala1.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe4fala2 = [[Fala alloc] init];
    mod2Aula7Exe3fala2.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe4fala3 = [[Fala alloc] init];
    mod2Aula7Exe3fala3.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe4fala4 = [[Fala alloc] init];
    mod2Aula7Exe3fala4.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe4fala5 = [[Fala alloc] init];
    mod2Aula7Exe3fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula7Exe4conversa1 = [[Conversa alloc] init];
    [[mod2Aula7Exe4conversa1 listaDeFalas] addObject: mod2Aula7Exe4fala1];
    [[mod2Aula7Exe4conversa1 listaDeFalas] addObject: mod2Aula7Exe4fala2];
    [[mod2Aula7Exe4conversa1 listaDeFalas] addObject: mod2Aula7Exe4fala3];
    [[mod2Aula7Exe4conversa1 listaDeFalas] addObject: mod2Aula7Exe4fala4];
    [[mod2Aula7Exe4conversa1 listaDeFalas] addObject: mod2Aula7Exe4fala5];
    [[[mod2Aula7Exe4 mascote] listaDeConversas] addObject: mod2Aula7Exe4conversa1];
    
    
//COMPLEMENTO
    Exercicio *mod2Aula7Exe5 = [[Exercicio alloc] init:201 nome:@"Complemento" nomeView:@"Mod2Aula7Exe5ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
    //Falas
    Fala *mod2Aula7Exe5fala1 = [[Fala alloc] init];
    mod2Aula7Exe5fala1.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe5fala2 = [[Fala alloc] init];
    mod2Aula7Exe5fala2.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe5fala3 = [[Fala alloc] init];
    mod2Aula7Exe5fala3.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe5fala4 = [[Fala alloc] init];
    mod2Aula7Exe5fala4.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe5fala5 = [[Fala alloc] init];
    mod2Aula7Exe5fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula7Exe5conversa1 = [[Conversa alloc] init];
    [[mod2Aula7Exe5conversa1 listaDeFalas] addObject: mod2Aula7Exe5fala1];
    [[mod2Aula7Exe5conversa1 listaDeFalas] addObject: mod2Aula7Exe5fala2];
    [[mod2Aula7Exe5conversa1 listaDeFalas] addObject: mod2Aula7Exe5fala3];
    [[mod2Aula7Exe5conversa1 listaDeFalas] addObject: mod2Aula7Exe5fala4];
    [[mod2Aula7Exe5conversa1 listaDeFalas] addObject: mod2Aula7Exe5fala5];
    [[[mod2Aula7Exe5 mascote] listaDeConversas] addObject: mod2Aula7Exe5conversa1];
    
    
//COMPASSO GESTUAL
    Exercicio *mod2Aula7Exe6 = [[Exercicio alloc] init:201 nome:@"Compasso Gestual" nomeView:@"Mod2Aula7Exe6ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
    //Falas
    Fala *mod2Aula7Exe6fala1 = [[Fala alloc] init];
    mod2Aula7Exe6fala1.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe6fala2 = [[Fala alloc] init];
    mod2Aula7Exe6fala2.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe6fala3 = [[Fala alloc] init];
    mod2Aula7Exe6fala3.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe6fala4 = [[Fala alloc] init];
    mod2Aula7Exe6fala4.conteudo = @"FALA";
    
    Fala *mod2Aula7Exe6fala5 = [[Fala alloc] init];
    mod2Aula7Exe6fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula7Exe6conversa1 = [[Conversa alloc] init];
    [[mod2Aula7Exe6conversa1 listaDeFalas] addObject: mod2Aula7Exe6fala1];
    [[mod2Aula7Exe6conversa1 listaDeFalas] addObject: mod2Aula7Exe6fala2];
    [[mod2Aula7Exe6conversa1 listaDeFalas] addObject: mod2Aula7Exe6fala3];
    [[mod2Aula7Exe6conversa1 listaDeFalas] addObject: mod2Aula7Exe6fala4];
    [[mod2Aula7Exe6conversa1 listaDeFalas] addObject: mod2Aula7Exe6fala5];
    [[[mod2Aula7Exe6 mascote] listaDeConversas] addObject: mod2Aula7Exe6conversa1];
    
//Aula de Compasso
    Aula *mod2Aula7 = [[Aula alloc]init];
    mod2Aula7.nome = @"Compasso";
    mod2Aula7.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe1];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe2];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe3];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe4];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe5];
    [[mod2Aula7 listaDeExercicios]addObject: mod2Aula7Exe6];
    
    
    
////////////////////////////////// Aula 8 //////////////////////////////////////
    
//Exercicios
//RESUMO PARTITURA
    Exercicio *mod2Aula8Exe1 = [[Exercicio alloc] init:201 nome:@"Resumo de Partitura" nomeView:@"Mod2Aula8Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"logoPrata.png"]];
    
    //Falas
    Fala *mod2Aula8Exe1fala1 = [[Fala alloc] init];
    mod2Aula8Exe1fala1.conteudo = @"FALA";
    
    Fala *mod2Aula8Exe1fala2 = [[Fala alloc] init];
    mod2Aula8Exe1fala2.conteudo = @"FALA";
    
    Fala *mod2Aula8Exe1fala3 = [[Fala alloc] init];
    mod2Aula8Exe1fala3.conteudo = @"FALA";
    
    Fala *mod2Aula8Exe1fala4 = [[Fala alloc] init];
    mod2Aula8Exe1fala4.conteudo = @"FALA";
    
    Fala *mod2Aula8Exe1fala5 = [[Fala alloc] init];
    mod2Aula8Exe1fala5.conteudo = @"FALA";
    
    //Conversa
    Conversa *mod2Aula8Exe1conversa1 = [[Conversa alloc] init];
    [[mod2Aula8Exe1conversa1 listaDeFalas] addObject: mod2Aula8Exe1fala1];
    [[mod2Aula8Exe1conversa1 listaDeFalas] addObject: mod2Aula8Exe1fala2];
    [[mod2Aula8Exe1conversa1 listaDeFalas] addObject: mod2Aula8Exe1fala3];
    [[mod2Aula8Exe1conversa1 listaDeFalas] addObject: mod2Aula8Exe1fala4];
    [[mod2Aula8Exe1conversa1 listaDeFalas] addObject: mod2Aula8Exe1fala5];
    [[[mod2Aula8Exe1 mascote] listaDeConversas] addObject: mod2Aula8Exe1conversa1];
    
//Aula de Claves
    Aula *mod2Aula8 = [[Aula alloc]init];
    mod2Aula8.nome = @"Claves";
    mod2Aula8.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula8 listaDeExercicios]addObject: mod2Aula8Exe1];
    
    
///////////////////////////// Modulo Intermediario //////////////////////////////////
    
    //Cria o modulo Intermediario
    Modulo *moduloIntermediario = [[Modulo alloc]init];
    moduloIntermediario.nome = @"Intermediario";
    moduloIntermediario.capa = [UIImage imageNamed:@"escadaModulo.png"];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula1];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula2];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula3];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula4];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula5];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula6];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula7];
    [[moduloIntermediario listaDeAulas]addObject: mod2Aula8];
    
    //Adiciona o Modulo dentro da biblioteca
    [[self listaDeModulos]addObject: moduloIntermediario];
    
}

-(void)instanciaAulasDoProjeto{
    [self instanciaModuloIniciante];
    [self instanciaModuloIntermediario];
}



@end
