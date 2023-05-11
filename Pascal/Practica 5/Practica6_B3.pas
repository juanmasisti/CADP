
Program Practica6_B3;

Type 
  Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] Of Puntero;

Procedure Inicializar(Var arr: ArrPunteros);

Var 
  i: integer;
Begin
  For i:= 1 To 2500 Do
    Begin
      New(arr[i]);
    End;
End;

Procedure Cargar(Var arr: ArrPunteros);

Var 
  i: integer;
Begin
  For i:= 1 To 2500 Do
    Begin
      writeln('Ingrese el nombre de la ciudad');
      readln(arr[i]^);
    End;
End;

Var 
  Punteros: ArrPunteros;
Begin
  Inicializar(Punteros);
  Cargar(Punteros)
End.
