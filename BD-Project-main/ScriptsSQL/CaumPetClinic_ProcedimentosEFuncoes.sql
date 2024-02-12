USE CaumPetClinic;

-- Criação e uma nova tabela - "Logs"
-- Implementação de um jornal de eventos para o sistema.
-- Tabela que acolhe o registo de eventos ocorridos no sistema.

Drop table if exists logs;
CREATE TABLE IF NOT EXISTS Logs (
	Número INT NOT NULL AUTO_INCREMENT,
    Sucesso INT NOT NULL DEFAULT 0,
	DataHora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	Descrição TEXT  NOT NULL ,
		PRIMARY KEY (Número)
)
	ENGINE=InnoDB 
    DEFAULT CHARSET=utf8mb4;

-- função que permite aos clientes registar um novo pedido

Drop procedure if exists criaPedido;
DELIMITER $$
CREATE procedure criaPedido(
   IN NIFCliente INT,
   IN IdAnimal INT,
   IN IdServico INT,
   IN IdClinica INT,
   IN dataRecolha DATE,
   IN dataEntrega DATE
    )

criaPedido:BEGIN
    Declare v_totalPedido Float;
    Declare v_idPedido INT;
    Declare v_NIFFuncionario INT;
    Declare v_valorBase Float;
    DECLARE res VARCHAR(200);
    DECLARE vPontos FLOAT;
    
    -- Declaração de variáveis de controlo e de um handler para deteção
    -- da ocorrência de exceções SQL
        
    DECLARE vErro INT DEFAULT 0;
    DECLARE CONTINUE HANDLER 
        FOR SQLEXCEPTION 
            SET vErro = 1;    
        
        -- verificar se o servico existe
        select count(Servico.idServico) into vErro from Servico where Servico.idServico=IdServico;
		IF vErro = 0 then 
            rollback;
            set res = "Serviço não existe";
            insert into logs(Sucesso,Descrição) values(0,Concat("Operação abortada: ", "Criação do Pedido\nMotivo:", res));
			select Descrição from logs order by Número DESC limit 1;
            leave criaPedido;
        END IF;
        
		-- verificar se o animal existe 
        select count(idAnimal) into vErro from Animal where IdAnimal=Animal.idAnimal;
		IF vErro != 1 then rollback;
        set res = "Transação abortada, animal não existe";
		insert into logs(Sucesso,Descrição) values(0,Concat("Operação abortada: ", "Criação do Pedido\nMotivo:", res));
		select Descrição from logs order by Número DESC limit 1;
		LEAVE criaPedido;
        end if;
        
        -- verificar se o cliente consta na base de dados
        select count(NIF) into vErro from Cliente where Cliente.NIF=NIFCliente;

		IF vErro != 1 then rollback;
        set res = "O Cliente não existe";
		insert into logs(Sucesso,Descrição) values(0,Concat("Operação abortada: ", "Criação do Pedido\nMotivo:", res));
		select Descrição from logs order by Número DESC limit 1;
		leave criaPedido;
        end if;
        
        -- verificar se o animal pertence ao cliente
        select count(Cliente_NIF) into vErro from Animal where Animal.Cliente_NIF=NIFCliente && Animal.idAnimal=IdAnimal;
        if vErro != 1 then rollback;
        set res = "O animal não pertence ao cliente";
		insert into logs(Sucesso,Descrição) values(0,Concat("Operação abortada: ", "Criação do Pedido\nMotivo:", res));
		select Descrição from logs order by Número DESC limit 1;
        leave criaPedido;
        end if;
        
        -- verificar se a clinica consta na base de dados
        select count(idClinica) into vErro from Clinica where Clinica.idClinica=IdClinica;
		IF vErro != 1 then rollback;
        set res = "Clinica não existe";
		insert into logs(Sucesso,Descrição) values(0,Concat("Operação abortada: ", "Criação do Pedido\nMotivo:", res));
		select Descrição from logs order by Número DESC limit 1;
		leave criaPedido;
        end if;
        
        -- verificar se a data de entrega é após a data de recolha
        if dataEntrega<=dataRecolha then 
			set res = "Datas inválidas data de entrega antes da data de recolha";
			insert into logs(Sucesso,Descrição) values(0,Concat("Operação abortada: ", "Criação do Pedido\nMotivo:", res));
			select Descrição from logs order by Número DESC limit 1;
			leave criaPedido;
        end if;
        
        -- verificar se não há pedidos para o animal em questão no mesmo periodo de tempo
        select count(Pedido.idPedido) into vErro from Pedido
        where ((Pedido.dataEstimadaRecolha<=dataRecolha && Pedido.dataEstimadaEntrega>=DataRecolha) || (Pedido.dataEstimadaRecolha>=dataRecolha && Pedido.dataEstimadaEntrega<=dataEntrega) || (Pedido.dataEstimadaRecolha>=dataRecolha && Pedido.dataEstimadaEntrega>=dataEntrega)) && Pedido.Animal_idAnimal=IdAnimal;
        
        
        if vErro != 0 then
			set res = "Datas inválidas o animal já tem marcações na mesma data, por favor altere as mesmas ao invés de tentar inserir um novo pedido";
			insert into logs(Sucesso,Descrição) values(0,Concat("Operação abortada: ", "Criação do Pedido\nMotivo:", res));
			select Descrição from logs order by Número DESC limit 1;
			leave criaPedido;
        end if;
        
        select max(idPedido)+1 into v_idPedido from Pedido;
        if v_idPedido is null then set v_idPedido = 0; end if;
        
        SELECT funcionarioOcioso(0, dataRecolha) into v_NIFFuncionario;
        
        if v_NIFFuncionario is NULL then
			SELECT Funcionario.NIF into v_NIFFuncionario FROM Funcionario WHERE Funcionario.NIF = (SELECT Funcionario.NIF FROM Funcionario where Funcionario.Clinica_idClinica=IdClinica ORDER BY RAND() LIMIT 1) limit 1;
        end if;
        
        select valorBase+RAND()*(15-5)+5 into v_valorBase from Servico where Servico.idServico=IdServico;
		
        
        set v_valorBase = ROUND(v_valorBase+v_valorBase*0.23,2);
        
        
        
		insert into Pedido(idPedido, dataEstimadaRecolha, dataEfetivaRecolha, dataEstimadaEntrega, dataEfetivaEntrega, avaliacao, custoFinal, Animal_idAnimal, Servico_idServico, Funcionario_NIF, Clinica_idClinica)
        values(v_idPedido,dataRecolha, null, dataEntrega,null,0,v_valorBase, IdAnimal, IdServico, v_NIFFuncionario, IdClinica);
	
		select sum(Cliente.Pontos) into vPontos where Cliente.NIF=NIFCliente;
        if vPontos is null then set vPontos = 0; end if;
        set vPontos = vPontos+v_valorBase*0.5;
        update Cliente set Pontos=vPontos where Cliente.NIF = NIFCliente;
    
		insert into logs(Sucesso,Descrição) values(1, Concat("Transação concluida, pedido inserido na base de dados e atribuido a um funcionario: ", v_NIFFuncionario, 
						"\nData estimada de recolha: ", dataRecolha, "\nData Estimada de Entrega",dataEntrega, "\nNIF Cliente:", 
                        NIFCliente, "\nAnimal em causa: ",IdAnimal,
                        "\nClinica de destino: ", IdClinica, "\nO Cliente ficou agora com: ", vPontos, " pontos"));
                        
		select Descrição from logs order by Número DESC limit 1;
        
		leave criaPedido;
    -- finaliza a transação
END$$

-- função que permite aos clientes registar que os seus animais foram recolhidos com sucesso

drop function if exists registaRecolha;
Delimiter $$
create function registaRecolha(idPedido INT)
	returns INT
    deterministic
    
    begin
		declare vErro INT Default 0;
        
        select count(Pedido.idPedido) into vErro from Pedido where Pedido.idPedido=idPedido && Pedido.dataEfetivaRecolha is NULL;
		if vErro=0 then
			return 0;
		end if;
        
        update Pedido set Pedido.DataEfetivaRecolha=NOW() where Pedido.idPedido=idPedido;
        
        return 1;
    end;

$$

    
-- função que permite aos clientes registar que os seus animais foram entregues e atribuir uma avaliação ao serviço prestado

drop function if exists registaEntrega;
Delimiter $$
create function registaEntrega(idPedido INT, avaliacao INT)
	returns INT
	deterministic
    
    begin
		declare vErro INT;
        declare v_avaliacao FLOAT DEFAULT 0;
        declare v_numPedidosEntregues INT;
        declare v_idFun INT;
        
        
        select count(Pedido.idPedido) into v_numPedidosEntregues from CaumPetClinic.Pedido where Pedido.idPedido=idPedido && Pedido.dataEfetivaEntrega is not NULL;
        
        -- seleciona o funcionario
        select Pedido.Funcionario_NIF into v_idFun from CaumPetClinic.Pedido where Pedido.idPedido = idPedido;
        -- numero de pedidos para fazer a média 
        select count(Pedido.avaliacao) into vErro from CaumPetClinic.Pedido where Pedido.Funcionario_NIF=v_idFun && Pedido.avaliacao>=0;
        if vErro is not NULL then set v_avaliacao=vErro; end if;
        
        set vErro=0;
        
        if avaliacao>=0 && avaliacao<=5 then 
			set v_avaliacao = (v_avaliacao+(avaliacao))/(v_numPedidosEntregues+1); 
			update Pedido set avaliacao=avaliacao, dataEfetivaEntrega = NOW() where Pedido.idPedido=idPedido;
            update Funcionario set avaliacao=v_avaliacao where Funcionario.NIF = v_idFun;
            set vErro = 1;
        end if;
        
        return vErro;
	end;
$$

select registaEntrega(0,5) as valor;        
select * from pedido;
select * from funcionario;
select * from logs;

drop function if exists funcionarioOcioso;
delimiter $$
create function funcionarioOcioso(clinicaID int,datarecolha DATE)
    returns varchar(255)
    deterministic
    BEGIN 
        declare NIF varchar(255);
        
        select  Funcionario.NIF
        INTO NIF
        FROM Funcionario INNER JOIN Clinica
        ON Funcionario.Clinica_idClinica=Clinica.idClinica && Funcionario.Clinica_idClinica=clinicaID && Funcionario.Cargo="Estafeta"
        INNER JOIN Pedido
        ON Pedido.Clinica_idClinica=clinicaID && Pedido.dataEstimadaRecolha<=DATE_ADD(datarecolha, INTERVAL 5 DAY) && Pedido.dataEstimadaRecolha>=datarecolha && Pedido.Funcionario_NIF=Funcionario.NIF && Funcionario.Cargo="Estafeta"
        group by Funcionario.NIF 
        order by count(Funcionario.NIF) asc
        limit 1;
        return NIF;
    END;
$$


-- Procedimento que permite ao Doutor Paulo Rocha verificar o top3 clientes da sua clinica este mês
Delimiter $$
create procedure topClientesMensaisCadeia()
	BEGIN
		select Cliente.NIF
        from Cliente inner join Animal
        on Animal.Cliente_NIF=Cliente.NIF
        INNER join Pedido
        on MONTH(pedido.dataEstimadaRecolha)=MONTH(NOW())
        group by Cliente.NIF
        order by count(pedido.idPedido) desc
        limit 3;
	END
$$

-- Procedimento que permite ao Doutor Paulo Rocha e administradores vinculados às suas clinicas verificar 
-- dados relativos aos clientes mais assiduos das suas clinicas num determinado mês de um ano
Delimiter $$
create procedure topClientesMensaisClinica(ClinicaId INT, dataEstimada DATE)
	BEGIN
		select Cliente.NIF
        from Cliente inner join Animal
        on Animal.Cliente_NIF=Cliente.NIF
        INNER join Pedido
        on MONTH(pedido.dataEstimadaRecolha)=MONTH(dataEstimada) && YEAR(pedido.dataEstimadaRecolha)=YEAR(dataEstimada) && Pedido.Clinica_idClinica=ClinicaId
        group by Cliente.NIF
        order by count(pedido.idPedido) desc
        limit 3;
	END
$$

call topClientesMensaisClinica(0, DATE("2022-12-01")) ;

-- Procedimento que permite ao Doutor Paulo Rocha e administradores vinculados às suas clinicas verificar 
-- dados relativos aos animais que frequentam as suas clinicas

delimiter $$
create procedure topAnimais()
	begin
		select Animal.raca, count(Animal.idAnimal) as numeroAnimais, Pedido.Clinica_idClinica as idClinica
		from Animal
        inner join Pedido
        where Pedido.Animal_idAnimal = Animal.idAnimal
		group by Animal.raca, Pedido.Clinica_idClinica
		order by Pedido.Clinica_idClinica ASC, numeroAnimais DESC;
	end;
$$

-- função que permite ao utilizador associar o seu perfil à empresa do Doutor Paulo Rocha

drop function criaCliente;
delimiter $$
create function criaCliente(NIF INT, nome VARCHAR(200), dataDeNascimento DATE, codPostal VARCHAR(50), rua varchar(200), localidade varchar(100), porta INT, piso VARCHAR(10), email varchar(200), telemovel INT, telefone INT  )
	returns int
    deterministic
    
	begin
		declare vErro Int default 0;
        declare vIdContacto INT default 0;
        declare vIdMorada Int default 0;
        declare res varchar(200);
        
        select count(Cliente.nif) into vErro from cliente where cliente.nif=NIF;
        if vErro != 0 then
			set res = "NIF do Cliente já consta na base de dados";
            insert into logs(Sucesso,Descrição) values(0,Concat("Operação abortada: ", "Criação de cliente\nMotivo:", res));
			return 0;
		end if;
        
		select max(Contacto.idContacto)+1 into vIdContacto from Contacto;
        
        select max(Morada.idMorada)+1 into vIdMorada from Morada;
        
        
        insert into Contacto(idContacto, email, telemovel, telefone) values(vIdContacto, email, telemovel,telefone);
        
        insert into Morada (idMorada, codPostal,rua, localidade, porta,piso) values(vIdMorada, codPostal,rua,localidade, porta, piso);
        
        insert into Cliente(NIF, nome, dataDeNascimento, pontos, Morada_idMorada, Contacto_idContacto) values (NIF, nome, dataDeNascimento, 0, vIdMorada, vIdContacto);
		
        
        insert into logs(Sucesso,Descrição) values(1,Concat("Operação bem sucedida: ", "Criação de cliente\nCom o NIF: ", NIF, "\nContacto com identificador: ",vIdContacto,"\nIdentificador de morada: ", vIdMorada ));
        
        return 1;
    end
$$

-- função que permite ao utilizador associar o seu animal à empresa do Doutor Paulo Rocha
drop function criaAnimal;
Delimiter $$
create function criaAnimal(nome varchar(100), peso FLOAT, dataDeNascimento DATE, especie VARCHAR(100), raca varChar(100), historico varchar(200), NIFDONO INT)
	returns int
    deterministic
    
    begin
		declare res varchar(200);
        declare vIdAnimal INT;
        declare vErro INT;
        
        select max(Animal.idAnimal)+1 into vIdAnimal from Animal;
        if vIdAnimal is null then set vIdAnimal=0; end if;
        
		insert into Animal(idAnimal, nome, peso, dataDeNascimento, especie, raca, historico, Cliente_NIF) 
        values (vIdAnimal,nome, peso, dataDeNascimento, especie, raca, historico, NIFDONO);
        
		insert into logs(Sucesso,Descrição) values(1,Concat("Operação bem sucedida: ", "Animal associado ao cliente\nCom o NIF: ", NIFDONO, "\nIdentificado pelo número: ",vIdAnimal));
        

        return 1;
    end
$$



