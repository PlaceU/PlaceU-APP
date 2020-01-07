-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Jan-2020 às 22:45
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `placeudb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `edificios`
--

CREATE TABLE `edificios` (
  `id` int(11) UNSIGNED NOT NULL,
  `designacao` varchar(200) NOT NULL,
  `morada` varchar(200) NOT NULL,
  `id_organizacao` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `membros_organizacao`
--

CREATE TABLE `membros_organizacao` (
  `id_utilizador` int(11) UNSIGNED NOT NULL,
  `id_organizacao` int(11) UNSIGNED NOT NULL,
  `moderador` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `organizacoes`
--

CREATE TABLE `organizacoes` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(200) NOT NULL,
  `mail` varchar(200) NOT NULL,
  `contacto_fixo` varchar(100) NOT NULL,
  `contacto_movel` varchar(100) NOT NULL,
  `dta_registo` date DEFAULT current_timestamp(),
  `id_owner` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `organizacoes`
--

INSERT INTO `organizacoes` (`id`, `nome`, `morada`, `mail`, `contacto_fixo`, `contacto_movel`, `dta_registo`, `id_owner`) VALUES
(16, 'manfios2', 'batata', '22@33', '28789798', '91234234', '2020-01-07', 25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `requisicoes`
--

CREATE TABLE `requisicoes` (
  `id` int(11) UNSIGNED NOT NULL,
  `dta_inicio` date NOT NULL,
  `dta_fim` date NOT NULL,
  `id_utilizador` int(11) UNSIGNED NOT NULL,
  `id_sala` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `salas`
--

CREATE TABLE `salas` (
  `id` int(11) UNSIGNED NOT NULL,
  `designacao` varchar(200) NOT NULL,
  `lugares` int(11) NOT NULL,
  `tem_pc` tinyint(1) DEFAULT NULL,
  `tem_projetor` tinyint(1) DEFAULT NULL,
  `tem_qi` tinyint(1) DEFAULT NULL,
  `tem_wifi` tinyint(1) DEFAULT NULL,
  `id_edificio` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizadores`
--

CREATE TABLE `utilizadores` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `morada` varchar(200) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `dta_nascimento` date DEFAULT NULL,
  `dta_registo` date DEFAULT current_timestamp(),
  `isadmin` tinyint(1) DEFAULT NULL,
  `isbanned` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `utilizadores`
--

INSERT INTO `utilizadores` (`id`, `nome`, `password`, `email`, `morada`, `contacto`, `dta_nascimento`, `dta_registo`, `isadmin`, `isbanned`) VALUES
(24, 'Nelsan', '11111111111', 'adasdddd', 'asdasd', 'asdasd', '1991-02-12', '2019-12-17', 1, 1),
(25, 'Toja', '123456', 'ada@mail', 'rua', '946541321', '1992-05-14', '2020-01-07', 1, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `edificios`
--
ALTER TABLE `edificios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_organizacao` (`id_organizacao`);

--
-- Índices para tabela `membros_organizacao`
--
ALTER TABLE `membros_organizacao`
  ADD UNIQUE KEY `id_utilizador` (`id_utilizador`,`id_organizacao`),
  ADD KEY `id_organizao` (`id_organizacao`);

--
-- Índices para tabela `organizacoes`
--
ALTER TABLE `organizacoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_owner` (`id_owner`);

--
-- Índices para tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_requisicoes_utilizador` (`id_utilizador`),
  ADD KEY `fk_requisicoes_sala` (`id_sala`);

--
-- Índices para tabela `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_edificio` (`id_edificio`);

--
-- Índices para tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `edificios`
--
ALTER TABLE `edificios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `organizacoes`
--
ALTER TABLE `organizacoes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `salas`
--
ALTER TABLE `salas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `utilizadores`
--
ALTER TABLE `utilizadores`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `edificios`
--
ALTER TABLE `edificios`
  ADD CONSTRAINT `fk_id_organizacao` FOREIGN KEY (`id_organizacao`) REFERENCES `organizacoes` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `membros_organizacao`
--
ALTER TABLE `membros_organizacao`
  ADD CONSTRAINT `membros_organizacao_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `membros_organizacao_ibfk_2` FOREIGN KEY (`id_organizacao`) REFERENCES `organizacoes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `organizacoes`
--
ALTER TABLE `organizacoes`
  ADD CONSTRAINT `organizacoes_ibfk_1` FOREIGN KEY (`id_owner`) REFERENCES `utilizadores` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  ADD CONSTRAINT `fk_requisicoes_sala` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_requisicoes_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizadores` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`id_edificio`) REFERENCES `edificios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
