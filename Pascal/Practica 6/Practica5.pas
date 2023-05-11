
Program Practica5;

Type 
  lista = ^nodo;
  str20 = string[20];
  producto = Record
    codigo: integer;
    descripcion: str20;
    stockA: integer;
    stockMin: integer;
    precio: real;
  End;
  nodo = Record
    dato: producto;
    sig: lista;
  End;

Procedure cargarProducto(Var R: producto);
Begin
  writeln('Ingrese el codigo del producto: ');
  readln(R.codigo);
  If (R.codigo<>-1) Then
    Begin
      writeln('Ingrese la descripcion del producto: ');
      readln(R.descripcion);
      writeln('Ingrese el stock Actual del producto: ');
      readln(R.stockA);
      writeln('Ingrese el stock Minimo del producto: ');
      readln(R.stockMin);
      writeln('Ingrese el precio del producto: ');
      readln(R.precio);
    End;
End;

Procedure cargarVector(Var L: lista);

Var 
  nuevo: lista;
  pro: producto;
Begin
  cargarProducto(pro);
  While (pro.codigo<>-1) Do
    Begin
      new(nuevo);
      nuevo^.dato := pro;
      nuevo^.sig := L;
      L:= nuevo;
      cargarProducto(pro);
    End;
End;

Function codigoTresPares(cod: integer): boolean;

Var 
  dig, cant: integer;
Begin
  cant:= 0;
  While (cod<>0) Do
    Begin
      dig := cod Mod 10;
      If (dig Mod 2 = 0) Then
        cant := cant + 1;
      cod := cod Div 10;
    End;
  If (cant>=3) Then
    codigoTresPares := True
  Else
    codigoTresPares := False;
End;

Procedure Min(precio: real; codigo: integer; Var precioMin1, precioMin2: real; Var codMin1, codMin2: integer);
Begin
  If (precio<precioMin1) Then
    Begin
      precioMin2 := precioMin1;
      precioMin1 := precio;
      codMin2 := codMin1;
      codMin1 := codigo;
    End
  Else If (precio<precioMin2) Then
         Begin
           precioMin2 := precio;
           codMin2 := codigo;
         End;
End;

Var 
  pri,aux: lista;
  cantTotal, stockDiff, codMin1, codMin2: integer;
  precioMin1, precioMin2: real;
Begin
  cantTotal := 0; stockDiff := 0;
  precioMin1 := 9999; precioMin2 := 9999;
  pri := Nil;
  cargarVector(pri);
  aux := pri;
  While (aux<>Nil) Do
    Begin
      cantTotal := cantTotal + 1;
      If (aux^.dato.stockA<aux^.dato.stockMin) Then
        stockDiff := stockDiff + 1;
      If (codigoTresPares(aux^.dato.codigo)) Then
        writeln('La descripcion del producto de codigo ', aux^.dato.codigo,' es ', aux^.dato.descripcion);
      min(aux^.dato.precio, aux^.dato.codigo, precioMin1, precioMin2, codMin1,codMin2);
      aux := aux^.sig;
    End;
  writeln('El porcentaje de productos con stock actual por debajo de su stock minimo es: ');
  writeln(stockDiff*100/cantTotal:2:2);
  writeln('Los codigos de los dos productos mas economicos son ', codMin1, ' y ', codMin2);
End.
