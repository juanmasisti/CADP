
Program Practica4_B;

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

Function Minimo(L: lista): integer;

Var 
  min: integer;
Begin
  min := 9999;
  While (L<>Nil) Do
    Begin
      If (L^.num<min) Then
        min := L^.num;
      L := L^.sig;
    End;
  Minimo := min;
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
  writeln('El numero minimo es ', Minimo(pri));
End.
