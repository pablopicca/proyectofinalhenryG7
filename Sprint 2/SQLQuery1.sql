USE Internet_BAF;
GO

/* 2) TABLAS DIMENSIÓN (SIN DEPENDENCIAS ENTRE ELLAS) */

/* 2.1 Periodos */
CREATE TABLE Periodos (
    ID_Periodo NVARCHAR(10) NOT NULL PRIMARY KEY, -- ej: '2014-T1'
    Anio       INT,
    Trimestre  INT
);
GO

/* 2.2 Provincias */
CREATE TABLE Provincias (
    ID_Provincia NVARCHAR(50) NOT NULL PRIMARY KEY  -- ej: 'Buenos Aires'
);
GO

/* 2.3 Rangos de velocidad */
CREATE TABLE Rangos (
    ID_Rango_Velocidad NVARCHAR(50) NOT NULL PRIMARY KEY
    -- ej: 'Hasta 512 kbps', '6 Mbps - 10 Mbps', etc.
);
GO

/* 2.4 Tecnologias */
CREATE TABLE Tecnologias (
    ID_Tecnologia NVARCHAR(50) NOT NULL PRIMARY KEY
    -- ej: 'ADSL', 'Cablemodem', etc.
);
GO

/* 3) TABLAS QUE DEPENDEN DE PROVINCIAS / PERIODOS / RANGOS / TECNOLOGIAS */

/* 3.1 Localidades (depende de Provincias) */
CREATE TABLE Localidades (
    ID_Localidad INT NOT NULL PRIMARY KEY,
    ID_Provincia NVARCHAR(50) NOT NULL,
    Partido      NVARCHAR(200) NULL,
    Localidad    NVARCHAR(200) NULL,
    CONSTRAINT FK_Localidades_Provincias
        FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia)
);
GO

/* 4) TABLA DE CONEXIONES POR PERIODO (HECHOS NACIONALES)
      Basada en Conexiones_Periodos.csv */
CREATE TABLE Conexiones_Periodos (
    ID_Conexion_Per INT NOT NULL PRIMARY KEY,
    [Banda Ancha Fija]            INT NULL,
    [Dial Up]                     INT NULL,
    [Total(BAF+DU)]               INT NULL,
    Ingresos                      DECIMAL(18,2) NULL,
    [Accesos cada 100 Hogares]    DECIMAL(10,2) NULL,
    [Accesos cada 100 Habitantes] DECIMAL(10,2) NULL,
    ADSL                          INT NULL,
    Cablemodem                    INT NULL,
    [Fibra Optica]                INT NULL,
    Wireless                      INT NULL,
    [Otros(Tecnologias)]          INT NULL,
    [Total(Tecnologias)]          INT NULL,
    [Hasta 512 kbps]              INT NULL,
    [+ 512 Kbps - 1 Mbps]         INT NULL,
    [+ 1 Mbps - 6 Mbps]           INT NULL,
    [+ 6 Mbps - 10 Mbps]          INT NULL,
    [+ 10 Mbps - 20 Mbps]         INT NULL,
    [+ 20 Mbps - 30 Mbps]         INT NULL,
    [+ 30 Mbps]                   INT NULL,
    [Otros(Velocidades)]          INT NULL,
    [Total(Velocidades)]          INT NULL,
    ID_Periodo NVARCHAR(10) NOT NULL,
    CONSTRAINT FK_ConexPer_Periodos
        FOREIGN KEY (ID_Periodo) REFERENCES Periodos(ID_Periodo)
);
GO

/* 5) TABLA DE CONEXIONES POR PROVINCIA Y PERIODO
      Basada en Conexiones_Provincias.csv */
CREATE TABLE Conexiones_Provincias (
    ID_Conexion_Prov INT NOT NULL PRIMARY KEY,
    ID_Provincia NVARCHAR(50) NOT NULL,
    [Banda Ancha Fija]            INT NULL,
    [Dial Up]                     INT NULL,
    [Total(BAF+DU)]               INT NULL,
    [Accesos cada 100 Hogares]    DECIMAL(10,2) NULL,
    [Accesos cada 100 Habitantes] DECIMAL(10,2) NULL,
    ADSL                          INT NULL,
    Cablemodem                    INT NULL,
    [Fibra Optica]                INT NULL,
    Wireless                      INT NULL,
    [Otros(Tecnologias)]          INT NULL,
    [Total(Tecnologias)]          INT NULL,
    [Hasta 512 kbps]              INT NULL,
    [+ 512 Kbps - 1 Mbps]         INT NULL,
    [+ 1 Mbps - 6 Mbps]           INT NULL,
    [+ 6 Mbps - 10 Mbps]          INT NULL,
    [+ 10 Mbps - 20 Mbps]         INT NULL,
    [+ 20 Mbps - 30 Mbps]         INT NULL,
    [+ 30 Mbps]                   INT NULL,
    [Otros(Velocidades)]          INT NULL,
    [Total(Velocidades)]          INT NULL,
    [Mbps (Media de bajada)]      DECIMAL(10,2) NULL,
    ID_Periodo NVARCHAR(10) NOT NULL,
    CONSTRAINT FK_ConProv_Provincias
        FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia),
    CONSTRAINT FK_ConProv_Periodos
        FOREIGN KEY (ID_Periodo) REFERENCES Periodos(ID_Periodo)
);
GO

/* 6) TABLA DE VELOCIDADES POR LOCALIDAD
      Basada en Velocidades_Loc.csv */
CREATE TABLE Velocidades_Loc (
    ID_Acceso_Loc INT NOT NULL PRIMARY KEY,
    ID_Localidad INT NOT NULL,
    Velocidad INT NULL,
    Accesos   INT NULL,
    ID_Rango_Velocidad NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_VLoc_Localidades
        FOREIGN KEY (ID_Localidad) REFERENCES Localidades(ID_Localidad),
    CONSTRAINT FK_VLoc_Rangos
        FOREIGN KEY (ID_Rango_Velocidad) REFERENCES Rangos(ID_Rango_Velocidad)
);
GO

/* 7) TABLA DE VELOCIDADES POR PROVINCIA
      Basada en Velocidades_Prov.csv */
CREATE TABLE Velocidades_Prov (
    ID_Acceso_Prov INT NOT NULL PRIMARY KEY,
    ID_Provincia NVARCHAR(50) NOT NULL,
    Velocidad INT NULL,
    Accesos   INT NULL,
    ID_Periodo NVARCHAR(10) NOT NULL,
    ID_Rango_Velocidad NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_VProv_Provincias
        FOREIGN KEY (ID_Provincia) REFERENCES Provincias(ID_Provincia),
    CONSTRAINT FK_VProv_Periodos
        FOREIGN KEY (ID_Periodo) REFERENCES Periodos(ID_Periodo),
    CONSTRAINT FK_VProv_Rangos
        FOREIGN KEY (ID_Rango_Velocidad) REFERENCES Rangos(ID_Rango_Velocidad)
);
GO

/* 8) TABLA DE ACCESOS DEL ÚLTIMO TRIMESTRE
      Basada en Accesos_Ultimo_Trim.csv */
CREATE TABLE Accesos_Ultimo_Trim (
    ID_Acceso_UT  INT NOT NULL PRIMARY KEY,
    ID_Localidad  INT NOT NULL,
    ID_Tecnologia NVARCHAR(50) NOT NULL,
    Accesos       INT NULL,
    CONSTRAINT FK_AccUT_Localidades
        FOREIGN KEY (ID_Localidad) REFERENCES Localidades(ID_Localidad),
    CONSTRAINT FK_AccUT_Tecnologias
        FOREIGN KEY (ID_Tecnologia) REFERENCES Tecnologias(ID_Tecnologia)
);
GO
