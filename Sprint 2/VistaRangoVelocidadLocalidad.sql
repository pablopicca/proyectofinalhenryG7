
  CREATE VIEW Vista_Rango_Velocidad_localidad
    AS
  SELECT l.Localidad AS Localidad,
         l.Partido  AS Partido,
         l.ID_Provincia AS Provincia,
         vloc.Velocidad,
         vloc.Accesos,
         r.ID_Rango_Velocidad AS "Rango de Velocidad"
        
 FROM

  Velocidades_Loc vloc

  INNER JOIN Localidades l
   
   ON vloc.ID_Localidad = l.ID_Localidad

  INNER JOIN Rangos r

  ON vloc.ID_Rango_Velocidad = r.ID_Rango_Velocidad



