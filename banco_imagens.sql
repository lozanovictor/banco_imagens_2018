psql -U ibm18g3 -h dcmshare.ffclrp.usp.br centroimg
2340


-- -----------------------------------------------------
-- Table Funcionario
-- -----------------------------------------------------
DROP TABLE IF EXISTS Funcionario CASCADE;

CREATE TABLE Funcionario (
  idFuncionario INTEGER NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  RG VARCHAR(9) NOT NULL,
  nome VARCHAR(60) NOT NULL,
  sexo VARCHAR(1) NOT NULL,
  salário FLOAT NOT NULL,
  dta_nascimento DATE NOT NULL,
  cargo VARCHAR(45) NOT NULL,
  Recepcionista_Funcionario_idFuncionario INTEGER NOT NULL,
 PRIMARY KEY (idFuncionario));

-- -----------------------------------------------------
-- Table Recepcionista
-- -----------------------------------------------------
DROP TABLE IF EXISTS Recepcionista CASCADE;

CREATE TABLE Recepcionista (
  departamento VARCHAR(60) NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY (Funcionario_idFuncionario),
  FOREIGN KEY (Funcionario_idFuncionario) REFERENCES Funcionario (idFuncionario));

--------------------------------------------------------
ALTER TABLE Funcionario
  ADD FOREIGN KEY (Recepcionista_Funcionario_idFuncionario) REFERENCES Recepcionista (Funcionario_idFuncionario);
-- -----------------------------------------------------
-- Table Enfermeiro
-- -----------------------------------------------------
DROP TABLE IF EXISTS Enfermeiro ;

CREATE TABLE Enfermeiro (
  departamento VARCHAR(60) NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY (Funcionario_idFuncionario),
  FOREIGN KEY (Funcionario_idFuncionario) REFERENCES Funcionario (idFuncionario));

-- -----------------------------------------------------
-- Table Medico
-- -----------------------------------------------------
DROP TABLE IF EXISTS Medico ;

CREATE TABLE Medico (
  CRM VARCHAR(10) NOT NULL,
  especialidade VARCHAR(45) NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY (Funcionario_idFuncionario),
  FOREIGN KEY (Funcionario_idFuncionario) REFERENCES Funcionario (idFuncionario));

-- -----------------------------------------------------
-- Table Tecnico
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tecnico ;

CREATE TABLE Tecnico (
  reg_Tecnico VARCHAR(10) NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
  PRIMARY KEY (Funcionario_idFuncionario),
  FOREIGN KEY (Funcionario_idFuncionario) REFERENCES Funcionario (idFuncionario));


-- -----------------------------------------------------
-- Table Paciente
-- -----------------------------------------------------
DROP TABLE IF EXISTS Paciente ;

CREATE TABLE Paciente (
  idPaciente INTEGER NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  RG VARCHAR(9) NOT NULL,
  nome VARCHAR(60) NOT NULL,
  sexo VARCHAR(1) NOT NULL,
  status INTEGER NOT NULL,
  dta_nascimento DATE NOT NULL,
  Recepcionista_Funcionario_idFuncionario INTEGER NOT NULL,
  Enfermeiro_Funcionario_idFuncionario INTEGER NOT NULL,
 PRIMARY KEY (idPaciente),
 FOREIGN KEY (Recepcionista_Funcionario_idFuncionario) REFERENCES Recepcionista (Funcionario_idFuncionario),
 FOREIGN KEY (Enfermeiro_Funcionario_idFuncionario) REFERENCES Enfermeiro (Funcionario_idFuncionario)
);


-- -----------------------------------------------------
-- Table Clinica Conveniada
-- -----------------------------------------------------
DROP TABLE IF EXISTS Clinica_Conveniada ;

CREATE TABLE Clinica_Conveniada (
  idClinica INTEGER NOT NULL,
  codANS VARCHAR(20) NOT NULL,
  nome VARCHAR(60) NOT NULL,
  endereço VARCHAR(60) NOT NULL,
 PRIMARY KEY (idClinica));

-- -----------------------------------------------------
-- Table Tipo Exame
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tipo_Exame ;

CREATE TABLE Tipo_Exame (
  idTipo_Exame INTEGER NOT NULL,
  custo FLOAT NOT NULL,
  material VARCHAR(60) NOT NULL,
  tipo_maquina VARCHAR(50) NOT NULL,
 PRIMARY KEY (idTipo Exame));

-- -----------------------------------------------------
-- Table Exame
-- -----------------------------------------------------
DROP TABLE IF EXISTS Exame ;

CREATE TABLE IF NOT EXISTS Exame (
  seqExame INTEGER NOT NULL,
  status INTEGER NOT NULL,
  laudo VARCHAR(400) NOT NULL,
  local VARCHAR(45) NOT NULL,
  dta_exame DATE NOT NULL,
  imagem BYTEA NOT NULL,
  hora_exame TIME NOT NULL,
  Paciente_idPaciente INTEGER NOT NULL,
  Tipo_Exame_idTipo_Exame INTEGER NOT NULL,
  Tecnico_Funcionario_idFuncionario INTEGER NOT NULL,
  Clinica_Conveniada_idClinica INTEGER NOT NULL,
  Medico_Funcionario_idFuncionario INTEGER NOT NULL,
  orientação VARCHAR(45) NOT NULL,
 PRIMARY KEY (seqExame, Paciente_idPaciente),
 FOREIGN KEY (Paciente_idPaciente) REFERENCES Paciente (idPaciente),
 FOREIGN KEY (Tipo_Exame_idTipo_Exame) REFERENCES Tipo_Exame (idTipo_Exame),
 FOREIGN KEY (Tecnico_Funcionario_idFuncionario) REFERENCES Tecnico (Funcionario_idFuncionario),
 FOREIGN KEY (Clinica_Conveniada_idClinica) REFERENCES Clinica_Conveniada (idClinica),
 FOREIGN KEY (Medico_Funcionario_idFuncionario) REFERENCES Medico (Funcionario_idFuncionario));

-- -----------------------------------------------------
-- Table Atendimento
-- -----------------------------------------------------
DROP TABLE IF EXISTS Atendimento ;

CREATE TABLE IF NOT EXISTS Atendimento (
  seqAtendimento INTEGER NOT NULL,
  dados VARCHAR(200) NOT NULL,
  data DATE NOT NULL,
  horário TIME NOT NULL,
  Paciente_idPaciente INTEGER NOT NULL,
  Medico_Funcionario_idFuncionario INTEGER NOT NULL,
  Exame_seqExame INTEGER NOT NULL,
 PRIMARY KEY (seqAtendimento, Paciente_idPaciente),
 FOREIGN KEY (Paciente_idPaciente) REFERENCES Paciente (idPaciente),
 FOREIGN KEY (Medico_Funcionario_idFuncionario) REFERENCES Medico (Funcionario_idFuncionario));

 ALTER TABLE Atendimento
 ADD FOREIGN KEY (Exame_seqExame) REFERENCES Exame (seqExame)

-- -----------------------------------------------------
-- Table Raio-X
-- -----------------------------------------------------
DROP TABLE IF EXISTS RaioX ;

CREATE TABLE RaioX (
  dose_rad INTEGER NOT NULL,
  Exame_seqExame INTEGER NOT NULL,
 PRIMARY KEY (Exame_seqExame));



-- -----------------------------------------------------
-- Table Angiografia
-- -----------------------------------------------------
DROP TABLE IF EXISTS Angiografia ;

CREATE TABLE Angiografia (
  região_cateterismo VARCHAR(45) NOT NULL,
  Exame_seqExame INTEGER NOT NULL,
 PRIMARY KEY (Exame_seqExame));


-- -----------------------------------------------------
-- Table Tomografia
-- -----------------------------------------------------
DROP TABLE IF EXISTS Tomografia ;

CREATE TABLE Tomografia (
  dose_rad INTEGER NOT NULL,
  Exame_seqExame INTEGER NOT NULL,
 PRIMARY KEY (Exame_seqExame));


-- -----------------------------------------------------
-- Table Mamografia
-- -----------------------------------------------------
DROP TABLE IF EXISTS Mamografia ;

CREATE TABLE Mamografia (
  tipo_mamografia VARCHAR(100) NOT NULL,
  dose_rad INTEGER NOT NULL,
  Exame_seqExame INTEGER NOT NULL,
 PRIMARY KEY (Exame_seqExame));


-- -----------------------------------------------------
-- Table Ultrassonografia
-- -----------------------------------------------------
DROP TABLE IF EXISTS Ultrassonografia ;

CREATE TABLE Ultrassonografia (
  região VARCHAR(100) NOT NULL,
  tipo_ultrassonografia VARCHAR(100) NOT NULL,
  Exame_seqExame INTEGER NOT NULL,
 PRIMARY KEY (Exame_seqExame));


-- -----------------------------------------------------
-- Table Ressonancia Magnética
-- -----------------------------------------------------
DROP TABLE IF EXISTS Ressonancia_Magnetica ;

CREATE TABLE Ressonancia_Magnetica (
  região VARCHAR(100) NOT NULL,
  tipo_ressonancia VARCHAR(100) NOT NULL,
  Exame_seqExame INTEGER NOT NULL,
 PRIMARY KEY (Exame_seqExame));



-- -----------------------------------------------------
-- Table Clinica Conveniada_has_Medico
-- -----------------------------------------------------
DROP TABLE IF EXISTS Clinica_Conveniada_has_Medico ;

CREATE TABLE Clinica_Conveniada_has_Medico (
  Clinica_Conveniada_idClinica INTEGER NOT NULL,
  Medico_Funcionario_idFuncionario INTEGER NOT NULL);


-- -----------------------------------------------------
-- Table Fone Funcionario
-- -----------------------------------------------------
DROP TABLE IF EXISTS Fone_Funcionario ;

CREATE TABLE Fone_Funcionario (
  fone VARCHAR(11) NOT NULL,
  Funcionario_idFuncionario INTEGER NOT NULL,
 PRIMARY KEY (Funcionario_idFuncionario, fone),
 FOREIGN KEY (Funcionario_idFuncionario) REFERENCES Funcionario (idFuncionario));

-- -----------------------------------------------------
-- Table Fone Paciente
-- -----------------------------------------------------
DROP TABLE IF EXISTS Fone_Paciente ;

CREATE TABLE Fone_Paciente (
  fone VARCHAR(13) NOT NULL,
  Paciente_idPaciente INTEGER NOT NULL,
 PRIMARY KEY (Paciente_idPaciente, fone),
 FOREIGN KEY (Paciente_idPaciente) REFERENCES Paciente (idPaciente));

-- -----------------------------------------------------
-- Table Fone Clinica
-- -----------------------------------------------------
DROP TABLE IF EXISTS Fone_Clinica ;

CREATE TABLE Fone_Clinica (
  fone VARCHAR(13) NOT NULL,
  Clinica Conveniada_idClinica INTEGER NOT NULL,
 PRIMARY KEY (Clinica Conveniada_idClinica, fone),
 FOREIGN KEY (Clinica_Conveniada_idClinica) REFERENCES Clinica_Conveniada (idClinica));


--------------------------------------------------------------------------------
-----FALTOU TERMINAR PQ A PORRA DA INTERNET CAIU -------------------------------

 ALTER TABLE Clinica_Conveniada_has_Medico
 ADD FOREIGN KEY (Clinica_Conveniada_idClinica) REFERENCES Clinica_Conveniada (idClinica),
 ADD FOREIGN KEY (Medico_Funcionario_idFuncionario) REFERENCES Medico (Funcionario_idFuncionario);

 --------------------------------------------------------------------------
 --------ALTER TABLES COM CONFLITO DE UNICIDADE DA TABELA EXAME------------
 ALTER TABLE Exame
 DROP seqExame;
 ALTER TABLE Exame
 ADD seqExame INTEGER NOT NULL,
 ADD FOREIGN KEY (seqExame);
 ALTER TABLE Ressonancia_Magnetica
 ADD FOREIGN KEY (Exame_seqExame) REFERENCES Exame (seqExame);
 ALTER TABLE Ultrassonografia
 ADD FOREIGN KEY (Exame_seqExame) REFERENCES Exame (seqExame);
 ALTER TABLE Mamografia
 ADD FOREIGN KEY (Exame_seqExame) REFERENCES Exame (seqExame);
 ALTER TABLE Tomografia
 ADD FOREIGN KEY (Exame_seqExame) REFERENCES Exame (seqExame);
 ALTER TABLE RaioX
 ADD FOREIGN KEY (Exame_seqExame) REFERENCES Exame (seqExame);
 ALTER TABLE Angiografia
 ADD FOREIGN KEY (Exame_seqExame) REFERENCES Exame (seqExame);
