-- Crear Base de Datos dbCurso
CREATE DATABASE dbCurso
DEFAULT CHARACTER SET utf8;

-- Poner en uso

USE dbCurso;
-- Creando tablas
CREATE TABLE PERSONA
(
	DNIPER CHAR(8),
    NOMPER VARCHAR(50) null,
    APEPER VARCHAR (80) null,
    FECNACPER DATE null,
    CELPER CHAR (9) NULL,
    EMAPER VARCHAR (100),
    SEXPER CHAR(1) null,
    TIPPER CHAR(3) null,
    DISTPER VARCHAR(80) null,
    FECREGPER timestamp,
    PWSPER VARCHAR(20),
	CONSTRAINT DNIPER_PK PRIMARY KEY (DNIPER)     
);	


CREATE TABLE DEPARTAMENTO
(
	IDDEP INT,
    NOMDEP VARCHAR(50) null,
    DNIPER CHAR(8),
    SALJEFDEP DECIMAL(8,2),
	CONSTRAINT IDDEP_PK PRIMARY KEY (IDDEP)     
);	

CREATE TABLE HISTORICO
(
	IDHIS INT,
    DNIPER CHAR(8),
    FECFINHIST DATE NOT NULL,
    TIPHIS CHAR(3) NOT NULL,
    COMEHIST VARCHAR(100),
	CONSTRAINT IDHIS_PK PRIMARY KEY (IDHIS)
);

CREATE TABLE CURSO
(
	CODCUR CHAR(3),
    DESCUR VARCHAR(100),
    CATCUR CHAR(3),
    DURCUR INT,
    CONSTRAINT CODCUR_PK PRIMARY KEY (CODCUR)
);

CREATE TABLE OFERTA
(
	IDOFER INT,
    CODCUR CHAR(3),
    FECOFER DATE NOT NULL,
    FECINICCUROFER DATE NOT NULL,
    IDEMP INT,
	CONSTRAINT IDOFER_PK PRIMARY KEY (IDOFER)
);

CREATE TABLE EMPLEADO
(
	IDEMP INT,
    DNIPER CHAR(8),
    FECINGEMP DATE NOT NULL,
    CARGEMP VARCHAR(40) NOT NULL,
    SALEMP DECIMAL(6,2) NOT NULL,
    IDDEP INT,
    ESTEMP CHAR(1),
    CONSTRAINT IDEMP_PK PRIMARY KEY (IDEMP)
);

CREATE TABLE INSCRIPCION
(
	IDINSC INT,
    DNIPER CHAR(8),
    IDEMP INT,
    IDOFER INT,
    FECINS DATE NOT NULL,
    EVALINSC INT,
    CONSTRAINT IDINSC_PK PRIMARY KEY (IDINSC)
);

-- Creando relaciones

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT PERSONA_DEPARTAMENTO_DNIPER
FOREIGN KEY (DNIPER) REFERENCES PERSONA (DNIPER);

ALTER TABLE HISTORICO
ADD CONSTRAINT PERSONA_HISTORICO_DNIPER
FOREIGN KEY (DNIPER) REFERENCES PERSONA (DNIPER);

ALTER TABLE EMPLEADO
ADD CONSTRAINT PERSONA_EMPLEADO_DNIPER
FOREIGN KEY (DNIPER) REFERENCES PERSONA (DNIPER);

ALTER TABLE EMPLEADO
ADD CONSTRAINT DEPARTAMENTO_EMPLEADO_IDDEP
FOREIGN KEY (IDDEP) REFERENCES DEPARTAMENTO (IDDEP);

ALTER TABLE INSCRIPCION
ADD CONSTRAINT PERSONA_INSCRIPCION_DNIPER
FOREIGN KEY (DNIPER) REFERENCES PERSONA (DNIPER);

ALTER TABLE INSCRIPCION
ADD CONSTRAINT EMPLEADO_INSCRIPCION_IDEMP
FOREIGN KEY (IDEMP) REFERENCES EMPLEADO (IDEMP);

ALTER TABLE INSCRIPCION
ADD CONSTRAINT OFERTA_INSCRIPCION_IDOFER
FOREIGN KEY (IDOFER) REFERENCES OFERTA (IDOFER); 

ALTER TABLE OFERTA
ADD CONSTRAINT CURSO_OFERTA_CODCUR
FOREIGN KEY (CODCUR) REFERENCES CURSO (CODCUR);

ALTER TABLE OFERTA
ADD CONSTRAINT EMPLEADO_OFERTA_IDEMP
FOREIGN KEY (IDEMP) REFERENCES EMPLEADO (IDEMP);






