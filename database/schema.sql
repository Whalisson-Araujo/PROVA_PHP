
CREATE TABLE mensageiro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE contribuinte (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE tipos_pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE movimento_diario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_movimento DATE NOT NULL,
    id_mensageiro INT NOT NULL,
    FOREIGN KEY (id_mensageiro) REFERENCES mensageiro(id)
);

CREATE TABLE contribuicao (
    recibo INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10, 2) NOT NULL,
    data_prevista DATE NOT NULL,
    status ENUM('Pendente', 'Recebido', 'Cancelado') DEFAULT 'Pendente',
    data_recebimento DATETIME,
    id_mensageiro INT,
    id_tipo_pagamento INT,
    id_contribuinte INT,
    FOREIGN KEY (id_mensageiro) REFERENCES mensageiro(id),
    FOREIGN KEY (id_tipo_pagamento) REFERENCES tipos_pagamento(id),
    FOREIGN KEY (id_contribuinte) REFERENCES contribuinte(id)
);