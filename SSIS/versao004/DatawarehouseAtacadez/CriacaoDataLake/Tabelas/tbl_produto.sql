CREATE TABLE [dbo].[tbl_produto]
(
	[cod_produto] VARCHAR(25) NOT NULL PRIMARY KEY, 
    [desc_produto] VARCHAR(200) NULL, 
    [desc_departamento] VARCHAR(200) NULL, 
    [atr_unidade_medida] VARCHAR(50) NULL, 
    [cod_forncedor] VARBINARY(25) NULL, 
    [arquivo_origem] VARCHAR(200) NULL, 
    [data_origem] DATETIME NULL
)
