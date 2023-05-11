
Program Practica3_B;

Type 
  lista = ^nodo;
  nodo = Record
    num : integer;
    sig : lista;
  End;
Procedure armarNodo(Var L, Lult: lista; v: integer);

Var 
  nuevo : lista;
Begin
  new(nuevo);
  nuevo^.num := v;
  nuevo^.sig := Nil;
  If (L=Nil) Then
    Begin
      L := nuevo;
      Lult := nuevo;
    End
  Else
    Begin
      Lult^.sig := nuevo;
      Lult := nuevo;
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
  pri, ult : lista;
  valor : integer;
Begin
  pri := Nil;
  writeln('Ingrese un numero');
  read(valor);
  While (valor <> 0) Do
    Begin
      armarNodo(pri, ult, valor);
      writeln('Ingrese un numero');
      Read(valor);
    End;
  ImprimirNodo(pri);
End.
