
Program Practica4;

Const 
  dimF = 42;

Type 
  lista = ^nodo;
  str20 = string[20];
  sem42 = array[1..dimF] Of real;
  madre = Record
    nombre: str20;
    apellido: str20;
    pesosSemanas: sem42;
    dimL: 1..dimF;
  End;
  nodo = Record
    dato: madre;
    sig: lista;
  End;

Function pesoMaxArreglo(v: sem42; dimL: integer): integer;

Var 
  i: integer;
  cambioPeso, CambioPesoMax: real;
  semanaMax: integer;
Begin
  CambioPesoMax := -1;
  For i:= 1 To (dimL-1) Do
    Begin
      cambioPeso := v[i+1] - v[i];
      If (cambioPeso>CambioPesoMax) Then
        Begin
          CambioPesoMax := cambioPeso;
          semanaMax := i+1;
        End;
    End;
  pesoMaxArreglo := semanaMax;
End;

Procedure analizarLista(L: lista);
Begin
  While (L<>Nil) Do
    Begin
      write('La semana con mayor aumento de peso es ', pesoMaxArreglo(L^.dato.pesosSemanas, L^.dato.dimL));
      write('El cambio de peso total de la embarazada es ', L^.dato.pesosSemanas[L^.dato.dimL] - L^.dato.pesosSemanas[1]);
      L := L^.sig;
    End;
End;

Var 
  pri: lista;
Begin
  pri := Nil;
  {cargarLista(pri); Se dispone}
  analizarLista(pri);
End.
