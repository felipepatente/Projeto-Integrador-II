--Criando stored procedures

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

----Stored procedure inserir dados na tabela livro

CREATE PROCEDURE InserirLivro(@Nome VARCHAR(50), @Autor VARCHAR(50), @Editora VARCHAR(50),
 @Ano INT, @Origem VARCHAR(50))
AS
INSERT tbl_Livro(Nome,Autor,Editora,Ano_Publicacao,Pais_Origem) 
VALUES(@Nome, @Autor, @Editora, @Ano, @Origem)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Stored procedure inserir dados na tabela volume

CREATE PROCEDURE InserirVolume(@ID_Livro INT)
AS
INSERT tbl_Volume(ID_Livro) VALUES (@ID_Livro)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

----Stored procedure inserir dados na tabela departamento

CREATE PROCEDURE InserirDepartamento (@Nome VARCHAR(50))
AS
INSERT INTO tbl_Departamento VALUES(@Nome)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Stored procedure inserir dados na tabela cliente

CREATE PROCEDURE Inserir_Cliente(@Nome VARCHAR(50), @Data_Nasc DATE, @Sexo CHAR, @Endereco VARCHAR(50), @RG VARCHAR(9))
AS
INSERT INTO tbl_Cliente VALUES (@Nome, @Data_Nasc, @Sexo, @Endereco, @RG)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Stored procedure inserir dados na tabela Funcionario

CREATE PROCEDURE InserirFuncionario(@ID_DEP INT, @Nome VARCHAR(50), @Data_Nasc DATE, @Sexo char(1), @Endereco VARCHAR(50), @Telefone VARCHAR(9), @RG VARCHAR(9), @CPF VARCHAR(9), @Trabalho VARCHAR(50))
AS
INSERT INTO tbl_Funcionario VALUES (@ID_DEP, @Nome, @Data_Nasc, @Sexo, @Endereco, @Telefone, @RG, @CPF, @Trabalho)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Stored procedure inserir dados na tabela Emprestimo

CREATE PROCEDURE InserirEmprestimo (@ID_Cliente INT, @ID_Volume INT, @ID_Funcionario INT, @Data_Retirada DATE, @Estimativa_Devolucao DATE)
AS
INSERT INTO tbl_Emprestimo VALUES (@ID_Cliente, @ID_Volume, @ID_Funcionario, @Data_Retirada, @Estimativa_Devolucao)

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

----Stored procedure inserir dados na tabela Devolução

CREATE PROCEDURE InserirDevolucao (@ID_Funcionario INT, @ID_Emprestimo INT, @Data_Devolucao DATE, @Valor DECIMAL(2))
AS
INSERT INTO tbl_Devolucao VALUES(@ID_Funcionario, @ID_Emprestimo, @Data_Devolucao, @Valor) 

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Executando as procedures

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Executando procedure para inserir dados na tabela  livros

EXEC InserirLivro 
@Nome = 'Logica de Programação', 
@Autor = 'Gley Fabiano Cardoso', 
@Editora = 'Senac São Paulo', 
@Ano = '1999',
@Origem = 'São Paulo'

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Executando procedure para inserir dados na tabela volume

EXEC InserirVolume 
@ID_Livro = 2

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Executando procedure para inserir dados na tabela departamento

EXEC InserirDepartamento 
@Nome = 'Gestão'

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Executando procedure para inserir dados na tabela cliente

EXEC Inserir_Cliente 
@Nome = 'Felipe', 
@Data_Nasc = '25/03/2000', 
@Sexo = 'M', 
@Endereco = 'Rua Funchal, 42',
@RG = '482513695'

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Executando procedure para inserir dados na tabela funcionario

EXEC InserirFuncionario 
@ID_DEP = 1, 
@Nome = 'Camila',
@Data_Nasc = '16/03/1979',
@Sexo = 'F',
@Endereco = 'Avenida Belmira Marim, 237',
@Telefone = '92037183',
@RG = '930267340',
@CPF = '2029994892602',
@Trabalho = '123658'

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Executando procedure para inserir dados na tabela emprestimo

EXEC InserirEmprestimo 
@ID_Cliente = 1,
@ID_Volume = 1,
@ID_Funcionario = 1,
@Data_Retirada = '25/03/2000',
@Estimativa_Devolucao = '25/04/2000'

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Executando procedure para inserir dados na tabela devolucao

EXEC InserirDevolucao 
@ID_Funcionario = 1,
@ID_Emprestimo = 1,
@Data_Devolucao = '25/04/2015',
@Valor = 4.12

--////////////////////////////////////////////////////////////////////////////////////////////////////////////