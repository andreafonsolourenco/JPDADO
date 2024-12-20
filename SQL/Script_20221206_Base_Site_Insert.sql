SET IDENTITY_INSERT [dbo].[TIPOS_ESPECIALIDADES] ON 
GO

INSERT [dbo].[TIPOS_ESPECIALIDADES] ([TIPOS_ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ordem], [ctrldata], [ctrlcodop]) VALUES (1, N'Engenharia Civil', N'Civil Engineering', N'', N'', 1, CAST(N'2019-12-30T01:04:53.697' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[TIPOS_ESPECIALIDADES] ([TIPOS_ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ordem], [ctrldata], [ctrlcodop]) VALUES (2, N'Engenharia Eletrotécnica', N'', N'', N'', 2, CAST(N'2019-03-27T12:35:16.147' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[TIPOS_ESPECIALIDADES] ([TIPOS_ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ordem], [ctrldata], [ctrlcodop]) VALUES (3, N'Engenharia Mecânica', N'', N'', N'', 3, CAST(N'2019-03-27T12:35:16.147' AS DateTime), N'JPOLIVEIRA     ')
GO
SET IDENTITY_INSERT [dbo].[TIPOS_ESPECIALIDADES] OFF
GO



SET IDENTITY_INSERT [dbo].[ESPECIALIDADES] ON 
GO

INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (1, N'Certificação Energética', N'', N'', N'', 3, 7, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (2, N'Certificados Energéticos (REH e PES)', N'', N'', N'', 1, 12, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (3, N'Estudos Energéticos', N'', N'', N'', 3, 6, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (4, N'Fichas Eletrotécnicas', N'', N'', N'', 2, 6, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (5, N'Medidas de Autoproteção', N'', N'', N'', 1, 11, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (6, N'Projetos de Águas', N'', N'', N'', 1, 4, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (7, N'Projetos de Águas Pluviais', N'', N'', N'', 1, 6, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (8, N'Projetos de Águas Residuais', N'', N'', N'', 1, 5, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (9, N'Projetos de AVAC', N'', N'', N'', 3, 1, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (10, N'Projetos de Conforto Acústico', N'', N'', N'', 1, 8, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (11, N'Projetos de Contenação Periférica', N'', N'', N'', 1, 2, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (12, N'Projetos de Domótica', N'', N'', N'', 2, 4, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (13, N'Projetos de Eletricidade', N'', N'', N'', 2, 1, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (14, N'Projetos de Escavação', N'', N'', N'', 1, 9, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (15, N'Projetos de Estruturas', N'', N'', N'', 1, 1, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (16, N'Projetos de Exaustão de Fumos', N'', N'', N'', 3, 3, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (17, N'Projetos de Fundações', N'', N'', N'', 1, 3, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (18, N'Projetos de Instalações Especiais', N'', N'', N'', 3, 5, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (19, N'Projetos de Instalações Mecânicas', N'', N'', N'', 3, 4, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (20, N'Projetos de ITED', N'', N'', N'', 2, 3, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (21, N'Projetos de Redes Informáticas', N'', N'', N'', 2, 5, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (22, N'Projetos de Segurança Contra Risco de Incêndios - 1ª, 2ª, 3ª e 4ª Categorias de Risco', N'', N'', N'', 1, 10, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (23, N'Projetos de Telecomunicações', N'', N'', N'', 2, 2, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (24, N'Projetos de Térmica', N'', N'', N'', 1, 7, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (25, N'Projetos de Ventilação', N'', N'', N'', 3, 2, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (26, N'Relatórios Técnicos', N'', N'', N'', 2, 7, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[ESPECIALIDADES] ([ESPECIALIDADESID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ID_TIPO], [ordem], [ctrldata], [ctrlcodop]) VALUES (27, N'Relatórios Técnicos', N'', N'', N'', 3, 8, CAST(N'2019-03-27T12:36:05.073' AS DateTime), N'JPOLIVEIRA     ')
GO

SET IDENTITY_INSERT [dbo].[ESPECIALIDADES] OFF
GO



SET IDENTITY_INSERT [dbo].[PORTFOLIO_TIPO] ON 
GO

INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (1, N'(Projetos, Fiscalização, Coordenação de Segurança e Gestão de Obra)', N'(Projects, Supervision, Safety Coordination and Construction Management)', N'', N'', CAST(N'2019-12-31T00:52:37.070' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (2, N'Coordenação das Especialidades, Projetos de Especialidades e Medição & Orçamentação', N'Coordenação das Especialidades, Projetos de Especialidades e Medição & Orçamentação', N'', N'', CAST(N'2020-01-04T02:52:46.823' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (3, N'Coordenação das Especialidades, Projetos de Estabilidade, Águas e Esgotos e Medição & Orçamentação', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (4, N'Coordenação das Especialidades, Projetos de Infraestruturas e Especialidades e Medição & Orçamentação', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (5, N'Coordenação das Especialidades, Projetos de Infraestruturas e Medição & Orçamentação', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (6, N'Coordenação das Infraestruturas e Especialidades, Projetos de Infraestruturas e Especialidades e Medição & Orçamentação', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (7, N'Projeto de Estabilidade', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (8, N'Projeto de Estabilidade e Medição & Orçamentação', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (9, N'Projeto de Estabilidade, Esgotos e Acústico', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (10, N'Projeto de Gás e Medição & Orçamentação', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (11, N'Projeto de Infraestuturas de Esgotos', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (12, N'Projetos de Águas e Gás e Medição & Orçamentação', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (13, N'Projetos de Águas e Medição & Orçamentação', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (14, N'Projetos de Demolição e Medição & Orçamentação', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (15, N'Relatório Pericial', N'', N'', N'', CAST(N'2019-04-01T19:14:53.323' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (18, N'Projeto de Segurança contra Incêndios em Edifícios', N'', N'', N'', CAST(N'2020-11-19T15:02:06.210' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (19, N'Ficha Técnica de Habitação', N'', N'', N'', CAST(N'2020-11-19T15:06:02.800' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (20, N'Projeto de Águas e Medição & Orçamentação', N'', N'', N'', CAST(N'2020-11-19T15:17:56.133' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (21, N'Projeto de Exaustão e Ventilação de Fumos e Medição & Orçamentação', N'', N'', N'', CAST(N'2020-11-19T15:19:01.817' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (23, N'Projeto de Águas Residuais Domésticas e Pluviais e Medição & Orçamentação', N'', N'', N'', CAST(N'2020-11-19T15:21:12.567' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (24, N'Coordenação das Especialidades, Projetos de Infraestruturas, Projetos de Especialidades e Medição & Orçamentação', N'', N'', N'', CAST(N'2020-11-19T15:23:29.337' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (25, N'Projeto de Estabilidade, Projeto de Águas, Projeto de Esgotos e Medição & Orçamentação', N'', N'', N'', CAST(N'2022-11-21T21:29:46.377' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (26, N'Projeto de Águas, Projeto de Esgotos, Projeto de Segurança contra Incêndios em Edifícios, Projeto de Ventilação e Medição & Orçamentação', N'', N'', N'', CAST(N'2022-11-21T21:32:41.740' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (27, N'Projeto de Águas, Projeto de Esgotos e Medição & Orçamentação', N'', N'', N'', CAST(N'2022-11-21T21:34:34.987' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (28, N'Relatório de Inspeção', N'', N'', N'', CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_TIPO] ([PORTFOLIO_TIPOID], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [ctrldata], [ctrlcodop]) VALUES (29, N'Projeto de Segurança contra Incêndios em Edifícios e Projeto de Térmica', N'', N'', N'', CAST(N'2022-11-22T00:03:12.077' AS DateTime), N'JPOLIVEIRA     ')
GO

SET IDENTITY_INSERT [dbo].[PORTFOLIO_TIPO] OFF
GO



SET IDENTITY_INSERT [dbo].[PORTFOLIO] ON 
GO

INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (1, N'Venda Nova, Amadora', N'Substituição de deque no pátio de acesso ao Edifício Modular nos Serviços Centrais localizados na Rua das Industrias 21', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 1, 2015, CAST(N'2019-04-01T19:32:21.997' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (2, N'Entroncamento', N'Remodelação da Oficina de Motorizados no Parque Oficinal Centro (POC)', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'1.jpg', 13, 2015, CAST(N'2020-01-03T21:58:03.480' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (4, N'Barreiro', N'Realocação de plataformas e sistema de recolha de óleos usados no POS-Parque Oficinal do Barreiro, localizado na Rua Miguel Pais', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 3, 2015, CAST(N'2020-01-03T21:58:10.763' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (5, N'Campolide, Lisboa', N'Reparações de infraestruturas e de diques - POS, localizados na Rua Particular nº1', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 4, 2015, CAST(N'2020-01-03T22:03:14.090' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (6, N'Barreiro', N'Realocação de Quinadeira e Guilhotina – Parque Oficinal Sul - Barreiro localizada na Rua Miguel Pais, S/N', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 5, 2015, CAST(N'2020-01-03T22:25:01.283' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (7, N'Barreiro', N'Colocação de Gradil em Fosso de Dique – Parque Oficinal Sul - Barreiro localizada na Rua Miguel Pais, S/N', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 6, 2015, CAST(N'2020-01-03T22:25:01.300' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (8, N'Penha de França, Lisboa', N'Remodelação do Parque de Resíduos e Pavimentação do Caminho de Acesso – Manutenção de Lisboa - Santa Apolónia localizados na Rua Madre Deus', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 7, 2015, CAST(N'2020-01-03T22:25:01.300' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (9, N'Entroncamento', N'Instalações Elétricas, referente à obra de Remodelação da Iluminação Oficina Carruagens no Parque Oficinal Centro (POC)', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 8, 2015, CAST(N'2020-01-03T22:25:01.300' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (10, N'Entroncamento', N'Drenagem Linear entre Limite do Parque Oficinal e Particular- Entroncamento localizados na Rua D. Afonso Henriques', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 9, 2015, CAST(N'2020-01-03T22:25:01.300' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (11, N'Penha de França, Lisboa', N'Tapamento da Lateral do Anexo à Nave Oficinal com Painéis de Policarbonato - Manutenção de Lisboa - Santa Apolónia localizados na Rua Madre Deus', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 10, 2015, CAST(N'2020-01-03T22:25:01.300' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (12, N'Contumil, Porto', N'Remodelação do Parque de Resíduos e implantação do espaço social- UMAV Unidade de Manutenção de Alta Velociadade, localizados na Rua Dr. Diniz 270', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 11, 2015, CAST(N'2020-01-03T22:25:01.313' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (13, N'Barreiro', N'Colocação de Tapume para Armazém na Oficina da Reparação – Parque Oficinal Sul - Barreiro localizada na Rua Miguel Pais, S/N', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 12, 2015, CAST(N'2020-01-03T22:25:01.313' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (15, N'Santo António dos Olivais, Coimbra', N'Remodelação do Piso 1 do Prédio de habitação, localizada na Rua Afrânio Peixoto, N.º 166', N'', N'', N'', N'', 2, N'', 1, 2015, CAST(N'2020-01-03T22:25:01.313' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (16, N'Carvalhal (Atalaia), Pinhel', N'Construção de uma garagem, localizado na Travessa do Forno', N'', N'', N'', N'', 2, N'', 2, 2015, CAST(N'2020-01-03T22:25:01.313' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (17, N'Aveiras de Cima, Azambuja', N'Construção ampliação de dois pavilhões industriais para armazenagem e um para produção de produtos de transformação de plásticos, a instalar na Rua 1º de Abril - Edifício Gepack', N'', N'', N'', N'', 2, N'2.jpg', 3, 2015, CAST(N'2020-01-03T22:25:01.313' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (18, N'Ajuda, Lisboa', N'Reconstrução edifício escolar EB60, localizado na Rua Coronel Pereira da Silva n. º 18', N'', N'', N'', N'', 2, N'3.jpg', 4, 2015, CAST(N'2020-01-03T22:25:01.330' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (19, N'Namibe, Angola', N'Construção do Centro Comercial Namibe', N'', N'', N'', N'', 2, N'4.jpg', 5, 2015, CAST(N'2020-01-03T22:25:01.330' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (20, N'Santiago de Rio de Moinhos (Rio de Moinhos), Borba', N'Edifício destinado a Lar Residencial e Centro de actividades ocupacionais para deficientes profundos, localizado na Herdade da Fuseira e Álamo', N'', N'', N'', N'', 2, N'51.jpg', 6, 2015, CAST(N'2020-01-03T22:25:01.330' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (21, N'S. Domingos de Benfica, Lisboa', N'Substituição da coluna montante de águas e de gás do Edifício de Habitação Coletiva, localizado no Largo Pedro Correia Marques, N.º 1', N'', N'', N'', N'', 12, N'', 1, 2015, CAST(N'2020-01-03T22:25:01.330' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (22, N'Misericórdia, Lisboa', N'Demolição do Edifício de Carpintaria, localizado na Calçada do Tijolo, N.º 41A', N'', N'', N'', N'', 14, N'', 1, 2015, CAST(N'2020-01-03T22:25:01.330' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (23, N'Queijas, Sintra', N'Pericia a moradia unifamiliar, sita na rua Almada Negreiros, N.º 28', N'', N'', N'', N'', 15, N'', 1, 2015, CAST(N'2020-01-03T22:25:01.347' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (24, N'Entroncamento', N'Alimentação Elétrica das Pontes Rolantes da Oficina de Motorizados no Parque Oficinal Centro (POC)', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 2, 2016, CAST(N'2020-01-03T23:08:12.120' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (25, N'Amadora, Lisboa', N'Remodelação de Gabinetes - Serviços Centrais - Amadora, localizados na Rua das Indústrias, 21', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 3, 2016, CAST(N'2020-01-03T23:08:12.120' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (26, N'Penha de França, Lisboa', N'Reparação dos Diques das Linhas M3 e M4- Manutenção de Lisboa - Santa Apolónia, localizados na Rua Madre Deus', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 4, 2016, CAST(N'2020-01-03T23:08:12.120' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (27, N'Entroncamento', N'Substituição de travessas, ripagem de via e afinação de AMV - Entroncamento, localizados na Rua D. Afonso Henriques', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 5, 2016, CAST(N'2020-01-03T23:08:12.133' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (28, N'Entroncamento', N'Ampliação e impermeabilização do tanque separador de óleos, localizada na Rua D. Afonso Henrique', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 6, 2016, CAST(N'2020-01-03T23:08:12.150' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (29, N'Guifões, Matosinhos', N'Reparações para entrega de instalações Metro do Porto localizados na Rua Ferroviário', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 7, 2016, CAST(N'2020-01-03T23:08:12.150' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (30, N'Campolide, Lisboa', N'Construção de Armazém e Requalificação de Estrutura de Pavimento, localizados na Rua Particular nº 1 – POS', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 8, 2016, CAST(N'2020-01-03T23:08:12.150' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (31, N'Entroncamento', N'Substituição do sistema de bombagem da EE5 e melhoramentos na EE4, localizada na Rua D. Afonso Henriques', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 9, 2016, CAST(N'2020-01-03T23:08:12.150' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (32, N'Misericórdia, Lisboa', N'Construção de edifício destinado a alojamento local, localizado na Calçada do Tijolo, N.º 41A', N'', N'', N'', N'', 2, N'6.jpg', 1, 2016, CAST(N'2020-01-03T23:08:12.167' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (33, N'Arroios, Lisboa', N'Ampliação Reabilitação do Edifício de Habitação Coletiva para Estudantes, localizada na Rua Gonçalves Crespo, N.º 21 e 21A', N'', N'', N'', N'', 2, N'8.jpg', 2, 2016, CAST(N'2020-01-03T23:08:12.213' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (34, N'Alvalade, Lisboa', N'Alteração do Edifício de Habitação Coletiva para Estudantes, localizada na Praça de Alvalade, N.º 9 e 9A', N'', N'', N'', N'', 2, N'9.jpg', 3, 2016, CAST(N'2020-01-03T23:08:12.230' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (35, N'Marvila, Lisboa', N'Remodelação do Polidesportivo “Capitães de Abril”, localizado em Avenida João Paulo II', N'', N'', N'', N'', 2, N'', 4, 2016, CAST(N'2020-01-03T23:08:12.230' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (36, N'Castelo Branco', N'Requalificação da Escola Secundária Nuno Álvares, localizada na Avenida Nuno Álvares', N'', N'', N'', N'', 2, N'', 5, 2016, CAST(N'2020-01-03T23:08:12.230' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (37, N'Santarém', N'Substituição de Coberturas do Edifício A, B e D, localizada em Serviços de Formação Profissional de Santarém, Quinta do Mocho, Zona Industrial, EN 114', N'', N'', N'', N'', 2, N'', 6, 2016, CAST(N'2020-01-03T23:08:12.230' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (38, N'Arroios, Lisboa', N'Ampliação DE 5.º Piso em Edifício Habitacional Coletivo, localizado na Rua António Pedro, 109', N'', N'', N'', N'', 2, N'', 7, 2016, CAST(N'2020-01-03T23:08:12.230' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (39, N'Seia', N'Implementação de um Espaço de Catering no CONTACT CENTER, EDP-SEIA (a realizar)', N'', N'', N'', N'', 2, N'', 8, 2016, CAST(N'2020-01-03T23:08:12.340' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (40, N'Cascais', N'Reabilitação de Habitação Unifamiliar (Solar dos Falcões), localizada na Rua Latino Coelho nº 104, 104A, 104B e 104C', N'', N'', N'', N'', 2, N'11.jpg', 9, 2016, CAST(N'2020-01-03T23:08:12.340' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (41, N'Marvila, Lisboa', N'Infraestruturas de Drenagem Pública de Esgotos Domésticos e Pluviais da Sede da Junta de Freguesia de Marvila ', N'', N'', N'', N'', 11, N'', 1, 2016, CAST(N'2020-01-03T23:08:12.353' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (42, N'Alvalade, Lisboa', N'Requalificação dos Logradouros da Avenida dos Estados Unidos da América, 12 a 48, localizada na Avenida dos Estados Unidos da América, 12 a 48', N'', N'', N'', N'', 11, N'', 2, 2016, CAST(N'2020-01-03T23:08:12.353' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (43, N'Lisboa', N'Remodelação da Sala de Reuniões do Hotel GAT', N'', N'', N'', N'', 9, N'', 1, 2016, CAST(N'2020-01-03T23:08:12.353' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (44, N'Créteil (Saint-Maur-Des-Fosse), França', N'Reabilitação e Construção de Edificio de Habitação de 5 Pisos', N'', N'', N'', N'', 7, N'', 1, 2016, CAST(N'2020-01-03T23:08:12.353' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (45, N'Cidade da Praia (Santiago), Cabo Verde', N'Ampliação de Prédio de Habitação Multiifamilia, Bairro da Plateau', N'', N'', N'', N'', 3, N'', 1, 2016, CAST(N'2020-01-03T23:08:12.370' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (46, N'Entroncamento', N'Instalação de Portões na Ala Central – Oficina de Material Motor localizados no POC ', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 1, 2017, CAST(N'2020-01-03T23:23:59.257' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (47, N'Entroncamento', N'Substituição de Cobertura e Pavimento Armazém 9200', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 2, 2017, CAST(N'2020-01-03T23:23:59.270' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (48, N'Amadora, Lisboa', N'Reparações Pontuais ao Edifício dos Serviços Centrais - Amadora localizados na Rua das Industrias, 21', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 3, 2017, CAST(N'2020-01-03T23:23:59.270' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (49, N'Portugal', N'Caderno de Encargos para “Execução de trabalhos de conservação de Construção Civil”, em todas as instalações da EMEF ', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 4, 2017, CAST(N'2020-01-03T23:23:59.270' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (50, N'Portugal', N'Caderno de Encargos para “Execução de trabalhos de conservação de Instalações Elétricas”, em todas as instalações da EMEF ', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 5, 2017, CAST(N'2020-01-03T23:23:59.270' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (51, N'Portugal', N'Implantação dos espaços NÓS EMEF, em todas as instalações da EMEF', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 6, 2017, CAST(N'2020-01-03T23:23:59.270' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (52, N'Vila Real de Santo António', N'Construção de pavimento em betão em Oficina', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 7, 2017, CAST(N'2020-01-03T23:23:59.270' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (53, N'Santa Apolónia, Lisboa', N'Construção de Plataforma de Acesso aos Tejadilhos e Zona de Lavagem Exterior', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 8, 2017, CAST(N'2020-01-03T23:23:59.287' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (54, N'Entroncamento', N'Drenagem Linear entre Limite do Parque Oficinal e Particular- Entroncamento localizados na Rua D. Afonso Henriques', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 9, 2017, CAST(N'2020-01-03T23:23:59.287' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (55, N'Barreiro', N'Impermeabilização da cobertura e remodelação de balneários no Barreiro localizados na POS', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 10, 2017, CAST(N'2020-01-03T23:23:59.287' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (56, N'Entroncamento', N'Reparação, Impermeabilização e Adaptação do tanque separador de óleos da ETAR, localizada na Rua D. Afonso Henriques', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 11, 2017, CAST(N'2020-01-03T23:23:59.287' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (57, N'Oeiras', N'Remodelação da Rede de Dados – Parque Oficinal Sul', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 12, 2017, CAST(N'2020-01-03T23:23:59.287' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (58, N'Campolide, Lisboa', N'Construção de Armazém – Parque Oficinal Sul - Campolide localizados na Rua Particular, N.º1', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 13, 2017, CAST(N'2020-01-03T23:23:59.303' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (59, N'Castelo Branco', N'Adaptação de fração de edifício a Contact Center, localizada na confluência da Av. 1º de Maio com a Rua Dádra', N'', N'', N'', N'', 2, N'12.jpg', 1, 2017, CAST(N'2020-01-03T23:23:59.303' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (60, N'Bobadela', N'Construção do Edifício de Habitação Unifamiliar, localizado em Rua Mira Tejo 103, Bairro da Figueira', N'', N'', N'', N'', 2, N'', 2, 2017, CAST(N'2020-01-03T23:23:59.303' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (61, N'São Domingos de Benfica, Lisboa', N'Edificação de dois apartamentos habitacionais no 3.º piso do edifício (sótão), localizado na Rua das Laranjeiras, 20, 3.º Piso', N'', N'', N'', N'', 2, N'', 3, 2017, CAST(N'2020-01-03T23:23:59.303' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (62, N'Santana, São Tomé e Príncipe', N'Reabilitação da Casa Malheiro, a instalar no Club Santana, Beach & Resort', N'', N'', N'', N'', 2, N'14.jpg', 4, 2017, CAST(N'2020-01-03T23:23:59.303' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (63, N'Outeiro Seco, Chaves', N'Construção das futuras instalações da EDP de Chaves, localizada no Lote 13B do Loteamento do Parque de Atividades de Chaves', N'', N'', N'', N'', 2, N'', 5, 2017, CAST(N'2020-01-03T23:23:59.303' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (64, N'Arroios, Lisboa', N'Integração de parte do sótão do edifício na área habitacional do 3.º piso direito (Fração G)”, localizada na Travessa Cidadão João Gonçalves, N.º 20, 3.º Dto', N'', N'', N'', N'', 2, N'', 6, 2017, CAST(N'2020-01-03T23:23:59.320' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (65, N'Aveiras de Cima, Azambuja', N'Ampliação de pavilhão industrial para armazenagem de produtos de transformação de plásticos, a instalar na Rua 1º de Abril - Edifício Gepack', N'', N'', N'', N'', 2, N'15.jpg', 7, 2017, CAST(N'2020-01-03T23:23:59.320' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (66, N'Ajuda, Lisboa', N'Ampliação de moradia geminada, localizada na Rua Rainha das Ilhas das Cobras N.º 13, Bairro do Caramão da Ajuda', N'', N'', N'', N'', 2, N'', 8, 2017, CAST(N'2020-01-03T23:23:59.320' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (67, N'Estrela, Lisboa', N'Ampliação de um prédio de habitação de 5 Pisos, na Rua do Borja, N.º 65 a 69', N'', N'', N'', N'', 2, N'', 9, 2017, CAST(N'2020-01-03T23:23:59.320' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (68, N'Idanha-a-Nova', N'Ampliação da Unidade de Cuidados Continuados Integrados, localizada na Tapada do Sobral e Vale Ferreiro', N'', N'', N'', N'', 2, N'', 10, 2017, CAST(N'2020-01-03T23:23:59.320' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (69, N'Santiago, Cabo Verde', N'Construção do Centro de Saúde de Assomada', N'', N'', N'', N'', 2, N'18.jpg', 11, 2017, CAST(N'2020-01-03T23:23:59.320' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (70, N'Santiago, Cabo Verde', N'Construção do Centro de Saúde de Orgãos', N'', N'', N'', N'', 2, N'17.jpg', 12, 2017, CAST(N'2020-01-03T23:23:59.333' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (71, N'Santiago, Cabo Verde', N'Construção do Centro de Saúde de Cancelo', N'', N'', N'', N'', 2, N'16.jpg', 13, 2017, CAST(N'2020-01-03T23:23:59.333' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (72, N'Montemor-o-Novo', N'Remodelação da Envolvente Norte, Sul e Oeste do Mercado Municipal e do Troço Sudeste da Rua Comandante Fragoso, localizado no Largo Professor Bento de Jesus Caraça', N'', N'', N'', N'', 5, N'', 1, 2017, CAST(N'2020-01-03T23:23:59.333' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (73, N'Porto Salvo, Lisboa', N'Ligação das Infraestruturas de Esgotos Domésticos à Galeria Existente na Avenida Doutor Mário Soares (TAGUSPARK), localizado na Avenida Professor Doutor Cavaco Silva, n.º 33', N'', N'', N'', N'', 5, N'', 2, 2017, CAST(N'2020-01-03T23:23:59.333' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (74, N'Morro Bento, Luanda', N'Construção de 3 Armazéns (Pavilhões)', N'', N'', N'', N'', 5, N'', 3, 2017, CAST(N'2020-01-03T23:23:59.333' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (75, N'Olivais, Lisboa', N'Construção do Mercado de Olivais Sul B, localizado em Avenida Cidade Lourenço Marques ', N'', N'', N'', N'', 4, N'13.jpg', 1, 2017, CAST(N'2020-01-03T23:23:59.350' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (76, N'Parque das Nações, Lisboa', N'Substituição da coluna montante e do ramal de ligação, bem como da rede de incêndio armada, localizada na Rua Padre Abel Varzim, Bairro Quinta das Laranjeiras, Lotes 1, 2, 3, 6, 7, 8, 11, 12, 13, 14, 15, 16 e 17', N'', N'', N'', N'', 13, N'', 1, 2017, CAST(N'2020-01-03T23:23:59.350' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (77, N'Luanda', N'Construção de 3 Armazéns (Pavilhões), localizada no Morro Bento', N'', N'', N'', N'', 2, N'19.jpg', 1, 2018, CAST(N'2020-01-03T23:34:00.500' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (78, N'Porto', N'Construção de “Residência de Estudantes Universitários”, localizada no Lote 1, Loteamento da Areosa, Bairro da Areosa, Estrada da Circunvalação e Rua do Dr. Manuel Pereira da Silva', N'', N'', N'', N'', 2, N'21.jpg', 2, 2018, CAST(N'2020-01-03T23:34:00.500' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (79, N'Benfica, Lisboa', N'Construção de uma Residência de Estudantes Universitários, situada na Avenida do Colégio Militar, Lote 1690 que está integrado na Sub-Unidade 5.1 do Plano de Pormenor do Eixo Luz-Benfica', N'', N'', N'', N'', 2, N'22.jpg', 3, 2018, CAST(N'2020-01-03T23:34:00.500' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (80, N'Cabeço Monteiro', N'Obra de Aldeia de Cabeço-Monteiro, Empreendimento de Turismo Rural - Casa de Campo 1.º Fase', N'', N'', N'', N'', 2, N'20.jpg', 4, 2018, CAST(N'2020-01-03T23:34:00.500' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (81, N'Castelo, Sesimbra', N'Ampliação de uma Habitação, localizada na Rua dos Agapantos nº 1, Carrasqueira', N'', N'', N'', N'', 2, N'', 5, 2018, CAST(N'2020-01-03T23:34:00.500' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (82, N'Lumiar, Lisboa', N'Reabilitação de um apartamento habitacional, a alterar no 3.º e 4.º Piso, da Rua Manuel Marques nº 15, 3º e 4º frente', N'', N'', N'', N'', 2, N'', 6, 2018, CAST(N'2020-01-03T23:34:00.517' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (83, N'Parque das Nações, Lisboa', N'Requalificação da Estação Elevatória de Águas Residuais Domésticas EE3, localizada na Rua da Cotovia', N'', N'', N'', N'', 2, N'', 7, 2018, CAST(N'2020-01-03T23:34:00.517' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (84, N'Cascais', N'Reabilitação de Habitação Unifamiliar (Solar dos Falcões), localizada na Rua Latino Coelho nº 104, 104A, 104B e 104C', N'', N'', N'', N'', 2, N'', 8, 2018, CAST(N'2020-01-03T23:34:00.517' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (85, N'Sintra', N'Remodelação de espaços comuns, escadas e lavabos no edifício E dos Serviços de Formação Profissional de Sintra', N'', N'', N'', N'', 2, N'', 9, 2018, CAST(N'2020-01-03T23:34:00.517' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (86, N'Misericórdia, Lisboa', N'Reabilitação de um apartamento habitacional, a alterar e ampliar no 3.º Piso e Sótão, da Rua Pedro Dias, 23', N'', N'', N'', N'', 2, N'', 10, 2018, CAST(N'2020-01-03T23:34:00.517' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (87, N'Tomar', N'Reabilitação geral do edifício do SE Tomar, situado na Rua Santa Iria', N'', N'', N'', N'', 2, N'', 11, 2018, CAST(N'2020-01-03T23:34:00.533' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (88, N'São Domingos de Benfica, Lisboa', N'Edificação de dois apartamentos habitacionais no 3.º piso do edifício (sótão), localizado na Rua das Laranjeiras, 20, 3.º Piso', N'', N'', N'', N'', 2, N'', 12, 2018, CAST(N'2020-01-03T23:34:00.533' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (89, N'Estrela, Lisboa', N'Ampliação de um prédio na Rua do Borja, N.º 65 a 69', N'', N'', N'', N'', 2, N'', 13, 2018, CAST(N'2020-01-03T23:34:00.547' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (90, N'Pêro Pinheiro e Montelavar, Sintra', N'Alteração e Ampliação de Moradia, localizada na Rua do Forno, 1, Vale de Lobos', N'', N'', N'', N'', 6, N'', 1, 2018, CAST(N'2020-01-03T23:34:00.547' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (91, N'São Romão do Neiva, Viana do Castelo', N'Construção de “Banco de Provas da Polícia Segurança Pública”, localizado na Rua António Castanho', N'', N'', N'', N'', 6, N'', 2, 2018, CAST(N'2020-01-03T23:34:00.547' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (92, N'Silves, Faro', N'Reabilitação de Muro de Suporte  nas Escadinhas do Mirante, localizado na Rua Dr. Francisco Vieira, nº 2 e 4 (Calçada do Castelo - Calçada superior à Rua do Mirante)', N'', N'', N'', N'', 8, N'', 1, 2018, CAST(N'2020-01-03T23:34:00.547' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (93, N'Santo Condestável, Lisboa', N'Reparação do 1.º andar direito no prédio localizado na Rua de Tomás da Anunciação, N.º 52', N'', N'', N'', N'', 8, N'', 2, 2018, CAST(N'2020-01-03T23:34:00.563' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (94, N'Parque das Nações, Lisboa', N'Substituição das colunas montantes e do ramal de ligação, bem como da rede de incêndio armada, dos lotes localizados na Rua Padre Abel Varzim, Bairro Quinta das Laranjeiras', N'', N'', N'', N'', 13, N'', 1, 2018, CAST(N'2020-01-03T23:34:00.563' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (95, N'Arroios, Lisboa', N'Alteração e ampliação de uma moradia unifamiliar, situada na Rua Particular à Rua Manuel Soares Guedes, 3 a 4', N'', N'', N'', N'', 5, N'', 1, 2019, CAST(N'2020-01-03T23:36:25.070' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (96, N'Portimão', N'Reabilitação Geral da Sede da Divisão da PSP de Portimão, localizada na Avenida Miguel Bombarda 16', N'', N'', N'', N'', 5, N'', 2, 2019, CAST(N'2020-01-03T23:36:25.070' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (97, N'Lisboa', N'Execução das Instalações e Equipamentos da Rede Predial de Serviço de Incêndios, a integrar na construção de um armazém, anexo a dois existentes na Avenida Infante D. Henrique 286', N'', N'', N'', N'', 13, N'', 1, 2019, CAST(N'2020-01-03T23:36:25.070' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (98, N'Santa Maria de Belém, Lisboa', N'Remodelação de uma moradia unifamiliar, situada na Rua Dom Francisco de Almeida 47', N'', N'', N'', N'', 10, N'', 1, 2019, CAST(N'2020-01-03T23:36:25.070' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (103, N'Talatona, Angola', N'Construção da Sede, Centro de Formação e Residências da MUMBA', N'', N'', N'', N'', 4, N'71.jpg', 1, 2016, CAST(N'2020-01-04T02:45:12.500' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (104, N'Montemor-o-Novo', N'Reabilitação da Envolvente e do Mercado Municipal de Montemor-o-Novo, localizado no Largo Professor Bento de Jesus Caraça', N'', N'', N'', N'', 4, N'10.jpg', 2, 2016, CAST(N'2020-01-04T02:45:12.513' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (105, N'Entroncamento', N'Remodelação dos balneários da zona sul do POC - Parque Oficinal do Centro, localizados na Rua D. Afonso Henriques', N'', N'', N'', N'Consultor da EMEF (Empresa de Manutenção de Equipamento Ferroviário, SA)', 1, N'', 2, 2015, CAST(N'2020-01-04T17:14:24.897' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (116, N'Santa Maria Maior, Lisboa', N'Alteração e ampliação de um edifício multifamiliar, localizado na Rua Nova do Almada 20 ao 28', N'', N'', N'', N'', 2, N'', 1, 2019, CAST(N'2020-11-19T14:38:18.787' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (117, N'Palmela, Setúbal', N'Construção de "Casa Abrigo", localizada em Algeruz', N'', N'', N'', N'', 2, N'', 2, 2019, CAST(N'2020-11-19T14:38:18.787' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (118, N'Lumiar, Lisboa', N'Construção de "Residência de Estudantes Universitários", localizada na Alta do Lumiar - Malha 34, Lotes 13, 14, 15 e 16', N'', N'', N'', N'', 2, N'23.jpg', 3, 2019, CAST(N'2020-11-19T14:38:18.787' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (119, N'Covilhã e Canhoso, Covilhã', N'Edificação de uma Residência Universitária, localizada na Fonte do Lameiro', N'', N'', N'', N'', 2, N'24.jpg', 4, 2019, CAST(N'2020-11-19T14:38:18.787' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (120, N'Misericórdia, Lisboa', N'Alteração interior de um edifício multifamiliar, situado no Beco da Cruz 6 a 8', N'', N'', N'', N'', 2, N'', 5, 2019, CAST(N'2020-11-19T14:38:18.787' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (121, N'Silves, Faro', N'Reabilitação com ampliação de edificação, localizada na Rua Dr. Francisco Vieira, nº 4', N'', N'', N'', N'', 2, N'', 6, 2019, CAST(N'2020-11-19T14:38:18.787' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (122, N'Santa Maria dos Olivais, Lisboa', N'Edificação de um quiosque e de torre mIradouro no Parque de Jardim, situado na Rua Cidade de Tete', N'', N'', N'', N'', 2, N'', 7, 2019, CAST(N'2020-11-19T14:38:18.787' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (123, N'Carnide, Lisboa', N'Substituição das colunas montantes e dos ramais de ligação dos Edifícios do Bairro da Horta da Nora', N'', N'', N'', N'', 2, N'', 8, 2019, CAST(N'2020-11-19T14:38:18.787' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (124, N'Paço de Arcos, Lisboa', N'Condomínio em Estrada de Paço de Arcos, 1', N'', N'', N'', N'', 19, N'', 9, 2019, CAST(N'2020-11-19T14:38:18.787' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (125, N'Lumiar, Lisboa', N'Edificação de uma Residência Universitária, localizada na Alta do Lumiar - Malha 34, Lote 2', N'', N'', N'', N'', 18, N'', 1, 2020, CAST(N'2020-11-19T15:02:06.210' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (126, N'Lumiar, Lisboa', N'Edificação de uma Residência Universitária, localizada na Alta do Lumiar - Malha 34, Lote 12', N'', N'', N'', N'', 18, N'', 2, 2020, CAST(N'2020-11-19T15:02:06.223' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (127, N'Areeiro, Lisboa', N'"Construção, Smart Studios Areeiro", localizada no gaveto da Rua Sarmento de Beires com o Largo Bernardo Santareno', N'', N'', N'', N'', 18, N'', 3, 2020, CAST(N'2020-11-19T15:02:06.223' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (128, N'Parque das Nações, Lisboa', N'Requalificação da Estação Elevatória de Águas Residuais Domésticas EE6, localizada no Caminho das Cegonhas', N'', N'', N'', N'', 5, N'', 1, 2020, CAST(N'2020-11-19T15:02:06.223' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (129, N'Parque das Nações, Lisboa', N'Requalificação da Estação Elevatória de Águas Residuais Domésticas EE7, localizada na Travessa do Gil', N'', N'', N'', N'', 5, N'', 2, 2020, CAST(N'2020-11-19T15:02:06.223' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (130, N'UF Grândola e Santa Margarida da Serra, Grândola', N'Construção de Hotel Apartamento (Infraestruturas), localizado na Pernada do Marco de Cima, Bicas', N'', N'', N'', N'', 24, N'25.jpg', 3, 2020, CAST(N'2020-11-19T15:02:06.223' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (131, N'São Victor, Braga', N'Construção de um "Edifício destinado a Residência de Estudantes Universitários/Coliving", localizada na Rua da Quinta da Armada', N'', N'', N'', N'', 2, N'26.jpg', 4, 2020, CAST(N'2020-11-19T15:02:06.223' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (132, N'São Vicente, Lisboa', N'Alteração interior de um edifício multifamiliar, situado na Rua Pedro Alexandrino, 14 a 18', N'', N'', N'', N'', 2, N'', 5, 2020, CAST(N'2020-11-19T15:02:06.223' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (133, N'Mercês, Lisboa', N'Alteração de interiores de edifício unifamiliar geminado, situado na Rua Professor Branco Rodrigues, 29', N'', N'', N'', N'', 23, N'', 6, 2020, CAST(N'2020-11-19T15:02:06.240' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (134, N'Algés', N'Remodelação de um "Restaurante Chinês", localizado na Avenida dos Bombeiros Voluntários, 38 e 38B', N'', N'', N'', N'', 10, N'', 1, 2020, CAST(N'2020-11-19T15:02:06.240' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (135, N'Alapria, Estoril', N'Exaustão e ventilação de fumos da cozinha da ampliação e alteração de uso para ensino privado da Prime School', N'', N'', N'', N'', 21, N'', 2, 2020, CAST(N'2020-11-19T15:02:06.240' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (136, N'Estrela, Lisboa', N'Alteração interior de uma fração de um edifício de comércio e escritórios, situado na Avenida Infante Santo, 23-B', N'', N'', N'', N'', 20, N'', 3, 2020, CAST(N'2020-11-19T15:02:06.240' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (137, N'Ulgueira, Colares', N'Remodelação de uma Moradia Unifamiliar, localizada na Travessa da Madressilva N.º 5 e 5A', N'', N'', N'', N'', 19, N'', 4, 2020, CAST(N'2020-11-19T15:02:06.240' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (138, N'Ajuda, Lisboa', N'Construção de um edifício destinado a Residência de Estudantes Universitários, localizada no Lote limitado pela Rua do Cruzeiro e a Travessa José Fernandes', N'', N'', N'', N'', 5, N'31.jpg', 5, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (139, N'Aveiro', N'Edificação de uma Residência Universitária, com acesso pela Rua das Pombas, junto ao Estádio Municipal de Aveiro', N'', N'', N'', N'', 5, N'32.jpg', 6, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (140, N'Belém, Lisboa', N'Alteração de um edifício unifamiliar, situado na Rua do Embaixador 31', N'', N'', N'', N'', 5, N'', 2, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (141, N'Castelo Branco', N'Reabilitação do Edifício “Ex-Guarda Fiscal” a Centro de Empresas Inovadoras II, localizada no Gaveto da Quinta do Amieiro de Cima com a Rua Eng.° Duarte Pacheco', N'', N'', N'', N'', 5, N'', 9, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (142, N'Covilhã', N'Reconstrução com ampliação e alteração de edifício para comércio e serviços, localizada na Travessa da Calçada Fonte do Lameiro, freguesia da Covilhã e Canhoso', N'', N'', N'', N'', 5, N'', 10, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (143, N'Estoril', N'Reabilitação das Infraestruturas e Renovação dos Acabamentos da Residência de Estudantes integrada na Escola de Hotelaria do Estoril, localizada na Avenida Condes de Barcelona 808', N'', N'', N'', N'', 5, N'', 8, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (144, N'Lumiar, Lisboa', N'Construção de um Edifício de Habitação e Comércio, localizada no Alto do Lumiar do PUAL, Lote 10 da Malha 34, Urbanização do Alto do Lumiar do Pual', N'', N'', N'', N'', 5, N'29.jpg', 3, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (145, N'Lumiar, Lisboa', N'Construção de um Edifício de Habitação e Comércio, localizada no Alto do Lumiar do PUAL, Lote 11 da Malha 34, Urbanização do Alto do Lumiar do Pual', N'', N'', N'', N'', 5, N'30.jpg', 4, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (146, N'Odivelas', N'Edificação de uma Residência Universitária, localizada na Quinta Nova - Zona A - Lote 53', N'', N'', N'', N'', 5, N'', 7, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (147, N'São Domingos de Rana, Cascais', N'Alteração com ampliação e demolição de edificação, localizada na Rua dos Caçadores, n.º 24, Abóboda', N'', N'', N'', N'', 5, N'', 1, 2021, CAST(N'2022-11-21T22:54:22.937' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (148, N'Penha de França, Lisboa', N'Parque Infantil Inclusivo (PROJ. OP 2018/19) – Baluarte de Santa Apolónia', N'', N'', N'', N'Câmara Municipal de Lisboa', 27, N'', 11, 2021, CAST(N'2022-11-21T22:54:22.947' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (149, N'Sobral de Monte Agraço', N'Construção de Moradia Unifamiliar, localizada na Rua António Manuel Marques e Avenida da Linhas de Torres', N'', N'', N'', N'', 26, N'', 12, 2021, CAST(N'2022-11-21T22:54:22.947' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (150, N'Alvor, Portimão', N'Reabilitação do Edifício da Antiga Junta de Freguesia de Alvor, situada na Rua Marquês de Pombal 6', N'', N'', N'', N'', 25, N'', 13, 2021, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (151, N'Lisboa', N'Requalificação e Ampliação do Serviço de Medicina Intensiva, no piso 1, localizada no Hospital de Santa Maria', N'', N'', N'', N'', 18, N'', 14, 2021, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (152, N'Alcains', N'Centro de Saúde de Alcains, localizada na Rua Gil Vicente', N'', N'', N'', N'', 5, N'', 1, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (153, N'Algés', N'Reabilitação geral do edifício para armazenamento “Storage”, na Rua General Ferreira Martins, 7', N'', N'', N'', N'', 5, N'', 8, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (154, N'Almargem do Bispo, Sintra', N'Legalização de uma moradia unifamiliar e um anexo de apoio para arrumos, localizada na Rua dos Frades, N.º 22, Sabugo', N'', N'', N'', N'', 5, N'', 3, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (155, N'Caldas da Rainha', N'Requalificação da Residência Rafael Bordalo Pinheiro', N'', N'', N'', N'', 5, N'', 9, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (156, N'Lisboa', N'Reabilitação / Ampliação das construções existentes no lote compreendido entre a Rua de Buenos Aires 9 e a Travessa do Combro 10', N'', N'', N'', N'', 5, N'33.jpg', 4, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (157, N'Lisboa', N'Reabilitação de Edifício para Habitação Multifamiliar, localizado na Rua de São Pedro de Alcântara, N.os 5, 7, 9 e 11, 1250-237 Lisboa e Rua do Grémio Lusitano, N.os 2 e 4', N'', N'', N'', N'', 5, N'', 6, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (158, N'Porto', N'Reabilitação geral do edifício para armazenamento “Storage”, na Rua do Paraíso 304 e 320', N'', N'', N'', N'', 5, N'', 7, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (159, N'Senhora da Saúde, Évora', N'Demolição, alteração e ampliação dos edifícios existentes no Monte da Herdade Sousa de Sé para Alojamento Local', N'', N'', N'', N'', 5, N'', 2, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (160, N'Sintra', N'Reabilitação com alteração e ampliação de edificação, localizada na Rua Gomes Amorim, nº 15', N'', N'', N'', N'', 5, N'', 5, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (161, N'Santo António, Lisboa', N'Alteração de Edifício Multifamiliar, localizada na Rua do Passadiço, nº 18, 20, 22 e 24', N'', N'', N'', N'', 18, N'', 10, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (162, N'Anjos, Lisboa', N'Ampliação, Alteração e Construção de Palacete do Século XIX, para Edifício Multifamiliar, localizada na Rua Maria da Fonte, nº 4 a 16', N'', N'', N'', N'', 18, N'', 11, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (163, N'Lisboa', N'Habitação Multifamiliar, localizada na Rua Dom Pedro V, n.º 425, 2.º Direito', N'', N'', N'', N'', 28, N'', 12, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (164, N'Lisboa', N'Habitação Multifamiliar, localizada na Rua Eduardo Coelho, n.º 42, 3.º Andar', N'', N'', N'', N'', 28, N'', 13, 2022, CAST(N'2022-11-21T22:54:22.950' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (165, N'Miraflores, Algés', N'Construção de um Edifício de Habitação, localizada no Parque dos Cisnes, Lote 16', N'', N'', N'', N'', 24, N'27.jpg', 4, 2020, CAST(N'2022-11-22T00:03:12.077' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO] ([PORTFOLIOID], [LOCALIDADE], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [EMPRESA], [ID_TIPO], [IMAGEM_CAPA], [ORDEM], [ANO], [ctrldata], [ctrlcodop]) VALUES (167, N'Zaire, Angola', N'Construção do Cais e Requalificação da Base Naval do Soyo', N'', N'', N'', N'', 29, N'28.jpg', 1, 2020, CAST(N'2022-11-22T00:05:44.200' AS DateTime), N'JPOLIVEIRA     ')
GO

SET IDENTITY_INSERT [dbo].[PORTFOLIO] OFF
GO



SET IDENTITY_INSERT [dbo].[PORTFOLIO_IMAGES] ON 
GO

INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (1, 2, N'1.jpg', 1, CAST(N'2020-01-05T20:55:12.760' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (2, 17, N'2_horizontal.jpg', 1, CAST(N'2020-01-04T02:30:23.153' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (3, 18, N'3.jpg', 1, CAST(N'2020-01-04T02:30:39.797' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (4, 19, N'4_horizontal.jpg', 1, CAST(N'2020-01-04T02:30:51.860' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (5, 20, N'51.jpg', 1, CAST(N'2020-01-04T02:31:02.520' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (6, 32, N'6.jpg', 1, CAST(N'2020-01-04T02:33:24.303' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (7, 33, N'8_horizontal.jpg', 1, CAST(N'2020-01-04T02:34:04.920' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (8, 34, N'9_horizontal.jpg', 1, CAST(N'2020-01-04T02:34:59.067' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (9, 40, N'11_horizontal.jpg', 1, CAST(N'2020-01-04T02:35:58.393' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (10, 103, N'71.jpg', 1, CAST(N'2020-01-04T02:45:53.473' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (11, 103, N'72.jpg', 1, CAST(N'2020-01-04T02:46:06.570' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (12, 104, N'10.jpg', 1, CAST(N'2020-01-04T02:46:21.970' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (13, 59, N'12.jpg', 1, CAST(N'2020-01-04T02:47:02.710' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (14, 62, N'14.jpg', 1, CAST(N'2020-01-04T02:48:15.430' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (15, 65, N'15.jpg', 1, CAST(N'2020-01-04T02:48:36.307' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (16, 69, N'18.jpg', 1, CAST(N'2020-01-04T02:48:57.857' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (17, 70, N'17.jpg', 1, CAST(N'2020-01-04T02:49:13.390' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (18, 71, N'16.jpg', 1, CAST(N'2020-01-04T02:49:24.220' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (19, 75, N'13.jpg', 1, CAST(N'2020-01-04T02:49:56.307' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (25, 78, N'21.jpg', 1, CAST(N'2020-01-04T17:44:47.117' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (26, 79, N'22.jpg', 1, CAST(N'2020-01-04T17:45:03.803' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (27, 80, N'20.jpg', 1, CAST(N'2020-01-04T17:45:19.993' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (28, 20, N'52.jpg', 2, CAST(N'2020-01-04T17:46:34.150' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (29, 77, N'19.jpg', 1, CAST(N'2020-01-04T17:49:27.147' AS DateTime), N'ALOURENCO      ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (30, 118, N'23_horizontal.jpg', 1, CAST(N'2022-11-21T23:53:10.050' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (31, 119, N'24_horizontal.jpg', 1, CAST(N'2022-11-21T23:53:10.053' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (32, 130, N'25_horizontal.jpg', 1, CAST(N'2022-11-21T23:53:10.053' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (33, 131, N'26.jpg', 1, CAST(N'2022-11-21T23:53:10.053' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (34, 165, N'27.jpg', 1, CAST(N'2022-11-22T00:04:57.693' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (35, 167, N'28.jpg', 1, CAST(N'2022-11-22T00:06:19.340' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (36, 144, N'29.jpg', 1, CAST(N'2022-11-22T00:13:25.010' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (37, 145, N'30.jpg', 1, CAST(N'2022-11-22T00:13:25.010' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (38, 138, N'31.jpg', 1, CAST(N'2022-11-22T00:13:25.010' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (39, 139, N'32.jpg', 1, CAST(N'2022-11-22T00:13:25.010' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[PORTFOLIO_IMAGES] ([PORTFOLIO_IMAGESID], [ID_PORTFOLIO], [IMAGEM], [ORDEM], [ctrldata], [ctrlcodop]) VALUES (40, 156, N'33_horizontal.jpg', 1, CAST(N'2022-11-22T00:13:25.013' AS DateTime), N'JPOLIVEIRA     ')
GO

SET IDENTITY_INSERT [dbo].[PORTFOLIO_IMAGES] OFF
GO



SET IDENTITY_INSERT [dbo].[CONTACTOS] ON 
GO

INSERT [dbo].[CONTACTOS] ([CONTACTOSID], [NOME], [MORADA1], [MORADA2], [COD_POSTAL], [LOCALIDADE], [ctrldata], [ctrlcodop]) VALUES (1, N'JPDADO - SERVIÇOS DE ENGENHARIA E CONSULTADORIA, LDA', N'Rua das Sargaceiras, N.º 34', N'Fonte da Aranha (Almornos)', N'2715-308', N'Almargem do Bispo', CAST(N'2019-03-29T21:03:22.183' AS DateTime), N'JPOLIVEIRA     ')
GO

SET IDENTITY_INSERT [dbo].[CONTACTOS] OFF
GO



SET IDENTITY_INSERT [dbo].[TEXTOS] ON 
GO

INSERT [dbo].[TEXTOS] ([TEXTOSID], [CODIGO], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [ordem], [ctrldata], [ctrlcodop]) VALUES (1, N'ABOUT', N'Sobre Nós', N'', N'', N'', N'A empresa JPDADO - Serviços de Engenharia e Consultadoria, Lda foi consituída em fevereiro de 2015, atuando no setor dos projetos de engenharia, coordenação de segurança e fiscalização/gestão de obras.<br />É dirigida tecnicamente por:<br />João Paulo do Amaral de Oliveira<br /><i>(Engenheiro Civil Sénior)</i><br />
Este técnico desenvolveu durante anos a sua atividade em diversos gabinetes de estudos e projetos.<br />A sua origem como empresa multidisciplinar, de diversas áreas da Engenharia Civil, tem como proncipal objetivo, no âmbito de uma prestação integrada de serviços aos seus clientes, elaborar projetos de qualidade em prazos ambiciosos. A inovação e qualidade são também vistas pela JPDADO como meios de proporcionar oportunidades de aprendizagem e de realização profissional aos seus colaboradores.<br />
A construção deste "espaço" surge da necessidade de partilhar alguns dos nossos trabalhos com clientes, parceiros de negócios e amigos.<br />Pretendemos que seja uma plataforma dedicada à Engenharia em geral com divulgação de trabalhos, partilha de negócios, etc.', N'', N'', N'', 0, CAST(N'2019-03-27T13:12:11.927' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[TEXTOS] ([TEXTOSID], [CODIGO], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [ordem], [ctrldata], [ctrlcodop]) VALUES (2, N'CERTIFICATION', N'Certificação', N'', N'', N'', N' O Sistema Nacional de Certificação Energética e da Qualidade do Ar Interior nos Edifícios (SCE) define os novos requisitos energéticos aplicáveis aos edifícios de habitação e de serviços. Na construção, venda ou arrendamento de edifícios, deve existir um certificado do desempenho energético válido até 10 anos, que incluí valores de referência de desempenho energético ideal. O Certificado Energético atribui uma etiqueta que traduz o desempenho energético dos edifícios de habitação e serviços, novos ou existentes e inclui recomendações de melhoria e viabilidade económica, realçando os benefícios fiscais para quem possui imóveis da classe energética A e A+.', N'', N'', N'', 4, CAST(N'2019-03-27T13:12:11.927' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[TEXTOS] ([TEXTOSID], [CODIGO], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [ordem], [ctrldata], [ctrlcodop]) VALUES (3, N'CSO', N'Coordenação de Segurança de Obras', N'', N'', N'', N'Anteriormente descurada a Atividade da Coordenação de Segurança de Obras, veio através do Decreto-Lei nº 273/2003 de 29 de outubro, ver reconhecida a sua elevada importância no sector da construção civil. O dono de obra, seja este Particular ou Publico, reconhece hoje em dia uma mais-valia, ao contratar uma empresa Experiente para efetuar este serviço, com rigor sabedoria, isenção e disciplina. Sendo as mais-valias para o Dono de Obra a garantia de da obtenção de uma Qualidade, aliados a um Controlo dos Riscos associados ao desenvolvimento do seu Projeto. Salientamos entre outros, os seguintes serviços:<br /><br />- Coordenação de Segurança na Fase Obra;<br />- Planos de Segurança e Saúde - PSS;<br />- Desenvolvimento de Planos de Segurança e Saúde - DPSS;<br />- Implementação de Planos de Segurança e Saúde - IPSS;<br />- Segurança e Higiene no Trabalho;<br />- Vistorias;<br />- Pareceres;<br />- Consultoria;<br />- Peritagens', N'', N'', N'', 3, CAST(N'2019-03-27T13:12:11.927' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[TEXTOS] ([TEXTOSID], [CODIGO], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [ordem], [ctrldata], [ctrlcodop]) VALUES (4, N'GFO', N'Gestão e Fiscalização de Obras', N'', N'', N'', N'Anteriormente descurada a Atividade de Gestão e Fiscalização de Obras, veio através da Portaria nº232/2008 de 11 de março, ver reconhecida a sua elevada importância no sector da construção civil. O dono de obra, seja este Particular ou Publico, reconhece hoje em dia uma mais-valia, ao contratar uma empresa Experiente para efetuar este serviço, com rigor sabedoria, isenção e disciplina. Sendo as mais-valias para o Dono de Obra a garantia de da obtenção de uma Qualidade no desenvolvimento do seu Projeto, aliados a um Controlo de Custos e ao Rigoroso Cumprimento dos Prazos. Salientamos entre outros, os seguintes serviços:<br /><br />
- Fiscalização de Obras;<br />- Gestão de Obras;<br />- Caderno de Encargos;<br />- Medições;<br />- Orçamentos;<br />- Revisão de Projetos;<br />- Análise de Propostas;<br />- Coordenação de Projetos;<br />- Pareceres;<br />- Consultoria;<br />- Peritagens', N'', N'', N'', 2, CAST(N'2019-03-27T13:12:11.927' AS DateTime), N'JPOLIVEIRA     ')
GO
INSERT [dbo].[TEXTOS] ([TEXTOSID], [CODIGO], [NOME], [NOME_EN], [NOME_FR], [NOME_ES], [TEXTO], [TEXTO_EN], [TEXTO_FR], [TEXTO_ES], [ordem], [ctrldata], [ctrlcodop]) VALUES (5, N'SERVICES', N'Serviços', N'', N'', N'', N'A JPDADO, dentro da área de project management, desenvolve as seguintes atividades:<br /><br />- Gestão de Projeto;<br />- Fiscalização;<br />- Topografia e Geosistemas;<br />
- Coordenação de Segurança e Saúde;<br />- Gestão da Qualidade da Construção<br /><br />O seu projeto é único e desenhado à sua medida. Sabemos como aprecia uma solução rápida e eficaz, uma resposta pertinente, um trabalho inovador.<br />No fundo, UMA BOA IDEIA!', N'', N'', N'', 1, CAST(N'2019-03-27T13:12:11.927' AS DateTime), N'JPOLIVEIRA     ')
GO

SET IDENTITY_INSERT [dbo].[TEXTOS] OFF
GO
