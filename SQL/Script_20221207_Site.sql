IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[JPDADO_REPORT_ESPECIALIDADES]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [JPDADO_REPORT_ESPECIALIDADES]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[JPDADO_REPORT_ESPECIALIDADES](@id_especialidade int, @id_tipo int, @lingua varchar(10))
returns table as return
(
	select
		case when @lingua = 'EN' then tpesp.nome_en else
		case when @lingua = 'ES' then tpesp.nome_es else
		case when @lingua = 'FR' then tpesp.nome_fr else
		tpesp.nome end end end as tipo_especialidade,
		case when @lingua = 'EN' then esp.nome_en else
		case when @lingua = 'ES' then esp.nome_es else
		case when @lingua = 'FR' then esp.nome_fr else
		esp.nome end end end as especialidade,
		esp.ordem as ordem_especialidade,
		tpesp.ordem as ordem_tipo,
		especialidadesid as id_especialidade
	from especialidades esp
	left join tipos_especialidades tpesp on tpesp.tipos_especialidadesid = esp.id_tipo
	where (@id_especialidade is null or @id_especialidade = esp.especialidadesid)
	and (@id_tipo is null or @id_tipo = tpesp.tipos_especialidadesid)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[JPDADO_REPORT_TEXTOS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [JPDADO_REPORT_TEXTOS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[JPDADO_REPORT_TEXTOS](@codigo varchar(100), @id_texto int, @lingua varchar(10))
returns table as return
(
	select
		TEXTOSID as id_texto,
		CODIGO,
		case when @lingua = 'EN' then nome_en else
		case when @lingua = 'ES' then nome_es else
		case when @lingua = 'FR' then nome_fr else
		nome end end end as nome,
		case when @lingua = 'EN' then texto_en else
		case when @lingua = 'ES' then texto_es else
		case when @lingua = 'FR' then texto_fr else
		texto end end end as texto,
		ordem
	from textos
	where (@codigo is null or @codigo = CODIGO)
	and (@id_texto is null or @id_texto = textosid)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[JPDADO_REPORT_CONTACTOS]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [JPDADO_REPORT_CONTACTOS]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[JPDADO_REPORT_CONTACTOS]()
returns table as return
(
	select
		NOME,
		MORADA1,
		MORADA2,
		COD_POSTAL,
		LOCALIDADE
	from contactos
)
GO



IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[JPDADO_REPORT_PORTFOLIO_TIPO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [JPDADO_REPORT_PORTFOLIO_TIPO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[JPDADO_REPORT_PORTFOLIO_TIPO](@id_tipo int, @lingua varchar(10))
returns table as return
(
	select
		portfolio_tipoid as id,
		case when @lingua = 'EN' then nome_en else
		case when @lingua = 'ES' then nome_es else
		case when @lingua = 'FR' then nome_fr else
		nome end end end as nome
	from portfolio_tipo pt
	where (@id_tipo is null or @id_tipo = portfolio_tipoid)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[JPDADO_REPORT_PORTFOLIO]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [JPDADO_REPORT_PORTFOLIO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[JPDADO_REPORT_PORTFOLIO](@id int, @id_tipo int, @ano int, @lingua varchar(10))
returns table as return
(
	select
		p.portfolioid as id,
		p.localidade,
		case when @lingua = 'EN' then texto_en else
		case when @lingua = 'ES' then texto_es else
		case when @lingua = 'FR' then texto_fr else
		texto end end end as texto,
		p.empresa,
		pt.id as id_tipo,
		pt.nome as tipo,
		p.imagem_capa,
		p.ordem,
		p.ano
	from portfolio p
	inner join JPDADO_REPORT_PORTFOLIO_TIPO(@id_tipo, @lingua) pt on pt.id = p.id_tipo
	where (@id is null or @id = p.PORTFOLIOID)
	and (@id_tipo is null or @id_tipo = pt.id)
	and (@ano is null or @ano = p.ANO)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[JPDADO_REPORT_PORTFOLIO_IMAGES]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [JPDADO_REPORT_PORTFOLIO_IMAGES]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[JPDADO_REPORT_PORTFOLIO_IMAGES](@id int, @img varchar(500), @id_portfolio int, @id_tipo int, @ano int, @lingua varchar(10))
returns table as return
(
	select
		pimg.portfolio_imagesid as id,
		pimg.imagem,
		pimg.ordem,
		rpt.id as id_portfolio,
		rpt.localidade,
		rpt.texto,
		rpt.empresa,
		rpt.id_tipo,
		rpt.tipo,
		rpt.imagem_capa,
		rpt.ordem as ordem_portfolio,
		rpt.ano
	from portfolio_images pimg
	inner join JPDADO_REPORT_PORTFOLIO(@id_portfolio, @id_tipo, @ano, @lingua) rpt on rpt.id = pimg.id_portfolio
	where (@id is null or @id = pimg.portfolio_imagesid)
	and (@img is null or @img = pimg.imagem)
	and (@id_portfolio is null or @id_portfolio = rpt.id)
	and (@id_tipo is null or @id_tipo = rpt.id_tipo)
	and (@ano is null or @ano = rpt.ano)
)
GO


IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[JPDADO_REPORT_MAIN_IMAGES]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
	DROP FUNCTION [JPDADO_REPORT_MAIN_IMAGES]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[JPDADO_REPORT_MAIN_IMAGES](@img varchar(500))
returns table as return
(
	with img as
	(
		select distinct isnull(imagem, '') as imagem, ordem
		from JPDADO_REPORT_PORTFOLIO_IMAGES(null, @img, null, null, null, null)
	),

	capa as 
	(
		select distinct isnull(imagem_capa, '') as imagem, ordem
		from JPDADO_REPORT_PORTFOLIO(null, null, null, null)
		where (@img is null or @img = imagem_capa)
		and imagem_capa <> ''
	),

	both_images as (
		select distinct img.imagem, case when img.ordem >= capa.ordem then img.ordem else capa.ordem end as ordem
		from img
		inner join capa on capa.imagem = img.imagem
	),

	capa_only as (
		select distinct capa.imagem, capa.ordem
		from capa
		left join both_images on capa.imagem = both_images.imagem
		where both_images.imagem is null
	),

	img_only as (
		select distinct img.imagem, img.ordem
		from img
		left join both_images on img.imagem = both_images.imagem
		where both_images.imagem is null
	),

	all_distinct as (
		select imagem, ordem
		from both_images
		union
		select imagem, ordem
		from capa_only
		union
		select imagem, ordem
		from img_only
	)

	select distinct
		imagem, ordem
	from all_distinct
)
GO