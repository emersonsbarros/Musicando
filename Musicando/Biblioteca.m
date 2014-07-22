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
    Exercicio *mod1Aula1Exe1 = [[Exercicio alloc] init:101 nome:@"Introdução a Música" nomeView:@"Mod1Aula1Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
//Falas do Mascote
    //Falas
    Fala *mod1Aula1Exe1fala1 = [[Fala alloc] init];
    mod1Aula1Exe1fala1.conteudo = @"Bem vindo ao Musicando, eu sou o Lálá e aqui você aprenderá como funciona a musica e os segredos das Partituras.";
    
    Fala *mod1Aula1Exe1fala2 = [[Fala alloc] init];
    mod1Aula1Exe1fala2.conteudo = @"Você terminará essa jornada tendo um amplo conhecimento em partituras e a importancia da musica nas nossas vidas! Então vamos lá!!";
    
    Fala *mod1Aula1Exe1fala3 = [[Fala alloc] init];
    mod1Aula1Exe1fala3.conteudo = @"A musica é a manifestação artística e cultural de um povo usado para expressar os sentimentos onde tudo pode ser transformada nela, duvida? vou te provar!";
    
    Fala *mod1Aula1Exe1fala4 = [[Fala alloc] init];
    mod1Aula1Exe1fala4.conteudo = @"Este é o nosso Toca Treco, um carinha que toca o som de todo tipo de objeto jogado nele e ainda pode misturalos";
    
    Fala *mod1Aula1Exe1fala5 = [[Fala alloc] init];
    mod1Aula1Exe1fala5.conteudo = @"Agora arraste esses objetos para a entrada do nosso Toca Treco e vamos a magica!";
    
    Fala *mod1Aula1Exe1fala6 = [[Fala alloc] init];
    mod1Aula1Exe1fala6.conteudo = @"Muito Bem! Agora abaixe a alavanca e veja a musica acontecer da forma mais inesperada";
    
    Fala *mod1Aula1Exe1fala7 = [[Fala alloc] init];
    mod1Aula1Exe1fala7.conteudo = @"É isso ai! Eu não falei que qualquer coisa podia se tornar musica, e ainda á pessoas que conseguem fazer musica utilizando objetos bem esquisitos, quer ver?";
    
    Fala *mod1Aula1Exe1fala8 = [[Fala alloc] init];
    mod1Aula1Exe1fala8.conteudo = @"Jogue os intems esquisitos acima no toca treco e veja a musica rolar, é de se supreender!";
    
    Fala *mod1Aula1Exe1fala9 = [[Fala alloc] init];
    mod1Aula1Exe1fala9.conteudo = @"Ah como eu amo a musica, ela é muito importante não só no lazer, mais ajuda tambem em terapias, estimula o aprendizado e até na melhora em casos de doenca";
    
    Fala *mod1Aula1Exe1fala10 = [[Fala alloc] init];
    mod1Aula1Exe1fala10.conteudo = @"Vamos comecar nossa jornada!, como o grande professor Suzuki falava,'não precisa nascer com o dom para musica, todos podem aprender com a vontade!'";
    
    
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
    
    
//Aula de Musicalização
    Aula *mod1Aula1 = [[Aula alloc]init];
    mod1Aula1.nome = @"Musicalização";
    mod1Aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula1 listaDeExercicios]addObject: mod1Aula1Exe1];

    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
//Exercícios
    Exercicio *mod1Aula2Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução ao Som" nomeView:@"Mod1Aula2Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
//Falas do Mascote
    Fala *mod1Aula2Exe1fala1 = [[Fala alloc] init];
    mod1Aula2Exe1fala1.conteudo = @"Agora nos falaremos um pouco sobre o som, ele é uma vibraca de algum corpo que se propaga em ondas no ar, meio complicado neh? Vou te explicar com um exemplo!";
    
    Fala *mod1Aula2Exe1fala2 = [[Fala alloc] init];
    mod1Aula2Exe1fala2.conteudo = @"Agora bata a colher na panela, e veja as vibracoes emitidas pelo objeto";
    
    Fala *mod1Aula2Exe1fala3 = [[Fala alloc] init];
    mod1Aula2Exe1fala3.conteudo = @"Como voce observou, todas as vibracoes penetram em nossos ouvidos e provocacam algum som, porem alguns lugares não propaga como o vacuo do espaco onde tem auxencia de ar, que é o meio em que a vibracao passa até chegar no ouvido";
    
    Fala *mod1Aula2Exe1fala4 = [[Fala alloc] init];
    mod1Aula2Exe1fala4.conteudo = @"Agora falando um pouco mais intimamente, o som pode ser divido em 4 pilastres: Altura, Duracao, Intesidade e Timbre!";
    
    //Conversa
    Conversa *mod1Aula2Exe1conversa1 = [[Conversa alloc] init];
    [[mod1Aula2Exe1conversa1 listaDeFalas] addObject: mod1Aula2Exe1fala1];
    [[mod1Aula2Exe1conversa1 listaDeFalas] addObject: mod1Aula2Exe1fala2];
    [[mod1Aula2Exe1conversa1 listaDeFalas] addObject: mod1Aula2Exe1fala3];
    [[mod1Aula2Exe1conversa1 listaDeFalas] addObject: mod1Aula2Exe1fala4];
    [[[mod1Aula2Exe1 mascote] listaDeConversas] addObject: mod1Aula2Exe1conversa1];
    
//----------------------------------------------------------------------------------------------------------//

//Exercícios
    Exercicio *mod1Aula2Exe2 = [[Exercicio alloc] init:102 nome:@"Pilares do Som" nomeView:@"Mod1Aula2Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
//Falas do Mascote
    Fala *mod1Aula2Exe2fala1 = [[Fala alloc] init];
    mod1Aula2Exe2fala1.conteudo = @"O primeiro pilastre que vamos falar é a Altura, esse pilar mede a quantidade de vibracoes de um objeto, ou seja o quanto ele é agudo ou grave, vou explicar melhor!";
    
    Fala *mod1Aula2Exe2fala2 = [[Fala alloc] init];
    mod1Aula2Exe2fala2.conteudo = @"Jogue esses Objetos dentro do Toca Treco e veja o que ele vai responder sobre a vibracao do objeto";
    
    Fala *mod1Aula2Exe2fala3 = [[Fala alloc] init];
    mod1Aula2Exe2fala3.conteudo = @"Como voce viu dependendo da quantidade de vibracoes a altura do objeto pode sair um som agudo ou grave, sendo quanto maior, maior o nivel de agudo";
    
    Fala *mod1Aula2Exe2fala4 = [[Fala alloc] init];
    mod1Aula2Exe2fala4.conteudo = @"Observe esses graficos acima, e os jogue para o Toca Treco captar a vibracao e observe a resposta para cada objeto!";
    
    Fala *mod1Aula2Exe2fala5 = [[Fala alloc] init];
    mod1Aula2Exe2fala5.conteudo = @"Como voce observou quanto mais ondinhas tiver em um trecho, maior será o agudo e a frequencia, que é a quantidade de ocorrencias de alguma coisa em determinado intervalo, acima temos um grafico com frequencia 2 e outro 1, logo a primeira figura é mais aguda";
    
    Fala *mod1Aula2Exe2fala6 = [[Fala alloc] init];
    mod1Aula2Exe2fala6.conteudo = @"Agora vamos aprender outro Pilar, o timbre que é a capacidade que nos faz descobrir a origem de algum som e está relacionada a forma das ondinhas do grafico.";
    
    Fala *mod1Aula2Exe2fala7 = [[Fala alloc] init];
    mod1Aula2Exe2fala7.conteudo = @"Agora toque nos pontos pretos acima e tente associalos ao seu respectivos instrumento arrastando as plaquinhas para em cima do ponto";
    
    Fala *mod1Aula2Exe2fala8 = [[Fala alloc] init];
    mod1Aula2Exe2fala8.conteudo = @"Como eu tinha falado no comeco, o que faz diferenciar o timbre na frequencia é o formato das ondas como voce observa as imagens a cima";
    
    Fala *mod1Aula2Exe2fala9 = [[Fala alloc] init];
    mod1Aula2Exe2fala9.conteudo = @"Mais um pilar é importante falar, se o som aumentar alguem vai reclamar!, e é exatamente dessa rima que vem nosso outro carinha, a chamada Intensidade, ou melhor o Volume";
    
    Fala *mod1Aula2Exe2fala10 = [[Fala alloc] init];
    mod1Aula2Exe2fala10.conteudo = @"Como observou a Intesidade é o volume do som, onde maior a intensidade, maior o volume do seu som, agora arraste um som descolado no Toca Treco e aumente a intesidade";
    
    Fala *mod1Aula2Exe2fala11 = [[Fala alloc] init];
    mod1Aula2Exe2fala11.conteudo = @"A intensidade na frequencia é representada pela amplitude que está desenhada no grafico acima, onde quando maior o seu comprimento, maior será o volume.";
    
    Fala *mod1Aula2Exe2fala12 = [[Fala alloc] init];
    mod1Aula2Exe2fala12.conteudo = @"Por fim chegamos ao nosso ultimo pilar, a duracao que é nada mais que o tempo em que o som é feito";
    
    Fala *mod1Aula2Exe2fala13 = [[Fala alloc] init];
    mod1Aula2Exe2fala13.conteudo = @"A animacao acima descreve bem como a duracao funciona, toque nos animais e veja a tartaruga fazendo um som mais longo e a lebre fazendo o som mais rapido, ambos possuem uma duracao mais com tempos diferentes!";

    
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


//----------------------------------------------------------------------------------------------------------//
    
//Aula de Som
    Aula *mod1Aula2 = [[Aula alloc]init];
    mod1Aula2.nome = @"Som";
    mod1Aula2.capa = [UIImage imageNamed:@"aula.png"];
    [[mod1Aula2 listaDeExercicios]addObject: mod1Aula2Exe1];
    [[mod1Aula2 listaDeExercicios]addObject: mod1Aula2Exe2];
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
//Exercícios
//INTRODUÇÃO MUSICAL
    Exercicio *mod1Aula3Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução Musical" nomeView:@"Mod1Aula3Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];

//Falas
    Fala *mod1Aula3Exe1fala1 = [[Fala alloc] init];
    mod1Aula3Exe1fala1.conteudo = @"Agora que já temos uma ideia do que é música e som. Vamos aprender como a música é formada, quais são seus componentes e o papel de cada uma.";
    
    Fala *mod1Aula3Exe1fala2 = [[Fala alloc] init];
    mod1Aula3Exe1fala2.conteudo = @"De uma forma sucinta a música é um conjunto ou somatória de sons e silêncios. No tocatreco ao adicionarmos esses elementos sua saída pode ser considerada música.";
    
    Fala *mod1Aula3Exe1fala3 = [[Fala alloc] init];
    mod1Aula3Exe1fala3.conteudo = @"Desse resultado podemos perceber cada elemento da música, Clique em próximo novamente";
    
    Fala *mod1Aula3Exe1fala4 = [[Fala alloc] init];
    mod1Aula3Exe1fala4.conteudo = @"O pequeno mascote apontado representa o som e o intervalo entre um som e outro, os silêncios são as pausas";
    
    Fala *mod1Aula3Exe1fala5 = [[Fala alloc] init];
    mod1Aula3Exe1fala5.conteudo = @"Para memorizar agora vamos para um teste. Qual desses conjuntos representa o significado de música?";
    
    Fala *mod1Aula3Exe1fala6 = [[Fala alloc] init];
    mod1Aula3Exe1fala6.conteudo = @"Agora já sabe um pouco mais do que é a música";
    
    //Conversa
    Conversa *mod1Aula3Exe1conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala1];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala2];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala3];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala4];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala5];
    [[mod1Aula3Exe1conversa1 listaDeFalas] addObject: mod1Aula3Exe1fala6];
    [[[mod1Aula3Exe1 mascote] listaDeConversas] addObject: mod1Aula3Exe1conversa1];
    
//RITMO
    Exercicio *mod1Aula3Exe2 = [[Exercicio alloc] init:102 nome:@"Ritmo" nomeView:@"Mod1Aula3Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];

//Falas
    Fala *mod1Aula3Exe2fala1 = [[Fala alloc] init];
    mod1Aula3Exe2fala1.conteudo = @"Pra falarmos de ritmo, talvez a primeira coisa que venha a sua mente é estilo como rock ou samba. Mas você o que diferencia cada um?";
    
    Fala *mod1Aula3Exe2fala2 = [[Fala alloc] init];
    mod1Aula3Exe2fala2.conteudo = @"Você já deve ter ouvido essa música muito conhecida XXX, mas talvez nunca percebeu que ela pode ser apresentar de várias maneiras dependendo do ritmo. Clique em cada uma ao lado e veja diferença.";
    
    Fala *mod1Aula3Exe2fala3 = [[Fala alloc] init];
    mod1Aula3Exe2fala3.conteudo = @"É nítido que de acordo com o ritmo a velocidade e tempo da música é alterada, se você se lembra do tocatreco clique em cada um e veja a diferença na saída da música.";
    
    Fala *mod1Aula3Exe2fala4 = [[Fala alloc] init];
    mod1Aula3Exe2fala4.conteudo = @"Agora para exercitar me responda, qual dessas figuras corresponde ao ritmo na música?";
    
    Fala *mod1Aula3Exe2fala5 = [[Fala alloc] init];
    mod1Aula3Exe2fala5.conteudo = @"Rápido, devagar, alegre ou sonolento. Cada ritmo desempenha...";
    
//Conversa
    Conversa *mod1Aula3Exe2conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala1];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala2];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala3];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala4];
    [[mod1Aula3Exe2conversa1 listaDeFalas] addObject: mod1Aula3Exe2fala5];
    [[[mod1Aula3Exe2 mascote] listaDeConversas] addObject: mod1Aula3Exe2conversa1];

//MELODIA
    Exercicio *mod1Aula3Exe3 = [[Exercicio alloc] init:102 nome:@"Melodia" nomeView:@"Mod1Aula3Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];

//Falas
    Fala *mod1Aula3Exe3fala1 = [[Fala alloc] init];
    mod1Aula3Exe3fala1.conteudo = @"Descobrimos como uma música é formada e como o ritmo pode alterar seu tempo e velocidade. Vamos agora saber onde se encaixa.";
    
    Fala *mod1Aula3Exe3fala2 = [[Fala alloc] init];
    mod1Aula3Exe3fala2.conteudo = @"Entenda por melodia como sons ou notas tocados e cantados SEPARADAMENTE, sempre uma nota por vez. Veja abaixo o exemplo dos tocatrecos, clique em cada um.";
    
    Fala *mod1Aula3Exe3fala3 = [[Fala alloc] init];
    mod1Aula3Exe3fala3.conteudo = @"Para fixar, sabendo que a melodia ocorre equando notas são tocadas individualmente. Qual dos instrumentos abaixo tem essa caracteristica?";
    
    Fala *mod1Aula3Exe3fala4 = [[Fala alloc] init];
    mod1Aula3Exe3fala4.conteudo = @"Notas em fila ou sons simultaneos, a melodia aparece...";
    
//Conversa
    Conversa *mod1Aula3Exe3conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala1];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala2];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala3];
    [[mod1Aula3Exe3conversa1 listaDeFalas] addObject: mod1Aula3Exe3fala4];
    [[[mod1Aula3Exe3 mascote] listaDeConversas] addObject: mod1Aula3Exe3conversa1];

//HARMONIA
    Exercicio *mod1Aula3Exe4 = [[Exercicio alloc] init:102 nome:@"Harmonia" nomeView:@"Mod1Aula3Exe4ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
//Falas
    Fala *mod1Aula3Exe4fala1 = [[Fala alloc] init];
    mod1Aula3Exe4fala1.conteudo = @"Agora vamos falar um pouco sobre harmonia!";
    
    Fala *mod1Aula3Exe4fala2 = [[Fala alloc] init];
    mod1Aula3Exe4fala2.conteudo = @"De uma forma simples a harmonia é justamente o contrário da melodia. São sons tocados ao mesmo tempo, contíunos, dando fluidez a m'suica";
    
    Fala *mod1Aula3Exe4fala3 = [[Fala alloc] init];
    mod1Aula3Exe4fala3.conteudo = @"Quer ver a diferença? Arraste a nota separada que é a melodia e depois a harmonia que são vários sons juntos.";
    
    Fala *mod1Aula3Exe4fala4 = [[Fala alloc] init];
    mod1Aula3Exe4fala4.conteudo = @"Notou que na harmonia há esse conjunto de sons, e a melodia parece apenas uma sequência cada um tocada de uma vez?";
    
    Fala *mod1Aula3Exe4fala5 = [[Fala alloc] init];
    mod1Aula3Exe4fala5.conteudo = @"Assim como para a melodia, existem maneiras de tocar os instrumentos que exemplificam bem a harmonia. Arraste e veja a diferença entre os acordes harmoniosos do violão para a escala feita na flauta";
    
    Fala *mod1Aula3Exe4fala6 = [[Fala alloc] init];
    mod1Aula3Exe4fala6.conteudo = @"Viu como não há segredo na harmonia, daqui algumas aulas você mesmo já poderá testar e usar o que aprendeu. E até a próxima!";
    
    //Conversa
    Conversa *mod1Aula3Exe4conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala1];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala2];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala3];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala4];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala5];
    [[mod1Aula3Exe4conversa1 listaDeFalas] addObject: mod1Aula3Exe4fala6];
    [[[mod1Aula3Exe4 mascote] listaDeConversas] addObject:mod1Aula3Exe4conversa1];
 
//POLIFONIA
    Exercicio *mod1Aula3Exe5 = [[Exercicio alloc] init:102 nome:@"Polifonia" nomeView:@"Mod1Aula3Exe5ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];
    
//Falas
    Fala *mod1Aula3Exe5fala1 = [[Fala alloc] init];
    mod1Aula3Exe5fala1.conteudo = @"Você pode não saber, mas provavelmente já vem aprendendo um pouco sobre o que é polifonia...";
    
    Fala *mod1Aula3Exe5fala2 = [[Fala alloc] init];
    mod1Aula3Exe5fala2.conteudo = @"A definição é simples. Some a tal da melodia com a harmonia que acabou de aprender.";
    
    Fala *mod1Aula3Exe5fala3 = [[Fala alloc] init];
    mod1Aula3Exe5fala3.conteudo = @"Quer ver o que acontece? Arraste as duas ao Toca Treco!";
    
    Fala *mod1Aula3Exe5fala4 = [[Fala alloc] init];
    mod1Aula3Exe5fala4.conteudo = @"É simples assim. A polifonia é a junção de melodia com harmonia";
    
    Fala *mod1Aula3Exe5fala5 = [[Fala alloc] init];
    mod1Aula3Exe5fala5.conteudo = @"Assim como na harmonia conseguimos perceber a polifonia em instrumentos, o teclado é um deles. Que pode fazer uma batida eletrônica enquanto toca sua melodia. Arraste para o tocatreco e veja novamente.";
    
    Fala *mod1Aula3Exe5fala6 = [[Fala alloc] init];
    mod1Aula3Exe5fala6.conteudo = @"Viu que não tem segredo?";
    
    Fala *mod1Aula3Exe5fala7 = [[Fala alloc] init];
    mod1Aula3Exe5fala7.conteudo = @"Talvez não seja tão comum e veja poucas vezes durante o aprendizado. Mas agora já sabe o que é, e quando surge a Polifonia. Até a próxima.";

    
    //Conversa
    Conversa *mod1Aula3Exe5conversa1 = [[Conversa alloc] init];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala1];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala2];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala3];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala4];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala5];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala6];
    [[mod1Aula3Exe5conversa1 listaDeFalas] addObject: mod1Aula3Exe5fala7];
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
//PERCEPÇÃO MUSICAL
    Exercicio *mod1Aula4Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução a Percepção Musical" nomeView:@"Mod1Aula4Exe1ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];

//Falas
    Fala *mod1Aula4Exe1fala1 = [[Fala alloc] init];
    mod1Aula4Exe1fala1.conteudo = @"Bem, até aqui você já aprendeu sobre importantes elementos da música. Agora uma importante dica para continuar a aprender é praticar sua percepção musical...";
    
    Fala *mod1Aula4Exe1fala2 = [[Fala alloc] init];
    mod1Aula4Exe1fala2.conteudo = @"Não se assuste, porque não é nada de outro mundo. Percepção musical, é quando você identifica os elementos que fazem parte da música. Lembra do som, ritmo, melodia (e outras divisões) que vimos lá atrás?";
    
    Fala *mod1Aula4Exe1fala3 = [[Fala alloc] init];
    mod1Aula4Exe1fala3.conteudo = @"Justamente quando você 'percebe' cada um é tal da Percepção musical. Veja o que acontece quando arrasta cada elemento para o toca treco.";
    
    Fala *mod1Aula4Exe1fala4 = [[Fala alloc] init];
    mod1Aula4Exe1fala4.conteudo = @"Viu? O tocatreco é consegue saber o que cada elemento representa com sua percepção musical.";
    
    Fala *mod1Aula4Exe1fala5 = [[Fala alloc] init];
    mod1Aula4Exe1fala5.conteudo = @"Você deve se atentar a sempre perceber esses três elementos. Assim como no somo, imagine os como pilares...";
    
    Fala *mod1Aula4Exe1fala6 = [[Fala alloc] init];
    mod1Aula4Exe1fala6.conteudo = @"Não tem segredo. Quanto mais você ouvir, aprender e praticar a música melhor sua percepção musical ficará!";
    
//Conversa
    Conversa *mod1Aula4Exe1conversa1 = [[Conversa alloc] init];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala1];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala2];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala3];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala4];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala5];
    [[mod1Aula4Exe1conversa1 listaDeFalas] addObject: mod1Aula4Exe1fala6];
    [[[mod1Aula4Exe1 mascote] listaDeConversas] addObject: mod1Aula4Exe1conversa1];

    
//Aula de Percepção Musical
    Aula *mod1Aula4 = [[Aula alloc]init];
    mod1Aula4.nome = @"Percepção Musical";
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
    Exercicio *mod2Aula1Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução à Notas" nomeView:@"Mod2Aula1Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula1Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando as Notas" nomeView:@"Mod2Aula1Exe2ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula1Exe3 = [[Exercicio alloc] init:202 nome:@"História das Notas" nomeView:@"Mod2Aula1Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Notas
    Aula *mod2Aula1 = [[Aula alloc]init];
    mod2Aula1.nome = @"Notas";
    mod2Aula1.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe1];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe2];
    [[mod2Aula1 listaDeExercicios]addObject: mod2Aula1Exe3];

    
    
////////////////////////////////// Aula 2 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula2Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Pausas" nomeView:@"Mod2Aula2Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula2Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando Pausas" nomeView:@"Mod2Aula2Exe12ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Pausas
    Aula *mod2Aula2 = [[Aula alloc]init];
    mod2Aula2.nome = @"Pausas";
    mod2Aula2.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula2 listaDeExercicios]addObject: mod2Aula2Exe1];
    [[mod2Aula2 listaDeExercicios]addObject: mod2Aula2Exe2];
    
    
////////////////////////////////// Aula 3 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula3Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução ao Pentagrama" nomeView:@"Mod2Aula3Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula3Exe2 = [[Exercicio alloc] init:202 nome:@"Exercitando" nomeView:@"Mod2Aula3Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula3Exe3 = [[Exercicio alloc] init:202 nome:@"Pentagrama, como surgiu?" nomeView:@"Mod2Aula3Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Pentagrama
    Aula *mod2Aula3 = [[Aula alloc]init];
    mod2Aula3.nome = @"Pentagrama";
    mod2Aula3.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe1];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe2];
    [[mod2Aula3 listaDeExercicios]addObject: mod2Aula3Exe3];


////////////////////////////////// Aula 4 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula4Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução a simbologia das notas" nomeView:@"Mod2Aula4Exe1ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe2 = [[Exercicio alloc] init:202 nome:@"Apresentando a Imagem das notas" nomeView:@"Mod2Aula4Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe3 = [[Exercicio alloc] init:202 nome:@"Treinando com Imagem das notas" nomeView:@"Mod2Aula4Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe4 = [[Exercicio alloc] init:202 nome:@"Treinamento" nomeView:@"Mod2Aula4Exe4ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe5 = [[Exercicio alloc] init:202 nome:@"Novas imagens de Notas" nomeView:@"Mod2Aula4Exe5ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe6 = [[Exercicio alloc] init:202 nome:@"Introdução aos símbolos das pausas" nomeView:@"Mod2Aula4Exe6ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula4Exe7 = [[Exercicio alloc] init:202 nome:@"Resumo final" nomeView:@"Mod2Aula4Exe7ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];

    
//Aula de Notação nota/pausa
    Aula *mod2Aula4 = [[Aula alloc]init];
    mod2Aula4.nome = @"Notação nota/pausa";
    mod2Aula4.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe1];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe2];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe3];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe4];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe5];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe6];
    [[mod2Aula4 listaDeExercicios]addObject: mod2Aula4Exe7];

    
////////////////////////////////// Aula 5 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula5Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Oitavas" nomeView:@"Mod2Aula5Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Oitavas
    Aula *mod2Aula5 = [[Aula alloc]init];
    mod2Aula5.nome = @"Oitavas";
    mod2Aula5.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula5 listaDeExercicios]addObject: mod2Aula5Exe1];
    
    
////////////////////////////////// Aula 6 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula6Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução às Claves" nomeView:@"Mod2Aula4Exe6ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Claves
    Aula *mod2Aula6 = [[Aula alloc]init];
    mod2Aula6.nome = @"Claves";
    mod2Aula6.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula6 listaDeExercicios]addObject: mod2Aula6Exe1];
    
    
    
////////////////////////////////// Aula 7 //////////////////////////////////////
    
//Exercicios
    Exercicio *mod2Aula7Exe1 = [[Exercicio alloc] init:201 nome:@"Introdução ao Compasso" nomeView:@"Mod2Aula7Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe2 = [[Exercicio alloc] init:201 nome:@"Número de Compasso" nomeView:@"Mod2Aula7Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe3 = [[Exercicio alloc] init:201 nome:@"Unidade de Tempo" nomeView:@"Mod2Aula7Exe3ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe4 = [[Exercicio alloc] init:201 nome:@"Fórmula de Compasso" nomeView:@"Mod2Aula7Exe4ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe5 = [[Exercicio alloc] init:201 nome:@"Complemento" nomeView:@"Mod2Aula7Exe5ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    Exercicio *mod2Aula7Exe6 = [[Exercicio alloc] init:201 nome:@"Compasso Gestual" nomeView:@"Mod2Aula7Exe6ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
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
    Exercicio *mod2Aula8Exe1 = [[Exercicio alloc] init:201 nome:@"Resumo de Partitura" nomeView:@"Mod2Aula8Exe1ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
//Aula de Claves
    Aula *mod2Aula8 = [[Aula alloc]init];
    mod2Aula8.nome = @"Claves";
    mod2Aula8.capa = [UIImage imageNamed:@"aula.png"];
    [[mod2Aula8 listaDeExercicios]addObject: mod2Aula8Exe1];
    
    
///////////////////////////// Modulo Intermediario //////////////////////////////////
    
    //Cria o modulo Intermediario
    Modulo *moduloIntermediario = [[Modulo alloc]init];
    moduloIntermediario.nome = @"Intermediario";
    moduloIntermediario.capa = [UIImage imageNamed:@"escada.png"];
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
