-- RE01 - O sistema deve apresentar o número de pedidos realizados nesse dia.
select count(Pedido.idPedido) as numPedidos, Pedido.dataEfetivaRecolha, Animal.nome
from Pedido
inner join Animal
on Pedido.Animal_idAnimal=Animal.idAnimal
where Pedido.dataEfetivaRecolha = DATE('2023-01-18')
group by Pedido.dataEfetivaRecolha
order by numPedidos DESC;

select * from servico;

Delimiter $$
create procedure atualizaValorBase(IN novoValor INT, IN v_idServico INT)
begin
	update Servico set valorBase=novoValor where idServico=v_idServico;
end
$$

call atualizaValorBase(5, 0);

-- RE02 - Deverá ser possível efetuar um registo dos clientes de cada clínica, para um determinado mês.
Delimiter $$
create procedure listaClientes(dataPretendida DATE)
	begin
		select Cliente.NIF, Pedido.Clinica_idClinica
		from Cliente
		inner join Animal
		on Cliente.NIF = Animal.Cliente_NIF
		inner join Pedido
		on Pedido.Animal_idAnimal = Animal.idAnimal
		where MONTH(Pedido.dataEfetivaRecolha) = MONTH(dataPretendida)
        group by Cliente.NIF
		order by Pedido.Clinica_idClinica;
	end;
$$

call listaClientes(DATE("2022-12-12"))


-- RE03 – Depois da implementação do sistema de base de dados, deverá ser possível a listagem dos animais por raças.
Delimiter $$
create procedure topAnimais()
	begin
		select Animal.raca, count(Animal.idAnimal) as numAnimais
		from Animal
		group by Animal.raca
		order by numAnimais DESC;
	end;
$$

call topAnimais();


-- RE04 - Deverá também ser possivel listar o top 3 clientes dado uma clínica e um mês específicos.
Delimiter $$
create procedure topClientesMensaisClinica(ClinicaId INT, dataEstimada DATE)
	BEGIN
		select Cliente.NIF
        from Cliente inner join Animal
        on Animal.Cliente_NIF=Cliente.NIF
        INNER join Pedido
        on MONTH(pedido.dataEfetivaRecolha)=MONTH(dataEstimada) && YEAR(pedido.dataEfetivaRecolha)=YEAR(dataEstimada) && Pedido.Clinica_idClinica=ClinicaId
        group by Cliente.NIF
        order by count(pedido.idPedido) desc
        limit 3;
	END
$$

call topClientesMensaisClinica(0, DATE("2022-12-01")) ;


-- RE05 – Com a implementação do sistema, deverá ser possível a listagem de funcionários de cada clínica agrupados por cargo.
select Funcionario.NIF, Clinica.idClinica, Funcionario.Cargo
from Funcionario
inner join Clinica
on Funcionario.Clinica_idClinica = Clinica.idClinica
order by Funcionario.Cargo ASC;


-- RE06 – Será possível verificar o funcionário com menos pedidos realizados num período de 5 dias consecutivos, para uma determinada clinica
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


drop procedure numeroPedidosNumDia
-- RE08 – Deverá ser possível listar as clínicas e a quantidade de pedidos de cada clínica num certo dia.
delimiter $$
create procedure numeroPedidosNumDia(dia DATE)
	BEGIN
		select Pedido.Clinica_idClinica, count(Pedido.idPedido) as numeroPedidos
		from Pedido
		INNER JOIN Clinica
		ON Clinica.idClinica = Pedido.Clinica_idClinica and dia = Pedido.dataEfetivaRecolha
		group by Pedido.Clinica_idClinica
		order by numeroPedidos DESC;
	END;
$$

call numeroPedidosNumDia(DATE("2022-12-12"))