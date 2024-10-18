
CREATE TABLE [dbo].[details] (
    [id]        INT          IDENTITY (1, 1) NOT NULL,
    [name] VARCHAR (50) NULL,
    [address]   VARCHAR (50) NULL,
    [age]       INT          NULL,
    [gender]    VARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);
