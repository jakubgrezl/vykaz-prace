-- Tabulka pro uživatele s novým názvem
CREATE TABLE IF NOT EXISTS `janbrunclik_vykaz_prace_uzivatele` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jmeno` varchar(50) NOT NULL,
  `prijmeni` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `heslo` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabulka pro pracovní výkazy s novým názvem
CREATE TABLE IF NOT EXISTS `janbrunclik_vykaz_prace_pracovni_vykaz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_zamestnance` int(11) NOT NULL,
  `datum` date NOT NULL,
  `cas_zacatku` time NOT NULL DEFAULT '07:00:00',
  `cas_konce` time NOT NULL DEFAULT '19:00:00',
  `poznamka` varchar(255) DEFAULT NULL,
  `noni` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_zamestnance` (`id_zamestnance`),
  CONSTRAINT `janbrunclik_vykaz_prace_pracovni_vykaz_ibfk_1` FOREIGN KEY (`id_zamestnance`) REFERENCES `janbrunclik_vykaz_prace_uzivatele` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
