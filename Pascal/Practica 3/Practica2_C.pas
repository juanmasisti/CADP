
Program Practica2;

Type 
  casam = Record
    dia: integer;
    mes: integer;
    ano: integer;
  End;

Procedure leer(Var cas: casam);
Begin
  writeln('Escriba el año:');
  readln(cas.ano);
  If (cas.ano<>2020) Then
    Begin
      writeln('Escriba el mes:');
      readln(cas.mes);
      writeln('Escriba el dia:');
      readln(cas.dia);
    End;
End;

Function esVerano(mes: integer): boolean;
Begin
  esVerano := (mes<=3);
End;

Function es10Mes(dia: integer): boolean;
Begin
  es10Mes := (dia<=10);
End;

Var 
  casamientos: casam;
  casamVerano, casam10: integer;
Begin
  casamVerano := 0;
  casam10 := 0;
  leer(casamientos);
  While (casamientos.ano<>2020) Do
    Begin
      If (esVerano(casamientos.mes)) Then
        casamVerano := casamVerano + 1;
      If (es10Mes(casamientos.dia)) Then
        casam10 := casam10 + 1;
      leer(casamientos);
    End;
  writeln('Los casamientos en Verano fueron: ', casamVerano);
  writeln('Los casamientos en los 10 primeros dias del mes fueron: ', casam10);
End.
