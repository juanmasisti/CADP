
Program Practica9_A;

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

Function estaOrdenado(L: lista): boolean;

Var 
  ant: lista;
  ordenado: boolean;
Begin
  ant := L;
  ordenado := true;
  While (L<>Nil) And (ordenado) Do
    Begin
      If (ant^.num>L^.num) Then
        ordenado := false
      Else
        Begin
          ant := L;
          L := L^.sig;
        End;
    End;
  estaOrdenado := ordenado;
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
  writeln(estaOrdenado(pri));
End.
