
Program Practica4_A;

Const 
  dim = 100;

Type 
  vdatos = array[1..dim] Of real;

Function posicion(v: vdatos; x: integer): integer;

Var 
  i: integer;
Begin
  For i:= 1 To 100 Do
    Begin
      If (v[i]= x) Then
        posicion := i
      Else
        posicion := -1;
    End;
End;
Begin
End.
