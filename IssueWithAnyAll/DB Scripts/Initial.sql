CREATE TABLE [dbo].[RequestStatuses] (
    [Id]           INT                IDENTITY (1, 1) NOT NULL,
    [Title]        NVARCHAR (1024)    NULL,
    [IsDeleted]    BIT                NULL,
    [RowVersion]   ROWVERSION         NULL,
    [CreatedById]  INT                NULL,
    [ModifiedById] INT                NULL,
    CONSTRAINT [PK_RequestStatuses] PRIMARY KEY CLUSTERED ([Id] DESC),
);

CREATE TABLE [dbo].[RequestTypes] (
    [Id]           INT                IDENTITY (1, 1) NOT NULL,
    [Title]        NVARCHAR (1024)    NULL,
    [DisplayTitle] NVARCHAR (1024)    NULL,
    [ShowOrder]    INT                NULL DEFAULT 999,
    [IsDeleted]    BIT                NULL,
    [RowVersion]   ROWVERSION         NULL,
    [CreatedById]  INT                NULL,
    [ModifiedById] INT                NULL,
    [Format]       NVARCHAR (1024)    NULL,
    [Flags]        INT                NULL,
    CONSTRAINT [PK_RequestTypes] PRIMARY KEY CLUSTERED ([Id] DESC),
);


CREATE TABLE [dbo].[Requests] (
    [Id]                            INT                IDENTITY (1, 1) NOT NULL,
    [Title]                         NVARCHAR (1024)    NULL,
    [IsDeleted]                     BIT                NULL,
    [RowVersion]                    ROWVERSION         NULL,
    [CreatedById]                   INT                NULL,
    [ModifiedById]                  INT                NULL,
    [TypeId]                        INT                NULL,
    [StatusId]                      INT                NULL,
    

    CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Requests_RequestStatuses] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[RequestStatuses] ([Id]),
    CONSTRAINT [FK_Requests_RequestTypes] FOREIGN KEY ([TypeId]) REFERENCES [dbo].[RequestTypes] ([Id])    
);

CREATE TABLE [dbo].[Users] (
    [Id]           INT                IDENTITY (1, 1) NOT NULL,
    [Title]        NVARCHAR (1024)    NULL,
    [Login]        NVARCHAR (255)     NULL,
    [JobTitle]     NVARCHAR (1024)    NULL,
    [Department]   NVARCHAR (1024)    NULL,
    [Email]        NVARCHAR (255)     NULL,
    [Phone]        NVARCHAR (255)     NULL,
    [IsDeleted]    BIT                NULL,
    [RowVersion]   ROWVERSION         NULL,
    [Created]      DATETIMEOFFSET (7) CONSTRAINT [DF_Users_Created] DEFAULT (sysdatetimeoffset()) NULL,
    [Modified]     DATETIMEOFFSET (7) CONSTRAINT [DF_Users_Modified] DEFAULT (sysdatetimeoffset()) NULL,
    [CreatedById]  INT                NULL,
    [ModifiedById] INT                NULL,
    [Profile]      NVARCHAR (MAX)     NULL,
    [Number]       NVARCHAR (255)     NULL,
    [B2BId]        INT                NULL,
    CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED ([Id] DESC),
    CONSTRAINT [FK_Users_CreatedBy_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Users_ModifiedBy_Users] FOREIGN KEY ([ModifiedById]) REFERENCES [dbo].[Users] ([Id])
);

CREATE TABLE [dbo].[Files] (
    [Id]           INT                IDENTITY (1, 1) NOT NULL,
    [IsDeleted]    BIT                NULL,
    [RowVersion]   ROWVERSION         NULL,
    [Created]      DATETIMEOFFSET (7) CONSTRAINT [DF_Files_Created] DEFAULT (sysdatetimeoffset()) NULL,
    [Modified]     DATETIMEOFFSET (7) CONSTRAINT [DF_Files_Modified] DEFAULT (sysdatetimeoffset()) NULL,
    [CreatedById]  INT                NULL,
    [ModifiedById] INT                NULL,
    [Name]         NVARCHAR (1024)    NULL,
    [Type]         NVARCHAR (255)     NULL,
    [Size]         BIGINT             NULL,
    [Source]       TINYINT            NULL,
    [Hash]         NVARCHAR (255)     NULL,
    CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED ([Id] DESC),
    CONSTRAINT [FK_Files_CreatedBy_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Files_ModifiedBy_Users] FOREIGN KEY ([ModifiedById]) REFERENCES [dbo].[Users] ([Id])
);






CREATE TABLE [dbo].[VoteResults] (
    [Id]           INT                IDENTITY (1, 1) NOT NULL,
    [Title]        NVARCHAR (1024)    NULL,
    [IsDeleted]    BIT                NULL,
    [RowVersion]   ROWVERSION         NULL,
    [Created]      DATETIMEOFFSET (7) CONSTRAINT [DF_VoteResults_Created] DEFAULT (sysdatetimeoffset()) NULL,
    [Modified]     DATETIMEOFFSET (7) CONSTRAINT [DF_VoteResults_Modified] DEFAULT (sysdatetimeoffset()) NULL,
    [CreatedById]  INT                NULL,
    [ModifiedById] INT                NULL,
    CONSTRAINT [PK_VoteResults] PRIMARY KEY CLUSTERED ([Id] DESC),
    CONSTRAINT [FK_VoteResults_CreatedBy_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_VoteResults_ModifiedBy_Users] FOREIGN KEY ([ModifiedById]) REFERENCES [dbo].[Users] ([Id])
);

CREATE TABLE [dbo].[Votes] (
    [Id]               INT                IDENTITY (1, 1) NOT NULL,
    [Title]            NVARCHAR (1024)    NULL,
    [IsDeleted]        BIT                NULL,
    [RowVersion]       ROWVERSION         NULL,
    [Created]          DATETIMEOFFSET (7) CONSTRAINT [DF_Votes_Created] DEFAULT (sysdatetimeoffset()) NULL,
    [Modified]         DATETIMEOFFSET (7) CONSTRAINT [DF_Votes_Modified] DEFAULT (sysdatetimeoffset()) NULL,
    [CreatedById]      INT                NULL,
    [ModifiedById]     INT                NULL,
    [ResultId]         INT                NULL,
    [MeetingRequestId] INT                NULL,
    [ResponsibleId]    INT                NULL,
	[VotedById]		   INT                NULL,
    [Comment]          NVARCHAR(MAX)      NULL,
    [Completed]        BIT                NULL,
    [IsAutoVote]       BIT                CONSTRAINT [DF_Votes_IsAutoVote] DEFAULT ((0)) NOT NULL,
    [AwaitingResult]        BIT                NULL,
    CONSTRAINT [PK_Votes] PRIMARY KEY CLUSTERED ([Id] DESC),
    CONSTRAINT [FK_Votes_CreatedBy_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Votes_ModifiedBy_Users] FOREIGN KEY ([ModifiedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Votes_Responsible_Users] FOREIGN KEY ([ResponsibleId]) REFERENCES [dbo].[Users] ([Id]),
	CONSTRAINT [FK_Votes_VotedBy_Users] FOREIGN KEY ([VotedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_Votes_VoteResults] FOREIGN KEY ([ResultId]) REFERENCES [dbo].[VoteResults] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Votes_ResponsibleId]
    ON [dbo].[Votes]([ResponsibleId] ASC);
GO
CREATE NONCLUSTERED INDEX [IX_Votes_MeetingRequestId]
    ON [dbo].[Votes]([MeetingRequestId] ASC);
GO
CREATE NONCLUSTERED INDEX [IX_Votes_ResultId]
    ON [dbo].[Votes]([ResultId] ASC);



	CREATE TABLE [dbo].[VoteDocuments] (
    [Id]              INT                IDENTITY (1, 1) NOT NULL,
    [Title]           NVARCHAR (1024)    NULL,
    [IsDeleted]       BIT                NULL,
    [RowVersion]      ROWVERSION         NULL,
    [Created]         DATETIMEOFFSET (7) CONSTRAINT [DF_VotesDocuments_Created] DEFAULT (sysdatetimeoffset()) NULL,
    [Modified]        DATETIMEOFFSET (7) CONSTRAINT [DF_VotesDocuments_Modified] DEFAULT (sysdatetimeoffset()) NULL,
    [CreatedById]     INT                NULL,
    [ModifiedById]    INT                NULL,
    [TypeId]          INT                NULL,
    [VoteId]          INT                NULL,
    [FileId]          INT                NULL,
    CONSTRAINT [PK_VoteDocuments] PRIMARY KEY CLUSTERED ([Id] DESC),
    CONSTRAINT [FK_VoteDocuments_CreatedBy_Users] FOREIGN KEY ([CreatedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_VoteDocuments_Files] FOREIGN KEY ([FileId]) REFERENCES [dbo].[Files] ([Id]),
    CONSTRAINT [FK_VoteDocuments_ModifiedBy_Users] FOREIGN KEY ([ModifiedById]) REFERENCES [dbo].[Users] ([Id]),
    CONSTRAINT [FK_VoteDocuments_Votes] FOREIGN KEY ([VoteId]) REFERENCES [dbo].[Votes] ([Id])
);
GO

CREATE NONCLUSTERED INDEX [IX_VotesDocuments_FileId]
    ON [dbo].[VoteDocuments] ([FileId] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_VotesDocuments_VoteId]
    ON [dbo].[VoteDocuments] ([VoteId] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_VotesDocuments_DocumentTypeId]
    ON [dbo].[VoteDocuments] ([TypeId] ASC);
GO


CREATE TABLE [dbo].[MeetingRequests] (
    [Id]                 INT                IDENTITY (1, 1) NOT NULL,
    [IsDeleted]          BIT                NULL,
    [RowVersion]         ROWVERSION         NULL,
    [Created]            DATETIMEOFFSET (7) CONSTRAINT [DF_MeetingRequests_Created] DEFAULT (sysdatetimeoffset()) NULL,
    [Modified]           DATETIMEOFFSET (7) CONSTRAINT [DF_MeetingRequests_Modified] DEFAULT (sysdatetimeoffset()) NULL,
    [CreatedById]        INT                NULL,
    [ModifiedById]       INT                NULL,
    [MeetingId]          INT                NULL,
    [RequestId]          INT                NULL,
    [ConclusionId]       INT                NULL,
    [Decision]           NVARCHAR (MAX)     NULL,
    [Date]               DATETIMEOFFSET (7) NULL,
    [DueDate]            DATETIMEOFFSET (7) NULL,
    [DueDatePermanently] BIT                NULL,
    [Index]              INT                CONSTRAINT [DF_MeetingRequests_Index] DEFAULT ((0)) NULL,
    [IsVoted]            BIT                NULL,
    [SolutionFileHash]   NVARCHAR (255)     NULL,
    [RequestExtraKey]    INT                NULL,
    [ExternalId]         INT                NULL,
    [ExternalIdTc5]      INT                NULL, 
    [ExternalIdTkpb]     INT                NULL, 
    [ProposalRequestId]  INT                NULL,
    [ExternalIdBuTech]   NVARCHAR(128)      NULL, 
    CONSTRAINT [PK_MeetingRequests] PRIMARY KEY CLUSTERED ([Id] DESC),
    CONSTRAINT [FK_MeetingRequests_Requests] FOREIGN KEY ([RequestId]) REFERENCES [dbo].[Requests] ([Id]),

);
















GO
CREATE NONCLUSTERED INDEX [IX_MeetingRequests_RequestId]
    ON [dbo].[MeetingRequests]([RequestId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MeetingRequests_MeetingId]
    ON [dbo].[MeetingRequests]([MeetingId] ASC);

