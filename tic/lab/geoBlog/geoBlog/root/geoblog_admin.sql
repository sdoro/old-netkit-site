-- $Id: geoblog_admin.sql,v 1.1 2008-08-27 21:33:52 doros Exp $

-- 
-- Database: `geoblog_admin`
-- 

-- --------------------------------------------------------

-- 
-- Struttura della tabella `Contenuti`
-- 

CREATE TABLE `Contenuti` (
  `id` int(5) NOT NULL,
  `desc` char(40) character set latin1 collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dump dei dati per la tabella `Contenuti`
-- 

INSERT INTO `Contenuti` (`id`, `desc`) VALUES 
(1, 'Risorsa'),
(2, 'Proposta'),
(3, 'Problema');

-- --------------------------------------------------------

-- 
-- Struttura della tabella `Luoghi`
-- 

CREATE TABLE `Luoghi` (
  `id` int(4) NOT NULL,
  `desc` char(40) character set latin1 collate latin1_general_ci NOT NULL,
  `GLatLng` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `zoom` int(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dump dei dati per la tabella `Luoghi`
-- 

INSERT INTO `Luoghi` (`id`, `desc`, `GLatLng`, `zoom`) VALUES 
(1, 'Mestre Carpenedo', '45.496120005970226,12.244091033935546', 14),
(2, 'Chirignago Zelarino', '45.498947627475246,12.201948165893554', 13),
(3, 'Aeroporto', '45.50333918359158,12.332324981689453', 14),
(4, 'Favaro Veneto', '45.50460244451094,12.282586097717285', 15),
(5, 'Marghera', '45.47204939555312,12.217741012573242', 15),
(6, 'Porto Marghera', '45.45302634150112,12.253789901733398', 14),
(7, 'Venezia', '45.435743511845935,12.333698272705078', 14),
(8, 'Isole', '45.469401000526105,12.385883331298828', 13),
(9, 'Lido Pellestrina', '45.33621923783805,12.321510314941406', 12);

-- --------------------------------------------------------

-- 
-- Struttura della tabella `NuoviCommenti`
-- 

CREATE TABLE `NuoviCommenti` (
  `id` int(5) NOT NULL auto_increment,
  `messaggio` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `quando` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nickname` char(20) character set latin1 collate latin1_general_ci NOT NULL,
  `email` char(30) character set latin1 collate latin1_general_ci NOT NULL,
  `codValore` int(5) default NULL,
  `id_padre` int(5) default NULL,
  `daValutare` tinyint(1) NOT NULL,
  `nonInseribile` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

-- 
-- Dump dei dati per la tabella `NuoviCommenti`
-- 

INSERT INTO `NuoviCommenti` (`id`, `messaggio`, `quando`, `nickname`, `email`, `codValore`, `id_padre`, `daValutare`, `nonInseribile`) VALUES 
(55, 'cdcdcd', '2008-06-20 14:35:55', 'ciao', 'monty14@hotmail.it', 0, 1, 0, 0),
(56, 'dfdfciao', '2008-06-20 15:30:35', 'ffff', 'fdsds@gfh.it', 0, 3, 0, 0);

-- --------------------------------------------------------

-- 
-- Struttura della tabella `NuoviMessaggi`
-- 

CREATE TABLE `NuoviMessaggi` (
  `id` int(5) NOT NULL auto_increment,
  `codLuogo` int(5) default NULL,
  `codTema` int(5) default NULL,
  `codContenuto` int(5) default NULL,
  `GLatLng` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `zoom` int(10) default NULL,
  `titolo` char(40) character set latin1 collate latin1_general_ci default NULL,
  `messaggio` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `quando` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nickname` char(20) character set latin1 collate latin1_general_ci default NULL,
  `email` char(30) character set latin1 collate latin1_general_ci default NULL,
  `daValutare` tinyint(1) NOT NULL,
  `nonInseribile` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

-- 
-- Dump dei dati per la tabella `NuoviMessaggi`
-- 

INSERT INTO `NuoviMessaggi` (`id`, `codLuogo`, `codTema`, `codContenuto`, `GLatLng`, `zoom`, `titolo`, `messaggio`, `quando`, `nickname`, `email`, `daValutare`, `nonInseribile`) VALUES 
(1, 4, 4, 1, '(45.50460244451094, 12.282586097717285)', 15, 'fgdfg', 'sono figo', '2008-06-20 14:36:23', 'dfsdfgg', 'gfgf@hotmail.it', 0, 0),
(2, 4, 2, 2, '(45.499338670336705, 12.286062240600586)', 15, 'dfssdf', 'sdffdsds', '2008-06-20 15:30:03', 'dsfffds', 'dfsfdsdfs@fg.it', 0, 0),
(3, 2, 2, 3, '(45.498947627475246, 12.201948165893555)', 13, 'gfg', 'fdgfgf', '2008-06-20 15:43:51', 'fgg', 'ciccio@lollo.it1', 0, 0),
(4, 4, 3, 3, '(45.50460244451094, 12.282586097717285)', 15, 'dfq', 'dfs', '2008-06-20 15:44:14', 'dfgfg', 'ciccio@lollo.it', 0, 0),
(5, 6, 2, 2, '(45.45302634150112, 12.253789901733398)', 14, 'd', 'sdfgf', '2008-06-20 15:45:31', 'dsfffds', 'dfgg@sggf.it', 0, 0),
(6, 5, 4, 3, '(45.47204939555312, 12.217741012573242)', 15, 'dgffgdf', 'ciao', '2008-07-13 18:28:28', 'dfgfg', 'gfgf@hotmail.it', 0, 0),
(7, 1, 1, 1, '(45.49088552339697, 12.221174240112305)', 14, 'lollo', 'ciao come va???', '2008-07-13 18:31:25', 'montagner stefano', 'dfgg@sggf.it', 0, 0),
(8, 2, 4, 1, '(45.498947627475246, 12.201948165893555)', 13, 'fdghfgh', 'fghfghgf', '2008-07-13 18:39:43', 'gfgh', 'gffff@hot.it', 0, 0),
(9, 3, 1, 2, '(45.50333918359158, 12.332324981689453)', 14, 'tyutyu', 'tyuytuty', '2008-07-19 14:01:51', 'egtettryu', 'ryutyu@f.k', 0, 0);

-- --------------------------------------------------------

-- 
-- Struttura della tabella `Temi`
-- 

CREATE TABLE `Temi` (
  `id` int(5) NOT NULL,
  `desc` char(40) character set latin1 collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dump dei dati per la tabella `Temi`
-- 

INSERT INTO `Temi` (`id`, `desc`) VALUES 
(1, 'Ambiente'),
(2, 'Paesaggio'),
(3, 'Residenza'),
(4, 'Aree produttive'),
(5, 'Turismo-Ricettivit'),
(6, 'Servizi'),
(7, 'Infrastrutture-Mobilit');
