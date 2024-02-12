import random


class populador:
    def __init__(self):
        id = 0
        file = open("./populaDb.txt", "w")
        for idClinica in range(48):
            texto = self.geraFuncionarios(id, idClinica % 3)
            file.write(texto)
            id += 1

        #gera 6 clientes
        for i in range(7):
            texto = self.geraClientes(i)
            file.write(texto)
        
        file.close()

    def geraClientes(self, ids):

        conector = ["do", "da", "de", ""]
        ruas = ["Facho", "Comandante de Santa Marta", "Boavista", "Bela Vista", "Vilar do Paraíso", "Soldado Manuel Pinheiro", "19 de Junho", "25 de Abril", "Independência",
                "Dom Diogo de Sousa", "Santa Casa da Misericórdia", "Parque das Conchas", "Estrela de Ouro", "do Ferro", "Santa Engrácia", "São Vicente de Fora", "Almirante Lopes"]
        sitios = ["Vilar do Paraiso", "Sequeira", "Santo Inácio", "Mafamude", "São Félix da Marinha", "Alferrarede", "Bruçó", "Azinhoso", "Bemposta", "Argoncilhe",
                  "Caldas de São Jorge", "Caldelas", "Moimenta", "Nespreira", "Pego", "Mouriscas", "Rio Torto", "Meirinhos", "Fornos", "Fiães", "Cumieira", "Eirado", "Cortiçada"]
        initContacto = ["91", "92", "93", "95", "96"]
        emailDomains = ["@gmail.com", "@gmail.pt", "@hotmail.com", "@hotmail.pt",
                        "@yahoo.com", "@yahoo.pt", "@outlook.pt", "@outlook.com"]

        nomes = [
            "Maria",
            "Ana",
            "Isabel",
            "Catarina",
            "Antónia",
            "Joana",
            "Francisca",
            "Rosa",
            "Mariana",
            "Teresa",
            "Joaquina",
            "Alice",
            "Luísa",
            "Margarida",
            "Emília",
            "Domingas",
            "Benedita",
            "Beatriz",
            "Júlia",
            "Rita",
            "Manuel",
            "António",
            "José",
            "João",
            "Francisco",
            "Joaquim",
            "Domingos",
            "Pedro",
            "Luís",
            "Carlos",
            "Tomás",
            "Miguel",
            "Augusto",
            "Alfredo",
            "Lourenço",
            "André",
            "Bento",
            "Diogo",
            "Fernando",
            "Martim"
        ]
        apelidos = [
            "Silva",
            "Rodrigues",
            "Fernandes",
            "Gonçalves",
            "Santos",
            "Pereira",
            "Costa",
            "Ferreira",
            "Gomes",
            "Martins",
            "Sousa",
            "Dias",
            "Oliveira",
            "Lopes",
            "Freitas",
            "Francisco",
            "Nunes",
            "Ribeiro",
            "Almeida",
            "Mendes",
        ]


        nomePessoa = self.geraNome(nomes, apelidos)
        codPostal, queryInsertMorada = self.criaMorada(
            ids+3+48, conector, ruas, sitios)
        queryInsertContacto = self.criaContacto(ids+3+48, nomePessoa.split(
            " ")[0], nomePessoa.split(" ")[-1], initContacto, emailDomains)
        queryGeraCliente = self.geraCliente(nomePessoa,ids+3+48)
        texto = f"#Cliente {ids}\n{queryInsertMorada};\n{queryInsertContacto};\n{queryGeraCliente};\n\n"
        return texto

    def geraCliente(self, nome, idMorada):
        nif = random.randint(18800000, 250000000)
        dataDeNascimento = f"{random.randint(1970,2002)}-{random.randint(1,12)}-{random.randint(1,29)}"
        return f'''insert into CaumPetClinic.Cliente (NIF, nome, dataDeNascimento,pontos,Morada_idMorada, Contacto_idContacto)
values("{nif}", "{nome}", DATE("{dataDeNascimento}"), {random.randint(0,100)},{idMorada}, {idMorada})'''


        

    def geraFuncionarios(self, idContacto, idClinica):

        conector = ["do", "da", "de", ""]
        ruas = ["Facho", "Comandante de Santa Marta", "Boavista", "Bela Vista", "Vilar do Paraíso", "Soldado Manuel Pinheiro", "19 de Junho", "25 de Abril", "Independência",
                "Dom Diogo de Sousa", "Santa Casa da Misericórdia", "Parque das Conchas", "Estrela de Ouro", "do Ferro", "Santa Engrácia", "São Vicente de Fora", "Almirante Lopes"]
        sitios = ["Vilar do Paraiso", "Sequeira", "Santo Inácio", "Mafamude", "São Félix da Marinha", "Alferrarede", "Bruçó", "Azinhoso", "Bemposta", "Argoncilhe",
                  "Caldas de São Jorge", "Caldelas", "Moimenta", "Nespreira", "Pego", "Mouriscas", "Rio Torto", "Meirinhos", "Fornos", "Fiães", "Cumieira", "Eirado", "Cortiçada"]
        initContacto = ["91", "92", "93", "95", "96"]
        emailDomains = ["@gmail.com", "@gmail.pt", "@hotmail.com", "@hotmail.pt",
                        "@yahoo.com", "@yahoo.pt", "@outlook.pt", "@outlook.com"]

        nomes = [
            "Maria",
            "Ana",
            "Isabel",
            "Catarina",
            "Antónia",
            "Joana",
            "Francisca",
            "Rosa",
            "Mariana",
            "Teresa",
            "Joaquina",
            "Alice",
            "Luísa",
            "Margarida",
            "Emília",
            "Domingas",
            "Benedita",
            "Beatriz",
            "Júlia",
            "Rita",
            "Manuel",
            "António",
            "José",
            "João",
            "Francisco",
            "Joaquim",
            "Domingos",
            "Pedro",
            "Luís",
            "Carlos",
            "Tomás",
            "Miguel",
            "Augusto",
            "Alfredo",
            "Lourenço",
            "André",
            "Bento",
            "Diogo",
            "Fernando",
            "Martim"
        ]
        apelidos = [
            "Silva",
            "Rodrigues",
            "Fernandes",
            "Gonçalves",
            "Santos",
            "Pereira",
            "Costa",
            "Ferreira",
            "Gomes",
            "Martins",
            "Sousa",
            "Dias",
            "Oliveira",
            "Lopes",
            "Freitas",
            "Francisco",
            "Nunes",
            "Ribeiro",
            "Almeida",
            "Mendes",
        ]


        nomePessoa = self.geraNome(nomes, apelidos)
        codPostal, queryInsertMorada = self.criaMorada(
            idContacto+3, conector, ruas, sitios)
        queryInsertContacto = self.criaContacto(idContacto+3, nomePessoa.split(
            " ")[0], nomePessoa.split(" ")[-1], initContacto, emailDomains)
        queryGeraFuncionario = self.geraFuncionario(
            nomePessoa, idClinica, idContacto+3, idContacto+3)
        texto = f"#Funcionario {idContacto}\n{queryInsertMorada};\n{queryInsertContacto};\n{queryGeraFuncionario};\n\n"
        return texto

    def geraNome(self, nomes, apelidos):
        return f'''{random.choice(nomes)} {" ".join( [random.choice(apelidos) for i in range(random.randint(1,3))] )}'''

    def criaMorada(self, idMorada, conectores, ruas, sitios):
        codPostal = "".join([str(random.randint(0, 9)) for i in range(
            4)])+"-"+"".join([str(random.randint(0, 9)) for i in range(3)])
        ruasTravessas = ["Rua", "Travessa"]
        rua = f"{random.choice(ruasTravessas)} {random.choice(conectores)} {random.choice(ruas)}"
        localidade = random.choice(sitios)
        porta = str(random.randint(0, 999))
        pisosPossiveis = ["E", "F", "D", "T"]
        piso = f"{random.randint(0,9)}{random.choice(pisosPossiveis)}"
        boolPiso = [piso, "null"]
        return codPostal, f'''insert into CaumPetClinic.Morada (idMorada, codPostal, rua, localidade, porta, piso) values({idMorada},\"{codPostal}\",\"{rua}\",\"{localidade}\",\"{porta}\",\"{random.choice(boolPiso)}\")'''

    def criaContacto(self, idContacto, nome, apelido, initContacto, emailDomains):
        contacto = f'''{random.choice(initContacto)}{"".join([str(random.randint(0,9)) for i in range(7)])}'''
        data = ["", "".join([str(random.randint(0, 9)) for i in range(3)])]
        email = f"{nome}.{apelido}{random.choice(data)}{random.choice(emailDomains)}"
        return f'''insert into CaumPetClinic.Contacto (idContacto, email, telemovel, telefone)
values("{idContacto}", "{email}", "{contacto}", null)'''

    def geraFuncionario(self, nome, idClinica, idMorada, idContacto):
        nif = random.randint(18800000, 250000000)
        dataDeNascimento = f"{random.randint(1970,2002)}-{random.randint(1,12)}-{random.randint(1,29)}"
        return f'''insert into CaumPetClinic.Funcionario (NIF, nome, dataDeNascimento, cargo, avaliacao,Morada_idMorada, Contacto_idContacto, Clinica_idClinica)
values("{nif}", "{nome}", DATE("{dataDeNascimento}"), "Estafeta", {random.randint(1,6)}, {idMorada}, {idContacto}, {idClinica})'''


populador()
