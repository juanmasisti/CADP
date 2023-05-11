{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de las expensas de dichas oficinas. 
Implementar un programa modularizado que:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina se ingresa el código de identificación, DNI del propietario y valor de la expensa.
La lectura finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}
program ej2;
const dimF = 300;
type 
    oficina= record
				codigo: integer;
				DNI: longint;
                valor:real;
			 end;
	 vector = array [1..dimF] of oficina;

procedure leerVenta (var p:oficina);
begin
	writeln('Codigo de producto: ');
	readln(p.codigo);
	if (p.codigo<>-1) then begin 
		writeln('Ingrese dni del propietario: ');
		readln(p.DNI);
        writeln('Ingrese valor de la expensa: ');
        readln(p.valor);
		end;
end;

procedure almacenarVenta (var v:vector; dml:integer);
var	
	p:venta;
begin
	dml:=0;
	leerVenta(p);
	while(dml<dimf) and (v.codigoP <> 0) do begin
		dml:=dml+ 1;
		v[dml]:=v;
		leerVenta(p);
	end;
end;	

procedure Ordenar (var v: vector; dimL: integer);

var i, j, pos: integer; item: oficina;	
		
begin
 for i:= 1 to dimL - 1 do 
 begin {busca el mínimo y guarda en pos la posición}
   pos := i;
   for j := i+1 to dimL do 
        if (v[j].codigoP < v[pos].codigoP) then pos:=j;

   {intercambia v[i] y v[pos]}
   item := v[pos];   
   v[pos] := v[i];   
   v[i] := item;
 end;
end;