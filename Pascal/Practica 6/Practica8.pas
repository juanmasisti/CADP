
Program Practica8;

Type 
  lista = ^nodo;
  nodo = Record
    num : integer;
    sig : lista;
  End;
Procedure armarNodo(Var L: lista; v: integer);

Var 
  nuevo, ant, act : lista;
Begin
  new(nuevo);
  nuevo^.num := v;
  nuevo^.sig := Nil;
  ant := L;
  act := L;
  While (act<>Nil) And (act^.num<nuevo^.num) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (ant = act) Then
    L := nuevo
  Else
    ant^.sig := nuevo;
  nuevo^.sig := act;
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
  Read(valor);
  While (valor <> 0) Do
    Begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      Read(valor);
    End;
  ImprimirNodo(pri);
End.
