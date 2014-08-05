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

-(void)chamaOProximoExercicio:(UIViewController*)viewAntiga :(NSString*)nomeDaViewAtual{
    
    Exercicio *prox = [self retornaIndiceExercicioModuloBasico:nomeDaViewAtual];
    id object = [[NSClassFromString(prox.nomeView) alloc]initWithNibName:[prox nomeView] bundle:nil];
    [Biblioteca sharedManager].exercicioAtual = prox;
    
    CATransition* transition = [CATransition animation];
    transition.duration = 1.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [viewAntiga.view.window.layer addAnimation:transition forKey:kCATransition];
    [viewAntiga presentViewController:object animated:NO completion:nil];

}

-(NSString*)retornaONomeDaProximaAula:(NSString*)nomeDaViewAtual{
    Exercicio *prox = [self retornaIndiceExercicioModuloBasico:nomeDaViewAtual];
    return prox.nome;
}

-(void)chamaViewTransicaoExercicio:(UIViewController*)viewProxAula :(NSString*)nomeDaViewAtual{
    TransicaoExercicioViewController *trans = [[TransicaoExercicioViewController alloc]init];
    
    CATransition* transition = [CATransition animation];
    transition.duration = 1.5;
    transition.type = kCATransitionFade;
    transition.subtype = kCATransitionFromBottom;
    [viewProxAula.view.window.layer addAnimation:transition forKey:kCATransition];
    [viewProxAula presentViewController:trans animated:NO completion:nil];

}

-(Exercicio*)retornaIndiceExercicioModuloBasico:(NSString*)nomeView{
    
    NSMutableArray *aux = [[NSMutableArray alloc]init];
    
    for(Modulo *mod in [self listaDeModulos]){
        for(Aula *aulas in mod.listaDeAulas){
            for(Exercicio *exerRetorna in aulas.listaDeExercicios){
                [aux addObject:exerRetorna];
            }
        }
    }
    
    for(int i=0;i<aux.count-1;i++){
        Exercicio *exerRetorna = [aux objectAtIndex:i];
        if([exerRetorna.nomeView isEqualToString:nomeView]){
            exerRetorna = [aux objectAtIndex:i+1];
            return exerRetorna;
        }
    }
    
    return NULL;
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
    mod1Aula2Exe2fala7.conteudo = @"Agora toque nos pontos pretos acima e tente associalos ao seu respectivos instrumento arrastando os Objetos para em cima do ponto";
    
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
    mod1Aula3Exe1fala1.conteudo = @"Agora que já temos uma ideia de como a música está presente em nossa vida, e também o que é o som. Vamos aprender como a música é formada e quais são seus componentes.";
    
    Fala *mod1Aula3Exe1fala2 = [[Fala alloc] init];
    mod1Aula3Exe1fala2.conteudo = @"Numa mistura de SILÊNCIOS e SONS, a música nasce como a soma desses dois... Díficil de imaginar?";
    
    Fala *mod1Aula3Exe1fala3 = [[Fala alloc] init];
    mod1Aula3Exe1fala3.conteudo = @"Veja como tocatreco cria música com essa junção!";
    
    Fala *mod1Aula3Exe1fala4 = [[Fala alloc] init];
    mod1Aula3Exe1fala4.conteudo = @"É simples assim! Ao entrar sons + pausas o tocatreco faz a música. E com qualquer instrumento, também funcionará assim.";
    
    Fala *mod1Aula3Exe1fala5 = [[Fala alloc] init];
    mod1Aula3Exe1fala5.conteudo = @"Já pra fixarmos cada elemento, vamos para definição de cada um!";
    
    Fala *mod1Aula3Exe1fala6 = [[Fala alloc] init];
    mod1Aula3Exe1fala6.conteudo = @"O pequeno mascote apontado representa o SOM, e o intervalo entre um som e outro são os silêncios, ou as chamadas as pausas.";
    
    Fala *mod1Aula3Exe1fala7 = [[Fala alloc] init];
    mod1Aula3Exe1fala7.conteudo = @"Para memorizar vamos para um teste. Qual desses conjuntos na tela pode 'representar' a definição de música?";
    
    Fala *mod1Aula3Exe1fala8 = [[Fala alloc] init];
    mod1Aula3Exe1fala8.conteudo = @"Acho que agora já sabemos melhor o que é a música, o que acha de entramos no 'mundo' dos ritmos?";
    
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
    Exercicio *mod1Aula3Exe2 = [[Exercicio alloc] init:102 nome:@"Ritmo" nomeView:@"Mod1Aula3Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];

//Falas
    Fala *mod1Aula3Exe2fala1 = [[Fala alloc] init];
    mod1Aula3Exe2fala1.conteudo = @"Quando ouvimos falar sobre RITMO, talvez a primeira coisa que venha na nossa mente é estilo como rock ou samba. Mas você já parou pra pensar, o que diferencia cada um?";
    
    Fala *mod1Aula3Exe2fala2 = [[Fala alloc] init];
    mod1Aula3Exe2fala2.conteudo = @"O ritmo é o movimento dos sons regulados pela sua maior ou menor duração. Pode ser considerado um condutor dos sons conforme o tempo e velocidade que são tocados. Ainda díficil de entender?";
    
    Fala *mod1Aula3Exe2fala3 = [[Fala alloc] init];
    mod1Aula3Exe2fala3.conteudo = @"Os batimentos cardíacos para seu bom funcionamento necessitam sempre estar coordenados com velocidade e tempo para que o fluxo seja bombeado e o movimento do coração seja executado constantemente. Isso também é ritmo, e através dele esse processo acontece!";
    
    Fala *mod1Aula3Exe2fala4 = [[Fala alloc] init];
    mod1Aula3Exe2fala4.conteudo = @"Voltando ao ritmos ligamos à estilos musicais, realmente eles tem uma relação. Uns são mais rápidos como Rock, outros mais suaves como Clássico. Vamos ver um exemplo de alguns deles...";
    
    Fala *mod1Aula3Exe2fala5 = [[Fala alloc] init];
    mod1Aula3Exe2fala5.conteudo = @"Você já deve ter ouvido a música 'Parabéns pra você' pelo menos uma dezena de vezes na vida, mas talvez nunca percebeu que ela pode ser apresentar de várias maneiras dependendo do ritmo. Dúvida? Clique em cada um acima e veja a diferença.";
    
    Fala *mod1Aula3Exe2fala6 = [[Fala alloc] init];
    mod1Aula3Exe2fala6.conteudo = @"Percebe que a diferênça acontece diretamente na execução, pode parecer até músicas diferente. E em tese realmente são, pois de acordo com o RITMO a velocidade e tempo da música é alterada.";
    
    Fala *mod1Aula3Exe2fala7 = [[Fala alloc] init];
    mod1Aula3Exe2fala7.conteudo = @"Veja mais uma vez essa diferença de velocidade e tempo no tocatreco. Clique em cada um, e veja a saída da música.";
    
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
    Exercicio *mod1Aula3Exe3 = [[Exercicio alloc] init:102 nome:@"Melodia" nomeView:@"Mod1Aula3Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];

//Falas
    Fala *mod1Aula3Exe3fala1 = [[Fala alloc] init];
    mod1Aula3Exe3fala1.conteudo = @"Já descobrimos como a música é formada e como o ritmo a coordena, mas você chegou a pensar de onde vem esse sentido musical, será realmente que acontece só com vários sons ou pausas tocadas?";
    
    Fala *mod1Aula3Exe3fala2 = [[Fala alloc] init];
    mod1Aula3Exe3fala2.conteudo = @"Agora é hora de saber onde esse elementos se encaixam...";
    
    Fala *mod1Aula3Exe3fala3 = [[Fala alloc] init];
    mod1Aula3Exe3fala3.conteudo = @"Melodia são sons emitidos SEPARADAMENTE, uma sucessão que dá sentido e fluidez na música. Isso mesmo, sempre que uma nota por vez é tocada em sequência de acordo com o ritmo, surge a melodia!";
    
    Fala *mod1Aula3Exe3fala4 = [[Fala alloc] init];
    mod1Aula3Exe3fala4.conteudo = @"Imagine uma fila de notas e pausas sendo lideradas pelo ritmo, e uma à uma são tocadas criando esse sentido.";
    
    Fala *mod1Aula3Exe3fala5 = [[Fala alloc] init];
    mod1Aula3Exe3fala5.conteudo = @"O conceito é simples, vamos ver em seguida um exemplo nos tocatrecos.";
    
    Fala *mod1Aula3Exe3fala6 = [[Fala alloc] init];
    mod1Aula3Exe3fala6.conteudo = @"O primeiro tocatreco representa bem a melodia, com cada nota sendo tocada. Já o segundo contém a harmonia, porém já acresenta outros elementos que veremos mais pra frente, daí a diferença.";
    
    Fala *mod1Aula3Exe3fala7 = [[Fala alloc] init];
    mod1Aula3Exe3fala7.conteudo = @"Você deve memorizar que a melodia é fluidez de sons contínuos, e assim conseguirá diferenciar quando ela aparece.";
    
    Fala *mod1Aula3Exe3fala8 = [[Fala alloc] init];
    mod1Aula3Exe3fala8.conteudo = @"Para fixar, sabendo que a melodia ocorre equando notas são tocadas individualmente. Qual dos instrumentos abaixo tem essa caracteristica?";
    
    Fala *mod1Aula3Exe3fala9 = [[Fala alloc] init];
    mod1Aula3Exe3fala9.conteudo = @"Notas em fila ou sons simultâneos, a melodia aparece em toda música. Porém ela ainda terá o auxilio de outros 'colegas'. Vamos para a Harmonia!";
    
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
    Exercicio *mod1Aula3Exe4 = [[Exercicio alloc] init:102 nome:@"Harmonia" nomeView:@"Mod1Aula3Exe4ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
//Falas
    Fala *mod1Aula3Exe4fala1 = [[Fala alloc] init];
    mod1Aula3Exe4fala1.conteudo = @"Agora vamos falar um pouco sobre harmonia, que é um dos chamados 'elementos constitutivos e fundamentais' da música!";
    
    Fala *mod1Aula3Exe4fala2 = [[Fala alloc] init];
    mod1Aula3Exe4fala2.conteudo = @"Para nossa felicidade, a harmonia é justamente o contrário da melodia. São sons tocados ao mesmo tempo, contíunos, que também dão fluidez a música tocada. Díficil?";
    
    Fala *mod1Aula3Exe4fala3 = [[Fala alloc] init];
    mod1Aula3Exe4fala3.conteudo = @"Imagine sons interligados, só que diferentemente da melodia, temos blocos de notas que ocupam o mesmo 'tempo' na música.";
    
    Fala *mod1Aula3Exe4fala4 = [[Fala alloc] init];
    mod1Aula3Exe4fala4.conteudo = @"Quer ver a diferença? Arraste a nota separada que representa a melodia, e depois a harmonia que são vários sons juntos. E ouça cada uma!";
    
    Fala *mod1Aula3Exe4fala5 = [[Fala alloc] init];
    mod1Aula3Exe4fala5.conteudo = @"Notou que na harmonia parece vários sons juntos, e já na melodia dá a impressão de apenas uma sequência cada um tocada de uma vez?";
    
    Fala *mod1Aula3Exe4fala6 = [[Fala alloc] init];
    mod1Aula3Exe4fala6.conteudo = @"Agora vamos para os instrumentos. Assim como mostrei na melodia, existem técnicas de tocar instrumentos que exemplificam bem a harmonia.";
    
    Fala *mod1Aula3Exe4fala7 = [[Fala alloc] init];
    mod1Aula3Exe4fala7.conteudo = @"Arraste  cada um e veja a diferença entre os acordes harmoniosos do violão para a escala feita na flauta.";
    
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
    [[[mod1Aula3Exe4 mascote] listaDeConversas] addObject:mod1Aula3Exe4conversa1];
 
//POLIFONIA
    Exercicio *mod1Aula3Exe5 = [[Exercicio alloc] init:102 nome:@"Polifonia" nomeView:@"Mod1Aula3Exe5ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];
    
//Falas
    Fala *mod1Aula3Exe5fala1 = [[Fala alloc] init];
    mod1Aula3Exe5fala1.conteudo = @"Você pode não saber, mas já vem aprendendo um pouco sobre o que é polifonia...";
    
    Fala *mod1Aula3Exe5fala2 = [[Fala alloc] init];
    mod1Aula3Exe5fala2.conteudo = @"A definição é simples. Basta somar a MELODIA com a HARMONIA, que acabou de aprender. É isso mesmo! A polifonia ocorre sempre que temos a melodia e harmonia ao mesmo tempo. Meio complicado, ainda?";
    
    Fala *mod1Aula3Exe5fala3 = [[Fala alloc] init];
    mod1Aula3Exe5fala3.conteudo = @"Vamos ao tocatreco ver o que acontece!";
    
    Fala *mod1Aula3Exe5fala4 = [[Fala alloc] init];
    mod1Aula3Exe5fala4.conteudo = @"O pequeno mascote representa a melodia, já as outras notas representam a harmonia. Arraste-os ao tocatreco!";
    
    Fala *mod1Aula3Exe5fala5 = [[Fala alloc] init];
    mod1Aula3Exe5fala5.conteudo = @"Quando o tocatreco toca as duas, ocorre a tal polifonia. Juntando os sons indivuais numa escala e conjuntos de sons num acorde.";
    
    Fala *mod1Aula3Exe5fala6 = [[Fala alloc] init];
    mod1Aula3Exe5fala6.conteudo = @"Assim como na harmonia conseguimos perceber a polifonia em instrumentos. O teclado elétrico é um deles, que pode fazer uma batida eletrônica enquanto toca sua melodia.";
    
    Fala *mod1Aula3Exe5fala7 = [[Fala alloc] init];
    mod1Aula3Exe5fala7.conteudo = @"Vamos ver, arraste para o tocatreco e como ele faz essa mistura.";
    
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
//PERCEPÇÃO MUSICAL
    Exercicio *mod1Aula4Exe1 = [[Exercicio alloc] init:102 nome:@"Introdução a Percepção Musical" nomeView:@"Mod1Aula4Exe1ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];

//Falas
    Fala *mod1Aula4Exe1fala1 = [[Fala alloc] init];
    mod1Aula4Exe1fala1.conteudo = @"Até aqui já aprendemos importantes elementos da música. Agora para continuar a aprender, veremos porque é bom praticar sua percepção musical.";
    
    Fala *mod1Aula4Exe1fala2 = [[Fala alloc] init];
    mod1Aula4Exe1fala2.conteudo = @"Não é nada de outro mundo. Percepção musical, é quando identificamos os elementos que fazem parte da música. Você lembra do ritmo, melodia e harmonia que dão fluidez e controlam o tempo da música?";
    
    Fala *mod1Aula4Exe1fala3 = [[Fala alloc] init];
    mod1Aula4Exe1fala3.conteudo = @"Justamente quando você 'percebe' cada um deles na música, é a chamada da Percepção musical.";

    
    Fala *mod1Aula4Exe1fala4 = [[Fala alloc] init];
    mod1Aula4Exe1fala4.conteudo = @"Aqui temos elementos que representam o RITMO, MELODIA e HARMONIA. Veja o que acontece no placar lá em cima, quando você arrastar-los para o tocatreco.";
    
    
    Fala *mod1Aula4Exe1fala5 = [[Fala alloc] init];
    mod1Aula4Exe1fala5.conteudo = @"Viu? O tocatreco consegue identificar o que cada elemento representa com sua 'percepção musical'.";
    
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


    //Falas do Mascote
    //Falas
    Fala *mod1Aula1Exe1fala1 = [[Fala alloc] init];
    mod1Aula1Exe1fala1.conteudo = @"Agora vamos comecar a entrar no mundo das partituras, mais antes vamos falar sobre Notas!";
    
    Fala *mod1Aula1Exe1fala2 = [[Fala alloc] init];
    mod1Aula1Exe1fala2.conteudo = @"Lembra aquela nossa aula sobre som, a nota musical pode ser chamanda assim, porem el retorna uma frequencia unica, meio confuso né, vamos a pratica";
    
    Fala *mod1Aula1Exe1fala3 = [[Fala alloc] init];
    mod1Aula1Exe1fala3.conteudo = @"Toca nas teclas do Piano acima e veja que cada tecla corresponde a uma nota musical com uma frequencia constante, com um som unico e sem alteracoes";
    
    Fala *mod1Aula1Exe1fala4 = [[Fala alloc] init];
    mod1Aula1Exe1fala4.conteudo = @"Assim como o som, a nota tem a sua duracao, o seu timbre depedendo do intrumento, a intensidade do volume, e a altura que é quando o som é grave ou agudo!";
    
    Fala *mod1Aula1Exe1fala5 = [[Fala alloc] init];
    mod1Aula1Exe1fala5.conteudo = @"Para dividir essas notas com os 4 pilastres aprendidos até agora, criaram escalas para ajudar na aprendizagem e evitar erros de interpretacao, onde podemos imaginalá como uma escada!";
    
    Fala *mod1Aula1Exe1fala6 = [[Fala alloc] init];
    mod1Aula1Exe1fala6.conteudo = @"Essa escala é divida em 7 notas, cada uma com seus respectivos pilares que as fazem diferenciar uma da outra, vamos ao exemplo";
    
    Fala *mod1Aula1Exe1fala7 = [[Fala alloc] init];
    mod1Aula1Exe1fala7.conteudo = @"De um toque em cada imagem do mascote de baixo para cima e veja como uma se difere da outra, observe que quanto mais alto fica na escada, mais a nota fica aguda";
    
    Fala *mod1Aula1Exe1fala8 = [[Fala alloc] init];
    mod1Aula1Exe1fala8.conteudo = @"Observamos que ao passar de cada degrau da escada, a nossa nota fica cada vez mais aguda e menos grave assim alterando a altura, logo juntando com os outros 3 pilastres essas notas formam uma escala!";
    
    Fala *mod1Aula1Exe1fala9 = [[Fala alloc] init];
    mod1Aula1Exe1fala9.conteudo = @"Essas notas divididas dentro de uma escala ganham o nome aqui no Brasil de Dó – ré – mi – fá – sol – Lá – si";
    
    Fala *mod1Aula1Exe1fala10 = [[Fala alloc] init];
    mod1Aula1Exe1fala10.conteudo = @"É interessante falar que em outros paises essas notas podem ganhar outro nome, como o EUA que usam os termos C – D – E – F – G – A – B para dividir as notas de uma escala";
    
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
Exercicio *mod2Aula1Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando as Notas" nomeView:@"Mod2Aula1Exe2ViewController" experiencia:10 pontuacaoMaxima:10 :[UIImage imageNamed:@"exercicios.png"]];

    //Falas do Mascote
    //Falas
    Fala *mod1Aula1Exe2fala1 = [[Fala alloc] init];
    mod1Aula1Exe2fala1.conteudo = @"Agora vamos gravar bem o nome e a ordem dessas divisioes da escala";
    
    Fala *mod1Aula1Exe2fala2 = [[Fala alloc] init];
    mod1Aula1Exe2fala2.conteudo = @"Então repita comigo Dó-Ré-Mi-Fa-So-La-Si! e acompanhe o audio";
    
    Fala *mod1Aula1Exe2fala3 = [[Fala alloc] init];
    mod1Aula1Exe2fala3.conteudo = @"Ache dentro dessa sopa de letras o nome das 7 notas abrendidas até agora!";
    
    Fala *mod1Aula1Exe2fala4 = [[Fala alloc] init];
    mod1Aula1Exe2fala4.conteudo = @"Heh Jow, É isso ai!, agora que voce já tem uma nocão, tente colocar as notas das plaquinhas acima na ordem correta em que aprendemos até aqui, parra isso arraste para os pontos pretos acima cada plaquinha";
    
    Fala *mod1Aula1Exe2fala5 = [[Fala alloc] init];
    mod1Aula1Exe2fala5.conteudo = @"Oh ou! temos um problema o Toca Treco está Maluco e está jogando notas que não existem, e sua funcao e não deixar sair notas com os nomes errados, sempre que aparecer um nome diferente faca um gesto igual a imagem acima!";
    
    Fala *mod1Aula1Exe2fala6 = [[Fala alloc] init];
    mod1Aula1Exe2fala6.conteudo = @"Ufa! voce conseguiu arrumar o Toca Treco, imagina a chiadeira dele fazendo notas que não existem!";

    
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
    
  Exercicio *mod2Aula1Exe3 = [[Exercicio alloc] init:203 nome:@"História das Notas" nomeView:@"Mod2Aula1Exe3ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
    //Falas do Mascote
    //Falas
    
    Fala *mod2Aula1Exe3fala0 = [[Fala alloc] init];
    mod2Aula1Exe3fala0.conteudo = @"Bem, agora vamos falar um poquinho sobre a historia das notas Musicais, muitos tentaram chegar a um padrão mais somente no fim dos anos 1000 que chegaram ao que nós usamos hoje!";

    Fala *mod2Aula1Exe3fala1 = [[Fala alloc] init];
    mod2Aula1Exe3fala1.conteudo = @"A principio elas foram criadas por um Monge chamado Guido de Arezzo, que tirou de uma letra de musica latim os nomes das notas em homenagem ao Santo João";
    
    Fala *mod2Aula1Exe3fala2 = [[Fala alloc] init];
    mod2Aula1Exe3fala2.conteudo = @"Ele percebeu que com a criacao de uma simples escala musical, facilitaria o aprendizado dos alunos e diminuia possiveis erros de interpretacoes de obras";
    
    Fala *mod2Aula1Exe3fala3 = [[Fala alloc] init];
    mod2Aula1Exe3fala3.conteudo = @"Porem só bem depois no seculo 17 foi revisto os nomes das notas e a nota Dó foi criada e colocada no lugar do Ut!";
    
    Fala *mod2Aula1Exe3fala4 = [[Fala alloc] init];
    mod2Aula1Exe3fala4.conteudo = @"Realmente as historias por parte da Musica me deixam muito curioso, ainda veremos mais ao longo da nossa Jornada!";
    
    
    
    //Conversa
    Conversa *mod2Aula1Exe3conversa1 = [[Conversa alloc] init];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala0];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala1];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala2];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala3];
    [[mod2Aula1Exe3conversa1 listaDeFalas] addObject: mod2Aula1Exe3fala4];
    
    [[[mod2Aula1Exe3 mascote] listaDeConversas] addObject:mod2Aula1Exe3conversa1];
    
    
////////////////////////////////
    
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
    

//Falas do Mascote
    //Falas
    Fala *mod2Aula2Exe1fala1 = [[Fala alloc] init];
    mod2Aula2Exe1fala1.conteudo = @"Agora falaremos sobre Pausas, elas são basicamente silencios que fazem por determinado tempo! Logo elas são diferentes de Sons ou Notas já que só possuem um pilar, a duracao!";
    
    Fala *mod2Aula2Exe1fala2 = [[Fala alloc] init];
    mod2Aula2Exe1fala2.conteudo = @"A Pausa é um assunto bem simples mais de muita importancia, já que junto com as notas constroem um ritmo! Jogue as 2 Musicas no Toca Treco e observe com pausa e sem pausa como ritmo fica";
    
    Fala *mod2Aula2Exe1fala3 = [[Fala alloc] init];
    mod2Aula2Exe1fala3.conteudo = @"Dentro do mundo da Musica as pausas podem se dividir em diversos tempos, ou seja o tempo de silencio que ela pode ter";
    
    Fala *mod2Aula2Exe1fala4 = [[Fala alloc] init];
    mod2Aula2Exe1fala4.conteudo = @"Agora toque nos pontos pretos e veja o que acontece, e depois associe ao 3 elementos: Pausa, Som, Nota!";
    
    Fala *mod2Aula2Exe1fala5 = [[Fala alloc] init];
    mod2Aula2Exe1fala5.conteudo = @"Muito bem! Agora vamos aprofundar mais um pouco que daqui a pouco viram os Pentagramas!";
    
    
//Conversa
    Conversa *mod2Aula2Exe1conversa1 = [[Conversa alloc] init];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala1];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala2];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala3];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala4];
    [[mod2Aula2Exe1conversa1 listaDeFalas] addObject: mod2Aula2Exe1fala5];
 
    
    [[[mod2Aula2Exe1 mascote] listaDeConversas] addObject:mod2Aula2Exe1conversa1];

//////////////////////////// EXERCICIOS 2 ////////////////////////
    
Exercicio *mod2Aula2Exe2 = [[Exercicio alloc] init:202 nome:@"Praticando Pausas" nomeView:@"Mod2Aula2Exe2ViewController" experiencia:10 pontuacaoMaxima:10  :[UIImage imageNamed:@"exercicios.png"]];
    
    
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
