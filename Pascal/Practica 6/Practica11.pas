
Program Practica11;

Type 
  lista = ^nodo;
  str20 = string[20];
  alumno = Record
    numero: integer;
    apellido: str20;
    promedio: real;
  End;
  nodo = Record
    dato: alumno;
    sig: lista;
  End;

Procedure LeerRegistro(Var R: alumno);
Begin
  writeln('Ingrese el codigo del alumno: ');
  readln(R.numero);
  If (R.numero <> 0) Then
    Begin
      writeln('Ingrese el apellido del alumno: ');
      readln(R.apellido);
      writeln('Ingrese el promedio del alumno: ');
      readln(R.promedio);
    End;
End;

Procedure insertarOrdenado(Var L: lista);

Var 
  nuevo, act, ant: lista;
  alumnos: alumno;
Begin
  LeerRegistro(alumnos);
  While (alumnos.numero<>0) Do
    Begin
      new(nuevo);
      nuevo^.dato := alumnos;
      nuevo^.sig := L;
      act := L;
      ant := L;
      While (act<>Nil) And  (act^.dato.promedio>alumnos.promedio) Do
        Begin
          ant := act;
          act := act^.sig;
        End;
      If (ant = act) Then
        L := nuevo
      Else
        ant^.sig := nuevo;
      nuevo^.sig := act;
      LeerRegistro(alumnos);
    End;
End;

Procedure analizarLista(L: lista);

Var 
  i: integer;
Begin
  writeln('Los que recibiran el premio son: ');
  For i:= 1 To 4 Do
    Begin
      writeln(L^.dato.apellido, ', Codigo: ', L^.dato.numero);
      L := L^.sig;
    End;
End;

Var 
  pri: lista;
Begin
  insertarOrdenado(pri);
  analizarLista(pri);
End.
