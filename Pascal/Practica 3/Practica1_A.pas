
Program Registros;

Type 
  str20 = string[20];
  alumno = Record
    codigo : integer;
    nombre : str20;
    promedio : real;
  End;
Procedure leer(Var alu : alumno);
Begin
  writeln('Ingrese el codigo del alumno');
  readln(alu.codigo);
  If (alu.codigo <> 0) Then
    Begin
      writeln('Ingrese el nombre del alumno');
      readln(alu.nombre);
      writeln('Ingrese el promedio del alumno');
      readln(alu.promedio);
    End;
End;
{ declaración de variables del programa principal }

Var 
  a : alumno;
  cantAlu: integer;
{ cuerpo del programa principal }
Begin
  cantAlu := 0;
  leer(a);
  While (a.codigo<>0) Do
    Begin
      leer(a);
      cantAlu := cantAlu + 1;
    End;
  writeln(cantAlu);
End.
