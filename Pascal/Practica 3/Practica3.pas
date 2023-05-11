
Program Practica3;

Type 
  string20 = string[20];
  escuela = Record
    CUE: integer;
    nombre: string20;
    docentes: integer;
    alumnos: integer;
    localidad: string20;
  End;

Procedure leer(Var esc: escuela);
Begin
  writeln('Escriba el codigo CUE:');
  readln(esc.CUE);
  writeln('Escriba el nombre del Establecimiento:');
  readln(esc.nombre);
  writeln('Escriba la cantidad de docentes:');
  readln(esc.docentes);
  writeln('Escriba la cantidad de alumnos:');
  readln(esc.alumnos);
  writeln('Escriba la localidad:');
  readln(esc.localidad);
End;

Function relacionDocAlu(esc: escuela): real;
Begin
  relacionDocAlu := esc.docentes/esc.alumnos;
End;

Function esMayor(relacion: real): boolean;
Begin
  esMayor := (relacion>(1/23.435));
End;

Procedure relacionUnesco(relacionEscuela: real; escuelas: escuela; Var mejorRelacion1, mejorRelacion2: escuela; Var relacionMin1, relacionMin2: real);

Var 
	relacion: real;
Begin
  relacion := relacionEscuela-(1/23.435);
  If (relacion<0) Then
    relacion := relacion * -1;
  If (relacion<=relacionMin1) Then
    Begin
      relacionMin2 := relacionMin1;
      relacionMin1 := relacion;
      mejorRelacion2.CUE := mejorRelacion1.CUE;
      mejorRelacion1.CUE := escuelas.CUE;
      mejorRelacion2.nombre := mejorRelacion1.nombre;
      mejorRelacion1.nombre := escuelas.nombre;
    End
  Else If (relacion<=relacionMin2) Then
         Begin
           relacionMin2 := relacion;
           mejorRelacion2.CUE := escuelas.CUE;
           mejorRelacion2.nombre := escuelas.nombre;
         End;
End;

Var 
  escuelas, mejorRelacion1, mejorRelacion2: escuela;
  relacionEscuela, relacionMin1, relacionMin2: real;
  relacionSup, i: integer;
Begin
  relacionSup := 0;
  relacionMin1 := 9999;
  relacionMin2 := 9999;
  For i:= 1 To 2400 Do
    Begin
      leer(escuelas);
      relacionEscuela := relacionDocAlu(escuelas);
      write(relacionEscuela:2:2);
      If (esMayor(relacionEscuela)) Then
        relacionSup := relacionSup + 1;
      relacionUnesco(relacionEscuela, escuelas, mejorRelacion1, mejorRelacion2, relacionMin1, relacionMin2);
    End;
  writeln('El CUE de las escuelas con mejor relacion fue: ', mejorRelacion1.CUE,
          ' y ', mejorRelacion2.CUE);
  writeln('El Nombre de las escuelas con mejor relacion fue: ', mejorRelacion1.
          nombre, ' y ', mejorRelacion2.nombre);
  writeln('La cantidad de escuelas que tienen una relacion mayor a la esperada es/son:', relacionSup)
End.
