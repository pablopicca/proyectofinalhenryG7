CREATE OR ALTER VIEW dbo.vw_Velocidade_Provincias

SELECT TOP (10) 
       loc.ID_Provincia AS [Provincia]
      ,[Velocidad]
      ,[Accesos]
      ,per.ID_Periodo AS [¨Periodo]
      ,per.Anio AS [Año)
      ,per.Trimestre
      ,[ID_Rango_Velocidad]
  FROM [Internet_BAF].[dbo].[Velocidades_Prov] AS vel
  inner join dbo.Localidades AS loc
    on vel.ID_Provincia = loc.ID_Provincia
   inner join dbo.Periodos AS per
    on vel.ID_Periodo = per.ID_Periodo

    




