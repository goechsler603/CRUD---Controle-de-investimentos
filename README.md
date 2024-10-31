- 1 - CRUD - Controle de investimentos

- 2 - INTRODUÇÃO
  
Será desenvolvido um aplicativo para controle de investimentos, podendo cadastrar invesimentos feitos (Comprando ou vendendo) e visualizar o quando já foi investido.


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

  

- 5 - EXPLICAÇÃO DO CÓDIGO
  
- 6 - REGRAS DE NEGOCIOS
- 
  A primeira regra de negócios que eu consegui ver a necessidade foi a alteração e exclusão de investimento, que no meu caso é uma requisito "desnecessário". Quando estamos falando de investimentos, você pode simplesmente vendê-los ou comprar mais para poder gerenciar de maneira correta o seu dinheiro. Então a tela de cadastrar investimentos do meu aplicativo já serve como exclusão e atualização de investimentos.
  Na parte de quantidade e preço das ações, coloquei para aceitar somente valores numéricos, impedindo o usuário de escrever algo.

- 7 - DESAFIOS E SOLUÇÕES
  
  O principal desafio foi o tempo, pois para fazer um aplicativo realmente usável para controle de investimento seria necessário mais tempo. Tive que deixar diversas funcionalidades que são importantes para o gerenciamento dos investimentos de fora.
  
  Tive bastante dificuldade na hora de usar o firebase, tive que buscar em diversos lugares como implementar ele e a usa-lo.

  

- 8 - CONCLUSÃO


- 9 - REFERÊNCIAS:

(Link do meu figma)
https://www.figma.com/design/P0flCZ929Sg6jR546Yw29j/CRUD---Controle-de-investimentos?node-id=0-1&node-type=canvas&t=YLUHHO0nl4UPDVeE-0
  
(Como não conheço nada de investimentos, procurei aplicativos para me basear)
https://financeone.com.br/aplicativos-para-controlar-investimentos/

(Aplicativo escolhido como referência)
https://play.google.com/store/apps/details?id=br.com.gorilainvest.mobileapp

(Precisava conhecer mais sobre arquitetura de software para então poder escolher uma)
https://www.alura.com.br/artigos/padroes-arquiteturais-arquitetura-software-descomplicada?srsltid=AfmBOooE7Mwru8NDlqeUqUa_3nxohae86Cr29itAqDqNigL8J0JNO-Fd
