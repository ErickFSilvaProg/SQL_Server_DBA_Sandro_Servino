/* Área de transações - WAL (Log File):
	
	- Atualmente os bancos de dados tem uma proteção que, antes de gravar os dados no disco de dados, ele grava antes no log no disco de log.
	- Os arquivos de dados são criados com a extenção .mdf.
	- Os arquivos de dados são criados com a extenção .ldf.
	- Podemos criar mais de um 'file' para armazenar dados, podendo ficar em dois discos.
	- Podemos até colocar uma tabela grande em um disco específico.
	- Não seria uma boa prática criar mais de um 'file' do arquivo de 'log'.
	- A cada 1 minuto o SQL Server ativa o robô 'checkpoint' e verifica, na memória, quais instruções chegaram com o 'comando commit' para aplica-los na área de dados do disco de dados.

*/


-- Cria um banco de dados:
create database BANCOX
go


-- Cria uma tabela:
create table cliente(
	nome nchar(10)
)
go


-- Inicia uma transação única no SQL Server
begin transaction

-- Insere dados na tabela:
insert into cliente (nome) values ('Ana')
insert into cliente (nome) values ('José')
insert into cliente (nome) values ('Pedro')
insert into cliente (nome) values ('Tereza')
insert into cliente (nome) values ('Augusto')
insert into cliente (nome) values ('João')
go

-- Finalisa a transação única no SQL Server
commit transaction


-- Desfazer a última execução:
rollback transaction
go


-- Exibe dados commitados na tabela:
select nome 'CLIENTES' from cliente
go

-- Exibe dados não commitados na tabela:
select * from cliente with (nolock) -- É arriscado, pois não garante que os dados serão commitados na tabela.
go


-- Deleta od dados na tabela:
delete from cliente
go