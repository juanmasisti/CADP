{Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el siguiente encabezado:
   	Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice); 

Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra en el vector.
}

program ej5;
const
	dimF=7;
	N=101;
type
	indice = -1..dimF;
	vector = array[1..dimF] of integer;


procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
var
	mid: integer;
begin
	mid:=(fin+ini) div 2;
	if (ini>fin) then pos:=-1
	else if (v[mid]<dato) then busquedaDicotomica(v,mid+1,fin,dato,pos)
	else if (v[mid]>dato) then busquedaDicotomica(v,ini,mid-1,dato,pos)
	else pos:=mid;
end;

procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:=1 to dimL do write(v[i],' ');
	writeln;
end;

procedure generarVector(var v: vector; var dimL: integer);
	procedure cargar(var v: vector; var dimL: integer);
	begin
		if (dimL<dimF) then begin
			dimL:=dimL+1;
			v[dimL]:=random(N);
			cargar(v,dimL);
		end;
	end;
begin
	dimL:=0;
	cargar(v,dimL);
end;

procedure ordenar (var v: vector; dimL: integer);

var i, j, pos: integer; item: integer;	
		
begin
 for i:= 1 to dimL - 1 do 
 begin {busca el mínimo y guarda en pos la posición}
   pos := i;
   for j := i+1 to dimL do 
        if (v[j]< v[pos]) then pos:=j;

   {intercambia v[i] y v[pos]}
   item := v[pos];   
   v[pos] := v[i];   
   v[i] := item;
 end;
end;

var
	v: vector;
	dimL, dato: integer;
	pos, ini, fin: indice;
begin
	randomize;
	generarVector(v,dimL);
	ordenar (v,dimL);
	imprimirVector(v,dimL);
	ini:=1; fin:=dimL;
	write('Ingrese el numero a buscar: ');
	readln(dato);
	busquedaDicotomica(v,ini,fin,dato,pos);
	writeln(pos);
end.
