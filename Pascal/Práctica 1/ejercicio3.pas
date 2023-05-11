{. Netflix ha publicado la lista de películas que estarán disponibles durante el mes de diciembre de 2022. De cada película se conoce: código de película, 
código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. 
Implementar un programa modularizado que:
a. Lea los datos de películas y los almacene por orden de llegada y agrupados por código de género, en una estructura de datos adecuada. La lectura finaliza cuando 
se lee el código de la película -1. 
b. Una vez almacenada la información, genere un vector que guarde, para cada género, el código de película con mayor puntaje obtenido entre todas las críticas.
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos métodos vistos en la teoría. 
d. Luego de ordenar el vector, muestre el código de película con mayor puntaje y el código de película con menor puntaje.}

program ej3;
type    
    pelicula= record
        codigoP: integer;
        codigoG: 1..8;
        puntajeProm:real;
    end;

    lista= ^nodo;
    nodo= record
        dato:pelicula;
        sig:lista;
    end;

    vector = array[1..8] of lista;
    vectorPuntajes = array [1..8] of real;

procedure almacenarInfo (var v: vector);

procedure SetLista (var v: vector);
var
	i: integer;
	begin
		for i := 1 to 8 do
			v[i] := nil;
	end;

procedure leerPeliculas(var p:pelicula);
begin
    writeLn('Ingrese codigo de pelicula: ');
    readln(p.codigoP);
    if (p.codigoP<> -1) then begin
        writeln('Ingrese codigo de genero: ');
        readln(p.codigoG);
        writeln('Ingrese el puntaje promedio: ');
        readln(p.puntajeProm);
    end;
end;


Procedure AgregarAtras(Var l: lista; r:pelicula);

Var 
  nuevo: lista;
  aux: lista;
Begin
  new(nuevo);
  nuevo^.dato := r;
  nuevo^.sig := Nil;
  If l = Nil Then
    l := nuevo
  Else
    Begin
      aux := l;
      While (aux^.sig<>Nil) Do
        aux := aux^.sig;
      aux^.sig := nuevo;
    End;
End;

var
p : pelicula;
	begin
	SetLista(v);
	leerPeliculas (p);
	while (p.codigoP <> -1) do
		begin
			AgregarAtras (v[p.codigoG], p);
			leerPeliculas (p);
		end;
	end;

procedure procesarInfo (v:vector; var vp:vectorPuntajes);
var i,codigoMax:integer;
max:real;
begin   
    for i:= 1 to 8 do begin
        max:=-1;
        while (v[i] <> NIL) do begin    
            if (v[i]^.dato.puntajeProm>max) then begin
                max:=v[i]^.dato.puntajeProm;
                codigoMax:=v[i]^.dato.codigoP;
            end;    
            v[i]:=v[i]^.sig;
        end;
        vp[i]:=codigoMax;
    end;    
end;

procedure Ordenar (var vp: vectorPuntajes);
var i, j, pos: integer; item: real;	
begin
    for i:= 1 to 8 do 
    begin {busca el mínimo y guarda en pos la posición}
        pos := i;
        for j := i+1 to 8 do 
            if (vp[j] < vp[pos]) then 
                pos:=j;

   {intercambia v[i] y v[pos]}
   item := vp[pos];   
   vp[pos] := vp[i];   
   vp[i] := item;
   end;
end;

procedure Maximo(vp:vectorPuntajes);
var i:integer;
max:real;
begin
    max:= -1;
    for i:= 1 to 8 do begin 
        if (vp[i]>max) then 
            max:= vp[i];
    end;
    writeln('Maximo codigo de pelicula: ',max);
end;

procedure Minimo(vp:vectorPuntajes);
var i:integer;
minimo:real;
begin
    minimo:= 9999;
    for i:= 1 to 8 do begin 
        if (vp[i]<minimo) then 
            minimo:= vp[i];
    end;
    writeln('Minimo codigo de pelicula: ',minimo);
end;

// PROGRAMA PRINCIPAL //
var L:lista; v:vector ; vp:vectorPuntajes;
BEGIN
    almacenarInfo(v);
    procesarInfo(v,vp);
    Ordenar(vp);
    Maximo(vp);
    Minimo(vp);
END.