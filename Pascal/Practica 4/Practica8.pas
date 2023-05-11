
Program Practica8;

Const 
  tam = 400;

Type 
  str20 = string[20];
  alumno = Record
    nroIns: integer;
    DNI: longint;
    nombre: str20;
    apellido: str20;
    anoNac: integer;
  End;
  ingresante = array[1..tam] Of alumno;

Procedure cargarVector(Var ing: ingresante);

Var 
  i: integer;
  alumnos: alumno;
Begin
  writeln('Ingrese los alumnos: ');
  For i:= 1 To tam Do
    Begin
      writeln('Numero de inscripcion: ');
      readln(alumnos.nroIns);
      writeln('DNI: ');
      readln(alumnos.DNI);
      writeln('Nombre: ');
      readln(alumnos.nombre);
      writeln('Apellido: ');
      readln(alumnos.apellido);
      writeln('Año de nacimiento: ');
      readln(alumnos.anoNac);
      ing[i] := alumnos;
    End;
End;

Function dniPar(dni: integer): boolean;

Var 
  esPar: boolean;
Begin
  esPar := true;
  While (dni<>0) And (espar) Do
    Begin
      If (dni Mod 2 = 0) Then
        dni := dni Div 10
      Else
        espar := false;
    End;
  dniPar := esPar;
End;

Procedure max(edad: integer; nombre, apellido: str20; Var edadMax1, edadMax2: integer; Var apellidoMax1, apellidoMax2, nombreMax1, nombreMax2: str20);
Begin
  If (edad>edadMax1) Then
    Begin
      edadMax2 := edadMax1;
      edadMax1 := edad;
      apellidoMax2 := apellidoMax1;
      apellidoMax1 := apellido;
      nombreMax2 := nombreMax1;
      nombreMax1 := nombre;
    End
  Else
    If (edad>edadMax2) Then
      Begin
        edadMax2 := edad;
        apellidoMax2 := apellido;
        nombreMax2 := nombre;
      End;
End;

Var 
  ing: ingresante;
  i, cantDniPar, edad, edadMax1, edadMax2: integer;
  apellidoMax1, nombreMax1, apellidoMax2, nombreMax2: str20;
Begin
  cantDniPar := 0; edadMax1 := -9999; edadMax2 := -9999;
  cargarVector(ing);
  For i:= 1 To tam Do
    Begin
      If (dniPar(ing[i].DNI)) Then
        cantDniPar := cantDniPar + 1;
      edad:= 2020 - ing[i].anoNac;
      write(edad);
      max(edad, ing[i].nombre, ing[i].apellido, edadMax1, edadMax2, apellidoMax1, apellidoMax2, nombreMax1, nombreMax2);
    End;
  writeln('El porcentaje de alumnos con DNI de digitos pares es: ', cantDniPar*100/tam:2:2, '%');
  writeln('Los apellidos y nombres de los alumnos con mayor edad son ', apellidoMax1, ' ', nombreMax1, ' y ', apellidoMax2, ' ', nombreMax2);
End.
