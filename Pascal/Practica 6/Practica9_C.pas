
Program Practica9_C;

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

Procedure subLista(L: lista; Var L2:lista; a,b: integer);
Begin
  While (L<>Nil) Do
    Begin
      If (L^.num>a) And (L^.num<b) Then
        Begin
          armarNodo(L2,L^.num);
        End;
      L := L^.sig;
    End;
End;

Var 
  pri, pri2 : lista;
  valor : integer;
Begin
  pri := Nil;
  pri2 := Nil;
  writeln('Ingrese un numero');
  read(valor);
  While (valor <> 0) Do
    Begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      Read(valor);
    End;
  sublista(pri, pri2, 4, 8);
  ImprimirNodo(pri);
  ImprimirNodo(pri2);
End.
