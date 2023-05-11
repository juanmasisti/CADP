
Program Practica6_B2;

Type 
  Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] Of Puntero;

Procedure Inicializar(arr: ArrPunteros);

Var 
  i: integer;
Begin
  For i:= 1 To 2500 Do
    Begin
      New(arr[i]);
    End;
End;

Var 
  Punteros: ArrPunteros;
Begin
  Inicializar(Punteros);
End.
