
Program Practica4_B;

Const 
  dim = 100;

Type 
  vdatos = array[1..dim] Of real;

Function posElementoMinimo(v: vdatos): real;

Var 
  i, pos: integer;
  min: real;
Begin
  min := 9999;
  For i:= 1 To 100 Do
    Begin
      If (v[i]<min) Then
        Begin
          min := v[i];
          pos := i;
        End
    End;
  posElementoMinimo := pos;
End;
Begin
End.
