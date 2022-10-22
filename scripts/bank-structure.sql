CREATE DATABASE db_pesquisa_universidade;

use db_pesquisa_universidade;

CREATE TABLE IF NOT EXISTS `pessoa` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS `pesquisa_pandemia` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `data_pesquisa` date NOT NULL,
  `salario` varchar(14) NOT NULL,
  `data_inclusao` datetime default CURRENT_TIMESTAMP,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS  `pessoa_entrevista` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `id_pessoa` int NOT NULL,
  `id_pesquisa`  int NOT NULL,
  `data_inclusao` datetime default CURRENT_TIMESTAMP,
   FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
   FOREIGN KEY (id_pesquisa) REFERENCES pesquisa_pandemia(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS  `empresa` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `segmento` varchar(14) NOT NULL,
  `id_pessoa` int NOT NULL,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS  `cargo` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `nivel` varchar(14) NOT NULL,
  `id_pessoa` int NOT NULL,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE IF NOT EXISTS  `departamento` (
  `id` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `localizacao` varchar(14) NOT NULL,
  `id_pessoa` int NOT NULL,
  `id_empresa` int NOT NULL,
  FOREIGN KEY (id_pessoa) REFERENCES pessoa(id),
  FOREIGN KEY (id_empresa) REFERENCES empresa(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;