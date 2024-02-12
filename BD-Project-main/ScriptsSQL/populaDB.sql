use caumpetclinic;

#criar clinicas
insert into CaumPetClinic.Morada (idMorada,codPostal, rua, localidade, porta, piso)
values(0,"4710-167", "Rua Soldado Manuel Pinheiro", "Adaúfe", "7", null);
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso)
values(1,"4705-472", "Rua Cruz de Vilar", "Tadim", "31", null);
insert into CaumPetClinic.Morada (idMorada,codPostal, rua, localidade, porta, piso)
values(2,"4770-121", "Rua Joao Carlos Pereira", "Requião", "189", null);

insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values(0, "geral.adaufe@caumpetclinic.pt", null, 253577270);
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values(1, "geral.tadim@caumpetclinic.pt", null, 253577271);
insert into CaumPetClinic.Contacto (idContacto, email,telemovel, telefone)
values(2, "geral.requiao@caumpetclinic.pt",null, 253577272);


insert into CaumPetClinic.Clinica (idClinica, Morada_idMorada, Contacto_idContacto)
values(0, 0, 0);
insert into CaumPetClinic.Clinica (idClinica, Morada_idMorada, Contacto_idContacto)
values(1, 1, 1);
insert into CaumPetClinic.Clinica (idClinica, Morada_idMorada, Contacto_idContacto)
values(2, 2, 2);


#adicionar servicos
Select * from CaumPetClinic.Servico;
insert into CaumPetClinic.Servico (idServico, tipoServico, descricao, valorBase, lucro)
values(0, "Desparasitação externa", "Banho e aplicação de uma ampôla desparasitante(pulgas e carraças)", 15, 10);
insert into CaumPetClinic.Servico (idServico, tipoServico, descricao, valorBase, lucro)
values(1, "Desparasitação interna", "Banho e vacinação contra pulgas e carraças", 25, 12);
insert into CaumPetClinic.Servico (idServico, tipoServico, descricao, valorBase, lucro)
values(2, "Banho e brushing", "Banho completo e brushing", 15, 7);
insert into CaumPetClinic.Servico (idServico, tipoServico, descricao, valorBase, lucro)
values(3, "Consulta de clínica geral", "Consulta de medicina veterinária geral",35, 25);
insert into CaumPetClinic.Servico (idServico, tipoServico, descricao, valorBase, lucro)
values(4, "Esterilização", "Esterilização", 150, 100);
insert into CaumPetClinic.Servico (idServico, tipoServico, descricao, valorBase, lucro)
values(5, "Análises Clínicas", "Análises clínicas básicas(Recolha de sangue, inspeção visual)", 30, 25);
insert into CaumPetClinic.Servico (idServico, tipoServico, descricao, valorBase, lucro)
values(6, "Hotel", "Permanência no hotel com supervisionamento dos nossos profissionais e acompanhamento dos nossos profissionais", 20, 7);


#Funcionario 0
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(3,"5821-402","Rua  25 de Abril","Vilar do Paraiso","220","3D");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("3", "Francisca.Rodrigues459@hotmail.com", "953388193", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("32556492", "Francisca Gomes Nunes Rodrigues", DATE("1985-8-26"), "Estafeta", 6, 3, 3, 0);

#Funcionario 1
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(4,"2126-197","Travessa do Vilar do Paraíso","Meirinhos","863","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("4", "António.Gonçalves334@hotmail.pt", "956513225", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("19115371", "António Ferreira Francisco Gonçalves", DATE("1999-1-18"), "Estafeta", 6, 4, 4, 1);

#Funcionario 2
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(5,"6694-056","Travessa  Estrela de Ouro","Bruçó","172","9T");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("5", "Luís.Fernandes@hotmail.com", "964042597", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("239267072", "Luís Nunes Fernandes Fernandes", DATE("1982-1-8"), "Estafeta", 6, 5, 5, 2);

#Funcionario 3
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(6,"5162-782","Rua da Boavista","Caldas de São Jorge","56","5F");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("6", "Luís.Freitas@hotmail.pt", "935465983", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("99164836", "Luís Freitas", DATE("1975-2-28"), "Estafeta", 6, 6, 6, 0);

#Funcionario 4
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(7,"8840-644","Rua de Comandante de Santa Marta","Mafamude","540","1T");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("7", "Domingos.Ribeiro981@outlook.pt", "956676710", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("114258433", "Domingos Ribeiro", DATE("1978-3-20"), "Estafeta", 6, 7, 7, 1);

#Funcionario 5
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(8,"8976-762","Travessa da Estrela de Ouro","Fiães","881","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("8", "Tomás.Ribeiro426@gmail.com", "966264692", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("175550073", "Tomás Martins Ribeiro", DATE("1986-1-23"), "Estafeta", 6, 8, 8, 2);

#Funcionario 6
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(9,"5610-246","Travessa do Facho","Bemposta","119","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("9", "Bento.Silva787@gmail.pt", "966443664", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("91559171", "Bento Silva Gonçalves Silva", DATE("1972-9-28"), "Estafeta", 4, 9, 9, 0);

#Funcionario 7
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(10,"4533-723","Rua do Santa Engrácia","Bruçó","747","9D");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("10", "Joana.Francisco609@hotmail.pt", "931322068", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("197318417", "Joana Pereira Francisco", DATE("1985-1-5"), "Estafeta", 2, 10, 10, 1);

#Funcionario 8
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(11,"2656-424","Rua do Vilar do Paraíso","Pego","223","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("11", "Beatriz.Lopes@hotmail.pt", "922793168", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("109849364", "Beatriz Fernandes Freitas Lopes", DATE("1996-5-3"), "Estafeta", 3, 11, 11, 2);

#Funcionario 9
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(12,"4206-722","Travessa de Santa Casa da Misericórdia","Eirado","447","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("12", "André.Freitas@yahoo.com", "934815111", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("51126379", "André Freitas", DATE("1975-5-27"), "Estafeta", 1, 12, 12, 0);

#Funcionario 10
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(13,"9754-074","Travessa do Independência","Fornos","769","7E");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("13", "Rosa.Dias@gmail.pt", "918438670", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("46894403", "Rosa Silva Dias", DATE("1989-9-10"), "Estafeta", 3, 13, 13, 1);

#Funcionario 11
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(14,"5738-676","Travessa da São Vicente de Fora","Fiães","813","7E");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("14", "Rosa.Martins@outlook.pt", "969987544", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("66273913", "Rosa Almeida Martins", DATE("2001-5-23"), "Estafeta", 3, 14, 14, 2);

#Funcionario 12
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(15,"7708-350","Rua do Parque das Conchas","Santo Inácio","302","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("15", "Domingos.Santos@hotmail.pt", "933017712", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("63366610", "Domingos Oliveira Santos", DATE("1997-1-13"), "Estafeta", 4, 15, 15, 0);

#Funcionario 13
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(16,"3310-595","Travessa  Parque das Conchas","Meirinhos","928","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("16", "Margarida.Martins@hotmail.com", "959669539", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("177580819", "Margarida Silva Ribeiro Martins", DATE("1986-6-4"), "Estafeta", 3, 16, 16, 1);

#Funcionario 14
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(17,"9506-704","Travessa  Bela Vista","Alferrarede","967","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("17", "Júlia.Silva845@hotmail.com", "965420328", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("59849550", "Júlia Gomes Silva", DATE("1996-8-19"), "Estafeta", 3, 17, 17, 2);

#Funcionario 15
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(18,"6083-986","Rua  25 de Abril","Cumieira","942","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("18", "Miguel.Sousa120@hotmail.com", "914245281", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("60535582", "Miguel Sousa", DATE("1973-2-18"), "Estafeta", 5, 18, 18, 0);

#Funcionario 16
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(19,"9702-289","Rua do São Vicente de Fora","Moimenta","325","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("19", "Catarina.Silva792@gmail.com", "910015995", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("182856385", "Catarina Costa Silva", DATE("1989-12-12"), "Estafeta", 6, 19, 19, 1);

#Funcionario 17
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(20,"0225-340","Rua do Santa Casa da Misericórdia","Moimenta","910","9T");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("20", "Francisca.Gomes@hotmail.pt", "962713013", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("103473516", "Francisca Gomes", DATE("1973-1-28"), "Estafeta", 6, 20, 20, 2);

#Funcionario 18
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(21,"7958-614","Rua  Santa Casa da Misericórdia","Bruçó","860","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("21", "Lourenço.Martins159@yahoo.pt", "916005234", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("219159294", "Lourenço Martins", DATE("1970-12-22"), "Estafeta", 4, 21, 21, 0);

#Funcionario 19
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(22,"1683-795","Travessa da Santa Casa da Misericórdia","Caldas de São Jorge","911","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("22", "Francisca.Lopes@yahoo.pt", "937478253", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("53190183", "Francisca Pereira Pereira Lopes", DATE("1994-1-26"), "Estafeta", 1, 22, 22, 1);

#Funcionario 20
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(23,"6135-338","Rua  Estrela de Ouro","Bemposta","751","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("23", "Domingos.Gomes506@yahoo.pt", "910194052", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("41390189", "Domingos Costa Ferreira Gomes", DATE("1985-1-29"), "Estafeta", 6, 23, 23, 2);

###

#Funcionario 21
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(24,"9513-742","Rua do Independência","Nespreira","850","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("24", "Alfredo.Francisco039@outlook.com", "912420963", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("144691911", "Alfredo Ribeiro Rodrigues Francisco", DATE("1975-2-4"), "Gestor de clínica", 3, 24, 24, 0);

#Funcionario 22
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(25,"0972-645","Travessa da Almirante Lopes","Moimenta","644","3D");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("25", "Rita.Mendes032@gmail.com", "965973739", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("70080158", "Rita Gomes Freitas Mendes", DATE("1983-6-20"), "Administrador", 3, 25, 25, 1);

#Funcionario 23
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(26,"9675-924","Rua de Estrela de Ouro","Alferrarede","869","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("26", "Pedro.Ferreira845@yahoo.pt", "928289250", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("104991290", "Pedro Rodrigues Ferreira", DATE("1988-2-13"), "Profissional de saúde animal", 6, 26, 26, 2);

#Funcionario 24
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(27,"5331-456","Travessa da Dom Diogo de Sousa","Pego","104","4T");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("27", "Ana.Dias727@yahoo.pt", "926822542", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("56815569", "Ana Dias", DATE("1993-11-11"), "Profissional de saúde animal", 6, 27, 27, 0);

#Funcionario 25
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(28,"3632-499","Rua  Santa Engrácia","Cortiçada","657","6F");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("28", "Teresa.Pereira108@gmail.pt", "919404538", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("54851206", "Teresa Gomes Fernandes Pereira", DATE("1979-5-10"), "Profissional de saúde animal", 3, 28, 28, 1);

#Funcionario 26
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(29,"3085-043","Travessa da Santa Casa da Misericórdia","Eirado","246","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("29", "Alice.Francisco266@yahoo.com", "921856604", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("223417937", "Alice Francisco", DATE("1990-8-2"), "Profissional de saúde animal", 5, 29, 29, 2);

#Funcionario 27
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(30,"9795-066","Travessa do Santa Engrácia","Bruçó","779","9D");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("30", "Diogo.Costa670@outlook.pt", "933578753", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("172304089", "Diogo Pereira Freitas Costa", DATE("1970-6-2"), "Assistente médico", 1, 30, 30, 0);

#Funcionario 28
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(31,"5621-241","Rua  Independência","Bemposta","939","5E");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("31", "Isabel.Oliveira022@yahoo.pt", "917867109", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("68657143", "Isabel Pereira Oliveira", DATE("1999-1-6"), "Assistente médico", 6, 31, 31, 1);

#Funcionario 29
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(32,"3830-644","Travessa da Almirante Lopes","Pego","414","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("32", "Mariana.Almeida519@yahoo.com", "955336334", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("131915470", "Mariana Sousa Almeida", DATE("1999-4-21"), "Assistente médico", 3, 32, 32, 2);

#Funcionario 30
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(33,"7519-979","Travessa do Almirante Lopes","Bemposta","981","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("33", "Antónia.Francisco269@yahoo.pt", "937614176", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("242993305", "Antónia Freitas Nunes Francisco", DATE("1982-1-19"), "Gestor de clínica", 1, 33, 33, 0);

#Funcionario 31
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(34,"2009-432","Travessa do 19 de Junho","Rio Torto","658","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("34", "Francisco.Lopes819@outlook.com", "963712541", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("66471559", "Francisco Lopes", DATE("1978-10-20"), "Administrador", 1, 34, 34, 1);

#Funcionario 32
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(35,"3245-528","Travessa da Santa Casa da Misericórdia","Sequeira","334","7T");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("35", "Alfredo.Ribeiro@yahoo.pt", "933517003", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("113664596", "Alfredo Sousa Ribeiro", DATE("1991-8-11"), "Profissional de saúde animal", 3, 35, 35, 2);

#Funcionario 33
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(36,"0786-202","Travessa  Facho","Santo Inácio","469","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("36", "Augusto.Mendes176@outlook.com", "965240667", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("241206088", "Augusto Ferreira Silva Mendes", DATE("2001-3-16"), "Profissional de saúde animal", 2, 36, 36, 0);

#Funcionario 34
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(37,"8615-658","Rua do 25 de Abril","Eirado","612","1F");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("37", "Luísa.Francisco263@outlook.com", "912644026", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("43415001", "Luísa Nunes Freitas Francisco", DATE("1974-1-23"), "Profissional de saúde animal", 1, 37, 37, 1);

#Funcionario 35
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(38,"5968-148","Travessa  São Vicente de Fora","Cortiçada","965","0T");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("38", "André.Ferreira112@yahoo.com", "968468396", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("56801073", "André Nunes Ferreira", DATE("1980-2-20"), "Profissional de saúde animal", 1, 38, 38, 2);

#Funcionario 36
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(39,"2818-410","Travessa da Facho","Fiães","988","4F");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("39", "Tomás.Francisco@hotmail.pt", "964967382", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("165529400", "Tomás Francisco Francisco", DATE("1977-9-23"), "Assistente médico", 5, 39, 39, 0);

#Funcionario 37
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(40,"7612-306","Travessa do Boavista","Moimenta","12","8F");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("40", "Francisco.Almeida424@yahoo.pt", "915060805", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("120882490", "Francisco Almeida Gonçalves Almeida", DATE("1996-11-12"), "Assistente médico", 3, 40, 40, 1);

#Funcionario 38
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(41,"0868-902","Rua da do Ferro","Meirinhos","928","7D");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("41", "Margarida.Gomes350@yahoo.pt", "912590116", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("40508292", "Margarida Gomes", DATE("1990-8-22"), "Assistente médico", 4, 41, 41, 2);

#Funcionario 39
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(42,"1666-297","Travessa de Vilar do Paraíso","Pego","820","8T");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("42", "André.Ferreira516@hotmail.com", "924027332", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("79852923", "André Fernandes Ferreira", DATE("1993-5-7"), "Gestor de clínica", 4, 42, 42, 0);

#Funcionario 40
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(43,"5836-341","Rua de 25 de Abril","Moimenta","923","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("43", "José.Lopes992@outlook.pt", "966551033", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("64580885", "José Costa Freitas Lopes", DATE("1987-1-29"), "Administrador", 3, 43, 43, 1);

#Funcionario 41
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(44,"4023-116","Travessa do Facho","Mouriscas","421","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("44", "Alfredo.Nunes@hotmail.pt", "928618738", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("61298740", "Alfredo Silva Nunes", DATE("1998-2-24"), "Profissional de saúde animal", 1, 44, 44, 2);

#Funcionario 42
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(45,"4208-619","Rua de Estrela de Ouro","Caldelas","369","2E");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("45", "Bento.Silva845@gmail.pt", "961090049", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("20846577", "Bento Silva", DATE("1975-7-28"), "Profissional de saúde animal", 5, 45, 45, 0);

#Funcionario 43
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(46,"3521-582","Travessa  Santa Engrácia","Mafamude","477","8E");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("46", "Joaquina.Martins968@hotmail.pt", "919368931", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("114039155", "Joaquina Costa Martins", DATE("1989-1-16"), "Profissional de saúde animal", 1, 46, 46, 1);

#Funcionario 44
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(47,"6892-711","Rua de Dom Diogo de Sousa","Santo Inácio","109","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("47", "Martim.Nunes712@gmail.com", "920607791", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("44381946", "Martim Martins Nunes", DATE("1992-1-5"), "Profissional de saúde animal", 5, 47, 47, 2);

#Funcionario 45
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(48,"0139-196","Travessa  Parque das Conchas","Vilar do Paraiso","580","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("48", "Alice.Rodrigues@outlook.com", "956269230", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("21229648", "Alice Rodrigues", DATE("1993-3-22"), "Assistente médico", 5, 48, 48, 0);

#Funcionario 46
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(49,"8369-387","Travessa da 19 de Junho","Fiães","478","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("49", "Augusto.Oliveira780@gmail.com", "969505228", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("138022850", "Augusto Costa Oliveira", DATE("1976-12-21"), "Assistente médico", 1, 49, 49, 1);

#Funcionario 47
insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values(50,"6738-655","Rua  Santa Engrácia","Moimenta","244","null");
insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("50", "Domingas.Sousa@outlook.pt", "966286629", null);
insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("58510244", "Domingas Sousa", DATE("1972-8-16"), "Assistente médico", 1, 50, 50, 2);

#Carrinhas
Select * from CaumPetClinic.Carrinha;
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("69-BB-96", 130422, False, "Fazer revisão", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("18-AO-20", 167152, False, "Mudar pneus", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("34-OZ-10", 139687, False, "", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("AR-20-TI", 20123, False, "", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("12-ZZ-99", 119396, False, "Mudar oleo", null);

insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("27-OP-02", 168199, False, "", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("78-PQ-21", 170486, False, "Verificar estado dos travões", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("80-XZ-92", 228001, False, "Fazer revisão", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("12-ZZ-24", 155045, False, "", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("AB-77-LA", 37191, False, "Lavar dentro/fora", null);

insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("AP-27-BN", 7704, False, "", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("12-LL-21", 230379, False, "Mudar oleo", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("AN-12-PL", 18008, False, "Barulho estranho a 2022-10-20", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("22-18-QN", 198708, False, "", null);
insert into CaumPetClinic.Carrinha(matricula, kmsNaUltimaUtil, emUso, anotacoes, Funcionario_NIF)
values("18-RE-19", 105721, False, "Provável fuga de combustivel", null);



select criaCliente(647451205, "Nuno Costa", DATE("2002-08-23"), 4820-123, "Rua das Bananeiras", "Fafe", 62, 0, "nuno23@gmail.com", 962323233, null);
select criaCliente(425366944, "Nelson Almeida", DATE("2002-03-30"), 4805-111, "Rua das Pessegos", "Taipas", 17, 0, "nelson30@gmail.com", 912764589, null);
select criaCliente(773409851, "Sara Fontes", DATE("2001-09-07"), 4000-784, "Urbanização dos Astros", "Braga", 654, 5, "sara7f@gmail.com", 912171897, 253707169);
select criaCliente(475564914, "Hugo Costa", DATE("2002-01-28"), 4761-987, "Rua dos Carneiros", "tadim", 75, 2, "hugo9c@gmail.com", 935987612, 250172839);
select criaCliente(649851205, "António Castro", DATE("1977-03-29"), 4000-553, "Urbanização dos Bombeiros", "Braga", 61, 8, "tony_das_camionetas@turismo.pt", 957588463, null);
select criaCliente(877612205, "Jorge Mendes", DATE("1980-12-04"), 4650-200, "Rua das Empadas", "Guimarães", 96, 1, "sergio_calado@gmail.com", 917651523, 258455550);
select criaCliente(985455512, "Sergio Calado", DATE("1981-11-13"), 4820-440, "Rua das Avestruzes", "Fafe", 123, 4, "serginho123pt@sapo.pt", 931234561, null);

select criaAnimal("Joaninha", 5, DATE("2011-10-24"), "C.Lupus", "Yorkshire Terrier", "Vacinas: Hepatite Canina, Raiva, Tosse de Canil.", 647451205);
select criaAnimal("Donatello", 1, DATE("2010-06-20"), "Testudines", "Tartaruga-ninja", "Consultas em dia", 425366944);
select criaAnimal("Michelangelo", 1, DATE("2010-06-20"), "Testudines", "Tartaruga-ninja", "Consultas em dia", 425366944);
select criaAnimal("Leonardo", 1, DATE("2010-06-20"), "Testudines", "Tartaruga-ninja", "Consultas em dia", 425366944);
select criaAnimal("Raphael", 1, DATE("2010-06-20"), "Testudines", "Tartaruga-ninja", "Consultas em dia", 425366944);
select criaAnimal("Budha", 7, DATE("2014-10-13"), "Felis Catus", "Europeu Comum", "Animal esterlizado a 2018-02-10", 773409851);
select criaAnimal("Simba", 5, DATE("2016-03-08"), "Felis Catus", "Persa", "", 475564914);
select criaAnimal("Bolota", 4, DATE("2022-12-25"), "C.Lupus", "Yorkshire Terrier", "Vacinas: Tosse de Canil", 985455512);
select criaAnimal("Flash", 50, DATE("2018-06-20"), "C.Lupus", "Golden Retriever", "Desparazitada a 2020-08-12", 877612205);
select criaAnimal("Naruto", 12, DATE("2022-12-24"), "C. Lupus", "Europeu Comum", "",647451205);


call criaPedido(425366944, 3, 1, 1, DATE("2023-01-17"), DATE("2023-01-18"));
call criaPedido(647451205, 9, 2, 0, DATE("2023-01-17"), DATE("2023-02-19"));
call criaPedido(425366944, 1, 1, 1, DATE("2023-01-17"), DATE("2023-01-18"));
call criaPedido(773409851, 5, 6, 1, DATE("2023-01-15"), DATE("2023-01-19"));
call criaPedido(475564914, 6, 3, 2, DATE("2023-01-17"), DATE("2023-01-22"));
call criaPedido(985455512, 7, 4, 0, DATE("2023-02-16"), DATE("2023-02-23"));


