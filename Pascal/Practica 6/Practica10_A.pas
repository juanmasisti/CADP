
Program Practica10_A;

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

Var 
  pri: lista;
Begin
  pri := Nil;
End.
