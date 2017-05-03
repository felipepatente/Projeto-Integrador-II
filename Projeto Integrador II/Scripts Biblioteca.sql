--Criando o banco

CREATE DATABASE DB_Biblioteca

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Usando o banco existente

USE DB_Biblioteca

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

-- Criando as tabelas do banco

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando tabela de livros

CREATE TABLE tbl_Livro(
	
    ID_Livro INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL,
    Autor VARCHAR(50) NOT NULL,
    Editora VARCHAR(50),
    Ano_Publicacao INT NOT NULL,
    Pais_Origem VARCHAR(50) NOT NULL,
	Qtd INT DEFAULT 0

)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando tabela de clientes

CREATE TABLE tbl_Cliente(

	ID_Cliente INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(50) NOT NULL,
    Data_De_Nascimento DATE NOT NULL,
	Sexo CHAR(1) NOT NULL
		CONSTRAINT Sexo_ CHECK (Sexo IN ('F', 'M')),
    Endereco VARCHAR(50) NOT NULL,
    RG VARCHAR(9) NOT NULL
)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando tabela de departamentos

CREATE TABLE tbl_Departamento(

	ID_Departamento INT PRIMARY KEY IDENTITY(1,1),
    Nome_Departamento VARCHAR(50) NOT NULL
)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando tabela de volumes

CREATE TABLE tbl_Volume(

	ID_Volume INT PRIMARY KEY IDENTITY(1,1),
    ID_Livro INT NOT NULL,
	Disponibilidade CHAR(1) DEFAULT 'D' NOT NULL
		CONSTRAINT Disp_ CHECK (Disponibilidade IN ('D', 'I')),
	
    CONSTRAINT FK_Volume FOREIGN KEY (ID_Livro) REFERENCES tbl_Livro(ID_Livro)
	
)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando tabela de funcionarios

CREATE TABLE tbl_Funcionario (

	ID_Funcionario INT PRIMARY KEY IDENTITY(1,1),
    ID_Departamento INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
	Data_De_Nascimento DATE NOT NULL,
	Sexo CHAR(1) NOT NULL
		CONSTRAINT SexoF_ CHECK (Sexo IN ('F', 'M')), 
	Endereco VARCHAR(50) NOT NULL,
    Telefone VARCHAR(9) NOT NULL,
    RG VARCHAR(9) NOT NULL,
	CPF VARCHAR(12) UNIQUE NOT NULL,
    N_Carteira_Trabalho VARCHAR(50) NOT NULL
    
    CONSTRAINT FK_Funcionario FOREIGN KEY (ID_Departamento) REFERENCES tbl_Departamento (ID_Departamento)
    
)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando tabela de emprestimos

CREATE TABLE tbl_Emprestimo(

	ID_Emprestimo INT PRIMARY KEY IDENTITY(1,1),
    ID_Cliente INT NOT NULL,
    ID_Volume INT NOT NULL,
    ID_Funcionario INT NOT NULL,
    Data_Retirada DATE NOT NULL,
    Estimativa_Devolucao DATE NOT NULL
    
    CONSTRAINT FK_Emprestimo FOREIGN KEY (ID_Cliente) REFERENCES tbl_cliente (ID_Cliente),
    CONSTRAINT FK_Emprestimo2 FOREIGN KEY (ID_Volume) REFERENCES tbl_volume (ID_Volume),
    CONSTRAINT FK_Emprestimo3 FOREIGN KEY (ID_Funcionario) REFERENCES tbl_funcionario (ID_Funcionario)

)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando tabela de devolução
CREATE TABLE tbl_Devolucao(

	ID_Devolucao INT PRIMARY KEY IDENTITY(1,1),
    ID_Funcionario INT NOT NULL,
    ID_Emprestimo INT NOT NULL,
    Data_Devolucao DATE NOT NULL,
    Valor_Pagar DECIMAL(6,2) NOT NULL
    
    
    CONSTRAINT FK_Devolucao FOREIGN KEY (ID_Funcionario) REFERENCES tbl_funcionario (ID_Funcionario),
    CONSTRAINT FK_Devolucao2 FOREIGN KEY (ID_Emprestimo) REFERENCES tbl_emprestimo (ID_Emprestimo)

)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Inserindo registros nas tabelas

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Inserindo na tabela livro

INSERT tbl_Livro(Nome,Autor,Editora,Ano_Publicacao,Pais_Origem)
VALUES ('Programação Java','Max Santos','Senac','2001','Brasil');
INSERT tbl_Livro(Nome,Autor,Editora,Ano_Publicacao,Pais_Origem) 
VALUES ('Banco de Dados','Ana Rosa','Saraiva','2002','França');
INSERT tbl_Livro(Nome,Autor,Editora,Ano_Publicacao,Pais_Origem)
VALUES ('Algoritmos','José Roberto','Senac','2001','Colombia');
INSERT tbl_Livro(Nome,Autor,Editora,Ano_Publicacao,Pais_Origem)
VALUES ('Estrutura de Dados','Alan Silva','Saraiva','2002','Brasil');
INSERT tbl_Livro(Nome,Autor,Editora,Ano_Publicacao,Pais_Origem)
VALUES ('Programação PHP','Fabio Santos','Senac','2004','França');

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Inserindo na tabela cliente

INSERT INTO tbl_Cliente VALUES ('Maria','25/04/2001','F','Rua Pujol, 48','492646544');
INSERT INTO tbl_Cliente VALUES ('João','04/03/2002','M','Rua Faria, 01','381535433');
INSERT INTO tbl_Cliente VALUES ('José','01/02/2000','M','Rua Funchal, 51','290424322');
INSERT INTO tbl_Cliente VALUES ('Juca','07/04/2004','M','Rua Olimpia, 81','181313211');
INSERT INTO tbl_Cliente VALUES ('Ana','07/03/1997','F','Rua Flor, 47','072201108');

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Inserindo na tabela departamento

INSERT INTO tbl_Departamento VALUES ('Atendente');
INSERT INTO tbl_Departamento VALUES ('Limpeza');
INSERT INTO tbl_Departamento VALUES ('Gerencia');
INSERT INTO tbl_Departamento VALUES ('Administrativo');
INSERT INTO tbl_Departamento VALUES ('Financeiro');

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Inserindo na tabela volume

INSERT tbl_Volume(ID_Livro) VALUES (2);
INSERT tbl_Volume(ID_Livro) VALUES (4);
INSERT tbl_Volume(ID_Livro) VALUES (1);
INSERT tbl_Volume(ID_Livro) VALUES (5);
INSERT tbl_Volume(ID_Livro) VALUES (3);

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Inserindo na tabela funcionario

INSERT INTO tbl_Funcionario VALUES (4,'Max','01/02/1996','M','Rua Cambuci, 48','46964188','487654128','411978100887','04481')
INSERT INTO tbl_Funcionario VALUES (1,'Felipe','12/04/1994','M','Rua Beija Flor, 23','46691219','376543017','322867011874','13372')
INSERT INTO tbl_Funcionario VALUES (5,'Thiago','02/08/1992','M','Rua Canada, 28','36918171','265432106','214778900763','24489')
INSERT INTO tbl_Funcionario VALUES (2,'Igor','04/07/1997','M','Rua Floripa, 102','40801980','154321215','108967900875','15563')
INSERT INTO tbl_Funcionario VALUES (3,'Ana','08/08/1998','F','Rua Jequiti, 08','31912870','053212434','801651812764','04490')

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Inserindo na tabela emprestimo

INSERT INTO tbl_Emprestimo VALUES (5,4,2,'03/11/2016','09/11/2016')
INSERT INTO tbl_Emprestimo VALUES (3,1,5,'02/11/2016','03/12/2016')
INSERT INTO tbl_Emprestimo VALUES (2,3,1,'03/09/2016','04/10/2016')
INSERT INTO tbl_Emprestimo VALUES (4,2,3,'07/10/2016','07/11/2016')
INSERT INTO tbl_Emprestimo VALUES (1,5,4,'07/11/2016','11/12/2016')

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Inserindo na tabela devolução

INSERT INTO tbl_Devolucao VALUES (4,2,'04/11/2001',9);
INSERT INTO tbl_Devolucao VALUES (3,1,'03/12/2004',8);
INSERT INTO tbl_Devolucao VALUES (5,4,'04/10/2008',10);
INSERT INTO tbl_Devolucao VALUES (2,3,'08/11/2010',18);
INSERT INTO tbl_Devolucao VALUES (1,5,'12/12/2012',20)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Exibindo registros das tabelas

SELECT * FROM tbl_Livro
SELECT * FROM tbl_Volume
SELECT * FROM tbl_Cliente
SELECT * FROM tbl_Departamento
SELECT * FROM tbl_Funcionario
SELECT * FROM tbl_Emprestimo
SELECT * FROM tbl_Devolucao

--////////////////////////////////////////////////////////////////////////////////////////////////////////////