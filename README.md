# Sistema de Votação Eletrônica em Blockchain (Smart Contract)

Este projeto consiste no desenvolvimento de um Contrato Inteligente (*Smart Contract*) para um sistema de votação eletrônica descentralizada. O objetivo é demonstrar o uso da tecnologia blockchain para garantir a imutabilidade, transparência e auditabilidade de um pleito eleitoral.

Trabalho desenvolvido para a disciplina **SSC0958 - Blockchain e Criptomoedas**.

## Funcionalidades

O contrato `VotacaoEletronica.sol` implementa uma lógica de votação segura com as seguintes características:

* **Controle de Acesso (Owner/Admin):** Apenas o administrador (quem fez o deploy) pode cadastrar candidatos e controlar o estado da eleição.
* **Gestão de Estado:** A votação possui estados definidos (Aberta/Fechada), impedindo votos fora do prazo.
* **Imutabilidade:** Um eleitor não pode alterar seu voto após computado, e não pode votar mais de uma vez.
* **Auditoria via Eventos:** O contrato emite eventos (`VotoComputado`) na blockchain para facilitar o rastreamento externo sem comprometer a eficiência.

## Para rodar

1.  Acesse o [Remix IDE](https://remix.ethereum.org/).
2.  Crie um novo arquivo e cole o código de `VotacaoEletronica.sol`.
3.  Compile o contrato na aba **Solidity Compiler**.
4.  Na aba **Deploy & Run Transactions**:
    * Selecione o ambiente `Remix VM (Cancun)`.
    * Clique em **Deploy**.
5.  **Interagindo:**
    * Use `adicionarCandidato` para incluir opções (ex: "Candidato A").
    * Use `iniciarVotacao` para liberar o pleito.
    * Use `votar` com o ID do candidato.
