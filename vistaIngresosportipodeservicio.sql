


CREATE OR ALTER VIEW dbo.vw_Ingresos_por_Tipo_Servicio
AS
SELECT 
       T.ID_Periodo,
       p.Anio                                     AS [AÑO],
       p.Trimestre                                AS [Trimestre],
       cm.Ingresos                                AS [Ingresos por Comunicaciones Moviles],
       t.Ingresos_TV_VFR                          AS [Ingresos por TV Cable],
       t.Ingresos_TV_Satelital                    AS [Ingresos por TV Satelital],
       t.Ingresos_TF                              AS [Ingresos por Telefonia Fija],
       cp.Ingresos                                AS [Ingresos por Internet]
       
FROM dbo.TV_Telefonia_Fija        AS t
INNER JOIN dbo.Comunicaciones_Moviles AS cm
        ON t.ID_Periodo = cm.ID_Periodo
INNER JOIN dbo.Conexiones_Periodos    AS cp
        ON t.ID_Periodo = cp.ID_Periodo
INNER JOIN dbo.Periodos               AS p
        ON t.ID_Periodo = p.ID_Periodo;
GO


