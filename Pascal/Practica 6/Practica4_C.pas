
Program Practica4_C;

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

Function Multiplos(L: lista; x: integer): integer;

Var 
  cant: integer;
Begin
  cant := 0;
  While (L<>Nil) Do
    Begin
      If (L^.num Mod x = 0 ) Then
        cant := cant + 1;
      L := L^.sig;
    End;
  Multiplos := cant;
End;

Var 
  pri : lista;
  valor, x : integer;
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
  writeln('Ingrese un numero a ser utilizado en la lista');
  readln(x);
  writeln('La cantidad de multiplos de ', x, ' es ', Multiplos(pri, x));
End.
