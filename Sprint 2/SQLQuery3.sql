SELECT *
FROM Provincias
WHERE ID_Provincia = 'Capital Federal';

INSERT INTO Provincias (ID_Provincia)
VALUES ('Capital Federal');
GO

INSERT INTO Velocidades_Prov (
    ID_Acceso_Prov,
    ID_Provincia,
    Velocidad,
    Accesos,
    ID_Periodo,
    ID_Rango_Velocidad
)
SELECT
    TRY_CAST(NULLIF(ID_Acceso_Prov,'') AS INT),
    ID_Provincia,
    TRY_CAST(REPLACE(NULLIF(Velocidad,''), ',', '.') AS DECIMAL(10,2)),
    TRY_CAST(NULLIF(Accesos,'') AS INT),
    ID_Periodo,
    ID_Rango_Velocidad
FROM Stg_Velocidades_Prov;
GO

BULK INSERT Accesos_Ultimo_Trim
FROM 'C:\Git\Tablas CSV\Accesos_Ultimo_Trim.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0d0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

-- 1) Provincias
SELECT TOP 10 * FROM Provincias;
GO

-- 2) Localidades
SELECT TOP 10 * FROM Localidades;
GO

-- 3) Periodos
SELECT TOP 10 * FROM Periodos;
GO

-- 4) Rangos
SELECT TOP 10 * FROM Rangos;
GO

-- 5) Tecnologias
SELECT TOP 10 * FROM Tecnologias;
GO

-- 6) Conexiones_Provincias
SELECT TOP 10 * FROM Conexiones_Provincias;
GO

-- 7) Conexiones_Periodos
SELECT TOP 10 * FROM Conexiones_Periodos;
GO

-- 8) Velocidades_Loc
SELECT TOP 10 * FROM Velocidades_Loc;
GO

-- 9) Velocidades_Prov
SELECT TOP 10 * FROM Velocidades_Prov;
GO

-- 10) Accesos_Ultimo_Trim (si esta tabla existe en tu modelo final)
SELECT TOP 10 * FROM Accesos_Ultimo_Trim;
GO
