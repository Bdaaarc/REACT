CREATE DATABASE SIGEPS;
USE SIGEPS;

CREATE TABLE CLIENTE(
codigo_cliente int(11) primary key not null,
nome_cliente varchar(100) not null,
telefone_cliente varchar(20) not null
);

CREATE TABLE ADM(
codigo_adm int(11) primary key not null,
nome_adm varchar(100) not null
);

CREATE TABLE STATUS_CHAMADO(
codigo_status_chamado int(11) primary key not null,
nome_status_chamado varchar(100) not null
);

CREATE TABLE ESPECIALIDADE(
codigo_especialidade int(11) primary key not null,
nome_especialista varchar(100) not null
);

CREATE TABLE TIPO_SISTEMA(
codigo_tipo_sistema int(11) primary key not null,
nome_tipo_sistema varchar(20) not null
);

CREATE TABLE SISTEMA (
nome_sistema varchar(100) not null,
codigo_sistema int(11) primary key not null,
versao_sistema varchar(20) not null,
codigo_tipo_sistema int(11),
FOREIGN KEY (codigo_tipo_sistema) REFERENCES TIPO_SISTEMA(codigo_tipo_sistema)
);

CREATE TABLE ESPECIALISTA(
codigo_especialista int(11) primary key not null,
nome_especialista varchar(100) not null,
codigo_especialidade int(11) not null,
FOREIGN KEY (codigo_especialidade) REFERENCES ESPECIALIDADE(codigo_especialidade)
);

CREATE TABLE TRIAGEM(
codigo_triagem int(11) primary key not null,
prioridade_triagem varchar(20) not null,
codigo_especialista int(11) not null,
classificacao_triagem varchar(20) not null,
FOREIGN KEY (codigo_especialista) REFERENCES ESPECIALISTA(codigo_especialista)
);

CREATE TABLE TIPO_MANUTENCAO(
nome_chamado varchar(100) not null,
descricao_chamado varchar(100)not null,
codigo_status_chamado int(11) not null,
codigo_cliente int(11) not null,
codigo_sistema int(11) not null,
numero_chamado int(11) not null,
data_abert_chamado date,
data_fim_chamado date,
codigo_triagem int(11) not null,
codigo_tipo_manutencao int(11)  primary key not null,
codigo_especialista int(11) not null,
FOREIGN KEY (codigo_status_chamado) REFERENCES STATUS_CHAMADO(codigo_status_chamado),
FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE(codigo_cliente),
FOREIGN KEY (codigo_sistema) REFERENCES SISTEMA(codigo_sistema),
FOREIGN KEY (codigo_triagem) REFERENCES TRIAGEM(codigo_triagem),
FOREIGN KEY (codigo_especialista) REFERENCES ESPECIALISTA(codigo_especialista)
);

CREATE TABLE CHAMADOS(
nome_chamado  varchar(100) not null,
descricao_chamado varchar(100) not null,
numero_chamado int(11) primary key not null,
data_abert_chamado date not null,
data_fim_chamado date not null,
codigo_status_chamado int(11) not null,
codigo_cliente int(11) not null,
codigo_sistema int(11) not null,
codigo_triagem int(11) not null,
codigo_tipo_manutencao int(11) not null,
codigo_especialista int(11) not null,
FOREIGN KEY (codigo_status_chamado) REFERENCES STATUS_CHAMADO(codigo_status_chamado),
FOREIGN KEY (codigo_cliente) REFERENCES CLIENTE(codigo_cliente),
FOREIGN KEY (codigo_sistema) REFERENCES SISTEMA(codigo_sistema),
FOREIGN KEY (codigo_triagem) REFERENCES TRIAGEM(codigo_triagem),
FOREIGN KEY (codigo_tipo_manutencao) REFERENCES TIPO_MANUTENCAO(codigo_tipo_manutencao),
FOREIGN KEY (codigo_especialista) REFERENCES ESPECIALISTA(codigo_especialista)
);

CREATE TABLE TIPO_DE_TESTE(
codigo_tipo_teste int(11) primary key auto_increment not null,
nome_tipo_teste varchar(45) not null, 
descricao_tipo_teste varchar(45) not null
);

CREATE TABLE TESTADOR(
codigo_testador int(11) primary key auto_increment not null,
nome_testador varchar(50) not null
);

CREATE TABLE PLANO_TESTE(
codigo_plano_teste int(11) primary key auto_increment not null,
nome_plano_teste varchar(100) not null,
descricao_plano_teste varchar(100) not null,
data_criacao_plano date not null,
codigo_testador int(11) not null,
foreign key (codigo_testador) references TESTADOR(codigo_testador)
);



CREATE TABLE RELATO_DE_NAO_CONFORMIDADE(
codigo_relato int(11) primary key auto_increment not null,
descricao_relato varchar(200) not null,
data_abertura_relato date not null,
data_encerramento_relato date not null,
codigo_testador int(11) not null,
codigo_tipo_teste int(11) not null,
codigo_sistema int(11) not null,
nome_status_relato varchar(100) not null,
foreign key (codigo_testador) references testador (codigo_testador),
foreign key (codigo_sistema) references sistema (codigo_sistema),
foreign key (codigo_tipo_teste) references tipo_de_teste (codigo_tipo_teste)
);

CREATE TABLE IMPLANTACAO(
codigo_implantacao int (11) not null,
nome_implantacao varchar (100) not null,
data_inic_implantacao date not null,
data_fim_implantacao date not null,
status_implantacao varchar (20) not null,
codigo_sistema int(11) not null, 
codigo_cliente int (11) not null,
foreign key (codigo_sistema) references sistema (codigo_sistema),
foreign key (codigo_cliente) references cliente (codigo_cliente)
);



