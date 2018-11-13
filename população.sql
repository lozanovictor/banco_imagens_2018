--------------------------------------------------------------------------------
--------SEQUENCES --------------------------------------------------------------

CREATE SEQUENCE idFuncionario INCREMENT 1;
CREATE SEQUENCE idPaciente INCREMENT 1;
CREATE SEQUENCE idClinica INCREMENT 1;
CREATE SEQUENCE idTipo_Exame INCREMENT 1;
CREATE SEQUENCE seqExame INCREMENT 1;
CREATE SEQUENCE seqAtendimento INCREMENT 1;

--------------------------------------------------------------------------------
--------INSERTS ----------------------------------------------------------------
---------CADA TABELA PRECISA DE 5 ENTRADAS CADA---------------------------------

-------A TABELA FUNCIONARIO PRECISA DE 20 ENTRADAS POIS TEM 4 GENERALIZAÇÕES----
INSERT INTO "Funcionario" (idFuncionario, CPF, RG, nome, sexo, salário, dta_nascimento, cargo, Recepcionista_Funcionario_idFuncionario)
VALUES (NEXTVAL('idFuncionario'),,,,,,,,,);

INSERT INTO "Recepcionista" (departamento, Funcionario_idFuncionario)
VALUES (,);

INSERT INTO "Enfermeiro" (departamento, Funcionario_idFuncionario)
VALUES (,);

INSERT INTO "Medico" (CRM, especialidade, Funcionario_idFuncionario)
VALUES (,,);

INSERT INTO "Tecnico" (reg_Tecnico, Funcionario_idFuncionario)
VALUES (,);

INSERT INTO "Paciente" (idPaciente, CPF, RG, nome, sexo, status, dta_nascimento, Recepcionista_Funcionario_idFuncionario, Enfermeiro_Funcionario_idFuncionario)
VALUES (NEXTVAL(idPaciente),,,,,,,,,);

INSERT INTO "Clinica_Conveniada" (idClinica, codANS, nome, endereço)
VALUES (NEXTVAL(idClinica),,,,);

INSERT INTO "Tipo_Exame" (idTipo_Exame, custo, material, tipo_maquina)
VALUES (NEXTVAL('idTipo_Exame'),,,);

----------------- EXAME PRECISA DE 25 ENTRADAS POIS TEM 5 GENERALIZAÇÕES--------

INSERT INTO "Exame" (seqExame, status, laudo, local, dta_exame, imagem, hora_exame, Paciente_idPaciente, Tipo_Exame_idTipo_Exame, Tecnico_Funcionario_idFuncionario, Clinica_Conveniada_idClinica, Medico_Funcionario_idFuncionario, orientação)
VALUES (NEXTVAL('seqExame'),,,,,,,,,,,,);

INSERT INTO "Atendimento" (seqAtendimento, dados, data, horário, Paciente_idPaciente, Medico_Funcionario_idFuncionario, Exame_seqExame)
VALUES (NEXTVAL('seqAtendimento'),,,,,,,);

INSERT INTO "RaioX" (dose_rad, Exame_seqExame)
VALUES (,);

INSERT INTO "Angiografia" (região_cateterismo, Exame_seqExame)
VALUES (,);

INSERT INTO "Tomografia" (dose_rad, Exame_seqExame)
VALUES (,);

INSERT INTO "Mamografia" (tipo_mamografia, dose_rad, Exame_seqExame)
VALUES (,,);

INSERT INTO "Ultrassonografia" (região, tipo_ultrassonografia, Exame_seqExame)
VALUES (,,);

INSERT INTO "Ressonancia_Magnetica" (região, tipo_ressonancia, Exame_seqExame)
VALUES (,,);

INSERT INTO "Clinica_Conveniada_has_Medico" (Clinica_Conveniada_idClinica, Medico_Funcionario_idFuncionario)
VALUES (,);

INSERT INTO "Fone_Funcionario" (fone, Funcionario_idFuncionario)
VALUES (,);

INSERT INTO "Fone_Paciente" (fone, Paciente_idPaciente)
VALUES (,);

INSERT INTO "Fone_Clinica" (fone, Clinica Conveniada_idClinica)
VALUES (,);
