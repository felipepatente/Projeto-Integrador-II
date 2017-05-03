--Comandos relacionados com views

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando view de visualização de dados referente aos volumes

CREATE VIEW vw_Volume (Num_Volume, Nome_Livro, Autor, Ano, Disponibilidade)
AS 
SELECT tbl_Volume.ID_Volume, tbl_Livro.Nome, tbl_Livro.Autor, tbl_Livro.Ano_Publicacao, tbl_Volume.Disponibilidade
FROM tbl_Livro, tbl_Volume WHERE tbl_Volume.ID_Livro = tbl_Livro.ID_Livro

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando view de visualização de dados referente aos emprestimos

CREATE VIEW vw_Emprestimo(Nome_Cliente, Volume, Nome_Livro, Retirada, Estimativa_Devolu, Funci_Respon)
AS
SELECT tbl_Cliente.Nome, tbl_Volume.ID_Volume, tbl_Livro.Nome, tbl_Emprestimo.Data_Retirada,
tbl_Emprestimo.Estimativa_Devolucao, tbl_Funcionario.Nome
FROM tbl_Cliente, tbl_Volume, tbl_Livro, tbl_Emprestimo, tbl_Funcionario
WHERE tbl_Emprestimo.ID_Cliente = tbl_Cliente.ID_Cliente AND tbl_Emprestimo.ID_Volume = tbl_Volume.ID_Volume AND
tbl_Livro.ID_Livro = tbl_Volume.ID_Livro AND tbl_Funcionario.ID_Funcionario = tbl_Emprestimo.ID_Emprestimo

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Executando view de visualização de dados referente a devolução

CREATE VIEW vw_Devolucao (Nome_Cliente, Livro, Data_Empres, Data_devo, Funcio_resp, Valor_Pagar)
AS
SELECT tbl_Cliente.Nome, tbl_Livro.Nome, tbl_Emprestimo.Data_Retirada, tbl_Devolucao.Data_Devolucao,
tbl_Funcionario.Nome, tbl_Devolucao.Valor_Pagar
FROM tbl_Devolucao, tbl_Cliente, tbl_Livro, tbl_Volume, tbl_Emprestimo, tbl_Funcionario
WHERE tbl_Emprestimo.ID_Emprestimo = tbl_Devolucao.ID_Emprestimo AND tbl_Cliente.ID_Cliente = tbl_Emprestimo.ID_Cliente AND
tbl_Emprestimo.ID_Volume = tbl_Volume.ID_Volume AND tbl_Livro.ID_Livro = tbl_Volume.ID_Livro AND
tbl_Devolucao.ID_Funcionario = tbl_Funcionario.ID_Funcionario

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Criando view de visualização de dados referente aos funcionarios

CREATE VIEW vw_Funcionario (Nome_Func, Sexo, Departamento)
AS
SELECT tbl_Funcionario.Nome, tbl_Funcionario.Sexo, tbl_Departamento.Nome_Departamento
FROM tbl_Funcionario, tbl_Departamento
WHERE tbl_Funcionario.ID_Departamento = tbl_Departamento.ID_Departamento

--////////////////////////////////////////////////////////////////////////////////////////////////////////////


--Executando as views

--Executando view de visualização de dados referente ao volume

SELECT * FROM vw_Volume

--/////////////////////////////////////////////////////////////////////////////////////

--Executando view de visualização de dados referente ao emprestimo

SELECT * FROM vw_Emprestimo

--/////////////////////////////////////////////////////////////////////////////////////

--Executando view de visualização de dados referente a devoluçao

SELECT * FROM vw_Devolucao

--/////////////////////////////////////////////////////////////////////////////////////


--Execuntado view de visualização de dados referente aos funcionarios

SELECT * FROM vw_Funcionario

--/////////////////////////////////////////////////////////////////////////////////////
