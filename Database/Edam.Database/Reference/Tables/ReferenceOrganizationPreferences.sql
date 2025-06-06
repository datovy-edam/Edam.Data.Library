﻿CREATE TABLE [Reference].[ReferenceOrganizationPreferences] (
    [CreatedDate]             DATETIME      DEFAULT (getdate()) NOT NULL,
    [OrganizationId]          VARCHAR (20)  NOT NULL,
    [ReferenceId]             VARCHAR (20)  DEFAULT ('COMMONS') NOT NULL,
    [CreatedBy]               VARCHAR (20)  NOT NULL,
    [DefaultLanguageNo]       SMALLINT      DEFAULT ((1)) NOT NULL,
    [DefaultCountryCode]      CHAR (2)      DEFAULT ('US') NOT NULL,
    [DefaultPostalCode]       VARCHAR (20)  DEFAULT ('') NOT NULL,
    [DefaultStateCode]        CHAR (2)      DEFAULT ('') NOT NULL,
    [DefaultRegionCode]       CHAR (4)      DEFAULT ('') NOT NULL,
    [DefaultRegionText]       VARCHAR (40)  DEFAULT ('') NOT NULL,
    [DefaultProvinceCode]     CHAR (4)      DEFAULT ('') NOT NULL,
    [DefaultProvinceText]     VARCHAR (40)  DEFAULT ('') NOT NULL,
    [DefaultMunicipalityCode] CHAR (10)     DEFAULT ('') NOT NULL,
    [DefaultMunicipalityText] VARCHAR (40)  DEFAULT ('') NOT NULL,
    [DefaultCityCode]         CHAR (10)     DEFAULT ('') NOT NULL,
    [DefaultCityText]         VARCHAR (40)  DEFAULT ('') NOT NULL,
    [ServiceGlAccountID]      VARCHAR (30)  DEFAULT ('41020') NOT NULL,
    [PreferencesBag]          VARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([OrganizationId] ASC),
    CONSTRAINT [fk_ReferenceOrganizationPreferenceEntityId] FOREIGN KEY ([OrganizationId], [CreatedBy]) REFERENCES [Reference].[ReferenceObjects] ([OrganizationId], [ReferenceId]),
    CONSTRAINT [fk_ReferenceOrganizationPreferenceOrganization] FOREIGN KEY ([OrganizationId], [ReferenceId]) REFERENCES [Reference].[ReferenceObjects] ([OrganizationId], [ReferenceId]),
    CONSTRAINT [fk_ReferenceOrganizationPreferencesLanguage] FOREIGN KEY ([DefaultLanguageNo]) REFERENCES [Object].[ObjectLanguages] ([IdNo])
);

