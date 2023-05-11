
Program Practica4_B;

Const 
  dim = 100;

Type 
  vdatos = array[1..dim] Of real;

Function promedio(v: vdatos): real;

Var 
  i: integer;
  suma: real;
Begin
  suma := 0;
  For i:= 1 To 100 Do
    Begin
      suma := suma + v[i];
    End;
  promedio := suma/100;
End;
Begin
End.
