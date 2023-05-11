
Program Practica2;

Type 
  casam = Record
    dia: integer;
    mes: integer;
    ano: integer;
  End;
Procedure leer(Var cas: casam);
Begin
  writeln('Escriba el dia:');
  readln(cas.dia);
  writeln('Escriba el mes:');
  readln(cas.mes);
  writeln('Escriba el año:');
  readln(cas.ano);
End;

Var 
  casamientos: casam;
Begin
  leer(casamientos);
End.
