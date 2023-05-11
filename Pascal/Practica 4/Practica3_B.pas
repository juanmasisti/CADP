
Program Practica3_B;

Type 
  vdatos = array[1..10] Of real;

Procedure imprimir(v:vdatos; dimL : integer);

Var 
  i: integer;
Begin
  For i:= dimL Downto 1 Do
    Begin
      writeln('El numero en la posicion ', i, ' es: ', v[i]);
    End;
End;
Begin
End.
