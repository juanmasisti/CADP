
Program Vectores;

Const 
  cant_datos = 100;

Type 
  vdatos = array[1..cant_datos] Of integer;

Procedure cargarVector(Var v:vdatos; Var dimL : integer);

Var 
  num: integer;
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

Procedure elementoMinimoMaximo(v: vdatos; dimL: integer; Var posMax,
                               posMin: integer);

Var 
  i, min, max: integer;
Begin
  min := 9999;
  max := -9999;
  For i:= 1 To dimL Do
    Begin
      If (v[i]<min) Then
        Begin
          min := v[i];
          posMin := i;
        End;
      If (v[i]>max) Then
        Begin
          max := v[i];
          posMax := i;
        End;
    End;
End;

Procedure intercambio(Var v: vdatos; x, y: integer);

Var 
  alm: integer;
Begin
  alm := v[x];
  v[x] := v[y];
  v[y] := alm;
End;

Var 
  datos: vdatos;
  elMax, elMin, posMax, posMin, dimL: integer;
Begin
  cargarVector(datos, dimL);
  elementoMinimoMaximo(datos, dimL, posMax, posMin);
  elMax := datos[posMax];
  elMin := datos[posMin];
  intercambio(datos, elMax, elMin);
  writeln('El elemento maximo ', elMax, ' que se encontraba en la posicion ',
          posMax, ' fue intercambiado con el elemento minimo ', elMin,
          ' que se encontraba en la posicion ', posMin);
End.
