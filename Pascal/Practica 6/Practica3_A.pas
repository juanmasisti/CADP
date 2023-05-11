
Program Practica3_A;

Type 
  lista = ^nodo;
  nodo = Record
    num : integer;
    sig : lista;
  End;
Procedure armarNodo(Var L: lista; v: integer);

Var 
  nuevo, aux : lista;
Begin
  new(nuevo);
  nuevo^.num := v;
  nuevo^.sig := Nil;
  If (L=Nil) Then
    L := nuevo
  Else
    Begin
      aux := L;
      While (aux^.sig<>Nil) Do
        aux := aux^.sig;
      aux^.sig := nuevo;
    End;
End;

Procedure ImprimirNodo(L: lista);
Begin
  While (L<>Nil) Do
    Begin
      writeln('El numero de la lista es ', L^.num);
      L := L^.sig;
    End;
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
End.
