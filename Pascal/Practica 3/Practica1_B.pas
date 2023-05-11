
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
Procedure Max(alu: alumno; Var promMax: alumno);
Begin
  If (alu.promedio>promMax.promedio) Then
    Begin
      promMax.promedio := alu.promedio;
      promMax.nombre := alu.nombre;
    End;
End;
{ declaración de variables del programa principal }

Var 
  a : alumno;
  cantAlu: integer;
  promMax: alumno;
{ cuerpo del programa principal }
Begin
  cantAlu := 0;
  promMax.promedio := -1;
  leer(a);
  While (a.codigo<>0) Do
    Begin
      leer(a);
      cantAlu := cantAlu + 1;
      max(a, promMax);
    End;
  writeln('La cantidad de alumnos es: ', cantAlu);
  writeln('El alumno con mejor promedio es: ', promMax.nombre);
End.
