{4.- Una librería requiere el procesamiento de la información de sus productos. De cada producto se conoce el código del producto, código de rubro (del 1 al 8) y precio. 
Implementar un programa modularizado que:
a. Lea los datos de los productos y los almacene ordenados por código de producto y agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos
   finaliza cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos
   del rubro 3 es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto. 
d. Ordene, por precio, los elementos del vector generado en b) utilizando alguno de los dos métodos vistos en la teoría. 
e. Muestre los precios del vector ordenado.}

program ej4;
type    
    producto= record
        codigoP: integer;
        codigoR: 1..8;
        precio:real;
    end;

    lista= ^nodo;
    nodo= record
        dato:producto;
        sig:lista;
    end;

    vector = array[1..8] of lista;
    vectorRubro3 = array [1..30] of real;

procedure almacenarInfo (var v: vector);

procedure SetLista (var v: vector);
var
	i: integer;
	begin
		for i := 1 to 8 do
			v[i] := nil;
	end;

procedure leerProductos(var p:producto);
begin
    writeLn('Ingrese codigo de producto: ');
    readln(p.codigoP);
    writeln('Ingrese codigo de rubro: ');
    readln(p.codigoR);
    writeln('Ingrese el precio: ');
    readln(p.precio);
end;

Procedure AgregarAtras(Var l: lista; r:producto);

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
p : producto;
	begin
	SetLista(v);
	leerProductos (p);
	while (p.precio <> 0) do
		begin
			AgregarAtras (v[p.codigoR], p);
			leerProductos (p);
		end;
	end;

procedure imprimirCodigo (v:vector);
var i:integer;
begin
    for i:= 1 to 8 do begin
        while (v[i] <> NIL) do begin 
            writeln('Rubro ',i,' Codigo: ',v[i]^.dato.codigoP);
            v[i]:=v[i]^.sig;
        end;
    end;
end;

procedure procesarInfo (v:vector; var vr:vectorRubro3);
var i:integer;
begin   
    i:=1;
    while (v[3] <> NIL) do begin    
        vr[i]:=v[3]^.dato.codigoP;
        i:=i+1;
        v[3]:=v[3]^.sig;
    end;    
end;
      

procedure Ordenar (var v: vector);

var i, j, pos: integer; item: lista;	
		
begin
 for i:= 1 to 8 do 
    begin {busca el mínimo y guarda en pos la posición}
        pos := i;
        for j := i+1 to 8 do 
            if (v[j]^.dato.precio < v[pos]^.dato.precio) then 
                pos:=j;
        {intercambia v[i] y v[pos]}
        item := v[pos];   
        v[pos] := v[i];   
        v[i] := item;
    end;
end;

procedure imprimirPrecio (v:vector);
var i:integer;
begin
    for i:= 1 to 8 do begin
        while (v[i] <> NIL) do begin 
            writeln('Rubro ',i,' Precio: ',v[i]^.dato.precio);
            v[i]:=v[i]^.sig;
        end;
    end;
end;

// PROGRAMA PRINCIPAL //
var  v:vector ; vr:vectorRubro3;
BEGIN
    almacenarInfo(v);
    imprimirCodigo(v);
    procesarInfo(v,vr);
    Ordenar(v);
    imprimirPrecio(v);
END.
 