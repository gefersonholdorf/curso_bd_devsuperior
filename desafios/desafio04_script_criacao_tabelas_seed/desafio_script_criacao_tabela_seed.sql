CREATE TABLE tb_regiao (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	localidade_s FLOAT NOT NULL,
	localidade_w FLOAT NOT NULL,
	descricao TEXT
);

CREATE TABLE tb_vinicola (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	descricao TEXT,
	fone VARCHAR(9),
	email VARCHAR(30) UNIQUE NOT NULL,
	regiao_id INTEGER NOT NULL,
	FOREIGN KEY(regiao_id) REFERENCES tb_regiao(id)
);

CREATE TABLE tb_tipo_vinho (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL
);

CREATE TABLE tb_vinho (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	tipo_id INTEGER NOT NULL,
	preco FLOAT,
	vinicola_id INTEGER NOT NULL,
	FOREIGN KEY(tipo_id) REFERENCES tb_tipo_vinho(id),
	FOREIGN KEY(vinicola_id) REFERENCES tb_vinicola(id)
);

INSERT INTO tb_regiao VALUES(1, 'Vale Central', 33.8088, 70.7644, 'Chile');
INSERT INTO tb_regiao VALUES(2, 'Serra Gaúcha', 29.3746, 50.8764, 'Sul do Brasil');

INSERT INTO tb_vinicola VALUES(1, 'Santa Rita', 'localizada no valle delmaipo e tem mais de 100 anos de história', null, 'santa@gmail.com', 1);
INSERT INTO tb_vinicola VALUES(2, 'Santa Carolina', null, '3395-4422', 'carolina@gmail.com', 1);
INSERT INTO tb_vinicola VALUES(3, 'Garibaldi', 'Vinícola situada na serra gaúcha', '9822-3344', 'garibaldi@gmail.com', 2);

INSERT INTO tb_tipo_vinho VALUES(1, 'Tinto');
INSERT INTO tb_tipo_vinho VALUES(2, 'Branco');
INSERT INTO tb_tipo_vinho VALUES(3, 'Rose');
INSERT INTO tb_tipo_vinho VALUES(4, 'Bordeaux');

INSERT INTO tb_vinho VALUES(1, 'Amanda', 1, 100.0, 1);
INSERT INTO tb_vinho VALUES(2, 'Belinha', 2, 200.0, 1);
INSERT INTO tb_vinho VALUES(3, 'Camila', 4, 65.0, 2);
INSERT INTO tb_vinho VALUES(4, 'Daniela', 3, 89.0, 2);
INSERT INTO tb_vinho VALUES(5, 'Eduarda', 1, 55.0, 3);
INSERT INTO tb_vinho VALUES(6, 'Fernanda', 2, 70.0, 3);