
Program Practica10_D;

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
  If (DNI<>'0') Then
    Begin
      new(nuevo); nuevo^.dato.DNI := DNI; nuevo^.sig := Nil;
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
        End
    End;
End;

Procedure AtenderCliente(Var L: Lista);
Var
  aux: lista;
Begin
  Writeln('Es el turno ', L^.dato.turno, ' con DNI ', L^.dato.DNI);
  If (L<>Nil) Then
    Begin
	  aux := L^.sig;
      dispose(L);
      L := aux;
    End
End;

Procedure generarLista(Var L: lista);

Var 
  DNI: str20;
Begin
  Writeln('Escriba su DNI');
  readln(DNI);
  RecibirCliente(L, DNI);
  While (DNI<>'0') Do
    Begin
      Writeln('Escriba su DNI');
      RecibirCliente(L, DNI);
      readln(DNI);
    End;
End;

Var 
  pri: lista;
Begin
  pri := Nil;
  generarLista(pri);
  While (pri<>Nil) Do
    AtenderCliente(pri);
End.
