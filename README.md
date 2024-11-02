- 1 - CRUD - Controle de investimentos

- 2 - INTRODUÇÃO
  
Será desenvolvido um aplicativo para controle de investimentos, podendo cadastrar invesimentos feitos (Comprando ou vendendo) e visualizar o quanto já foi aplicado.

- 3 - REQUISITOS DO SISTEMA

- 3.1 - REQUISITOS FUNCIONAIS:

RF001 - Cadastrar investimentos: O sistema deve cadastrar novos investimentos que o usuário fez.

RF002 - Visualizar investimentos criados: O sistena deve ter uma pagina para visualização dos investimentos feitos.

RF003 - Atualizar investimentos: O sistema deve ter uma tela para atualizar os investinmentos, por exemplo, vendendo as açoes ou comprando mais. 
(Em função do meu tema, esse requisito funcionará como o editar do CRUD, pois faz mais sentido do que a edição da ação.)

RF004 - O sistema deve permitir o cadastro de investimentos digitando os mesmos.

RF005 - O usuário deve poder informar a quantidade, preço e data de compra dos ativos.

RF006 - O sistema deve exibir uma visão geral da carteira com saldo atual e rentabilidade.

- 3.2 - REQUISITOS NÃO FUNCIONAIS: 

RNF001 - Banco de dados Firebase: Devido a um dos pontos a ser avaliado ser o conhecimento em Firebase.

RNF002 - A interface deve ser intuitiva e fácil de navegar, com foco na experiência do usuário (UX).

- 4 - DESCRIÇÃO DA ARQUITETURA DO SISTEMA
  Arquitetura: Monolito
  
  A arquitetura monolítica é um modelo de desenvolvimento de software onde todas as partes da aplicação — interface, lógica de negócios e acesso a dados — estão integradas em um único módulo.
  
    Principais características:
  Unidade Coesa: Todos os componentes são parte de um único pacote.
  Simplicidade de Implantação: Fácil de implantar, pois requer apenas um artefato.
  Desempenho: Comunicação interna é rápida, pois ocorre em memória.
  Facilidade de Desenvolvimento: Mais simples para equipes menores.
    Desvantagens:
  Escalabilidade: Difícil escalar apenas partes da aplicação.
  Manutenção: Alterações podem impactar outras partes, complicando a manutenção.
  Limitação Tecnológica: Difícil integrar novas tecnologias.
  Colaboração Complicada: Aumento de conflitos em equipes maiores.

  ![image](https://github.com/user-attachments/assets/8b1015c8-4dea-478a-8346-cfd455aa9caf)

  Como explicado anteriomente, todas as partes da aplicação estão integradas na pasta Lib, onde está a main.dart (minha tela principal), CadastrarTransacaoScreen (minha tela para cadastrar as transações) e a VisualizarTransacoesScreen (Tela onde você pode visualizar as transações).

- 5 - EXPLICAÇÃO DO CÓDIGO

  main.dart:

  Na main eu criei a classe HomeScreen que é onde se encontra a parte visual da tela principal e tambem inseri o botão para ir para a tela "VisualizarTransacoesScreem".
  A Widget _welcomeMessage é apenas uma mensagem que fica bem acima da tela, dando boas vindas ao usuario.
  A Widget _optionCard é a que faz a lógica do botão do "VisualizarTransacoesScreem".
  A Widget _investButton é a logica do botão para a tela "CadastrarTransacaoScreen".

  CadastrarTransacoesScreen:

  Na widget buld eu crie o botçao de voltar, o local para digitar qual ativo você deseja, se é compra ou venda, botão para escolher uma das 3 corretoras, a quantidade de ativos e o valor de cada um deles.
  Criei o botão para cadastrar a transação e dentro dele a lógica para ele só salvar se todos os campos estiverem preenchidos.
  A widget _buildDropdown é para fazer a lógica da seleção de uma das 3 corretoras.
  A widget _buildRadioButton é para fazer a escolha se é uma compra ou venda de ativos.

  VisualizarTransacoesScreen:

  O Build é um método que constroi a interface, e é onde eu defino o layout da tela.
  No AppBar está o botão para voltar para a tela inicial.
  O StreamBuilder é onde faz as mudanças no fluxo de dados do firestore. Ele var ver a coleção de "transacoes" e reconstruir com as mudanças.
  O ListView é para gerar um card oara cada transação feita no firestore. 
  
- 6 - REGRAS DE NEGOCIOS

  A primeira regra de negócios que eu consegui ver a necessidade foi a alteração e exclusão de investimento, que no meu caso é uma requisito "desnecessário". Quando estamos falando de investimentos, você pode simplesmente vendê-los ou comprar mais para poder     
  gerenciar de maneira correta o seu dinheiro. Então a tela de cadastrar investimentos do meu aplicativo já serve como exclusão e atualização de investimentos.
  Na parte de quantidade e preço das ações, coloquei para aceitar somente valores numéricos, impedindo o usuário de escrever algo.
  Para cadastrar uma transação é necessario preencher todos os campos.
  
- 7 - DESAFIOS E SOLUÇÕES
  
  O principal desafio foi o tempo, pois para fazer um aplicativo realmente usável para controle de investimento seria necessário mais tempo. Tive que deixar diversas funcionalidades que são importantes para o gerenciamento dos investimentos de fora.
  Tive bastante dificuldade na hora de usar o firebase, iniciamente estava usando o Project IDX para codar, mas não consegui usar o firebase de jeito nenhum.
  Tive bastante receio de usar o Android Studio porque sei que ele é um aplicarivo bem pesado e minha maquina não é das melhores, mas fui obrigado a usa-lo por causa do firebase. Com o andorid studio eu consegui linkar o firebase com meu projeto, mas ainda não consegui usar ele no meu projeto, por isso não consegui finalizar o projeto.

- 8 - CONCLUSÃO

  Consegui realizar boa parte do frontend do projeto, mas a parte do firebase foi a parte mais complicada. Como citado acima, tive muita dificuldade até para linkar ele com meu projeto, e mesmo após isso não consegui implementa-lo.
  Acredito que um projeto desse tamanho precisaria de mais tempo para ser feito, talvez poderiamos ter utilizado o projeto da N1 para adiantar e termos tempo de focar apenas no firebase, que era o foco da N2.

- 9 - REFERÊNCIAS:

(utilizei para aprender a utilizar o firebase e me ajudar em algumas partes do codigo)
https://chatgpt.com

(Link do meu figma)
https://www.figma.com/design/P0flCZ929Sg6jR546Yw29j/CRUD---Controle-de-investimentos?node-id=0-1&node-type=canvas&t=YLUHHO0nl4UPDVeE-0
  
(Como não conheço nada de investimentos, procurei aplicativos para me basear)
https://financeone.com.br/aplicativos-para-controlar-investimentos/

(Aplicativo escolhido como referência)
https://play.google.com/store/apps/details?id=br.com.gorilainvest.mobileapp

(Precisava conhecer mais sobre arquitetura de software para então poder escolher uma)
https://www.alura.com.br/artigos/padroes-arquiteturais-arquitetura-software-descomplicada?srsltid=AfmBOooE7Mwru8NDlqeUqUa_3nxohae86Cr29itAqDqNigL8J0JNO-Fd
