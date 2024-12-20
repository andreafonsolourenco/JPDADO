IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USERTYPE]') AND type in (N'U'))
	DROP TABLE [dbo].[USERTYPE]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[USERTYPE](
	[USERTYPEID] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](500) NOT NULL default '',
	[notas] [varchar](500) NOT NULL default '',
	[administrador] [bit] NOT NULL default 1,
	[ctrldata] [datetime] NOT NULL default getdate(),
	[ctrlcodop] [varchar](500) NOT NULL default 'AL',
	[ctrldataupdt] [datetime] NULL,
	[ctrlcodopupdt] [varchar](500) NULL,
 CONSTRAINT [PK_USERTYPE] PRIMARY KEY CLUSTERED 
(
	[USERTYPEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_USERTYPE_NOME] UNIQUE NONCLUSTERED 
(
	[nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USERS]') AND type in (N'U'))
	DROP TABLE [dbo].[USERS]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[USERS](
	[USERSID] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](max) NOT NULL default '',
	[codigo] [varchar](500) NOT NULL default '',
	[email] [varchar](max) NULL default '',
	[telemovel] [varchar](50) NULL default '',
	[ativo] [bit] NOT NULL default 1,
	[password] [varchar](250) NULL default '*',
	[notas] [varchar](max) NULL default '',
	[lastlogin] [datetime] NULL,
	[id_tipo_utilizador] [int] NOT NULL references usertype(usertypeid),
	[ctrldata] [datetime] NOT NULL default getdate(),
	[ctrlcodop] [varchar](500) NOT NULL default 'AL',
	[ctrldataupdt] [datetime] NULL,
	[ctrlcodopupdt] [varchar](500) NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[USERSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_USERS_CODIGO] UNIQUE NONCLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ACESSOS]') AND type in (N'U'))
	DROP TABLE [dbo].[ACESSOS]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ACESSOS](
	[ACESSOSID] [int] IDENTITY(1,1) NOT NULL,
	[id_utilizador] [int] NOT NULL references users(usersid),
	[datahora] [datetime] NOT NULL default getdate(),
	[tipo] [varchar](50) NOT NULL default 'LOGIN',
	[ctrldata] [datetime] NOT NULL default getdate(),
	[ctrlcodop] [varchar](500) NOT NULL default 'AL',
	[ctrldataupdt] [datetime] NULL,
	[ctrlcodopupdt] [varchar](500) NULL,
 CONSTRAINT [PK_ACESSOS] PRIMARY KEY CLUSTERED 
(
	[ACESSOSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ACESSOS_USER_DATE_TYPE] UNIQUE NONCLUSTERED 
(
	[id_utilizador] ASC,
	[datahora] ASC,
	[tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LOG]') AND type in (N'U'))
	DROP TABLE [dbo].[LOG]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LOG](
	[LOGID] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL references users(usersid),
	[id_relacionado] [int] NULL,
	[tipo] [varchar](200) NOT NULL default '',
	[notas] [varchar](max) NOT NULL default '',
	[ctrldata] [datetime] NOT NULL default getdate(),
	[ctrlcodop] [varchar](500) NOT NULL default 'AL',
	[ctrldataupdt] [datetime] NULL,
	[ctrlcodopupdt] [varchar](500) NULL,
 CONSTRAINT [PK_LOG] PRIMARY KEY CLUSTERED 
(
	[LOGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_LOG_TIPO_IDRELACIONADO_DATA] UNIQUE NONCLUSTERED 
(
	[id_user] ASC,
	[tipo] ASC,
	[id_relacionado] ASC,
	[ctrldata] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[APPLICATION_CONFIG]') AND type in (N'U'))
	DROP TABLE [dbo].[APPLICATION_CONFIG]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[APPLICATION_CONFIG](
	[APPLICATION_CONFIGID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](500) NULL default '',
	[email_password] [varchar](250) NULL default '',
	[email_smtp] [varchar](150) NULL default '',
	[email_smtpport] [varchar](20) NULL default '465',
	[emails_alerta] [varchar](max) NOT NULL default '',
	[sessaomaxmin] [int] NOT NULL default 60,
	[ctrldata] [datetime] NOT NULL default getdate(),
	[ctrlcodop] [varchar](500) NOT NULL default 'AL',
	[ctrldataupdt] [datetime] NULL,
	[ctrlcodopupdt] [varchar](500) NULL,
 CONSTRAINT [PK_APPLICATION_CONFIG] PRIMARY KEY CLUSTERED 
(
	[APPLICATION_CONFIGID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO