/****** Object:  View [dbo].[vw_ObjectPermissionMember]    Script Date: 07/09/2008 12:08:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_ObjectPermissionMember]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vw_ObjectPermissionMember]
AS
SELECT [ObjectClass], [ColumnName], [PermissionState],[Server], [dbname], [Grantee], [PermissionType]
, [ObjectSchema], [ObjectName], [timestamp], [member]
FROM dbo.ObjectPermission p
CROSS APPLY dbo.ufn_GetMember(p.members)'
GO
