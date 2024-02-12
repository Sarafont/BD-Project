create view vistaCliente as
select Cliente.nome as NomeCliente, Animal.Nome as NomeAnimal, count(Pedido.idPedido) as PedidosPendentes
from Pedido 
inner join Animal
on Pedido.Animal_idAnimal=Animal.idAnimal
inner join Cliente
on Cliente.NIF = Animal.Cliente_NIF
where Pedido.dataEfetivaEntrega is not null
group by cliente.nif;


create view vistaFuncionario as
select Clinica.idClinica as clinica, Pedido.dataEfetivaEntrega as dataEntrega, Pedido.Animal_idAnimal as idAnimal, Cliente.NIF as NIFCliente
from Clinica
inner join Pedido
on Pedido.Clinica_idClinica = Clinica.idClinica 
inner join Animal 
on Pedido.Animal_idAnimal = Animal.idAnimal
inner join Cliente
on Animal.Cliente_NIF = Cliente.NIF
where Pedido.dataEfetivaEntrega is not null 
group by Clinica.idClinica;

create view lista_de_funcionarios as
select nome, cargo, contacto.email, contacto.telemovel
from Funcionario
inner join contacto
on funcionario.contacto_idContacto = Contacto.idContacto
order by cargo;


create view vistaEstafeta as
select Pedido.Funcionario_NIF as idEstafeta, Cliente.nome as NomeCliente, Animal.nome as Animal, Pedido.idPedido as idPedido, Morada.Rua as Rua, Morada.codPostal as CodigoPostal, Morada.Porta as Porta, Morada.Piso as Piso
from Pedido
inner join Animal
on Pedido.Animal_idAnimal = Animal.idAnimal
inner join Cliente
on Animal.Cliente_NIF = Cliente.NIF
inner join Morada 
on Cliente.Morada_idMorada = Morada.idMorada
group by idEstafeta;
