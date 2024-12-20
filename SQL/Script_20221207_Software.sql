IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_USERTYPE]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_USERTYPE]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_USERTYPE](@id_tipo int)
returns table as return
(
    SELECT
		USERTYPEID as id,
		nome,
		notas,
		administrador,
		ctrldata,
		ctrlcodop,
		ctrldataupdt,
		ctrlcodopupdt
    FROM USERTYPE
    WHERE (@id_tipo is null or @id_tipo = USERTYPEID)
)
GO



IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_USERS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_USERS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_USERS](@id_user int, @username varchar(500), @password varchar(250), @ativo bit, @id_tipo int)
returns table as return
(
	select
		u.usersid as id,
		u.nome,
		u.codigo,
		u.email,
		u.telemovel,
		u.ativo,
		u.password,
		u.notas,
		u.lastlogin,
		ut.id as id_tipo,
		ut.nome as tipo,
		ut.administrador,
		u.ctrldata,
		u.ctrlcodop,
		u.ctrldataupdt,
		u.ctrlcodopupdt
	from users u
	inner join REPORT_USERTYPE(@id_tipo) as ut on ut.id = id_tipo_utilizador
	where (@id_user is null or @id_user = USERSID)
	and (@username is null or @username = u.codigo)
	and (@password is null or @password = u.password)
	and (@ativo is null or @ativo = u.ativo)
	and (@id_tipo is null or @id_tipo = u.id_tipo_utilizador)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_CONFIGS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_CONFIGS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_CONFIGS]()
returns table as return
(
	select
		email, 
		email_password, 
		email_smtp, 
		email_smtpport, 
		emails_alerta, 
		sessaomaxmin
	from APPLICATION_CONFIG
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[REGISTA_LOG]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[REGISTA_LOG]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[REGISTA_LOG](
	@idUser int,
	@id INT,
	@tipo varchar(200),
	@texto varchar(max),
	@ret int OUTPUT,
    @retMsg VARCHAR(max) OUTPUT
)
AS BEGIN
	DECLARE @codOp varchar(500);

	select @codOp = codigo from REPORT_USERS(@idUser, null, null, 1, null)

	INSERT INTO [LOG](id_user, id_relacionado, tipo, notas, ctrlcodop)
	VALUES(@idUser, @id, @tipo, @texto, @codOp)

	set @ret = SCOPE_IDENTITY();
	set @retMsg = 'Log registado com sucesso!';

	return;
END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VALIDATE_USER_SESSION]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[VALIDATE_USER_SESSION]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VALIDATE_USER_SESSION](
	@id INT,
    @ret bit OUTPUT,
	@admin bit OUTPUT,
	@name varchar(max) OUTPUT
)
AS BEGIN
	DECLARE @u varchar(150);
    DECLARE @p varchar(60);
    DECLARE @ativo bit = 1;
    DECLARE @id_tipo int;
    DECLARE @sessaomax int = (select sessaomaxmin from report_configs());
	DECLARE @tipoLog varchar(200) = 'SESSÃO';
	DECLARE @log varchar(max);
	DECLARE @codOp varchar(500);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);

    SELECT 
	    @ret = CASE WHEN DATEDIFF(mi, ut.lastlogin, getdate()) > @sessaomax then 0 else 1 end,
		@admin = administrador,
		@name = nome,
		@codOp = codigo
    FROM report_users(@id, @u, @p, @ativo, @id_tipo) ut 

	if(@sessaomax = 0)
	begin
		set @log = CONCAT('O utilizador ', @codOp, ' perdeu a sessão')

		EXEC REGISTA_LOG @id, null, @tipoLog, @log, @retLog output, @retMsgLog output;
	end

	return;
END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[login]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[login]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[login](
	@user varchar(150),
	@pass varchar(60),
    @ret int OUTPUT,
    @retMsg VARCHAR(max) OUTPUT
)
AS BEGIN
	declare @id int;
	declare @ativo bit;
	declare @id_tipo int;
	declare @dataatual datetime;
	DECLARE @tipoLog varchar(200) = 'LOGIN';
	DECLARE @log varchar(max);
	DECLARE @codOp varchar(500);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @idAcesso int;

	select top 1
		@id = id,
		@ativo = ativo,
		@codOp = codigo
	from REPORT_USERS(@id, @user, @pass, @ativo, @id_tipo)

	IF (@id is not null)
		BEGIN
			IF (@ativo = 1)
				begin
					set @dataatual = getdate()
					set @ret = @id;
					set @retMsg = 'Login efetuado com sucesso!'

					UPDATE USERS SET lastlogin = @dataatual WHERE USERSID = @id;
					INSERT INTO ACESSOS (id_utilizador, datahora) SELECT @id, @dataatual;

					set @idAcesso = SCOPE_IDENTITY();

					set @log = CONCAT('O utilizador ', @codOp, ' efetuou login no sistema')

					EXEC REGISTA_LOG @id, @idAcesso, @tipoLog, @log, @retLog output, @retMsgLog output;
				end
			ELSE
				begin
					set @ret = -1;
					set @retMsg = 'Utilizador Inativo!' + CHAR(13) + CHAR(10) + 'Para mais informações, por favor contacte o administrador do sistema!';
				end
		END
	ELSE 
		BEGIN
			set @ret = -2;
			set @retMsg = 'Dados de autenticação inválidos!';
		END

	RETURN;
END;
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_USER]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DELETE_USER]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DELETE_USER](
	@idUser int,
	@id int,
	@ret int OUTPUT,
	@retMsg varchar(max) output
)
AS BEGIN
	DECLARE @tipoLog varchar(200) = 'UTILIZADORES';
	DECLARE @log varchar(max);
	DECLARE @codOp varchar(500);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @admin bit;
	DECLARE @codUser varchar(max);
	
	select @admin = administrador, @codOp = codigo from REPORT_USERS(@idUser, null, null, 1, null)

	IF(ISNULL(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'O utilizador não tem permissões para apagar utilizadores!';
		return
	end

	IF(@id = @idUser)
	begin
		set @ret = -2;
		set @retMsg = 'O utilizador não se pode eliminar a ele próprio visto estar a usar o sistema! Por favor, contacte outro administrador!';
		return
	end

	select @codUser = codigo from REPORT_USERS(@id, null, null, null, null)

	delete from acessos where id_utilizador = @id;
	delete from USERS where USERSID = @id;

	set @ret = @id;
	set @retMsg = 'Utilizador eliminado com sucesso!';

	set @log = CONCAT('O utilizador ', @codOp, ' removeu o utilizador ', @codUser, ' e consequentemente todos os seus acessos')

	EXEC REGISTA_LOG @idUser, @id, @tipoLog, @log, @retLog output, @retMsgLog output;
END;
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_UTILIZADOR]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_UTILIZADOR]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRIA_EDITA_UTILIZADOR](
	@idUser int,
	@id INT,
	@nome varchar(max),
	@codigo varchar(500),
	@email varchar(max),
	@telemovel varchar(50),
	@ativo bit,
	@password varchar(250),
	@notas varchar(max),
	@id_tipo int,
	@ret int OUTPUT,
    @retMsg VARCHAR(max) OUTPUT
)
AS BEGIN
	DECLARE @codOp varchar(500);
	DECLARE @admin bit;
	DECLARE @tipoLog varchar(200) = 'UTILIZADORES';
	DECLARE @log varchar(max);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @matricula varchar(20);

	select @codOp = codigo, @admin = administrador from REPORT_USERS(@idUser, null, null, 1, null)

	if(isnull(@admin, 0) = 0 and isnull(@idUser, 0) <> isnull(@id, 0))
	begin
		set @ret = -1;
		set @retMsg = 'Utilizador não tem permissões suficientes para efetuar a operação!';
		return
	end
	else
	begin
		if(isnull(@id, 0) <= 0)
		begin
			insert into users(nome, codigo, email, telemovel, ativo, [password], notas, id_tipo_utilizador, ctrldata, ctrlcodop)
			values(@nome, @codigo, @email, @telemovel, @ativo, @password, @notas, @id_tipo, getdate(), @codOp)

			set @ret = SCOPE_IDENTITY();
			set @retMsg = 'Utilizador ' + @codigo + ' inserido com sucesso!';

			set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados do utilizador ', @codigo)
		end
		else
		begin
			update users
				set nome = @nome,
				codigo = @codigo,
				email = @email,
				telemovel = @telemovel,
				ativo = @ativo,
				[password] = @password,
				notas = @notas,
				id_tipo_utilizador = @id_tipo,
				ctrldataupdt = getdate(),
				ctrlcodopupdt = @codOp
			where usersid = @id

			set @ret = @id;
			set @retMsg = 'Utilizador ' + @codigo + ' atualizado com sucesso!';

			set @log = CONCAT('O utilizador ', @codOp, ' atualizou os dados do utilizador ', @codigo)
		end
	end

	EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;

	return;
END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_PORTFOLIO_TIPO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_PORTFOLIO_TIPO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_PORTFOLIO_TIPO](@id int)
returns table as return
(
	select
		portfolio_tipoid as id,
		nome,
		nome_en,
		nome_fr,
		nome_es
	from portfolio_tipo
	where (@id is null or @id = PORTFOLIO_TIPOID)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_PORTFOLIO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_PORTFOLIO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_PORTFOLIO](@id int, @id_tipo int, @localidade varchar(500), @ano int)
returns table as return
(
	select
		portfolioid as id,
		localidade,
		texto,
		texto_en,
		texto_fr,
		texto_es,
		empresa,
		id_tipo,
		rpt_tp.nome as tipo,
		rpt_tp.nome_en as tipo_en,
		rpt_tp.nome_fr as tipo_fr,
		rpt_tp.nome_es as tipo_es,
		imagem_capa,
		ordem,
		ano
	from portfolio pt
	inner join REPORT_PORTFOLIO_TIPO(@id_tipo) rpt_tp on rpt_tp.id = pt.id_tipo
	where (@id is null or @id = pt.portfolioid)
	and (@id_tipo is null or @id_tipo = pt.ID_TIPO)
	and (@localidade is null or @localidade = pt.localidade)
	and (@ano is null or @ano = pt.ano)
)
GO




IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_DASHBOARD_DATA]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_DASHBOARD_DATA]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_DASHBOARD_DATA]()
returns table as return
(
	with obras as (
		select
			count(id) as total1,
			'Obras' as label1,
			'Total de Obras Efetuadas' as rodape1
		from REPORT_PORTFOLIO(null, null, null, null)
	),
	img_obras as (
		select
			count(id) as total2,
			'Obras com Imagens' as label2,
			'Total de Obras com Imagens' as rodape2
		from REPORT_PORTFOLIO(null, null, null, null)
		where ISNULL(imagem_capa, '') <> ''
	)

	SELECT 
		label1,
		total1,
		rodape1,

		label2,
		total2,
		rodape2
	from obras
	inner join img_obras on 1=1
)
GO



IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_GRAPHIC_DATA]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_GRAPHIC_DATA]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_GRAPHIC_DATA]()
returns table as return
(
	select
		COUNT(id) as nr,
		ano
	from REPORT_PORTFOLIO(null, null, null, null)
	group by ano
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_TEXTOS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_TEXTOS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_TEXTOS](@id int, @codigo varchar(100))
returns table as return
(
	select
		textosid as id,
		CODIGO,
		NOME,
		NOME_EN,
		NOME_FR,
		NOME_ES,
		TEXTO,
		TEXTO_EN,
		TEXTO_FR,
		TEXTO_ES,
		ordem
	from textos
	where (@id is null or @id = textosid)
	and (@codigo is null or @codigo = codigo)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_CONTACTOS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_CONTACTOS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_CONTACTOS]()
returns table as return
(
	select
		CONTACTOSID as id,
		NOME,
		MORADA1,
		MORADA2,
		COD_POSTAL,
		LOCALIDADE
	from CONTACTOS
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_CONTACTOS]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_CONTACTOS]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRIA_EDITA_CONTACTOS](
	@idUser int,
	@id INT,
	@nome varchar(500),
	@morada1 varchar(500),
	@morada2 varchar(500),
	@codpostal varchar(500),
	@localidade varchar(500),
	@ret int OUTPUT,
    @retMsg VARCHAR(max) OUTPUT
)
AS BEGIN
	DECLARE @codOp varchar(500);
	DECLARE @admin bit;
	DECLARE @tipoLog varchar(200) = 'CONTACTOS';
	DECLARE @log varchar(max);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);

	select @codOp = codigo, @admin = administrador from REPORT_USERS(@idUser, null, null, 1, null)

	if(isnull(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'Utilizador não tem permissões suficientes para efetuar a operação!';
		return
	end
	else
	begin
		if(isnull(@id, 0) <= 0)
		begin
			insert into contactos(nome, morada1, morada2, cod_postal, localidade, ctrldata, ctrlcodop)
			values(@nome, @morada1, @morada2, @codpostal, @localidade, getdate(), @codOp)

			set @ret = SCOPE_IDENTITY();
			set @retMsg = 'Contactos inseridos com sucesso!';

			set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados de contacto')
		end
		else
		begin
			update contactos
				set nome = @nome,
				morada1 = @morada1,
				morada2 = @morada2,
				cod_postal = @codpostal,
				localidade = @localidade,
				ctrldataupdt = getdate(),
				ctrlcodopupdt = @codOp
			where contactosid = @id

			set @ret = @id;
			set @retMsg = 'Contactos atualizados atualizado com sucesso!';

			set @log = CONCAT('O utilizador ', @codOp, ' atualizou os dados de contacto')
		end
	end

	EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;

	return;
END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_TEXTOS]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_TEXTOS]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRIA_EDITA_TEXTOS](
	@idUser int,
	@id INT,
	@codigo varchar(100),
	@nome varchar(500),
	@nome_en varchar(500),
	@nome_fr varchar(500),
	@nome_es varchar(500),
	@texto varchar(max),
	@texto_en varchar(max),
	@texto_fr varchar(max),
	@texto_es varchar(max),
	@ordem int,
	@ret int OUTPUT,
    @retMsg VARCHAR(max) OUTPUT
)
AS BEGIN
	DECLARE @codOp varchar(500);
	DECLARE @admin bit;
	DECLARE @tipoLog varchar(200) = 'TEXTOS';
	DECLARE @log varchar(max);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);

	select @codOp = codigo, @admin = administrador from REPORT_USERS(@idUser, null, null, 1, null)

	if(isnull(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'Utilizador não tem permissões suficientes para efetuar a operação!';
		return
	end
	else
	begin
		select top 1 @id = id from [REPORT_TEXTOS](@id, @codigo)

		if(isnull(@id, 0) <= 0)
		begin
			insert into TEXTOS(codigo, nome, nome_en, nome_fr, nome_es, texto, texto_en, texto_fr, texto_es, ordem, ctrldataupdt, ctrlcodopupdt)
			values(@codigo, @nome, @nome_en, @nome_fr, @nome_es, @texto, @texto_en, @texto_fr, @texto_es, @ordem, getdate(), @codOp)

			set @ret = SCOPE_IDENTITY();
			set @retMsg = CONCAT('Texto ', @codigo, ' inserido com sucesso!');

			set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados do texto ', @codigo)

			EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;
			return;
		end
		else
		begin
			update TEXTOS
				set codigo = @codigo,
				nome = @nome,
				nome_en = @nome_en,
				nome_fr = @nome_fr,
				nome_es = @nome_es,
				texto = @texto,
				texto_en = @texto_en,
				texto_fr = @texto_fr,
				texto_es = @texto_es,
				ordem = @ordem,
				ctrldataupdt = getdate(),
				ctrlcodopupdt = @codOp
			where TEXTOSID = @id

			set @ret = @id;
			set @retMsg = CONCAT('Texto ', @codigo, ' atualizado com sucesso!');

			set @log = CONCAT('O utilizador ', @codOp, ' atualizou os dados do texto ', @codigo)

			EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;
			return;
		end
	end

	
	set @ret = -2;
	set @retMsg = 'Texto não encontrado!';
	return;
END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_TEXTO]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DELETE_TEXTO]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DELETE_TEXTO](
	@idUser int,
	@id int,
	@ret int OUTPUT,
	@retMsg varchar(max) output
)
AS BEGIN
	DECLARE @tipoLog varchar(200) = 'TEXTOS';
	DECLARE @log varchar(max);
	DECLARE @codOp varchar(500);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @admin bit;
	DECLARE @codigo varchar(100);
	
	select @admin = administrador, @codOp = codigo from REPORT_USERS(@idUser, null, null, 1, null)

	IF(ISNULL(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'O utilizador não tem permissões para apagar textos!';
		return
	end

	select @codigo = codigo from report_textos(@id, @codigo)

	delete from TEXTOS where TEXTOSID = @id;

	set @ret = @id;
	set @retMsg = 'Texto eliminado com sucesso!';

	set @log = CONCAT('O utilizador ', @codOp, ' removeu o texto ', @codigo)

	EXEC REGISTA_LOG @idUser, @id, @tipoLog, @log, @retLog output, @retMsgLog output;
END;
GO



IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_ESPECIALIDADES_TIPO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_ESPECIALIDADES_TIPO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_ESPECIALIDADES_TIPO](@id int, @nome varchar(500))
returns table as return
(
	select
		TIPOS_ESPECIALIDADESID as id,
		nome,
		nome_en,
		nome_fr,
		nome_es,
		ordem
	from TIPOS_ESPECIALIDADES
	where (@id is null or @id = TIPOS_ESPECIALIDADESID)
	and (@nome is null or @nome = nome)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_ESPECIALIDADES]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_ESPECIALIDADES]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_ESPECIALIDADES](@id int, @id_tipo int)
returns table as return
(
	select
		esp.especialidadesid as id,
		esp.nome,
		esp.nome_en,
		esp.nome_fr,
		esp.nome_es,
		esp.ordem,
		rpt_tp.id as id_tipo,
		rpt_tp.nome as nome_tipo,
		rpt_tp.nome_en as nome_en_tipo,
		rpt_tp.nome_fr as nome_fr_tipo,
		rpt_tp.nome_es as nome_es_tipo,
		rpt_tp.ordem as ordem_tipo
	from especialidades esp
	inner join REPORT_ESPECIALIDADES_TIPO(@id_tipo, null) rpt_tp on rpt_tp.id = esp.id_tipo
	where (@id is null or @id = esp.especialidadesid)
	and (@id_tipo is null or @id_tipo = rpt_tp.id)
)
GO



IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_PORTFOLIO_IMAGES]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_PORTFOLIO_IMAGES]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_PORTFOLIO_IMAGES](@id int, @id_portfolio int, @id_tipo int, @img varchar(500))
returns table as return
(
	select
		ptimg.PORTFOLIO_IMAGESID as id,
		ptimg.IMAGEM,
		ptimg.ordem,
		rpt.id as id_portfolio,
		rpt.localidade,
		rpt.texto,
		rpt.texto_en,
		rpt.texto_fr,
		rpt.texto_es,
		rpt.empresa,
		rpt.id_tipo,
		rpt.imagem_capa,
		rpt.ordem as ordem_portfolio,
		rpt.ano
	from portfolio_images ptimg
	inner join report_portfolio(@id_portfolio, @id_tipo, null, null) rpt on rpt.id = ptimg.id_portfolio
	where (@id is null or @id = ptimg.PORTFOLIO_IMAGESID)
	and (@id_tipo is null or @id_tipo = rpt.id_tipo)
	and (@id_portfolio is null or @id_portfolio = rpt.id)
	and (@img is null or @img = ptimg.imagem)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_ESPECIALIDADE]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DELETE_ESPECIALIDADE]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DELETE_ESPECIALIDADE](
	@idUser int,
	@id int,
	@ret int OUTPUT,
	@retMsg varchar(max) output
)
AS BEGIN
	DECLARE @tipoLog varchar(200) = 'ESPECIALIDADES';
	DECLARE @log varchar(max);
	DECLARE @codOp varchar(500);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @admin bit;
	DECLARE @especialidade varchar(500);
	
	select @admin = administrador, @codOp = codigo from REPORT_USERS(@idUser, null, null, 1, null)

	IF(ISNULL(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'O utilizador não tem permissões para apagar especialidades!';
		return
	end

	select @especialidade = nome from report_especialidades(@id, null)

	delete from ESPECIALIDADES where ESPECIALIDADESID = @id;

	set @ret = @id;
	set @retMsg = 'Especialidade eliminada com sucesso!';

	set @log = CONCAT('O utilizador ', @codOp, ' removeu a especialidade ', @especialidade)

	EXEC REGISTA_LOG @idUser, @id, @tipoLog, @log, @retLog output, @retMsgLog output;
END;
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_TIPO_ESPECIALIDADE]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DELETE_TIPO_ESPECIALIDADE]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DELETE_TIPO_ESPECIALIDADE](
	@idUser int,
	@id int,
	@ret int OUTPUT,
	@retMsg varchar(max) output
)
AS BEGIN
	DECLARE @tipoLog varchar(200) = 'TIPOS ESPECIALIDADE';
	DECLARE @log varchar(max);
	DECLARE @codOp varchar(500);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @admin bit;
	DECLARE @tipo varchar(500);
	
	select @admin = administrador, @codOp = codigo from REPORT_USERS(@idUser, null, null, 1, null)

	IF(ISNULL(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'O utilizador não tem permissões para apagar tipos de especialidade!';
		return
	end

	select @tipo = nome from report_especialidades_tipo(@id, null)

	delete from ESPECIALIDADES where id_tipo = @id;
	delete from TIPOS_ESPECIALIDADES where TIPOS_ESPECIALIDADESID = @id;

	set @ret = @id;
	set @retMsg = 'Tipo de Especialidade eliminada com sucesso!';

	set @log = CONCAT('O utilizador ', @codOp, ' removeu o tipo de especialidade ', @tipo, ' e todas as especialidades associadas')

	EXEC REGISTA_LOG @idUser, @id, @tipoLog, @log, @retLog output, @retMsgLog output;
END;
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_TIPO_PORTFOLIO]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DELETE_TIPO_PORTFOLIO]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DELETE_TIPO_PORTFOLIO](
	@idUser int,
	@id int,
	@ret int OUTPUT,
	@retMsg varchar(max) output
)
AS BEGIN
	DECLARE @tipoLog varchar(200) = 'TIPO PORTFOLIO';
	DECLARE @log varchar(max);
	DECLARE @codOp varchar(500);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @admin bit;
	DECLARE @tipo varchar(500);
	
	select @admin = administrador, @codOp = codigo from REPORT_USERS(@idUser, null, null, 1, null)

	IF(ISNULL(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'O utilizador não tem permissões para apagar tipos de portfolio!';
		return
	end

	select @tipo = nome from report_portfolio_tipo(@id)

	delete from PORTFOLIO_IMAGES where PORTFOLIO_IMAGESID in (select id from report_portfolio_images(null, null, @id, null))
	delete from PORTFOLIO where PORTFOLIOID in (select id from REPORT_PORTFOLIO(null, @id, null, null));
	delete from PORTFOLIO_TIPO where PORTFOLIO_TIPOID = @id;

	set @ret = @id;
	set @retMsg = 'Tipo de Portfolio eliminado com sucesso!';

	set @log = CONCAT('O utilizador ', @codOp, ' removeu o tipo de portfolio ', @tipo, ' e todos os portfolios e respetivas imagens associados')

	EXEC REGISTA_LOG @idUser, @id, @tipoLog, @log, @retLog output, @retMsgLog output;
END;
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_PORTFOLIO_IMAGE]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DELETE_PORTFOLIO_IMAGE]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DELETE_PORTFOLIO_IMAGE](
	@idUser int,
	@id int,
	@ret int OUTPUT,
	@retMsg varchar(max) output
)
AS BEGIN
	DECLARE @tipoLog varchar(200) = 'PORTFOLIO';
	DECLARE @log varchar(max);
	DECLARE @codOp varchar(500);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @admin bit;
	DECLARE @img varchar(500);
	
	select @admin = administrador, @codOp = codigo from REPORT_USERS(@idUser, null, null, 1, null)

	IF(ISNULL(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'O utilizador não tem permissões para apagar as imagens do portfolio!';
		return
	end

	select @img = imagem from report_portfolio_images(@id, null, null, null)

	delete from PORTFOLIO_IMAGES where PORTFOLIO_IMAGESID = @id

	set @ret = @id;
	set @retMsg = 'Imagem do Portfolio eliminada com sucesso!';

	set @log = CONCAT('O utilizador ', @codOp, ' removeu a imagem do portfolio ', @img)

	EXEC REGISTA_LOG @idUser, @id, @tipoLog, @log, @retLog output, @retMsgLog output;
END;
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_PORTFOLIO]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DELETE_PORTFOLIO]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DELETE_PORTFOLIO](
	@idUser int,
	@id int,
	@ret int OUTPUT,
	@retMsg varchar(max) output
)
AS BEGIN
	DECLARE @tipoLog varchar(200) = 'PORTFOLIO';
	DECLARE @log varchar(max);
	DECLARE @codOp varchar(500);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @admin bit;
	DECLARE @localidade varchar(500);
	DECLARE @ano int;
	
	select @admin = administrador, @codOp = codigo from REPORT_USERS(@idUser, null, null, 1, null)

	IF(ISNULL(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'O utilizador não tem permissões para apagar portfolios!';
		return
	end

	select @localidade = localidade, @ano = ano from report_portfolio(@id, null, null, null)

	delete from PORTFOLIO_IMAGES where PORTFOLIO_IMAGESID in (select id from report_portfolio_images(null, null, @id, null))
	delete from PORTFOLIO where PORTFOLIOID = @id;

	set @ret = @id;
	set @retMsg = 'Portfolio eliminado com sucesso!';

	set @log = CONCAT('O utilizador ', @codOp, ' removeu o portfolio da localidade ', @localidade, ' do ano ', LTRIM(RTRIM(STR(@ano))))

	EXEC REGISTA_LOG @idUser, @id, @tipoLog, @log, @retLog output, @retMsgLog output;
END;
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_TIPOS_ESPECIALIDADE]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_TIPOS_ESPECIALIDADE]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRIA_EDITA_TIPOS_ESPECIALIDADE](
	@idUser int,
	@id INT,
	@nome varchar(500),
	@nome_en varchar(500),
	@nome_fr varchar(500),
	@nome_es varchar(500),
	@ordem int,
	@ret int OUTPUT,
    @retMsg VARCHAR(max) OUTPUT
)
AS BEGIN
	DECLARE @codOp varchar(500);
	DECLARE @admin bit;
	DECLARE @tipoLog varchar(200) = 'TIPOS ESPECIALIDADE';
	DECLARE @log varchar(max);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);

	select @codOp = codigo, @admin = administrador from REPORT_USERS(@idUser, null, null, 1, null)

	if(isnull(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'Utilizador não tem permissões suficientes para efetuar a operação!';
		return
	end
	else
	begin
		select top 1 @id = id from report_especialidades_tipo(@id, @nome)

		if(isnull(@id, 0) <= 0)
		begin
			insert into TIPOS_ESPECIALIDADES(nome, nome_en, nome_fr, nome_es, ordem, ctrldataupdt, ctrlcodopupdt)
			values(@nome, @nome_en, @nome_fr, @nome_es, @ordem, getdate(), @codOp)

			set @ret = SCOPE_IDENTITY();
			set @retMsg = CONCAT('Tipo de Especialidade ', @nome, ' inserido com sucesso!');

			set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados do tipo de especialidade ', @nome)
			EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;
			return;
		end
		else
		begin
			update TIPOS_ESPECIALIDADES
				set nome = @nome,
				nome_en = @nome_en,
				nome_fr = @nome_fr,
				nome_es = @nome_es,
				ordem = @ordem,
				ctrldataupdt = getdate(),
				ctrlcodopupdt = @codOp
			where TIPOS_ESPECIALIDADESID = @id

			set @ret = @id;
			set @retMsg = CONCAT('Tipo de Especialidade ', @nome, ' atualizado com sucesso!');

			set @log = CONCAT('O utilizador ', @codOp, ' atualizou os dados do tipo de especialidade ', @nome)
			EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;
		end
	end

	set @ret = -2;
	set @retMsg = 'Tipo de Especialidade não encontrado!';
	return
END
GO



IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_TIPO_PORTFOLIO]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_TIPO_PORTFOLIO]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRIA_EDITA_TIPO_PORTFOLIO](
	@idUser int,
	@id INT,
	@nome varchar(500),
	@nome_en varchar(500),
	@nome_fr varchar(500),
	@nome_es varchar(500),
	@fromCsvFile bit,
	@ret int OUTPUT,
    @retMsg VARCHAR(max) OUTPUT
)
AS BEGIN
	DECLARE @codOp varchar(500);
	DECLARE @admin bit;
	DECLARE @tipoLog varchar(200) = 'TIPO PORTFOLIO';
	DECLARE @log varchar(max);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);

	select @codOp = codigo, @admin = administrador from REPORT_USERS(@idUser, null, null, 1, null)

	if(isnull(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'Utilizador não tem permissões suficientes para efetuar a operação!';
		return
	end
	else
	begin
		if(@fromCsvFile = 1)
		begin
			select top 1 @id = id from report_portfolio_tipo(@id)
		end

		if(isnull(@id, 0) <= 0)
		begin
			if(@fromCsvFile = 1)
			begin
				set @ret = -1;
				set @retMsg = 'Tipo de Portfolio não existente!';
				return;
			end
			else
			begin
				insert into PORTFOLIO_TIPO(nome, nome_en, nome_fr, nome_es, ctrldataupdt, ctrlcodopupdt)
				values(@nome, @nome_en, @nome_fr, @nome_es, getdate(), @codOp)

				set @ret = SCOPE_IDENTITY();
				set @retMsg = CONCAT('Tipo de Portfolio ', @nome, ' inserido com sucesso!');

				set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados do tipo de portfolio ', @nome)
				return;
			end
		end
		else
		begin
			update PORTFOLIO_TIPO
				set nome = @nome,
				nome_en = @nome_en,
				nome_fr = @nome_fr,
				nome_es = @nome_es,
				ctrldataupdt = getdate(),
				ctrlcodopupdt = @codOp
			where PORTFOLIO_TIPOID = @id

			set @ret = @id;
			set @retMsg = CONCAT('Tipo de Portfolio ', @nome, ' atualizado com sucesso!');

			set @log = CONCAT('O utilizador ', @codOp, ' atualizou os dados do tipo de portfolio ', @nome)
		end
	end

	EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;

	return;
END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_IMAGEM_PORTFOLIO]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_IMAGEM_PORTFOLIO]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRIA_EDITA_IMAGEM_PORTFOLIO](
	@idUser int,
	@id INT,
	@id_portfolio int,
	@imagem varchar(500),
	@ordem int,
	@fromCsvFile bit,
	@ret int OUTPUT,
    @retMsg VARCHAR(max) OUTPUT
)
AS BEGIN
	DECLARE @codOp varchar(500);
	DECLARE @admin bit;
	DECLARE @tipoLog varchar(200) = 'PORTFOLIO';
	DECLARE @log varchar(max);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @portfolio varchar(500);
	DECLARE @ano int;

	select @codOp = codigo, @admin = administrador from REPORT_USERS(@idUser, null, null, 1, null)

	if(isnull(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'Utilizador não tem permissões suficientes para efetuar a operação!';
		return
	end
	else
	begin
		if(@fromCsvFile = 1)
		begin
			select top 1 @id = id from report_portfolio_images(@id, @id_portfolio, null, null)
		end

		if(isnull(@id, 0) <= 0)
		begin
			if(@fromCsvFile = 1)
			begin
				set @ret = -1;
				set @retMsg = 'Imagem do Portfolio não existente!';
				return;
			end
			else
			begin
				select @portfolio = localidade, @ano = ano from REPORT_PORTFOLIO_IMAGES(@id, @id_portfolio, null, null)

				insert into PORTFOLIO_IMAGES(id_portfolio, imagem, ordem, ctrldataupdt, ctrlcodopupdt)
				values(@id_portfolio, @imagem, @ordem, getdate(), @codOp)

				set @ret = SCOPE_IDENTITY();
				set @retMsg = CONCAT('Imagem do Portfolio ', @imagem, ' inserida com sucesso!');

				set @log = CONCAT('O utilizador ', @codOp, ' inseriu a imagem ', @imagem, ' do Portfolio da localidade ', @portfolio, ' e do ano ', LTRIM(RTRIM(STR(@ano))))
				return;
			end
		end
		else
		begin
			update PORTFOLIO_IMAGES
				set id_portfolio = @id_portfolio,
				imagem = @imagem,
				ordem = @ordem,
				ctrldataupdt = getdate(),
				ctrlcodopupdt = @codOp
			where PORTFOLIO_IMAGESID = @id

			set @ret = @id;
			set @retMsg = CONCAT('Imagem do Portfolio ', @imagem, ' atualizada com sucesso!');

			set @log = CONCAT('O utilizador ', @codOp, ' atualizou a imagem ', @imagem, ' do Portfolio da localidade ', @portfolio, ' e do ano ', LTRIM(RTRIM(STR(@ano))))
		end
	end

	EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;

	return;
END
GO



IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_ESPECIALIDADE]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_ESPECIALIDADE]
END

SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[CRIA_EDITA_ESPECIALIDADE](
      @id_op int,
	  @DocXml nvarchar(max),
	  @error int OUTPUT,
	  @errorMsg varchar(max) OUTPUT
)
AS BEGIN     
	SET dateformat dmy;
    SET @error = 0;
	SET @errorMsg = '';
    	
	DECLARE @DocHandle INT; SET @DocHandle=-1;
	DECLARE @XmlDocument VARCHAR(MAX);
	DECLARE @codOp varchar(30);
	DECLARE @id_especialidade int;
	DECLARE @especialidade VARCHAR(500);
	DECLARE @especialidade_en VARCHAR(500);
	DECLARE @especialidade_fr VARCHAR(500);
	DECLARE @especialidade_es VARCHAR(500);
	DECLARE @id_tipo int;
	DECLARE @ordem int;
	DECLARE @tipo_especialidade VARCHAR(500);
	DECLARE @tipo_especialidade_en VARCHAR(500);
	DECLARE @tipo_especialidade_fr VARCHAR(500);
	DECLARE @tipo_especialidade_es VARCHAR(500);
	DECLARE @ordem_tipo int;
	DECLARE @tipoLog varchar(200);
	DECLARE @log varchar(max);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);

	select @codOp = codigo
	from REPORT_USERS(@id_op, null, null, 1, null)

	if(ISNULL(@codOp, '') = '')
	begin
		set @error = -1;
		set @errorMsg = 'Operador Inválido!';

		return;
	end

	-- START
	SET @XmlDocument=@DocXml;
	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @DocXml;

	-- OBTEMOS AS LINHAS A TRATAR
	SELECT @id_especialidade = ID, @especialidade = ISNULL(ESPECIALIDADE, ''), @especialidade_en = ISNULL(ESPECIALIDADE_EN, ''), 
		@especialidade_fr = ISNULL(ESPECIALIDADE_FR, ''), @especialidade_es = ISNULL(ESPECIALIDADE_ES, ''), @ordem = ORDEM
	FROM OPENXML (@DocHandle, '/ESPECIALIDADE',2)
	WITH (ID INT, ESPECIALIDADE VARCHAR(500), ESPECIALIDADE_EN VARCHAR(500), ESPECIALIDADE_FR VARCHAR(500), ESPECIALIDADE_ES VARCHAR(500), ORDEM INT)

	SELECT @tipo_especialidade = TIPO, @tipo_especialidade_en = TIPO_EN, @tipo_especialidade_fr = TIPO_FR, @tipo_especialidade_es = TIPO_ES, @ordem_tipo = ordem
	FROM OPENXML (@DocHandle, '/ESPECIALIDADE/TIPO_ESPECIALIDADE',2)
	WITH (TIPO VARCHAR(500), TIPO_EN VARCHAR(500), TIPO_FR VARCHAR(500), TIPO_ES VARCHAR(500), ORDEM INT)

	select @id_tipo = id
	from REPORT_ESPECIALIDADES_TIPO(@id_tipo, @tipo_especialidade)

	IF(ISNULL(@id_tipo, 0) > 0)
	BEGIN
		UPDATE TIPOS_ESPECIALIDADES
			set nome = @tipo_especialidade,
			NOME_EN = @tipo_especialidade_en,
			NOME_FR = @tipo_especialidade_fr,
			NOME_ES = @tipo_especialidade_es,
			ordem = @ordem_tipo,
			ctrlcodopupdt = @codOp,
			ctrldataupdt = getdate()
		where TIPOS_ESPECIALIDADESID = @id_tipo

		set @tipoLog = 'TIPOS ESPECIALIDADE';
		set @log = CONCAT('O utilizador ', @codOp, ' atualizou os dados do tipo de especialidade ', @tipo_especialidade)

		EXEC REGISTA_LOG @id_op, @id_tipo, @tipoLog, @log, @retLog output, @retMsgLog output;
	END
	ELSE
	BEGIN
		INSERT INTO TIPOS_ESPECIALIDADES(nome, NOME_EN, NOME_FR, NOME_ES, ordem, ctrlcodop)
		VALUES(@tipo_especialidade, @tipo_especialidade_en, @tipo_especialidade_fr, @tipo_especialidade_es, @ordem_tipo, @codOp)

		set @id_tipo = SCOPE_IDENTITY();

		set @tipoLog = 'TIPOS ESPECIALIDADE';
		set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados do tipo de especialidade ', @tipo_especialidade)

		EXEC REGISTA_LOG @id_op, @id_tipo, @tipoLog, @log, @retLog output, @retMsgLog output;
	END

	IF(ISNULL(@id_especialidade, 0) > 0)
	BEGIN
		UPDATE ESPECIALIDADES
			set nome = @especialidade,
			NOME_EN = @especialidade_en,
			NOME_FR = @especialidade_fr,
			NOME_ES = @especialidade_es,
			ID_TIPO = @id_tipo,
			ordem = @ordem,
			ctrlcodopupdt = @codOp,
			ctrldataupdt = getdate()
		WHERE ESPECIALIDADESID = @id_especialidade

		set @tipoLog = 'ESPECIALIDADES';
		set @log = CONCAT('O utilizador ', @codOp, ' atualizou os dados da especialidade ', @especialidade)

		EXEC REGISTA_LOG @id_op, @id_especialidade, @tipoLog, @log, @retLog output, @retMsgLog output;
	END
	ELSE
	BEGIN
		INSERT INTO ESPECIALIDADES(nome, nome_en, nome_fr, nome_es, id_tipo, ordem, ctrlcodop)
		values(@especialidade, @especialidade_en, @especialidade_fr, @especialidade_es, @id_tipo, @ordem, @codOp)

		set @id_especialidade = SCOPE_IDENTITY();

		set @tipoLog = 'ESPECIALIDADES';
		set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados da especialidade ', @especialidade)

		EXEC REGISTA_LOG @id_op, @id_especialidade, @tipoLog, @log, @retLog output, @retMsgLog output;
	END

	SET @error = @id_especialidade;
	SET @errorMsg = 'Operação realizada com sucesso!';
	
	return
END;
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_PORTFOLIO]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_PORTFOLIO]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRIA_EDITA_PORTFOLIO](
      @id_op int,
	  @DocXml nvarchar(max),
	  @error int OUTPUT,
	  @errorMsg varchar(max) OUTPUT
)
AS BEGIN     
	SET dateformat dmy;
    SET @error = 0;
	SET @errorMsg = '';
    	
	DECLARE @DocHandle INT; SET @DocHandle=-1;
	DECLARE @XmlDocument VARCHAR(MAX);
	DECLARE @codOp varchar(30);
	DECLARE @id_portfolio int;
	DECLARE @texto VARCHAR(MAX);
	DECLARE @texto_en VARCHAR(MAX);
	DECLARE @texto_fr VARCHAR(MAX);
	DECLARE @texto_es VARCHAR(MAX);
	DECLARE @id_tipo int;
	DECLARE @localidade varchar(500);
	DECLARE @empresa varchar(250);
	DECLARE @ordem int;
	DECLARE @img_capa varchar(500);
	DECLARE @ano int;
	DECLARE @tipo_portfolio VARCHAR(500);
	DECLARE @tipo_portfolio_en VARCHAR(500);
	DECLARE @tipo_portfolio_fr VARCHAR(500);
	DECLARE @tipo_portfolio_es VARCHAR(500);
	DECLARE @tipoLog varchar(200);
	DECLARE @log varchar(max);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);

	select @codOp = codigo
	from REPORT_USERS(@id_op, null, null, 1, null)

	if(ISNULL(@codOp, '') = '')
	begin
		set @error = -1;
		set @errorMsg = 'Operador Inválido!';

		return;
	end

	-- START
	SET @XmlDocument=@DocXml;
	EXEC sp_xml_preparedocument @DocHandle OUTPUT, @DocXml;

	-- OBTEMOS AS LINHAS A TRATAR
	SELECT @id_portfolio = ID, @texto = ISNULL(TEXTO, ''), @texto_en = ISNULL(TEXTO_EN, ''), @texto_fr = ISNULL(TEXTO_FR, ''), @texto_es = ISNULL(TEXTO_ES, ''), 
		@ordem = ORDEM, @img_capa = ISNULL(IMG, ''), @ano = ANO, @localidade = LOCALIDADE, @empresa = ISNULL(EMPRESA, '')
	FROM OPENXML (@DocHandle, '/PORTFOLIO',2)
	WITH (ID INT, TEXTO VARCHAR(MAX), TEXTO_EN VARCHAR(MAX), TEXTO_FR VARCHAR(MAX), TEXTO_ES VARCHAR(MAX), ORDEM INT, IMG VARCHAR(500), ANO INT, LOCALIDADE VARCHAR(500), EMPRESA VARCHAR(250))

	SELECT @tipo_portfolio = TIPO, @tipo_portfolio_en = TIPO_EN, @tipo_portfolio_fr = TIPO_FR, @tipo_portfolio_es = TIPO_ES
	FROM OPENXML (@DocHandle, '/PORTFOLIO/TIPO_PORTFOLIO',2)
	WITH (TIPO VARCHAR(500), TIPO_EN VARCHAR(500), TIPO_FR VARCHAR(500), TIPO_ES VARCHAR(500))

	select @id_tipo = id
	from REPORT_PORTFOLIO_TIPO(null)
	where nome = @tipo_portfolio

	IF(ISNULL(@id_tipo, 0) > 0)
	BEGIN
		UPDATE PORTFOLIO_TIPO
			set nome = @tipo_portfolio,
			NOME_EN = @tipo_portfolio_en,
			NOME_FR = @tipo_portfolio_fr,
			NOME_ES = @tipo_portfolio_es,
			ctrlcodopupdt = @codOp,
			ctrldataupdt = getdate()
		where PORTFOLIO_TIPOID = @id_tipo

		set @tipoLog = 'TIPO PORTFOLIO';
		set @log = CONCAT('O utilizador ', @codOp, ' atualizou os dados do tipo de portfolio ', @tipo_portfolio)

		EXEC REGISTA_LOG @id_op, @id_tipo, @tipoLog, @log, @retLog output, @retMsgLog output;
	END
	ELSE
	BEGIN
		INSERT INTO PORTFOLIO_TIPO(nome, NOME_EN, NOME_FR, NOME_ES, ctrlcodop)
		VALUES(@tipo_portfolio, @tipo_portfolio_en, @tipo_portfolio_fr, @tipo_portfolio_es, @codOp)

		set @id_tipo = SCOPE_IDENTITY();

		set @tipoLog = 'TIPO PORTFOLIO';
		set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados do tipo de portfolio ', @tipo_portfolio)

		EXEC REGISTA_LOG @id_op, @id_tipo, @tipoLog, @log, @retLog output, @retMsgLog output;
	END

	IF(ISNULL(@id_portfolio, 0) > 0)
	BEGIN
		UPDATE PORTFOLIO
			set texto = @texto,
			texto_en = @texto_en,
			texto_fr = @texto_fr,
			texto_es = @texto_es,
			ID_TIPO = @id_tipo,
			localidade = @localidade,
			EMPRESA = @empresa,
			ordem = @ordem,
			ANO = @ano,
			IMAGEM_CAPA = @img_capa,
			ctrlcodopupdt = @codOp,
			ctrldataupdt = getdate()
		WHERE PORTFOLIOID = @id_portfolio

		set @tipoLog = 'PORTFOLIO';
		set @log = CONCAT('O utilizador ', @codOp, ' atualizou os dados do portfolio na localidade ', @localidade, ' do ano ', LTRIM(RTRIM(STR(@ano))))

		EXEC REGISTA_LOG @id_op, @id_portfolio, @tipoLog, @log, @retLog output, @retMsgLog output;
	END
	ELSE
	BEGIN
		INSERT INTO PORTFOLIO(texto, texto_en, texto_fr, texto_es, id_tipo, localidade, empresa, ordem, ano, imagem_capa, ctrlcodop)
		values(@texto, @texto_en, @texto_fr, @texto_es, @id_tipo, @localidade, @empresa, @ordem, @ano, @img_capa, @codOp)

		set @id_portfolio = SCOPE_IDENTITY();

		set @tipoLog = 'PORTFOLIO';
		set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados do portfolio na localidade ', @localidade, ' do ano ', LTRIM(RTRIM(STR(@ano))))

		EXEC REGISTA_LOG @id_op, @id_portfolio, @tipoLog, @log, @retLog output, @retMsgLog output;
	END

	SET @error = @id_portfolio;
	SET @errorMsg = 'Operação realizada com sucesso!';
	
	return
END;
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_IMAGEM_CAPA]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_IMAGEM_CAPA]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CRIA_EDITA_IMAGEM_CAPA](
	@idUser int,
	@id INT,
	@imagem varchar(500),
	@ret int OUTPUT,
    @retMsg VARCHAR(max) OUTPUT
)
AS BEGIN
	DECLARE @codOp varchar(500);
	DECLARE @admin bit;
	DECLARE @tipoLog varchar(200) = 'PORTFOLIO';
	DECLARE @log varchar(max);
	DECLARE @retLog int;
	DECLARE @retMsgLog varchar(max);
	DECLARE @portfolio varchar(500);
	DECLARE @ano int;

	select @codOp = codigo, @admin = administrador from REPORT_USERS(@idUser, null, null, 1, null)

	if(isnull(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'Utilizador não tem permissões suficientes para efetuar a operação!';
		return
	end
	else
	begin
		select @portfolio = localidade, @ano = ano from REPORT_PORTFOLIO(@id, null, null, null)

		if(ISNULL(@ano, 0) <= 0)
		begin
			set @ret = -2;
			set @retMsg = 'Portfolio inexistente!';
			return
		end
		else
		begin
			update PORTFOLIO
				set imagem_capa = @imagem,
				ctrldataupdt = getdate(),
				ctrlcodopupdt = @codOp
			where PORTFOLIOID = @id

			set @ret = @id;
			set @retMsg = CONCAT('Imagem de capa ', @imagem, ' atualizada com sucesso!');

			set @log = CONCAT('O utilizador ', @codOp, ' atualizou a imagem de capa ', @imagem, ' do Portfolio da localidade ', @portfolio, ' e do ano ', LTRIM(RTRIM(STR(@ano))))

			EXEC REGISTA_LOG @idUser, @id, @tipoLog, @log, @retLog output, @retMsgLog output;
		end
	end
	return;
END
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_LOGS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_LOGS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_LOGS](@id int, @tipo varchar(200), @id_relacionado int, @initialDate date, @finalDate date, @idUser int)
returns table as return
(
	with lgn as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		left join ACESSOS ac on ac.ACESSOSID = lg.id_relacionado
		where lg.tipo = 'LOGIN'
	),
	sess as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		where lg.tipo = 'SESSÃO'
	),
	users as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		left join REPORT_USERS(null, null, null, null, null) u on u.id = lg.id_relacionado
		where lg.tipo = 'UTILIZADORES'
	),
	contactos as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		left join REPORT_CONTACTOS() cont on cont.id = lg.id_relacionado
		where lg.tipo = 'CONTACTOS'
	),
	especialidades as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		left join REPORT_ESPECIALIDADES(null, null) espec on espec.id = lg.id_relacionado
		where lg.tipo = 'ESPECIALIDADES'
	),
	portfolio as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		left join REPORT_PORTFOLIO(null, null, null, null) pt on pt.id = lg.id_relacionado
		left join REPORT_PORTFOLIO_IMAGES(null, null, null, null) img on img.id = lg.id_relacionado
		where lg.tipo = 'PORTFOLIO'
	),
	textos as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		left join REPORT_TEXTOS(null, null) txt on txt.id = lg.id_relacionado
		where lg.tipo = 'TEXTOS'
	),
	tipo_portfolio as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		left join REPORT_PORTFOLIO_TIPO(null) pt on pt.id = lg.id_relacionado
		where lg.tipo = 'TIPO PORTFOLIO'
	),
	tipo_especialidade as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		left join REPORT_ESPECIALIDADES_TIPO(null, null) tp on tp.id = lg.id_relacionado
		where lg.tipo = 'TIPO ESPECIALIDADE'
	),
	others as (
		select
			lg.LOGID as id,
			users.id as id_user,
			users.nome as name_user,
			users.codigo as code_user,
			lg.tipo as tipo,
			lg.notas as notas,
			lg.id_relacionado as id_relacionado,
			lg.ctrldata as data_log,
			CONCAT(convert(varchar, lg.ctrldata, 105), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_it, --dd-mm-yyyy
			CONCAT(convert(varchar, lg.ctrldata, 103), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_uk, --dd/mm/yyyy
			CONCAT(convert(varchar, lg.ctrldata, 111), ' ', convert(varchar, lg.ctrldata, 108)) as data_log_jp, --yyyy/mm/dd
			convert(varchar, lg.ctrldata, 120) as data_log_odbc --yyyy-mm-dd
		from [LOG] lg
		inner join REPORT_USERS(null, null, null, null, null) users on users.id = lg.id_user
		left join REPORT_ESPECIALIDADES_TIPO(null, null) tp on tp.id = lg.id_relacionado
		where lg.tipo not in ('TIPO ESPECIALIDADE', 'TIPO PORTFOLIO', 'TEXTOS', 'PORTFOLIO', 'ESPECIALIDADES', 'CONTACTOS', 'UTILIZADORES', 'SESSÃO', 'LOGIN')
	),
	
	all_logs as (
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from lgn
		union
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from sess
		union
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from users
		union
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from contactos
		union
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from especialidades
		union
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from portfolio
		union
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from textos
		union
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from tipo_portfolio
		union
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from tipo_especialidade
		union
		select
			id,
			id_user,
			name_user,
			code_user,
			tipo,
			notas,
			id_relacionado,
			data_log,
			data_log_it, --dd-mm-yyyy
			data_log_uk, --dd/mm/yyyy
			data_log_jp, --yyyy/mm/dd
			data_log_odbc --yyyy-mm-dd
		from others
	)

	select
		id,
		id_user,
		name_user,
		code_user,
		tipo,
		notas,
		id_relacionado,
		data_log,
		data_log_it, --dd-mm-yyyy
		data_log_uk, --dd/mm/yyyy
		data_log_jp, --yyyy/mm/dd
		data_log_odbc --yyyy-mm-dd
	from all_logs
	where (@id is null or @id = id)
	and (@tipo is null or @tipo = tipo)
	and (@id_relacionado is null or @id_relacionado = id_relacionado)
	and (@initialDate is null or @initialDate <= cast(data_log as date))
	and (@finalDate is null or @finalDate >= cast(data_log as date))
	and (@idUser is null or @idUser = id_user)
)
GO