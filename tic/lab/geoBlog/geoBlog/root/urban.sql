-- $Id: urban.sql,v 1.1 2008-08-27 21:36:55 doros Exp $

-- 
-- Database: `urban`
-- 

-- --------------------------------------------------------

-- 
-- Struttura della tabella `Commenti`
-- 

CREATE TABLE `Commenti` (
  `id` int(5) NOT NULL auto_increment,
  `codValore` int(5) default NULL,
  `messaggio` varchar(255) character set latin1 collate latin1_general_ci default NULL,
  `quando` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `nickname` char(20) character set latin1 collate latin1_general_ci NOT NULL,
  `email` char(30) character set latin1 collate latin1_general_ci NOT NULL,
  `id_padre` int(5) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- 
-- Dump dei dati per la tabella `Commenti`
-- 

INSERT INTO `Commenti` (`id`, `codValore`, `messaggio`, `quando`, `nickname`, `email`, `id_padre`) VALUES 
(1, 1, 'ottimo', '2008-06-17 14:30:36', 'monty', 'monty14@hotmail.it', 3),
(2, -1, 'cdfdf', '2008-06-17 15:18:13', 'lollo', 'lollo@hotmail.it', 1),
(3, -1, 'dofkodk', '2008-06-17 15:33:49', 'lodfdf', 'dfokdofk@hotmail.it', 2),
(4, 0, 'dfdf', '2008-06-17 18:09:35', 'fdfgfg', 'gfgf@hotmail.it', 3),
(5, 0, '', '0000-00-00 00:00:00', '', '', 0),
(6, -1, 'ciao come va???', '2008-07-20 12:22:33', 'ciao', 'ciccio@lollo.it', 7),
(7, 0, '', '0000-00-00 00:00:00', '', '', 0),
(8, 1, 'ciao come va???', '2008-07-20 14:03:54', 'dgfdgf', 'aaa@a.it', 6);

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
-- Struttura della tabella `Messaggi`
-- 

CREATE TABLE `Messaggi` (
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
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- 
-- Dump dei dati per la tabella `Messaggi`
-- 

INSERT INTO `Messaggi` (`id`, `codLuogo`, `codTema`, `codContenuto`, `GLatLng`, `zoom`, `titolo`, `messaggio`, `quando`, `nickname`, `email`) VALUES 
(1, 4, 3, 2, '(45.50460244451094, 12.282586097717285)', 15, 'oooo', '\\''???xke no', '2008-06-17 14:19:37', 'monty', 'lollo@hotmail.it'),
(2, 2, 2, 2, '(45.498947627475246, 12.201948165893555)', 13, 'dfdf', 'ccio', '2008-06-17 14:24:02', 'monty', 'ciccio@lollo.it'),
(3, 4, 3, 1, '(45.5527806901154, 12.311124801635742)', 17, 'CASA MIA', 'casa mia Ã¨ una risorsa', '2008-06-17 14:30:08', 'montagner stefano', 'monty14@hotmail.it'),
(4, 1, 1, 1, '(45.50478290804253, 12.249155044555664)', 14, 'd', 'dfdsdf', '2008-06-20 14:22:43', 'efer', 'ciccio@lollo.it1'),
(5, 1, 1, 1, '(45.496120005970226, 12.244091033935547)', 14, 'df', 'dvd', '2008-06-20 15:24:35', 'xzccxzcxz', 'gffff@hot.it'),
(6, 2, 1, 2, '(45.498947627475246, 12.201948165893555)', 13, 'ciao', 'fgh', '2008-07-19 14:34:33', 'fgh', 'ciccio@lollo.it'),
(7, 1, 2, 2, '(45.496120005970226, 12.244091033935547)', 14, 'ciao', 'fgdf', '2008-07-19 14:34:33', 'dfsdfgg', 'ciccio@lollo.it'),
(8, 7, 1, 1, '(45.410622787336656, 12.294387817382812)', 14, 'ciao', 'Andiamo a giocare?', '2008-07-20 11:47:52', 'Gianni & Michele', 'Gianni@gmail.com'),
(9, 3, 4, 3, '(45.50333918359158, 12.332324981689453)', 14, 'fdghfgh', 'sdfsdfgd', '2008-07-20 11:47:52', 'ciao', 'dfsfdsdfs@fg.it'),
(10, 4, 1, 1, '(45.53404042377603, 12.302713394165039)', 15, 'ciao', 'ciao come va????', '2008-07-20 11:55:58', 'monty figo', 'monty14@hotmail.it'),
(11, 4, 3, 1, '(45.55338171794811, 12.311897277832031)', 18, 'casa mia nuova', 'casa mia', '2008-07-20 11:58:52', 'monty figo', 'monty14@hotmail.it'),
(12, 4, 3, 1, '(45.55089492357032, 12.316242456436157)', 18, 'df', '.ljgyfgv', '2008-07-20 14:03:47', 'dfsdfgg', 'ciccio@lollo.it');

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
(5, 'Turismo-Ricettivit&agrave;'),
(6, 'Servizi'),
(7, 'Infrastrutture-Mobilit&agrave;');

-- --------------------------------------------------------

-- 
-- Struttura della tabella `Valori`
-- 

CREATE TABLE `Valori` (
  `valore` int(5) NOT NULL,
  `desc` char(50) character set latin1 collate latin1_general_ci default NULL,
  PRIMARY KEY  (`valore`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- 
-- Dump dei dati per la tabella `Valori`
-- 

INSERT INTO `Valori` (`valore`, `desc`) VALUES 
(-1, 'contrario'),
(0, 'indifferente'),
(1, 'a favore');
