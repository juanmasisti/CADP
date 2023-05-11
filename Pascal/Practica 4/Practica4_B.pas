
Program Practica4_B;

Const 
  dim = 100;

Type 
  vdatos = array[1..dim] Of real;

Procedure intercambio(Var v: vdatos; x, y: integer);

Var 
  alm: real;
Begin
  alm := v[x];
  v[x] := v[y];
  v[y] := alm;
End;
Begin
End.
