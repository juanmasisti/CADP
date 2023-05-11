
Program Practica2;

Const 
  cant_datos = 150;

Type 
  vdatos = array[1..cant_datos] Of real;

Procedure cargarVector(Var v:vdatos; Var dimL : integer);

Var 
  num: real;
Begin
  writeln('Ingrese numeros reales: ');
  read(num);
  dimL := 0;
  While (num<>0) And (dimL<cant_datos) Do
    Begin
      dimL := dimL + 1;
      v[dimL] := num;
      read(num);
    End;
End;

Procedure modificarVectorySumar(Var v:vdatos; dimL : integer; n: real; Var suma:
                                real);

Var 
  i: integer;
Begin
  For i:= 1 To dimL Do
    Begin
      v[i] := v[i] + n;
      suma := suma + v[i];
    End;
End;

Var 
  datos : vdatos;
  dim : integer;
  num, suma : real;
Begin
  dim := 0;
  suma := 0;
  cargarVector(datos, dim);
  writeln('Ingrese un valor a sumar');
  readln(num);
  modificarVectorySumar(datos, dim, num, suma);
  writeln('La suma de los valores es: ', suma:2:2);
  writeln('Se procesaron: ',dim, ' números');
End.
