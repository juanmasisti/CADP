
Program Practica 5;

Type 
  str20 = string[20];
  camion = Record
    patente: LongInt;
    anoFa: integer;
    pesoMa: real;
  End;
  camiones = array[1..100] Of camion;
  camionesKM = array[1..100] Of real;
  lista = ^nodo;
  viajes = Record
    codigo: integer;
    codCamion: 1..100;
    km: real;
    destino: str20;
    anoViaje: integer;
    DNI: LongInt;
  End;
  nodo = Record
    dato: viajes;
    sig: lista;
  End;

Procedure inicializarVector(Var V: camionesKM);

Var 
  i: integer;
Begin
  For i:= 1 To 100 Do
    V[i] := 0;
End;

Procedure leerRegistro(Var R: viajes);
Begin
  writeln('Introducir el codigo de viaje: ');
  readln(R.codigo);
  If (R.codigo<>-1) Then
    Begin
      writeln('Introducir el codigo de camion: ');
      readln(R.codCamion);
      writeln('Introducir los km recorridos: ');
      readln(R.km);
      writeln('Introducir la ciudad de destino: ');
      readln(R.destino);
      writeln('Introducir el año de viaje: ');
      readln(R.anoViaje);
      writeln('Introducir el DNI del chofer: ');
      readln(R.DNI);
    End;
End;

Procedure leerLista(Var L: lista);

Var 
  nuevo: lista;
  R: viajes;
Begin
  leerRegistro(R);
  While (R.codigo<>-1) Do
    Begin
      new(nuevo);
      nuevo^.dato := R;
      nuevo^.sig := L;
      L := nuevo;
      leerRegistro(R);
    End;
End;

Procedure maxMin (V: camionesKM; V2: camiones; Var Max: LongInt; Var Min:
                  LongInt);

Var 
  i: integer;
  kmMax, kmMin: real;
Begin
  kmMax := -1;
  kmMin := 9999;
  For i:= 1 To 100 Do
    Begin
      If (V[i]>kmMax) Then
        Begin
          kmMax := V[i];
          Max := V2[i].patente;
        End;
      If (V[i]<kmMin) Then
        Begin
          kmMin := V[i];
          Min := V2[i].patente;
        End;
    End;
End;

Function Condicion(peso: real; anoFa: integer; ano: integer): boolean;
Begin
  condicion := (peso>30.5) And (ano-anoFa>5);
End;

Function Condicion2(DNI: LongInt): boolean;

Var 
  impar: boolean;
Begin
  impar := false;
  While (DNI<>0) And (Not Impar) Do
    Begin
      If ((DNI Mod 10 ) Mod 2 = 0) Then
        Impar := true;
      DNI := DNI Div 10;
    End;
  condicion2 := Not Impar;
End;

Procedure analizarLista(L: lista; V: camiones);

Var 
  patenteMax, patenteMin: LongInt;
  camionesKMVec: camionesKM;
  condicionV: integer;
Begin
  inicializarVector(camionesKMVec);
  condicionV := 0;
  While (L<>Nil) Do
    Begin
      camionesKMVec[L^.dato.codCamion] := camionesKMVec[L^.dato.codCamion] + L^.
                                          dato.km;
      If (condicion(V[L^.dato.codCamion].pesoMa, V[L^.dato.codCamion].anoFa, L^.
         dato.anoViaje)) Then
        condicionV := condicionV + 1;
      If (condicion2(L^.dato.DNI)) Then
        writeln('El DNI del chofer es ', L^.dato.DNI);
      L := L^.sig;
    End;
  maxMin(camionesKMVec, V, patenteMax, patenteMin);
  writeln('La patente con mayor recorrido es ', patenteMax);
  writeln('La patente con menor recorrido es ', patenteMin);
  writeln('Los camiones que cumplen la condicion son ', condicionV);

End;

Var 
  pri: lista;
  camionesVec: camiones;
Begin
  pri := Nil;
  {cargarVector(camionesVec); Se dispone}
  leerLista(pri);
  analizarLista(pri, camionesVec);
End.
