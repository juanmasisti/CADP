
Program Practica4_A;

Type 
  lista = ^nodo;
  nodo = Record
    num : integer;
    sig : lista;
  End;
Procedure armarNodo(Var L: lista; v: integer);

Var 
  aux : lista;
Begin
  new(aux);
  aux^.num := v;
  aux^.sig := L;
  L := aux;
End;

Procedure ImprimirNodo(L: lista);
Begin
  While (L<>Nil) Do
    Begin
      writeln('El numero de la lista es ', L^.num);
      L := L^.sig;
    End;
End;

Function Maximo(L: lista): integer;

Var 
  max: integer;
Begin
  max := -9999;
  While (L<>Nil) Do
    Begin
      If (L^.num>max) Then
        max := L^.num;
      L := L^.sig;
    End;
  Maximo := max;
End;

Var 
  pri : lista;
  valor : integer;
Begin
  pri := Nil;
  writeln('Ingrese un numero');
  read(valor);
  While (valor <> 0) Do
    Begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      Read(valor);
    End;
  ImprimirNodo(pri);
  writeln('El numero maximo es ', Maximo(pri));
End.
