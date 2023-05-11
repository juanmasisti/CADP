
Program Practica8;

Type 
  lista = ^nodo;
  cuenta = Record
    numero: integer;
    DNI: LongInt;
  End;
  fechas = Record
    Ano: integer;
    mes: integer;
    dia: integer;
  End;
  str20 = string[20];
  motivoCant = array[1..7] Of integer;
  transferencia = Record
    cuentaO: cuenta;
    cuentaD: cuenta;
    fecha: fechas;
    hora: integer;
    monto: real;
    cod: 1..7;
  End;
  nodo = Record
    dato: transferencia;
    sig: lista;
  End;

{Procedure cargarLista(Var L: lista)}

Procedure inicializarVector(Var V: motivoCant);

Var 
  i: integer;
Begin
  For i:= 1 To 7 Do
    v[i] := 0;
End;

Procedure insertarOrdenado(Var L: lista; R: transferencia);

Var 
  act, ant, nuevo: lista;
Begin
  act := L;
  ant := L;
  new(nuevo);
  nuevo^.dato := R;
  nuevo^.sig := Nil;
  While (act<>Nil) And (act^.dato.cuentaO.numero>R.cuentaO.numero) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (act<>Nil) Then
    Begin
      If (act= L) Then
        L := nuevo
      Else
        ant^.sig := nuevo;
      nuevo^.sig := act;
    End;
End;

Procedure analizarLista(L: lista; Var L2: lista);
Begin
  While (L<>Nil) Do
    Begin
      If (L^.dato.cuentaD.numero<>L^.dato.cuentaO.numero) Then
        insertarOrdenado(L2, L^.dato);
      L := L^.sig;
    End;
End;

Function max(V: motivoCant): integer;

Var 
  maxV, i: integer;
Begin
  maxV := -1;
  For i:= 1 To 7 Do
    If (V[i]>maxV) Then
      maxV := V[i];
  max := maxV;
End;

Function menosDigPar(num: integer): boolean;

Var 
  par, impar: integer;
Begin
  par := 0;
  impar := 0;
  While (num<>0) Do
    Begin
      If (num Mod 2 = 0) Then
        par := par + 1
      Else
        impar := impar + 1;
      num := num Div 10;
    End;
  menosDigPar := par<impar;
End;
Procedure analizarLista2(L: lista);

Var 
  cuenta, condicionC: integer;
  motivos: motivoCant;
  montoT: real;
Begin
  condicionC := 1;
  inicializarVector(motivos);
  While (L<>Nil) Do
    Begin
      cuenta := L^.dato.cuentaO.numero;
      montoT := 0;
      While (L^.dato.cuentaO.numero = cuenta) Do
        Begin
          montoT := montoT + L^.dato.monto;
          motivos[L^.dato.cod] :=  motivos[L^.dato.cod] + 1;
          L := L^.sig;
          If ((L^.dato.fecha.mes = 7) And (menosDigPar(L^.dato.cuentaD.numero)))
            Then
            condicionC := condicionC + 1;
        End;
      writeln(montoT);
      writeln(max(motivos));
    End;
  writeln(condicionC);
End;

Var 
  pri, pri2: lista;
Begin
  pri := Nil;
  pri2 := Nil;
  {cargarLista(pri) Se dispone}
  analizarLista(pri, pri2);
  analizarLista2(pri2);
End.
