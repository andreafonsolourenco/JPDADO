IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[REPORT_PORTFOLIO_TIPO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [REPORT_PORTFOLIO_TIPO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[REPORT_PORTFOLIO_TIPO](@id int, @nome varchar(500))
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
	and (@nome is null or @nome = nome)
)
go


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
			return;
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
		select top 1 @id = id from report_portfolio_tipo(@id, @nome)

		if(isnull(@id, 0) <= 0)
		begin
			insert into PORTFOLIO_TIPO(nome, nome_en, nome_fr, nome_es, ctrldataupdt, ctrlcodopupdt)
			values(@nome, @nome_en, @nome_fr, @nome_es, getdate(), @codOp)

			set @ret = SCOPE_IDENTITY();
			set @retMsg = CONCAT('Tipo de Portfolio ', @nome, ' inserido com sucesso!');

			set @log = CONCAT('O utilizador ', @codOp, ' inseriu os dados do tipo de portfolio ', @nome)
			EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;
			return;
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
			EXEC REGISTA_LOG @idUser, @ret, @tipoLog, @log, @retLog output, @retMsgLog output;
			return;
		end
	end

	set @ret = -2;
	set @retMsg = 'Tipo de Portfolio não encontrado!';
	return
END
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

	select @id_tipo = id from REPORT_PORTFOLIO_TIPO(@id_tipo, @tipo_portfolio)

	EXEC CRIA_EDITA_TIPO_PORTFOLIO @id_op, @id_tipo, @tipo_portfolio, @tipo_portfolio_en, @tipo_portfolio_fr, @tipo_portfolio_es, @retLog output, @retMsgLog output;

	IF(@retLog <= 0)
	begin
		set @error = @retLog;
		set @errorMsg = 'Ocorreu um erro ao criar / editar o Tipo de Portfolio';
		return;
	end

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


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CRIA_EDITA_ESPECIALIDADE]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[CRIA_EDITA_ESPECIALIDADE]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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

	EXEC CRIA_EDITA_TIPOS_ESPECIALIDADE @id_op, @id_tipo, @tipo_especialidade, @tipo_especialidade_en, @tipo_especialidade_fr, @tipo_especialidade_en, @ordem_tipo, 
		@retLog output, @retMsgLog output;

	IF(@retLog <= 0)
	begin
		set @error = @retLog;
		set @errorMsg = 'Ocorreu um erro ao criar / editar o Tipo de Especialidade';
		return;
	end

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
	inner join REPORT_PORTFOLIO_TIPO(@id_tipo, null) rpt_tp on rpt_tp.id = pt.id_tipo
	where (@id is null or @id = pt.portfolioid)
	and (@id_tipo is null or @id_tipo = pt.ID_TIPO)
	and (@localidade is null or @localidade = pt.localidade)
	and (@ano is null or @ano = pt.ano)
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
		left join REPORT_PORTFOLIO_TIPO(null, null) pt on pt.id = lg.id_relacionado
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

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DELETE_PORTFOLIO_IMAGEM_CAPA]') AND type IN (N'P', N'PC'))
BEGIN
	DROP PROCEDURE [dbo].[DELETE_PORTFOLIO_IMAGEM_CAPA]
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DELETE_PORTFOLIO_IMAGEM_CAPA](
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
	DECLARE @ano int;
	DECLARE @localidade varchar(500);
	
	select @admin = administrador, @codOp = codigo from REPORT_USERS(@idUser, null, null, 1, null)

	IF(ISNULL(@admin, 0) = 0)
	begin
		set @ret = -1;
		set @retMsg = 'O utilizador não tem permissões para atualizar a imagem de capa do portfolio!';
		return
	end

	select @img = imagem_capa, @ano = ano, @localidade = localidade from REPORT_PORTFOLIO(@id, null, null, null)

	update portfolio set imagem_capa = '' where portfolioid = @id

	set @ret = @id;
	set @retMsg = 'Imagem de capa do Portfolio atualizada com sucesso!';

	set @log = CONCAT('O utilizador ', @codOp, ' atualizou a imagem de capa do portfolio do ano ', ltrim(rtrim(str(@ano))), ' da localidade ', @localidade)

	EXEC REGISTA_LOG @idUser, @id, @tipoLog, @log, @retLog output, @retMsgLog output;
END;
go
