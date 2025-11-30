CREATE VIEW vw_Accesos_Localidad_Tecnologia
AS
SELECT 
    a.ID_Acceso_UT,
    a.ID_Localidad,
    l.Partido,
    l.Localidad,
    l.ID_Provincia,
    p.ID_Provincia AS Nombre_Provincia,  -- si tu ID_Provincia es el nombre
    a.ID_Tecnologia,
    t.ID_Tecnologia AS Nombre_Tecnologia, -- igual, si el ID es el texto
    a.Accesos
FROM Accesos_Ultimo_Trim a
INNER JOIN Localidades l
    ON a.ID_Localidad = l.ID_Localidad
INNER JOIN Provincias p
    ON l.ID_Provincia = p.ID_Provincia
INNER JOIN Tecnologias t
    ON a.ID_Tecnologia = t.ID_Tecnologia;
GO

CREATE VIEW vw_Conexiones_Provincia_Periodo
AS
SELECT 
    cp.ID_Conexion_Prov,
    cp.ID_Provincia,
    p.ID_Provincia AS Nombre_Provincia,
    cp.ID_Periodo,
    per.Anio,
    per.Trimestre,
    cp.[Banda Ancha Fija],
    cp.[Dial Up],
    cp.[Total(BAF+DU)],
    cp.[Accesos cada 100 Hogares],
    cp.[Accesos cada 100 Habitantes],
    cp.ADSL,
    cp.Cablemodem,
    cp.[Fibra Optica],
    cp.Wireless,
    cp.[Otros(Tecnologias)],
    cp.[Total(Tecnologias)],
    cp.[Hasta 512 kbps],
    cp.[+ 512 Kbps - 1 Mbps],
    cp.[+ 1 Mbps - 6 Mbps],
    cp.[+ 6 Mbps - 10 Mbps],
    cp.[+ 10 Mbps - 20 Mbps],
    cp.[+ 20 Mbps - 30 Mbps],
    cp.[+ 30 Mbps],
    cp.[Otros(Velocidades)],
    cp.[Total(Velocidades)],
    cp.[Mbps (Media de bajada)]
FROM Conexiones_Provincias cp
INNER JOIN Provincias p
    ON cp.ID_Provincia = p.ID_Provincia
INNER JOIN Periodos per
    ON cp.ID_Periodo = per.ID_Periodo;
GO

SELECT * FROM vw_Conexiones_Provincia_Periodo

SELECT * FROM vw_Accesos_Localidad_Tecnologia