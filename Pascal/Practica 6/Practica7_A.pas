
Program Practica7_A;

Type 
  lista = ^nodo;
  str20 = string[20];
  range = 1..7;

  sonda = Record
    nombre: str20;
    duracion: integer;
    costoC: real;
    costoM: real;
    rango: range;
  End;

  Espectro = array[range] Of integer;

  nodo = Record
    dato: sonda;
    sig: lista;
  End;

Procedure cargarRegistro(Var R: sonda);
Begin
  writeln('Escriba el nombre de la sonda: ');
  readln(R.nombre);
  If (R.nombre <> 'Gaia') Then
    Begin
      writeln('Escriba la duracion del viaje: ');
      readln(R.duracion);
      writeln('Escriba el costo de construccion: ');
      readln(R.costoC);
      writeln('Escriba el costo de mantenimiento por mes: ');
      readln(R.costoM);
      writeln('Escriba el rango del espectro por estudiar: ');
      readln(R.rango);
    End;
End;

Procedure cargarLista(Var L:lista);

Var 
  nuevo: lista;
  R: sonda;
Begin
  cargarRegistro(R);
  While (R.nombre<>'Gaia') Do
    Begin
      new(nuevo);
      nuevo^.dato := R;
      nuevo^.sig := L;
      L := nuevo;
      cargarRegistro(R);
    End;
End;

Function cumpleCriteriosH2020(R: sonda): boolean;
Begin
  cumpleCriteriosH2020 := (R.costoM<=R.costoC) And (R.rango<>1);
End;

Var 
  pri: lista;
Begin
  pri := Nil;
  cargarLista(pri);
End.
