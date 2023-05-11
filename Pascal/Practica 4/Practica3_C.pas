
Program Practica3_C;

Type 
  vdatos = array[1..10] Of real;

Procedure imprimir(v:vdatos; dimL : integer);

Var 
  i: integer;
Begin
  For i:= (dimL Div 2) Downto 1 Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[i]);
    End;
  For i:= ((dimL Div 2)+ 1) To dimL Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[j]);
    End;
End;
Begin
End.
