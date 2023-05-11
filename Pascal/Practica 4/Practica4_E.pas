
Program Practica4_B;

Const 
  dim = 100;

Type 
  vdatos = array[1..dim] Of real;

Function posElementoMaximo(v: vdatos): real;

Var 
  i, pos: integer;
  max: real;
Begin
  max := -9999;
  For i:= 1 To 100 Do
    Begin
      If (v[i]>max) Then
        Begin
          max := v[i];
          pos := i;
        End;
    End;
  posElementoMaximo := pos;
End;
Begin
End.
