-- Criar o banco de dados "empresa"
create database empresa
go


-- Selecionar o banco "empresa"
use empresa
go


-- Tabela: cargo
create table cargo(
	idCargo int not null,
	nomeCargo varchar(40)
	constraint pk_cargo 
		primary key clustered(idCargo asc)
)
go


-- Tabela: funcionario
create table funcionario(
	idFuncionario int not null,
	nomeFuncionario varchar(50) not null,
	id_Cargo int not null
	-- Primary key
	constraint pk_funcionario 
		primary key clustered(idFuncionario),
	-- Foreign key
	constraint fk_funcionario_cargo 
		foreign key(id_Cargo) references cargo(idCargo) 
		on delete no action 
		on update no action
)
go


-- Tabela: dependente
create table dependente(
	idDependente int not null,
	nomeDependente varchar(50) not null,
	id_Funcionario int not null
	-- Primary key
	constraint pk_dependente 
		primary key clustered(idDependente),
	-- Foreign key
	constraint fk_dependente_funcionario
		foreign key(id_Funcionario) references funcionario(idFuncionario)
		on delete no action
		on update no action
)
go


-- Tabela: endereco
create table endereco(
	idEndereco int not null,
	ruaEndereco varchar(40) not null,
	numeroEndereco varchar(5) not null,
	complementoEndereco varchar(30),
	bairroEndereco varchar(40) not null,
	cidadeEndereco varchar(40) not null,
	ufEndereco char(2) not null,
	id_Funcionario int not null
	-- Primary key
	constraint pk_endereco 
		primary key clustered(idEndereco)
	-- Foreing key
	constraint fk_endereco_funcionario
		foreign key(id_Funcionario) references funcionario(idFuncionario)
		on delete no action
		on update no action
)
go


-- Tabela: telefone
create table telefone(
	idTelefone int not null,
	codAreaTelefone char(2),
	numeroTelefone char(9),
	id_Funcionario int not null
	-- Primary key
	constraint pk_telefone 
		primary key clustered(idTelefone)
	-- Foreign key
	constraint fk_telefone_funcionario
		foreign key(id_Funcionario) references funcionario(idFuncionario)
		on delete no action
		on update no action
)
go
