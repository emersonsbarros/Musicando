//
//  LeituraPartituraViewController.m
//  Musicando
//
//  Created by Vinicius Resende Fialho on 08/07/14.
//  Copyright (c) 2014 EMERSON DE SOUZA BARROS. All rights reserved.
//

#import "LeituraPartituraViewController.h"

@interface LeituraPartituraViewController ()

@end

@implementation LeituraPartituraViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}


-(void)viewDidDisappear:(BOOL)animated{
    [[Sinfonia sharedManager]pararPlayerPartitura];
}


-(void)atualizaBarraScroll{
    if([Sinfonia sharedManager].compassoAtual < [Sinfonia sharedManager].numeroTotalCompassos){
        if (([Sinfonia sharedManager].compassoAtual % 8 == 0)&&([Sinfonia sharedManager].compassoAtual != self.auxContadorScroll)){
            self.auxContadorScroll = [Sinfonia sharedManager].compassoAtual;
            CGPoint bottomOffset = CGPointMake(0,[[Sinfonia sharedManager]contadorScrollDesloca]);
            [[self scroll] setContentOffset:bottomOffset animated:YES];
            [Sinfonia sharedManager].contadorScrollDesloca += 500;
        }
    }
}

-(void)addItensDesenhoPartituraAoScroll{
    
    [[DesenhaPartitura sharedManager]metodosDesenhaPartitura];
    
    self.scroll.delegate = self;
    
    [[self scroll] setContentSize:CGSizeMake(self.scroll.bounds.size.width, self.scroll.bounds.size.height* ([[[Sinfonia sharedManager]numeroCompassos] floatValue]))];
    
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensColunaPentagrama) {
        [[self scroll]addSubview:t];
    }
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaImagensTracoPentagrama) {
        [[self scroll]addSubview:t];
    }
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaArmadurasClave) {
        [[self scroll]addSubview:t];
    }
    
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].textoNomePartitura];
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].textoNomeInstrumento];
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].tipoClave];
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].textoNumeroTempo];
    [[self scroll]addSubview:[DesenhaPartitura sharedManager].textoUnidadeTempo];
    
    for (Nota *t in [[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]) {
        [[self scroll]addSubview:t.imagemNota];
    }
    for (Nota *t in [[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]) {
        [[self scroll]addSubview:t.imagemAcidente];
    }
    
    for (Nota *t in [[[[Sinfonia sharedManager]listaPartiturasSinfonia]objectAtIndex:0]listaNotasPartitura]) {
        if([t.pontoNota isEqualToString:@"1"]){
            [[self scroll]addSubview:t.imagePontoNota];
        }
    }
    
    for (UIImageView *t in [DesenhaPartitura sharedManager].listaTracoNotas) {
        [[self scroll]addSubview:t];
    }
    
    
    [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(atualizaTextoDescricaoNota) userInfo:nil repeats:YES];
    
    
}

-(void)removeViewDoScroll{

    [Sinfonia sharedManager].compassoAtual = 0;
    [Sinfonia sharedManager].contadorScrollDesloca = 500;
    [Sinfonia sharedManager].controleVelocidaTranNota = 0.5;
    [[self scroll] setContentOffset:CGPointMake(0,0) animated:YES];
    for (UIView *subView in self.scroll.subviews){
        [subView removeFromSuperview];
    }
    
}

-(void)atualizaAlteraTempo{
    
    self.textoDescricaoVelocidade.text = [NSString stringWithFormat:@"%0.2f",[[Sinfonia sharedManager]controleVelocidaTranNota]];
    
}


- (void) viewDidLoad{
        
    [Sinfonia sharedManager].contadorScrollDesloca = 500;
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(atualizaBarraScroll) userInfo:nil repeats:YES];
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(atualizaAlteraTempo) userInfo:nil repeats:YES];
    
    self.auxTabelaHidden = NO;
    self.nomePartituraAtual = @"asa";
    [self carregaListaPartituras];
    
}

- (IBAction)btnTabelaPartituras:(id)sender {
    
    
    if(self.auxTabelaHidden){
        
        self.viewTabelaPartituras.hidden = NO;
        self.auxTabelaHidden = NO;
        CATransition* transition = [CATransition animation];
        transition.duration = 1.5;
        transition.type = kCATransitionReveal;
        transition.subtype = kCATransitionFromTop;
        [self.viewTabelaPartituras.layer addAnimation:transition forKey:kCATransition];
        
        self.viewTabelaPartituras.frame = CGRectMake(self.viewTabelaPartituras.frame.origin.x-self.viewTabelaPartituras.frame.size.width,
                                                     self.viewTabelaPartituras.frame.origin.y,
                                                     self.viewTabelaPartituras.frame.size.width,
                                                     self.viewTabelaPartituras.frame.size.height);
        
    }else{
        self.viewTabelaPartituras.hidden = YES;
        self.auxTabelaHidden = YES;
        
        CATransition* transition = [CATransition animation];
        transition.duration = 1.5;
        transition.type = kCATransitionReveal;
        transition.subtype = kCATransitionFromLeft;
        [self.viewTabelaPartituras.layer addAnimation:transition forKey:kCATransition];
        
        self.viewTabelaPartituras.frame = CGRectMake(self.viewTabelaPartituras.frame.origin.x+self.viewTabelaPartituras.frame.size.width,
                                                     self.viewTabelaPartituras.frame.origin.y,
                                                     self.viewTabelaPartituras.frame.size.width,
                                                     self.viewTabelaPartituras.frame.size.height);
        

        
    }
    
    
}



- (IBAction)tocar:(id)sender {
    [self removeViewDoScroll];
    [[Sinfonia sharedManager] metodoIniciaSinfonia:self.nomePartituraAtual:@"Piano"];
    [self addItensDesenhoPartituraAoScroll];
    
}


- (IBAction)tocarViolao:(id)sender {
    [self removeViewDoScroll];
    [[Sinfonia sharedManager] metodoIniciaSinfonia:self.nomePartituraAtual:@"natural"];
    [self addItensDesenhoPartituraAoScroll];
    
}


- (IBAction)tocarFlauta:(id)sender {
    [self removeViewDoScroll];
    [[Sinfonia sharedManager] metodoIniciaSinfonia:self.nomePartituraAtual:@"FlautaDoce"];
    [self addItensDesenhoPartituraAoScroll];
}


- (IBAction)botaoPause:(id)sender {
    [[Sinfonia sharedManager]pausePlayerPartitura];
}

- (IBAction)botaoStop:(id)sender {
    [[Sinfonia sharedManager]repetePlayerPartitura];
    [[self scroll] setContentOffset:CGPointMake(0,0) animated:YES];
    
}

- (IBAction)botaoPlay:(id)sender {
    [[Sinfonia sharedManager]tocarPlayerPartitura];
}

-(void)atualizaTextoDescricaoNota{
    self.textoDescricaoNota.text = [[Sinfonia sharedManager]textoDescricaoNota];
}

- (IBAction)botaoAlteraVelocidade:(id)sender {
    UIStepper *stepper = (UIStepper *) sender;
    
    stepper.maximumValue = 0.95;
    stepper.minimumValue = 0;
    stepper.stepValue = 0.05;
    
    stepper.continuous = YES;
    stepper.autorepeat =YES;
    
    [Sinfonia sharedManager].controleVelocidaTranNota = stepper.value;
    
}

//////////////// TABELA /////////////////////

-(void)carregaListaPartituras{
    self.listaPartituras = [[NSMutableArray alloc]init];
    //[self.listaPartituras addObject:@"Video_Games_ENDING"];
    [self.listaPartituras addObject:@"5th_Symphony"];
    [self.listaPartituras addObject:@"asa"];
    //[self.listaPartituras addObject:@"atireiGato"];
    [self.listaPartituras addObject:@"Bachviolao"];
    [self.listaPartituras addObject:@"Beethoven-Fur Elise"];
    //[self.listaPartituras addObject:@"caribe"];
    [self.listaPartituras addObject:@"cavaleiros"];
    [self.listaPartituras addObject:@"chefao"];
    [self.listaPartituras addObject:@"et"];
    [self.listaPartituras addObject:@"fantasma"];
    [self.listaPartituras addObject:@"ghost"];
    //[self.listaPartituras addObject:@"harry_potter_theme_song"];
    [self.listaPartituras addObject:@"heyjude"];
    [self.listaPartituras addObject:@"indiana"];
    //[self.listaPartituras addObject:@"kokiri-forest"];
    [self.listaPartituras addObject:@"lepo"];
    //[self.listaPartituras addObject:@"mario"];
    //[self.listaPartituras addObject:@"lepo"];
    [self.listaPartituras addObject:@"Mozart-Marcha Turca"];
    [self.listaPartituras addObject:@"natal"];
    [self.listaPartituras addObject:@"ninar"];
    //[self.listaPartituras addObject:@"nokia"];
    [self.listaPartituras addObject:@"palmeiras"];
    [self.listaPartituras addObject:@"parabens"];
    //[self.listaPartituras addObject:@"simpson"];
    //[self.listaPartituras addObject:@"Song_of_Storms"];
    [self.listaPartituras addObject:@"ticofuba"];
    [self.listaPartituras addObject:@"titanic"];
    //[self.listaPartituras addObject:@"vitoria"];
}

//Números de seções
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//Número de linhas por seção
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listaPartituras.count;
}


//Preeche a tabela de rotas
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Display recipe in the table cell
    NSString *recipe = [self.listaPartituras objectAtIndex:[indexPath row]];
    //[[cell textLabel] setFont:[UIFont systemFontOfSize:30.0]];
    cell.textLabel.font = [UIFont fontWithName:@"Papyrus" size:30.0f];
    cell.textLabel.textColor = [UIColor colorWithRed:(22/255.f) green:(29/255.f) blue:(189/255.f) alpha:1.0];
    [[cell textLabel]setText:recipe];

    
    return cell;
    
   
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.nomePartituraAtual = [self.listaPartituras objectAtIndex: [indexPath row]];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Lista de Partituras"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}


@end
