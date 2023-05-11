
Program Practica7;

Type 
  str20= string[20];
  lista = ^nodo;
  objetoA = Record
    codigo: integer;
    categoria: 1..7;
    distancia: real;
    nombreD: str20;
    anoD: integer;
  End;
  nodo = Record
    dato: objetoA;
    sig: lista;
  End;
  objetosCant = array[1..7] Of integer;

Procedure inicializarVector(Var V: objetosCant);

Var 
  i: integer;
Begin
  For i:= 1 To 7 Do
    V[i] := 0;
End;

Procedure cargarRegistro(Var R: objetoA);
Begin
  writeln('Escribir el codigo del objeto: ');
  readln(R.codigo);
  If (R.codigo<>-1) Then
    Begin
      writeln('Escribir la categoria del objeto: ');
      readln(R.categoria);
      writeln('Escribir la distancia del objeto a la tierra: ');
      readln(R.distancia);
      writeln('Escribir el nombre del descubridor: ');
      readln(R.nombreD);
      writeln('Escribir el año del descubrimiento: ');
      readln(R.anoD);
    End;
End;

Procedure cargarLista(Var L: lista);

Var 
  nuevo: lista;
  R: objetoA;
Begin
  cargarRegistro(R);
  While (R.codigo<>-1) Do
    Begin
      new(nuevo);
      nuevo^.dato := R;
      nuevo^.sig := L;
      L := nuevo;
      cargarRegistro(R);
    End;
End;

Procedure max(cod: integer; dis: real; Var codMax1, codMax2: integer; Var disMax1, disMax2: real);
Begin
  If (dis>disMax1) Then
    Begin
      disMax2 := disMax1;
      disMax1 := dis;
      codMax2 := codMax1;
      codMax1 := cod;
    End
  Else If (dis>disMax2) Then
         Begin
           disMax2 := dis;
           codMax2 := cod;
         End;
End;

Function condicion1(nombre: str20; ano: integer): boolean;
Begin
  condicion1 := (nombre='Galileo Galilei') And (ano<1600);
End;

Function condicion2(cod: integer): boolean;

Var 
  impar, par: integer;
Begin
  par:= 0;
  impar:= 0;
  While (cod<>0) Do
    Begin
      If ((cod Mod 10) Mod 2 = 0) Then
        par := par + 1
      Else
        impar := impar + 1;
      cod := cod Div 10;
    End;
  condicion2 := par>impar;
End;

Procedure analizarLista(L: lista);

Var 
  codMax1, codMax2 , condicion1V, i: integer;
  disMax1, disMax2: real;
  objetos: objetosCant;
Begin
  inicializarVector(objetos);
  disMax1 := -1; disMax2 := -1;
  condicion1V := 0;
  While (L<>Nil) Do
    Begin
    writeln('hola');
      max(L^.dato.codigo, L^.dato.distancia, codMax1, codMax2, disMax1, disMax2);
      If (condicion1(L^.dato.nombreD, L^.dato.anoD)) Then
        condicion1V := condicion1V + 1;
      If ((condicion2(L^.dato.codigo)) And (L^.dato.categoria = 1)) Then
        writeln('La estrella ', L^.dato.codigo, ' tiene mas digitos pares que impares en su codigo ');
      objetos[L^.dato.categoria] := objetos[L^.dato.categoria] + 1;
      L := L^.sig;
    End;
  writeln('El codigo de los objetos mas lejanos son ', codMax1, ' y ', codMax2);
  For i:= 1 To 7 Do
    writeln('La categoria ', i, ' tiene ', objetos[i], ' objetos');
End;

Var 
  pri: lista;
Begin
  pri := Nil;
  cargarLista(pri);
  analizarLista(pri);
End.
