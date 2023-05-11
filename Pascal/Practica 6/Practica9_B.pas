
Program Practica9_B;

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

Procedure eliminar(Var L: lista; x: integer);

Var 
  ant, act: lista;
Begin
  ant := L;
  act := L;
  While (act<>Nil) And (act^.num<>x) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (L<>Nil) Then
    Begin
      If (ant=act) Then
        L := act^.sig
      Else
        ant^.sig := act^.sig;
      dispose(act);
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
  eliminar(pri, 4);
  ImprimirNodo(pri);
End.
