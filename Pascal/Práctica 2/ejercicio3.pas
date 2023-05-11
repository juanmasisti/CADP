{3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random” mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista. 
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista. 
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se encuentra en la lista o falso en caso contrario.}
program ej3;
type
  lista = ^nodo;
	nodo = record
	  dato: integer;
	  sig: lista;
	end;

procedure AgregarAdelante (var L: lista; num: integer);
  var nue:lista;
  begin
    new(nue);
    nue^.dato:=num;
    nue^.sig:=L;
    L:=nue;
  end;

procedure cargarLista (var L:lista);
var num:integer;
begin
	Randomize;
  num:=random(100);
  if (num<>0) then begin
  AgregarAdelante(L,num);
  cargarLista(L);
  end;
end;

function Minimo(L:lista;min:integer):integer;
begin
  if (L<>NIL) then begin 
    if (l^.dato<min) then 
      min:=l^.dato;  
    l:=l^.sig;
    min:=Minimo(L,min);  
  end; 
  Minimo:=min; 
end;

function Maximo(L:lista;max:integer):integer;
begin
  if (L<>NIL) then begin 
    if (l^.dato>max) then 
      max:=l^.dato;  
    l:=l^.sig;
    max:=Maximo(L,max);  
  end; 
  Maximo:=max; 
end;

function Cumple (L:lista;valor:integer):boolean;
begin
  if (L<>NIL) then begin
    if (l^.dato=valor) then
      Cumple:=true 
      else
      begin
        cumple:=false;
      end;
    l:=l^.sig;
    Cumple(L,valor)
  end;
end;
var L:lista; 
valor:integer;
begin
  L:=NIL;
  cargarLista(L);
  writeln('Minimo: ', Minimo(L,9999));
  writeln('Maximo: ',Maximo(L,-1));
  writeln('Ingrese un valor para buscar en la lista: ');
  readln(valor);
  writeln('Cumple: ',Cumple(L,valor));
end.
  


