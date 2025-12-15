SELECT per.ID_Periodo
      ,per.Anio AS [Año]
      ,per.Trimestre
      ,[Accesos_cada_100_hab] as [Movil C/100 Hab ]
      
      ,tv.TV_Satelital_cada_100_hab AS [TV Sat C/100 Hab]
      ,tv.TV_VFR_cada_100_hab AS [TV Cable C/100 Hab]
      ,cp.[Accesos cada 100 Habitantes] AS [Internet C/100 Hab]


  FROM [Internet_BAF].[dbo].[Comunicaciones_Moviles] as cm
  inner join dbo.Periodos as per
    on cm.ID_Periodo = per.ID_Periodo
  inner join dbo.Tel_Fija_Pen_Acc_Prov as tf
    on cm.ID_Periodo = tf.ID_Periodo
  inner join dbo.TV_Telefonia_Fija as tv
    on cm.ID_Periodo = tv.ID_Periodo
  inner join dbo.Conexiones_Periodos as cp
    on cm.ID_Periodo = cp.ID_Periodo