
Program Practica6;

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
      nuevo^.dato:= R;
      nuevo^.sig:= L;
      L:= nuevo;
      cargarRegistro(R);
    End;
End;

Procedure max(nom: str20; cT: real; Var nMax: str20; Var cMax: real);
Begin
  If (cT>cMax) Then
    Begin
      cMax := cT;
      nMax := nom;
    End;
End;

Procedure inicializarArreglo(Var A: Espectro);

Var 
  i: integer;
Begin
  For i:= 1 To 7 Do
    A[i] := 0;
End;

Function cantDuracionMayorPromedio(L: lista; promedio: real): integer;

Var 
  cant : integer;
Begin
  cant := 0;
  While (L<>Nil) Do
    Begin
      If (L^.dato.duracion>promedio) Then
        cant := cant + 1;
      L:= L^.sig;
    End;
  cantDuracionMayorPromedio := cant;
End;

Function cantCostoMTotal(L: lista; costo: real): integer;

Var 
  cant : integer;
Begin
  cant := 0;
  While (L<>Nil) Do
    Begin
      If (L^.dato.costoC>costo) Then
        cant := cant + 1;
      L:= L^.sig;
    End;
  cantCostoMTotal := cant;
End;

Procedure analizarLista(L: lista);

Var 
  aux: lista;
  datoR: sonda;
  i, duracionT, sondasT: integer;
  costoSonda, costoMax, costoT: real;
  nombreMax: str20;
  cantEspectro: Espectro;

Begin
  costoMax := -9999; duracionT := 0; sondasT := 0; costoT := 0;
  aux:= L;
  inicializarArreglo(cantEspectro);
  While (aux<>Nil) Do
    Begin
      datoR:= aux^.dato;
      costoSonda := datoR.costoC + (datoR.costoM*datoR.duracion);
      costoT := costoT + costoSonda;
      duracionT := duracionT + datoR.duracion;
      sondasT := sondasT + 1;
      max(datoR.nombre, costoSonda, nombreMax, costoMax);
      cantEspectro[datoR.rango] := cantEspectro[datoR.rango] + 1;
      aux:= aux^.sig;
    End;
  writeln('El nombre de la sonda mas costosa es ', nombreMax);
  For i:= 1 To 7 Do
    writeln('EL rango de tipo ', i, ' sera estudiado por ', cantEspectro[i],' sondas');
  writeln('La cantidad de sondas cuya duracion supera la duracion promedio son ', cantDuracionMayorPromedio(L, duracionT/sondasT));
  writeln('La cantidad de sondas cuyo costo de Construccion supera el costo promedio son ', cantCostoMTotal(L, costoT/sondasT))
End;

Var 
  pri: lista;
Begin
  pri := Nil;
  cargarLista(pri);
  analizarLista(pri);
End.
