
Program Practica10_C;

Type 
  lista = ^nodo;
  str20 = string[20];
  cliente = Record
    DNI: str20;
    turno: integer;
  End;
  nodo = Record
    sig: lista;
    dato: cliente;
  End;

Procedure RecibirCliente(Var L: lista; DNI: str20);

Var 
  aux, nuevo: lista;
Begin
  new(nuevo);
  nuevo^.dato.DNI := DNI;
  nuevo^.sig := Nil;
  If (L = Nil) Then
    Begin
      L := nuevo;
      nuevo^.dato.turno := 1;
    End
  Else
    Begin
      aux := L;
      While (aux^.sig<>Nil) Do
        aux := aux^.sig;
      nuevo^.dato.turno := aux^.dato.turno + 1;
      aux^.sig := nuevo;
    End;
End;

Procedure AtenderCliente(Var L: Lista);
Begin
  Writeln('Es el turno ', L^.dato.turno, ' con DNI ', L^.dato.DNI);
  If (L<>Nil) Then
    Begin
      dispose(L);
      L := L^.sig;
    End;
End;

Var 
  pri: lista;
Begin
  pri := Nil;
End.
