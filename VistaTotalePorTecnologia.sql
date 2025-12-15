SELECT top (10)[ID_Provincia]
      ,[ADSL]
      ,[Cablemodem]
      ,[Fibra Optica]
      ,[Wireless]
      ,[Otros(Tecnologias)]
      ,per.Anio AS [Año]
      ,per.Trimestre AS [Trimestre]
  FROM [Internet_BAF].[dbo].[Conexiones_Provincias] as cp
  inner join dbo.Periodos as per
   on cp.ID_Periodo = per.ID_Periodo
   

--VISTA DE TOTALES POR TECNOLOGIA
CREATE OR ALTER VIEW dbo.vw_Tecnologias_por_Periodo_Pivot
AS
SELECT
    cp.ID_Periodo,
    per.Anio        AS Año,
    per.Trimestre   AS Trimestre
    SUM(cp.ADSL)                 AS ADSL_Total,
    SUM(cp.Cablemodem)           AS Cablemodem_Total,
    SUM(cp.[Fibra Optica])       AS Fibra_Total,
    SUM(cp.Wireless)             AS Wireless_Total,
    SUM(cp.[Otros(Tecnologias)]) AS Otros_Total
FROM dbo.Conexiones_Provincias AS cp
INNER JOIN dbo.Periodos AS per
    ON cp.ID_Periodo = per.ID_Periodo
    GROUP BY
    cp.ID_Periodo,
    per.Anio,
    per.Trimestre;
GO
