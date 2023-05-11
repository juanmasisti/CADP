
Program Practica4.pas;

Type 
  linea = Record
    numTelefono: integer;
    minConsum: real;
    mbConsum: real;
  End;
  Usuario = Record
    codigo: integer;
    cantLineas: integer;
  End;

Procedure leerUsuario(Var usu: usuario);
Begin
  writeln('Codigo del Usuario: ');
  readln(usu.codigo);
  writeln('Cantidad de lineas del Usuario: ');
  readln(usu.cantLineas);
End;

Procedure leerLinea(Var lin: linea);
Begin
  writeln('Numero de Telefono: ');
  readln(lin.numTelefono);
  writeln('Minutos consumidos: ');
  readln(lin.minConsum);
  writeln('MB consumidos: ');
  readln(lin.mbConsum);
End;

Var 
  i,j: integer;
  usuarios: usuario;
  lineas: linea;
  minTotal,  mbTotal: real;
Begin
  For i:= 1 To 9400 Do
    Begin
      minTotal := 0;
      mbTotal := 0;
      leerUsuario(usuarios);
      For j:= 1 To usuarios.cantLineas Do
        Begin
          leerLinea(lineas);
          minTotal := minTotal + lineas.minConsum;
          mbTotal := mbTotal + lineas.mbConsum;
        End;  
        writeln('El monto de minutos a pagar es: $', mbTotal*3.40:2:2);
		writeln('El monto de MB a pagar es: $', mbTotal*1.35:2:2);
    End;
End.
