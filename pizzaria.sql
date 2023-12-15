create database pizzaria;

use pizzaria;

create table usuarios
(
id_usuario integer primary key,
nome_usuario varchar(50),
email varchar(50),
senha varchar(50),
cpf numeric (11),
telefone numeric (11)
);

-- ALTER TABLE usuarios
-- ADD CONSTRAINT id_endereco FOREIGN KEY (id_endereco) REFERENCES enderecos (id_endereco);

-- ALTER TABLE usuarios
-- ADD CONSTRAINT id_comentario FOREIGN KEY (id_comentario) REFERENCES comentarios (id_comentario);

create table enderecos
(
id_endereco integer primary key,
cep numeric(8) not null,
rua varchar(50) not null,
bairro varchar(50) not null,
cidade varchar(25) not null, 
estado varchar(25)not null,
id_usuario integer,

foreign key (id_usuario) references usuarios (id_usuario)
);

create table categorias
(
id_categoria integer primary key,
nome_categoria varchar(25) not null
);

create table produtos
(
id_produto integer primary key,
nomeProduto varchar(50) not null,
preco double,
descricao varchar(100) not null,
avaliacao_geral double,
id_categoria integer,

foreign key (id_categoria) references categorias (id_categoria)
);

-- ALTER TABLE produtos
-- ADD CONSTRAINT id_comentario FOREIGN KEY (id_comentario) REFERENCES comentarios (id_comentario);

create table pedidos
(
id_pedido integer primary key,
data_pedido date,
endereco_entrega varchar(455),
id_usuario integer,
    
foreign key (id_usuario) references usuarios(id_usuario)
);

create table pagamentos (
id_pagamento integer primary key,
total_a_pagar double,
data_pagamento date,
forma_pagamento varchar(55),
id_pedido integer,
    
foreign key (id_pedido) references pedidos (id_pedido)
);

create table comentarios
(
id_comentario integer primary key,
comentario varchar(150),
avaliacao numeric(5) not null,
data_comentario date,
id_usuario integer,
id_produto integer,

foreign key (id_usuario) references usuarios (id_usuario),
foreign key (id_produto) references produtos (id_produto)
);

drop database pizzaria



