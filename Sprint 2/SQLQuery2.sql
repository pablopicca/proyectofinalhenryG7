USE Internet_BAF;
GO

BULK INSERT Periodos
FROM 'C:\Git\Tablas CSV\Periodos.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0d0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Provincias
FROM 'C:\Git\Tablas CSV\Provincias.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0d0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Rangos
FROM 'C:\Git\Tablas CSV\Rangos.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0d0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Tecnologias
FROM 'C:\Git\Tablas CSV\Tecnologias.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0d0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

BULK INSERT Localidades
FROM 'C:\Git\Tablas CSV\Localidades.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0d0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

DROP TABLE IF EXISTS Stg_Conexiones_Periodos;

CREATE TABLE Stg_Conexiones_Periodos (
    ID_Conexion_Per              NVARCHAR(100),
    BandaAnchaFija               NVARCHAR(100),
    DialUp                       NVARCHAR(100),
    TotalBAFDU                   NVARCHAR(100),
    Ingresos                     NVARCHAR(100),
    Accesos100Hog                NVARCHAR(100),
    Accesos100Hab                NVARCHAR(100),
    ADSL                         NVARCHAR(100),
    Cablemodem                   NVARCHAR(100),
    FibraOptica                  NVARCHAR(100),
    Wireless                     NVARCHAR(100),
    OtrosTec                     NVARCHAR(100),
    TotalTec                     NVARCHAR(100),
    Hasta512                     NVARCHAR(100),
    Mas512_1                     NVARCHAR(100),
    Mas1_6                       NVARCHAR(100),
    Mas6_10                      NVARCHAR(100),
    Mas10_20                     NVARCHAR(100),
    Mas20_30                     NVARCHAR(100),
    Mas30                        NVARCHAR(100),
    OtrosVel                     NVARCHAR(100),
    TotalVel                     NVARCHAR(100),
    ID_Periodo                   NVARCHAR(100)
);
GO

BULK INSERT Stg_Conexiones_Periodos
FROM 'C:\Git\Tablas CSV\Conexiones_Periodos.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '0x0d0a',
    CODEPAGE = '65001',
    TABLOCK
);
GO

INSERT INTO Conexiones_Periodos (
    ID_Conexion_Per,
    [Banda Ancha Fija],
    [Dial Up],
    [Total(BAF+DU)],
    Ingresos,
    [Accesos cada 100 Hogares],
    [Accesos cada 100 Habitantes],
    ADSL,
    Cablemodem,
    [Fibra Optica],
    Wireless,
    [Otros(Tecnologias)],
    [Total(Tecnologias)],
    [Hasta 512 kbps],
    [+ 512 Kbps - 1 Mbps],
    [+ 1 Mbps - 6 Mbps],
    [+ 6 Mbps - 10 Mbps],
    [+ 10 Mbps - 20 Mbps],
    [+ 20 Mbps - 30 Mbps],
    [+ 30 Mbps],
    [Otros(Velocidades)],
    [Total(Velocidades)],
    ID_Periodo
)
SELECT
    CAST(NULLIF(ID_Conexion_Per,'') AS INT),
    CAST(NULLIF(BandaAnchaFija,'')  AS INT),
    CAST(NULLIF(DialUp,'')          AS INT),
    CAST(NULLIF(TotalBAFDU,'')      AS INT),
    CAST(REPLACE(NULLIF(Ingresos,''), ',', '.')                AS DECIMAL(18,2)),
    CAST(REPLACE(NULLIF(Accesos100Hog,''), ',', '.')           AS DECIMAL(10,2)),
    CAST(REPLACE(NULLIF(Accesos100Hab,''), ',', '.')           AS DECIMAL(10,2)),
    CAST(NULLIF(ADSL,'')           AS INT),
    CAST(NULLIF(Cablemodem,'')     AS INT),
    CAST(NULLIF(FibraOptica,'')    AS INT),
    CAST(NULLIF(Wireless,'')       AS INT),
    CAST(NULLIF(OtrosTec,'')       AS INT),
    CAST(NULLIF(TotalTec,'')       AS INT),
    CAST(NULLIF(Hasta512,'')       AS INT),
    CAST(NULLIF(Mas512_1,'')       AS INT),
    CAST(NULLIF(Mas1_6,'')         AS INT),
    CAST(NULLIF(Mas6_10,'')        AS INT),
    CAST(NULLIF(Mas10_20,'')       AS INT),
    CAST(NULLIF(Mas20_30,'')       AS INT),
    CAST(NULLIF(Mas30,'')          AS INT),
    CAST(NULLIF(OtrosVel,'')       AS INT),
    CAST(NULLIF(TotalVel,'')       AS INT),
    ID_Periodo
FROM Stg_Conexiones_Periodos;
GO

DROP TABLE Stg_Conexiones_Periodos;
GO

