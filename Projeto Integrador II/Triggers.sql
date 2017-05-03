--Atualiza quantidade de exemplares dos livros

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Aumenta a quantidade de volumes na tabela livros a cada volume registrado

CREATE TRIGGER Aumen_Qtd_Livros ON tbl_Volume
AFTER INSERT 
AS
declare @id int
select @id = ID_Livro from inserted
UPDATE tbl_Livro SET Qtd = Qtd + 1 WHERE tbl_Livro.ID_Livro = @id

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Diminui a quantidade de volumes na tabela livros a cada volume registrado

CREATE TRIGGER Diminue_Qtd_Livros ON tbl_Volume
AFTER DELETE 
AS
declare @id int
select @id = ID_Livro from deleted
UPDATE tbl_Livro SET Qtd = Qtd - 1 WHERE tbl_Livro.ID_Livro = @id

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Torna o volume indisponivel durante o emprestimo

CREATE TRIGGER Volume_Indisp ON tbl_Emprestimo
AFTER INSERT 
AS
declare @id int
select @id = ID_Volume from inserted
UPDATE tbl_Volume SET Disponibilidade = 'I' WHERE tbl_Volume.ID_Volume = @id

--////////////////////////////////////////////////////////////////////////////////////////////////////////////

--Torna o volume disponivel após a devolução

CREATE TRIGGER Volume_Dispo ON tbl_Devolucao
AFTER INSERT 
AS
declare @id_empres int, @id int
select @id_empres = ID_Emprestimo from inserted
select @id = ID_Volume from tbl_Emprestimo where tbl_Emprestimo.ID_Emprestimo = @id_empres
UPDATE tbl_Volume SET Disponibilidade = 'D' WHERe tbl_Volume.ID_Volume = @id

--////////////////////////////////////////////////////////////////////////////////////////////////////////////