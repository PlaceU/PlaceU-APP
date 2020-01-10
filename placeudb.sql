-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Jan-2020 às 14:54
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
  `id_organizacao` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `edificios`
--

INSERT INTO `edificios` (`id`, `designacao`, `morada`, `id_organizacao`) VALUES
(2, 'sadfasdf', 'asdfasd', 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `membros_organizacao`
--
-- Erro ao ler a estrutura para a tabela placeudb.membros_organizacao: #1932 - Table 'placeudb.membros_organizacao' doesn't exist in engine
-- Erro ao ler dados para tabela placeudb.membros_organizacao: #1064 - Você tem um erro de sintaxe no seu SQL próximo a 'FROM `placeudb`.`membros_organizacao`' na linha 1

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
(5, 'Mafiosos', 'TVD', 'severas@xyz', '112442343', '916544892', '2020-01-09', 1);

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

--
-- Extraindo dados da tabela `salas`
--

INSERT INTO `salas` (`id`, `designacao`, `lugares`, `tem_pc`, `tem_projetor`, `tem_qi`, `tem_wifi`, `id_edificio`) VALUES
(1, 'A ', 20, 1, 1, 0, 1, 2),
(2, 'B', 10, 0, 0, 1, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) DEFAULT 10,
  `created_at` int(11) DEFAULT current_timestamp(),
  `updated_at` int(11) DEFAULT current_timestamp(),
  `verification_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isadmin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `name`, `status`, `created_at`, `updated_at`, `verification_token`, `isadmin`) VALUES
(1, 'toja', '', '$2y$13$pUKraVB2tZ/EFB6CZnYq6u4/zM7eY.YbXhEstWaFoNWQCeILrT0re', NULL, '', NULL, 10, 1578316789, 1578316789, NULL, 0),
(8, 'nelsan', '', '$2y$13$7RkbaZu/rUFhm0G9uZTLbOw8RgHuhCnunX6AT1/S2FMiFpmHFkRVa', NULL, 'asdas@mail.com', NULL, 10, 1578585337, 1578585337, NULL, 0);

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
-- Índices para tabela `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

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
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `requisicoes`
--
ALTER TABLE `requisicoes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `salas`
--
ALTER TABLE `salas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `edificios`
--
ALTER TABLE `edificios`
  ADD CONSTRAINT `fk_id_organizacao` FOREIGN KEY (`id_organizacao`) REFERENCES `organizacoes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `organizacoes`
--
ALTER TABLE `organizacoes`
  ADD CONSTRAINT `organizacoes_ibfk_1` FOREIGN KEY (`id_owner`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
