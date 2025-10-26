DROP TABLE IF EXISTS percentual_nutriente_projeto;  -- view depende de projeto_detalhado
DROP TABLE IF EXISTS projeto_detalhado;             -- view depende de várias tabelas

DROP TABLE IF EXISTS etapa_mp;       -- depende de etapa e materia_prima
DROP TABLE IF EXISTS etapa;          -- depende de projeto
DROP TABLE IF EXISTS garantia;       -- depende de nutriente e materia_prima
DROP TABLE IF EXISTS sessao;         -- depende de usuario
DROP TABLE IF EXISTS token;          -- depende de usuario
DROP TABLE IF EXISTS materia_prima;  -- independente
DROP TABLE IF EXISTS nutriente;      -- independente
DROP TABLE IF EXISTS projeto;        -- independente
DROP TABLE IF EXISTS usuario;        -- independente
DROP TABLE IF EXISTS elemento;       -- independente
DROP TABLE IF EXISTS configuracao;   -- independente

CREATE TABLE configuracao (
  id int UNSIGNED NOT NULL,
  `key` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  value json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE elemento (
  id tinyint UNSIGNED NOT NULL,
  simbolo char(3) NOT NULL,
  nome varchar(50) DEFAULT NULL,
  numero_atomico int DEFAULT NULL,
  massa_atomica decimal(10,6) DEFAULT NULL,
  grupo int UNSIGNED DEFAULT NULL,
  periodo int UNSIGNED DEFAULT NULL,
  ponto_de_fusao decimal(10,6) DEFAULT NULL,
  ponto_de_ebulicao decimal(10,6) DEFAULT NULL,
  densidade decimal(10,8) DEFAULT NULL,
  estado_padrao varchar(20) DEFAULT NULL,
  configuracao_eletronica varchar(50) DEFAULT NULL,
  propriedades text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE etapa (
  id int UNSIGNED NOT NULL,
  projeto int UNSIGNED DEFAULT NULL,
  nome varchar(255) DEFAULT NULL,
  descricao varchar(255) DEFAULT NULL,
  ordem tinyint DEFAULT NULL,
  createdAt datetime DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE etapa_mp (
  id int UNSIGNED NOT NULL,
  etapa int UNSIGNED DEFAULT NULL,
  mp int UNSIGNED DEFAULT NULL,
  percentual double DEFAULT NULL,
  tempo_agitacao varchar(10) DEFAULT NULL,
  observacao varchar(1000) DEFAULT NULL,
  ordem tinyint DEFAULT NULL,
  lote varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  createdAt datetime DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE garantia (
  id int UNSIGNED NOT NULL,
  materia_prima int UNSIGNED NOT NULL,
  nutriente int UNSIGNED NOT NULL,
  percentual double UNSIGNED DEFAULT NULL,
  createdAt datetime DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE materia_prima (
  id int UNSIGNED NOT NULL,
  codigo varchar(50) DEFAULT NULL,
  nome varchar(100) DEFAULT NULL,
  formula varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  cas_number varchar(50) DEFAULT NULL,
  densidade double UNSIGNED DEFAULT NULL,
  descricao varchar(1000) DEFAULT NULL,
  createdAt datetime DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE nutriente (
  id int UNSIGNED NOT NULL,
  nome varchar(100) DEFAULT NULL,
  formula varchar(100) DEFAULT NULL,
  visivel tinyint UNSIGNED DEFAULT '1',
  createdAt datetime DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE projeto (
  id int UNSIGNED NOT NULL,
  codigo varchar(20) DEFAULT NULL,
  nome varchar(255) DEFAULT NULL,
  cliente varchar(255) DEFAULT NULL,
  descricao text,
  data_inicio date DEFAULT NULL,
  data_termino date DEFAULT NULL,
  densidade double UNSIGNED DEFAULT NULL,
  ph varchar(255) DEFAULT NULL,
  tipo varchar(255) DEFAULT NULL,
  aplicacao json DEFAULT NULL,
  natureza_fisica varchar(255) DEFAULT NULL,
  status json DEFAULT NULL,
  createdAt datetime DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE sessao (
  id bigint UNSIGNED NOT NULL,
  usuario int UNSIGNED NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  validade datetime DEFAULT NULL,
  createdAt timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `token` (
  usuario int UNSIGNED NOT NULL,
  chave_token varchar(255) DEFAULT NULL,
  validade datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE usuario (
  id int UNSIGNED NOT NULL,
  nome varchar(100) DEFAULT NULL,
  email varchar(100) DEFAULT NULL,
  senha varchar(255) DEFAULT NULL,
  permissao tinyint DEFAULT NULL,
  avatar varchar(100) DEFAULT NULL,
  status tinyint DEFAULT NULL,
  createdAt datetime DEFAULT CURRENT_TIMESTAMP,
  updatedAt datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE configuracao
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY `key` (`key`);


ALTER TABLE elemento
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY simbolo (simbolo),
  ADD UNIQUE KEY nome (nome);


ALTER TABLE etapa
  ADD PRIMARY KEY (id),
  ADD KEY projeto (projeto);


ALTER TABLE etapa_mp
  ADD PRIMARY KEY (id),
  ADD KEY mp (mp),
  ADD KEY etapa (etapa);


ALTER TABLE garantia
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY nutriente_mp (nutriente,materia_prima),
  ADD KEY materia_prima (materia_prima),
  ADD KEY nutriente (nutriente);


ALTER TABLE materia_prima
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY codigo (codigo),
  ADD UNIQUE KEY nome (nome);


ALTER TABLE nutriente
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY nome (nome),
  ADD UNIQUE KEY formula (formula);


ALTER TABLE projeto
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY codigo (codigo);


ALTER TABLE sessao
  ADD PRIMARY KEY (id),
  ADD KEY usuario (usuario);


ALTER TABLE token
  ADD PRIMARY KEY (usuario);


ALTER TABLE usuario
  ADD PRIMARY KEY (id),
  ADD UNIQUE KEY email (email);


ALTER TABLE configuracao
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE elemento
  MODIFY id tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;


ALTER TABLE etapa
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE etapa_mp
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE garantia
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE materia_prima
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE nutriente
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE projeto
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE sessao
  MODIFY id bigint UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE usuario
  MODIFY id int UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE etapa
  ADD CONSTRAINT etapa_ibfk_1 FOREIGN KEY (projeto) REFERENCES projeto (id) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE etapa_mp
  ADD CONSTRAINT etapa_mp_ibfk_2 FOREIGN KEY (mp) REFERENCES materia_prima (id),
  ADD CONSTRAINT etapa_mp_ibfk_3 FOREIGN KEY (etapa) REFERENCES etapa (id) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE garantia
  ADD CONSTRAINT garantia_ibfk_1 FOREIGN KEY (nutriente) REFERENCES nutriente (id),
  ADD CONSTRAINT garantia_ibfk_2 FOREIGN KEY (materia_prima) REFERENCES materia_prima (id);

ALTER TABLE sessao
  ADD CONSTRAINT sessao_ibfk_1 FOREIGN KEY (usuario) REFERENCES usuario (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE token
  ADD CONSTRAINT token_ibfk_1 FOREIGN KEY (usuario) REFERENCES usuario (id) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
