-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 12-Dez-2019 às 16:35
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
  `morada` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `edificios`
--

INSERT INTO `edificios` (`id`, `designacao`, `morada`) VALUES
(1, 'aaaaaaaaaaaaaa', 'rua do edificio');

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
-- Estrutura da tabela `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1576149113),
('m130524_201442_init', 1576149127),
('m190124_110200_add_verification_token_column_to_user_table', 1576149127);

-- --------------------------------------------------------

--
-- Estrutura da tabela `organizacao`
--

CREATE TABLE `organizacao` (
  `id` int(11) UNSIGNED NOT NULL,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(200) NOT NULL,
  `mail` varchar(200) NOT NULL,
  `contacto_fixo` varchar(100) NOT NULL,
  `contacto_movel` varchar(100) NOT NULL,
  `dta_registo` date NOT NULL DEFAULT current_timestamp(),
  `id_owner` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `utilizador`
--

CREATE TABLE `utilizador` (
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
-- Extraindo dados da tabela `utilizador`
--

INSERT INTO `utilizador` (`id`, `nome`, `password`, `email`, `morada`, `contacto`, `dta_nascimento`, `dta_registo`, `isadmin`, `isbanned`) VALUES
(13, 'wedasdasdasd', 'adasdasdasd', 'adasdasdasd', 'asdasdasda', 'adadasdadsas', '1991-02-12', '0000-00-00', 1, 0),
(15, 'qqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqq', '1991-02-12', '0000-00-00', NULL, NULL),
(17, 'qqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqq', 'qqqqqqq', 'qqqqqqqqqqqqqqqqqq', 'qqqqqqqqqqqqqqqq', '1991-02-12', '2019-12-09', NULL, NULL),
(19, 'Jorge Severino', '12444', 'qweasdasdae@mail.com', 'rua da escola', '22222222', '1991-02-21', '2019-12-09', 1, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `edificios`
--
ALTER TABLE `edificios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `membros_organizacao`
--
ALTER TABLE `membros_organizacao`
  ADD UNIQUE KEY `id_utilizador` (`id_utilizador`,`id_organizacao`),
  ADD KEY `id_organizao` (`id_organizacao`);

--
-- Índices para tabela `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Índices para tabela `organizacao`
--
ALTER TABLE `organizacao`
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
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Índices para tabela `utilizador`
--
ALTER TABLE `utilizador`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `edificios`
--
ALTER TABLE `edificios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `organizacao`
--
ALTER TABLE `organizacao`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `salas`
--
ALTER TABLE `salas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `utilizador`
--
ALTER TABLE `utilizador`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `membros_organizacao`
--
ALTER TABLE `membros_organizacao`
  ADD CONSTRAINT `membros_organizacao_ibfk_1` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `membros_organizacao_ibfk_2` FOREIGN KEY (`id_organizacao`) REFERENCES `organizacao` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `organizacao`
--
ALTER TABLE `organizacao`
  ADD CONSTRAINT `organizacao_ibfk_1` FOREIGN KEY (`id_owner`) REFERENCES `utilizador` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  ADD CONSTRAINT `fk_requisicoes_sala` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `fk_requisicoes_utilizador` FOREIGN KEY (`id_utilizador`) REFERENCES `utilizador` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`id_edificio`) REFERENCES `edificios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
