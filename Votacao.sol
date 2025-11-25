// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotacaoEletronica {
    
    struct Candidato {
        uint id;
        string nome;
        uint votos;
    }

    // estados
    address public administrador;
    bool public votacaoAberta;
    uint public totalCandidatos;

    // Mapeamentos
    mapping(uint => Candidato) public candidatos;
    mapping(address => bool) public jaVotou;

    event VotoComputado(address indexed eleitor, uint candidatoId);
    event VotacaoStatus(bool status);

    modifier apenasAdmin() {
        require(msg.sender == administrador, "Apenas o administrador pode fazer isso.");
        _;
    }

    // Construtor: quem fizer o deploy é o administrador
    constructor() {
        administrador = msg.sender;
        votacaoAberta = false; // Começa fechada
    }

    // Cadastrar candidatos
    function adicionarCandidato(string memory _nome) public apenasAdmin {
        require(!votacaoAberta, "Nao pode adicionar candidatos durante a votacao.");
        totalCandidatos++;
        candidatos[totalCandidatos] = Candidato(totalCandidatos, _nome, 0);
    }

    // abrir e fechar votação
    function iniciarVotacao() public apenasAdmin {
        votacaoAberta = true;
        emit VotacaoStatus(true);
    }

    function encerrarVotacao() public apenasAdmin {
        votacaoAberta = false;
        emit VotacaoStatus(false);
    }

    // Votar
    function votar(uint _candidatoId) public {
        require(votacaoAberta, "A votacao esta encerrada.");
        require(!jaVotou[msg.sender], "Voce ja votou.");
        require(_candidatoId > 0 && _candidatoId <= totalCandidatos, "Candidato invalido.");

        jaVotou[msg.sender] = true;
        candidatos[_candidatoId].votos++;

        emit VotoComputado(msg.sender, _candidatoId);
    }
}