/*
Script de implantação para DW_ATACADEZ

Este código foi gerado por uma ferramenta.
As alterações feitas nesse arquivo poderão causar comportamento incorreto e serão perdidas se
o código for gerado novamente.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DW_ATACADEZ"
:setvar DefaultFilePrefix "DW_ATACADEZ"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQL_2024_05\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL16.SQL_2024_05\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detecta o modo SQLCMD e desabilita a execução do script se o modo SQLCMD não tiver suporte.
Para reabilitar o script após habilitar o modo SQLCMD, execute o comando a seguir:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'O modo SQLCMD deve ser habilitado para executar esse script com êxito.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'A operação de refatoração Renomear com chave 66e1147d-1512-404d-8d53-fd456dd2f338 foi ignorada; o elemento [dbo].[tbl_cliente].[desc_cidade] (SqlSimpleColumn) não será renomeado para cod_cidade';


GO
PRINT N'A operação de refatoração Renomear com chave c0369532-40bd-41cc-9d89-853b4d0a13a8 foi ignorada; o elemento [dbo].[tlb_empresa].[Id] (SqlSimpleColumn) não será renomeado para cod_loja';


GO
PRINT N'A operação de refatoração Renomear com chave f8c99e51-49c9-4dae-9390-a5e6e898575c foi ignorada; o elemento [dbo].[tlb_empresa].[Data_carga] (SqlSimpleColumn) não será renomeado para data_carga';


GO
PRINT N'A operação de refatoração Renomear com chave 8f35261e-8e04-48f6-af11-b976f14fdcac, ae5a6f72-c82e-4dcc-9ad9-9cfef92f67c2 foi ignorada; o elemento [dbo].[tbl_cliente].[Id] (SqlSimpleColumn) não será renomeado para cod_cliente';


GO
PRINT N'A operação de refatoração Renomear com chave 2ebdeab6-ebe6-4a97-a2da-230bf44b9eb2 foi ignorada; o elemento [dbo].[tbl_cliente].[desc_cidade] (SqlSimpleColumn) não será renomeado para desc_estado';


GO
PRINT N'A operação de refatoração Renomear com chave 61dde286-7891-4212-a683-619509102e8c foi ignorada; o elemento [dbo].[tbl_cliente].[cod_cidade] (SqlSimpleColumn) não será renomeado para des_cidade';


GO
PRINT N'A operação de refatoração Renomear com chave 817a6675-7dfe-4737-94c5-a21c19853428 foi ignorada; o elemento [dbo].[tbl_produto].[Id] (SqlSimpleColumn) não será renomeado para cod_produto';


GO
PRINT N'Criando Tabela [dbo].[tbl_cliente]...';


GO
CREATE TABLE [dbo].[tbl_cliente] (
    [cod_cliente]    VARCHAR (25)  NOT NULL,
    [desc_cliente]   VARCHAR (200) NULL,
    [endereco]       VARCHAR (200) NULL,
    [faturamento]    FLOAT (53)    NULL,
    [desc_segmento]  VARCHAR (200) NULL,
    [des_cidade]     VARCHAR (25)  NULL,
    [cod_estado]     VARCHAR (25)  NULL,
    [desc_estado]    VARCHAR (200) NULL,
    [desc_regiao]    VARCHAR (200) NULL,
    [arquivo_origem] VARCHAR (200) NULL,
    [data_carga]     DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([cod_cliente] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[tbl_produto]...';


GO
CREATE TABLE [dbo].[tbl_produto] (
    [cod_produto]        VARCHAR (25)   NOT NULL,
    [desc_produto]       VARCHAR (200)  NULL,
    [desc_departamento]  VARCHAR (200)  NULL,
    [atr_unidade_medida] VARCHAR (50)   NULL,
    [cod_forncedor]      VARBINARY (25) NULL,
    [arquivo_origem]     VARCHAR (200)  NULL,
    [data_origem]        DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([cod_produto] ASC)
);


GO
PRINT N'Criando Tabela [dbo].[tlb_empresa]...';


GO
CREATE TABLE [dbo].[tlb_empresa] (
    [cod_loja]       VARCHAR (25)    NOT NULL,
    [desc_loja]      VARBINARY (200) NULL,
    [desc_empresa]   VARBINARY (200) NULL,
    [cod_empresa]    VARBINARY (225) NULL,
    [tamanho_loja]   FLOAT (53)      NULL,
    [arquivo_origem] VARCHAR (200)   NULL,
    [data_carga]     DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([cod_loja] ASC)
);


GO
-- Etapa de refatoração para atualizar o servidor de destino com logs de transação implantados

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c0369532-40bd-41cc-9d89-853b4d0a13a8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c0369532-40bd-41cc-9d89-853b4d0a13a8')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f8c99e51-49c9-4dae-9390-a5e6e898575c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f8c99e51-49c9-4dae-9390-a5e6e898575c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '8f35261e-8e04-48f6-af11-b976f14fdcac')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('8f35261e-8e04-48f6-af11-b976f14fdcac')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ae5a6f72-c82e-4dcc-9ad9-9cfef92f67c2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ae5a6f72-c82e-4dcc-9ad9-9cfef92f67c2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '66e1147d-1512-404d-8d53-fd456dd2f338')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('66e1147d-1512-404d-8d53-fd456dd2f338')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2ebdeab6-ebe6-4a97-a2da-230bf44b9eb2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2ebdeab6-ebe6-4a97-a2da-230bf44b9eb2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '61dde286-7891-4212-a683-619509102e8c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('61dde286-7891-4212-a683-619509102e8c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '817a6675-7dfe-4737-94c5-a21c19853428')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('817a6675-7dfe-4737-94c5-a21c19853428')

GO

GO
PRINT N'Atualização concluída.';


GO
