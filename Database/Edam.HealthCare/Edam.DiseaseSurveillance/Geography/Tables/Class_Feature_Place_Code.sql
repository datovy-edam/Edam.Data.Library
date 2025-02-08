﻿-- based on Census Tiger CLASSFP Table
CREATE TABLE [Geography].[Class_Feature_Place_Code]
(
   [Code_ID]                VARCHAR(30) NOT NULL,
   [Description]            VARCHAR(1028) NULL,
   [Category_ID]            VARCHAR(30) NULL,

   [Associated_Entity]      VARCHAR(1028) NULL,

   [CodeSet_Name]           VARCHAR(80) NULL DEFAULT 'Census-Tigger CLASSFP',

   -- record management
   [Tenant_ID]              VARCHAR(40) NULL DEFAULT 'COMMON',
   [Data_Owner_ID]          VARCHAR(40) NULL DEFAULT 'Census',
   [Agency_Reporting_ID]    VARCHAR(40) NULL DEFAULT 'Census',
   [Sequence_Number]        INTEGER NULL DEFAULT 0,
   [Effective_DateTime]     DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Effective_End_DateTime] DATETIMEOFFSET NULL,
   [Version_Number]         VARCHAR(20) NULL DEFAULT '0',
   [Created_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Updated_DateTime]       DATETIMEOFFSET NULL DEFAULT getutcdate(),
   [Record_Status_Code_ID]  CHAR(1) NULL DEFAULT 'A',
   [Session_Updated_ID]     VARCHAR(40) NULL DEFAULT 'E4D32AEC-E7C8-426C-94A6-F0B37F626E67',

   CONSTRAINT [pk_Class_Feature_Place_Code] PRIMARY KEY CLUSTERED ([Code_ID] ASC)
)
GO

EXECUTE sp_addextendedproperty 
   @name = N'MS_Description', @value = 'Census Tiger - CLASFP - Class Feature Place Codes',
   @level0type = N'SCHEMA',   @level0name = N'Geography', 
   @level1type = N'TABLE',    @level1name = N'Class_Feature_Place_Code'
GO

