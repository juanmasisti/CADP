
Program Practica3_C;

Type 
  vdatos = array[1..10] Of real;

Procedure imprimir(v:vdatos; x, y: integer);

Var 
  i: integer;
Begin
  If (x<y) Then
    Begin
      alm := y;
      y := x;
      x := alm;
    End;
  For i:= x To y Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[i]);
    End;
End;
Begin
End.
