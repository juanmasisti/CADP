
Program Practica8;

Type 
  str20 = string[20];
  DocenteCoor = Record
    DNI: integer;
    nombre: str20;
    apellido: str20;
    email: str20;
  End;
  Proyecto = Record
    codigo: integer;
    titulo: str20;
    docente: DocenteCoor;
    cantAlumnos: integer;
    escuela: str20;
    localidad: str20;
  End;
  MaxEscl = Record
    nombre: str20;
    cantAlumnos: integer;
  End;

Procedure LeerDocente(Var doc: DocenteCoor);
Begin
  writeln('Ingrese el DNI del Docente: ');
  readln(doc.DNI);
  writeln('Ingrese el nombre del Docente: ');
  readln(doc.nombre);
  writeln('Ingrese el apellido del Docente: ');
  readln(doc.apellido);
  writeln('Ingrese el email del Docente: ');
  readln(doc.email);
End;

Procedure LeerProyec(Var proy: Proyecto);
Begin
  writeln('Ingrese el codigo: ');
  readln(proy.codigo);
  If (proy.codigo<>-1) Then
    Begin
      writeln('Ingrese el titulo: ');
      readln(proy.titulo);
      writeln('Ingrese la cantidad de Alumnos: ');
      readln(proy.cantAlumnos);
      writeln('Ingrese la escuela: ');
      readln(proy.escuela);
      writeln('Ingrese la localidad: ');
      readln(proy.localidad);
      writeln('Ingrese los Datos del Docente.');
      LeerDocente(proy.docente);
    End;
End;

Procedure max(cantA: integer; nombre: str20; Var maxEscl1, maxEscl2: MaxEscl);
Begin
  If (cantA>maxEscl1.cantAlumnos) Then
    Begin
      maxEscl2.cantAlumnos := maxEscl1.cantAlumnos;
      maxEscl1.cantAlumnos := cantA;
      maxEscl2.nombre := maxEscl1.nombre;
      maxEscl1.nombre := nombre;
    End
  Else
    If (cantA>maxEscl2.cantAlumnos) Then
      Begin
        maxEscl2.cantAlumnos := cantA;
        maxEscl2.nombre := nombre;
      End;
End;

Function digParImpar(cod: integer): boolean;

Var 
  Par, Impar: integer;
Begin
  Par := 0;
  Impar := 0;
  While (cod<>0) Do
    Begin
      If (cod Mod 2 = 0) Then
        Par := Par + 1
      else
        Impar := Impar + 1;
      cod := cod Div 10;
    End;
    digParImpar := (Par=Impar);
End;

Var 
  proy: Proyecto;
  maxEscl1, maxEscl2: MaxEscl;
  local, escl: str20;
  esclLocal, esclTotal, cantA: integer;
Begin
  LeerProyec(proy);
  esclTotal := 0;
  While (proy.codigo<>-1) Do
    Begin
      local := proy.localidad;
      esclLocal := 0;
      While (proy.localidad=local) And (proy.codigo<>-1) Do
        Begin
          escl := proy.escuela;
          cantA := 0;
          While (proy.escuela=escl) And (proy.codigo<>-1) And (proy.localidad=
                local) Do
            Begin
              cantA := cantA + proy.cantAlumnos;
              If (digParImpar(proy.codigo)) And (proy.localidad='Daireaux') And (proy.escuela=escl)  Then
                writeln('Este proyecto con titulo ', proy.titulo,' es de la localidad de Daireaux y su codigo posee igual cantidad de dígitos pares e impares');
              LeerProyec(proy);
            End;
          max(cantA, proy.escuela, maxEscl1, maxEscl2);
          esclLocal := esclLocal + 1;
        End;
      Writeln('La cantidad de escuelas en ', local, ' son ', esclLocal);
      esclTotal := esclTotal + esclLocal;
    End;
  Writeln('La cantidad de escuelas en el proyecto', proy.titulo, ' son ',esclTotal);
  Writeln('El nombre de las dos escuelas maximas son ', MaxEscl1.nombre, ' y ', MaxEscl2.nombre);
End.
