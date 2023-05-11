
Program Practica3_C;

Type 
  vdatos = array[1..10] Of real;

Procedure imprimirA(v:vdatos; x, y: integer);

Var 
  i, alm: integer;
Begin
  If (x<y) Then
    Begin
      alm := y;
      y := x;
      x := alm;
    End;
  For i:= 1 To x Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[i]);
    End;
End;

Procedure imprimirB(v:vdatos; x, y: integer);

Var 
  i, alm: integer;
Begin
  If (x<y) Then
    Begin
      alm := y;
      y := x;
      x := alm;
    End;
  For i:= x Downto 1 Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[i]);
    End;
End;


Procedure imprimirC(Var v:vdatos; x, y: integer);

Var 
  i,alm: integer;
Begin
  If (x<y) Then
    Begin
      alm := y;
      y := x;
      x := alm;
    End;
  For i:= (x Div 2) Downto y Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[i]);
    End;
  For i:= ((x Div 2)+1) To x Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[i]);
    End;
End;
Begin
End.
