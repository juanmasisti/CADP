
Program Practica7_C;

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

Procedure analizarCriterios(L: lista; Var cumpleV, cumpleX: lista);

Var 
  nuevo: lista;
Begin
  While (L<>Nil) Do
    Begin
      new(nuevo);
      If (cumpleCriteriosH2020(L^.dato)) Then
        Begin
          nuevo^.dato := L^.dato;
          nuevo^.sig := cumpleV;
          cumpleV := nuevo;
        End
      Else
        Begin
          nuevo^.dato := L^.dato;
          nuevo^.sig := cumpleX;
          cumpleX := nuevo;
        End;
      L := L^.sig;
    End;
End;

Procedure  analizarNoCumple(L: lista);

Var 
  costoT, costoSonda: real;
  cantT: integer;
Begin
  cantT := 0; costoT := 0;
  While (L<>Nil) Do
    Begin
      costoSonda := L^.dato.costoC + (L^.dato.costoM*L^.dato.duracion);
      cantT := cantT + 1;
      costoT := costoT + costoSonda;
      L := L^.sig;
    End;
  writeln('La cantidad de proyectos que no seran financiados son ', cantT);
  writeln('El costo total de proyectos no financiados es $', costoT:2:2);
End;

Var 
  pri, cumpleCriterio, noCumpleCriterio: lista;
Begin
  pri := Nil; cumpleCriterio := Nil; noCumpleCriterio := Nil;
  cargarLista(pri);
  analizarCriterios(pri, cumpleCriterio, noCumpleCriterio);
  analizarNoCumple(noCumpleCriterio);
End.
