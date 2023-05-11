
Program Practica8;

Const 
  tam = 2;

Type 
  str20 = string[20];
  galaxiaPropertie = Record
    nombre: str20;
    masa: integer;
    tipo: integer;
    pc: integer;
  End;
  galaxias = array[1..tam] Of galaxiaPropertie;
  tipos = array[1..4] Of integer;

Procedure leer(Var reg: galaxiaPropertie);

Begin
  writeln('Nombre de la galaxia: ');
  readln(reg.nombre);
  writeln('Masa de la Galaxia: ');
  readln(reg.masa);
  writeln('Tipo de la Galaxia: ');
  readln(reg.tipo);
  writeln('Distancia en parsecs desde la Tierra: ');
  readln(reg.pc);
End;

Procedure cargarVector(Var galaxia: galaxias);

Var 
  i: integer;
  reg: galaxiaPropertie;
Begin
  writeln('Ingrese las Galaxias.');
  For i:= 1 To tam Do
    Begin
      leer(reg);
      galaxia[i] := reg;
    End;
End;

Procedure inicializar(Var tipo: tipos);

Var 
  i: integer;
Begin
  For i:= 1 To 4 Do
    Begin
      tipo[i]:= 0;
    End;
End;

Function galaxiaPrincipal(galaxia: str20): boolean;
Begin
  galaxiaPrincipal := (galaxia='La Via Lactea') Or (galaxia='Andromeda') Or (galaxia='Triangulo');
End;

Function noIrregularPC1000(tipo, pc: integer): boolean;
Begin
  noIrregularPC1000 := Not(tipo=4) And (pc<1000);
End;

Procedure max(masa: integer; nombre: str20; Var masaMax1, masaMax2: integer; Var
              nombreMax1, nombreMax2: str20);
Begin
  If (masa>masaMax1) Then
    Begin
      masaMax2 := masaMax1;
      masaMax1 := masa;
      nombreMax2 := nombreMax1;
      nombreMax1 := nombre;
    End
  Else
    If (masa>masaMax2) Then
      Begin
        masaMax2 := masa;
        nombreMax2 := nombre;
      End;
End;

Procedure min(masa: integer; nombre: str20; Var masaMin1, masaMin2: integer; Var
              nombreMin1, nombreMin2: str20);
Begin
  If (masa<masaMin1) Then
    Begin
      masaMin2 := masaMin1;
      masaMin1 := masa;
      nombreMin2 := nombreMin1;
      nombreMin1 := nombre;
    End
  Else
    If (masa<masaMin2) Then
      Begin
        masaMin2 := masa;
        nombreMin2 := nombre;
      End;
End;

Var 
  galaxia: galaxias;
  tipo: tipos;
  i, masaTotal, masaPrincipal, noIrregular: integer;
  nombreMax1, nombreMax2, nombreMin1, nombreMin2: str20;
  masaMax1, masaMax2, masaMin1, masaMin2: integer;
Begin
  cargarVector(galaxia);
  masaPrincipal := 0; masaTotal:= 0; noIrregular := 0;
  masaMax1 := -9999; masaMax2 := -9999; masaMin1 := 9999; masaMin2 := 9999;
  inicializar(tipo);
  For i:= 1 To tam Do
    Begin
      tipo[galaxia[i].tipo]:= tipo[galaxia[i].tipo] + 1;
      masaTotal := masaTotal + galaxia[i].masa;
      If (galaxiaPrincipal(galaxia[i].nombre)) Then
        masaPrincipal := masaPrincipal + galaxia[i].masa;
      If (noIrregularPC1000(galaxia[i].tipo, galaxia[i].masa)) Then
        noIrregular := noIrregular + 1;
      max(galaxia[i].masa, galaxia[i].nombre, masaMax1, masaMax2, nombreMax1,
          nombreMax2);
      min(galaxia[i].masa, galaxia[i].nombre, masaMin1, masaMin2, nombreMin1,
          nombreMin2);
    End;
  For i:= 1 To 4 Do
    Begin
      writeln('La Cantidad de Galaxias en el tipo ', i, ' es ', tipo[i]);
    End;
  writeln('La masa total de las galaxias principáles es ', masaPrincipal,' y su porcentaje con respecto al total es ', masaPrincipal*100/masaTotal:2:2);
  writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc es ', noIrregular);
  writeln('Las dos galaxias con mayor masa son ', nombreMax1, ' y ', nombreMax2);
  writeln('Las dos galaxias con menor masa son ', nombreMin1, ' y ', nombreMin2);
End.
