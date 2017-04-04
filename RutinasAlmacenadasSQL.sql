delimiter //


drop function if exists diaSemana//


create function diaSemana(n int(1))

returns varchar(15)

comment 'devuelve como cadena el dia de la semana que corresponda con el valor introducido'

DETERMINISTIC 
begin

	declare resultado varchar(15);

	case n
		when 1 then set resultado='Lunes'
		when 2 then set resultado='Martes'
		when 3 then set resultado='Miercoles'
		when 4 then set resultado='Jueves'
		when 5 then set resultado='Viernes'
		when 6 then set resultado='Sabado'
		when 7 then set resultado='Domingo'
	else set resultado = null;
	end;
	
	RETURN resultado;

	

end//

drop function if exists maxTres//


create function maxTres(n1 int,n2 int,n3 int)

returns n int;

comment 'devuelve el mayor de los tres numeros introducidos'

DETERMINISTIC 
begin

	declare n int;

	if n1 < n2 then
		if n2 > n3 then
			set n = n2;
		else
			set n = n3;
		end if;
	elseif 	n1 > n3 then
		set n = n3;
	else
		set n = n1;
	end if;
	
	RETURN n;

end//

drop function if exists sumaN//


create function sumaN(m int)

returns n int;

comment 'devuelve el valor de la suma de los valores entre 0 y m'

DETERMINISTIC 
begin

	declare n int;
	declare contador int;
	set contador = m;
	set n =0;

	while contador > 0 do
		set n = n + contador;
		set contador = contador -1;
	end while;
	
	RETURN n;

end//

drop function if exists sucesion//


create function sucesion(m int)

returns n int;

comment 'devuelve la suma de 1/n con 1 < n < m y m debe ser distinto de 0. Es decir, devuelve 1/2 + 1/3 +...+ 1/m'

DETERMINISTIC 
begin

	declare n int;
	declare contador int;
	set contador = m;
	set n =0;

	while contador > 1 do
		set n = n + 1/contador;
		set contador = contador -1;
	end while;
	
	RETURN n;

end//

drop function if exists esPrimo//



create function esPrimo(numero int)

returns bool

comment 'Comprueba si un numero es primo o no'

DETERMINISTIC

begin

	declare encontrarDivisor bool;
	declare contador int;
	set encontrarDivisor = true;
	set contador = 2;

	if numero < 2 then
		return null;
	else
		WHILE contador <= numero/2 DO
			IF (numero % contador = 0) then
				set encontrarDivisor = false;
				return encontrarDivisor;
			end if;
			set contador=contador+1;
		end WHILE;
	end if;

	return encontrarDivisor;

end//

drop procedure if exists generarPrimos//

create procedure generarPrimos(IN m int,OUT salida int)
comment 'Devuelve el numero de primos menores que m, y los guarda en prueba.primos'
begin
	declare contador int;
	
	set contador=m;
	
	
	WHILE contador >0 DO
		if esPrimo(m) then
		insert into prueba.primos values (m);
		set salida=salida+1;
		end if;

	end WHILE;
end//

	
delimiter ;
