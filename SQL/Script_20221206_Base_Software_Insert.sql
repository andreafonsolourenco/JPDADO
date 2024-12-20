if(select usertypeid from usertype where nome = 'Administrador') is null
begin
	insert into usertype(nome, notas, administrador)
	values('Administrador', '', 1)
end
go

if(select usertypeid from usertype where nome = 'Default User') is null
begin
	insert into usertype(nome, notas, administrador)
	values('Default User', '', 0)
end
go

if(select usersid from users where codigo = 'AL') is null
begin
	insert into users(nome, codigo, email, telemovel, ativo, password, notas, id_tipo_utilizador)
	select 'André Lourenço', 'AL', 'afonsopereira6@gmail.com', '912803666', 1, 'liedson31', '', usertypeid
	from usertype
	where nome = 'Administrador'
end
go

if(select usersid from users where codigo = 'JPOLIVEIRA') is null
begin
	insert into users(nome, codigo, email, telemovel, ativo, password, notas, id_tipo_utilizador)
	select 'João Paulo Oliveira', 'JPOLIVEIRA', 'jogaboliveira@gmail.com', '934501962', 1, 'jpdado', '', usertypeid
	from usertype
	where nome = 'Administrador'
end
go