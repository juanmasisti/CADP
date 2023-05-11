
Program Practica7;

Const 
  dF = 24;

Type 
  lista = ^nodo;
  str20 = string[20];
  nota = array[1..dF] Of integer;
  alumno = Record
    numero: integer;
    apellido: str20;
    nombre: str20;
    correo: str20;
    anoI: integer;
    anoE: integer;
    notas: nota;
  End;
  alumnoMin = Record
    apellido: str20;
    nombre: str20;
    correo: str20;
  End;
  nodo = Record
    dato: alumno;
    sig: lista;
  End;

Procedure cargarVector(Var V: nota);

Var 
  i, j, num, pos: integer;
Begin
  For i:= 1 To dF Do
    Begin
      readln(num);
      pos := 1;
      While (num<V[pos]) Do
        pos := pos + 1;
      For j:= i Downto pos Do
        V[j+1] :=  V[j];
      v[pos] := num;
    End;
End;

Procedure cargarRegistro(Var R: alumno);
Begin
  writeln('Escribir el numero del alumno: ');
  readln(R.numero);
  If (R.numero <> -1) Then
    Begin
      writeln('Escribir el apellido del alumno: ');
      readln(R.apellido);
      writeln('Escribir el nombre del alumno: ');
      readln(R.nombre);
      writeln('Escribir el correo del alumno: ');
      readln(R.correo);
      writeln('Escribir el ano de ingreso del alumno: ');
      readln(R.anoI);
      writeln('Escribir el ano de egreso del alumno: ');
      readln(R.anoE);
      writeln('Escribir las notas del alumno: ');
      cargarVector(R.notas);
    End;
End;

Procedure agregarAdelante(Var L: lista; R: alumno);

Var 
  nuevo: lista;
Begin
  new(nuevo);
  nuevo^.dato := R;
  nuevo^.sig := L;
  L := nuevo;
End;

Procedure cargarLista(Var L: lista);

Var 
  R: alumno;
Begin
  cargarRegistro(R);
  While (R.numero<>-1) Do
    Begin
      agregarAdelante(L, R);
      cargarRegistro(R);
    End;
End;

Function prom(V: nota): real;

Var 
  i, tot : integer;
Begin
  tot := 0;
  For i:= 1 To dF Do
    tot := tot + V[i];
  prom := tot/24;
End;

Function digImpar(num: integer): boolean;

Var 
  impar: boolean;
Begin
  impar := num = 0;
  While (num<>0) And (Not impar) Do
    Begin
      If (num Mod 2 = 0) Then
        impar := true;
      num := num Div 10;
    End;
  digImpar := Not impar;
End;

Procedure min(ano: integer; apellido, nombre, correo: str20; Var min1, min2:
              integer; Var rMin1, rMin2: alumnoMin);
Begin
  If (ano<min1) Then
    Begin
      Min2 := Min1;
      Min1 := ano;
      rMin2 := rMin1;
      rMin1.apellido := apellido;
      rMin1.nombre := nombre;
      rMin1.correo := correo;
    End
  Else If (ano<min2) Then
         Begin
           Min2 := ano;
           rMin2.apellido := apellido;
           rMin2.nombre := nombre;
           rMin2.correo := correo;
         End;
End;

Procedure analizarLista(L: lista);

Var 
  R: alumno;
  RMin1, RMin2: alumnoMin;
  condicionB, anoMin1, anoMin2: integer;
Begin
  condicionB := 0;
  anoMin1 := 9999;
  anoMin2 := 9999;
  While (L<>Nil) Do
    Begin
      R := L^.dato;
      If ((R.anoI = 2012) And (digImpar(R.numero))) Then
        condicionB := condicionB + 1;
      min(R.anoE - R.anoI, R.apellido, R.nombre, R.correo, anoMin1, anoMin2, RMin1, RMin2);
      writeln('El promedio de el alumno ', R.apellido, ' es ', prom(R.notas));
      L := L^.sig;
    End;
  writeln(condicionB);
  writeln(RMin1.apellido, RMin1.nombre, rMin1.correo);
  writeln(RMin2.apellido, RMin2.nombre, rMin2.correo);
End;

Procedure eliminar(Var L: lista; num: integer);

Var 
  ant, act: lista;
Begin
  act := L;
  While (act<>Nil) And (act^.dato.numero<>num) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act<>Nil) Then
    Begin
      If (act = L) Then
        L := act^.sig
      Else
        ant^.sig := act^.sig;
      dispose(act);
    End;
End;

Var 
  pri: lista;
  num: integer;
Begin
  pri := Nil;
  cargarLista(pri);
  analizarLista(pri);
  readln(num);
  eliminar(pri, num);
End.
