
Program Practica13;

Const 
  dF = 50;
  dF2 = 100;

Type 
  puntos = array[1..dF2] Of real;
  anos = array[1..dF] Of puntos;
  
Procedure cargarVector(Var v: anos);

Var 
  i, j: integer;
  num: real;
Begin
  For i:= 1 To dF Do
    Begin
      writeln('Escriba los puntos del año ', i);
      For j:= 1 To dF2 Do
		Begin
		  readln(num);
          v[i][j] := num;
        End;
    End;
End;

Procedure maxPunto(temp: real; ano: integer; Var maxTemp: real; Var maxAno
                   : integer);
Begin
  If (temp>maxTemp) Then
    Begin
      maxTemp := temp;
      maxAno := ano;
    End;
End;

Procedure maxPromMundial(prom: real; ano: integer; Var maxProm: real; Var maxAno2: integer);
Begin
  If (prom>maxProm) Then
    Begin
      maxProm := prom;
      maxAno2 := ano;
    End;
End;

Var 
  ano: anos;
  i, j: integer;
  maxAno, maxAno2: integer;
  total, maxProm, maxTemp: real;
Begin
  maxProm := -9999; maxTemp := -9999;
  cargarVector(ano);
  For i:= 1 To dF Do
    Begin
      total:= 0;
      For j:= 1 To dF2 Do
        Begin
          total := total + ano[i][j];
          maxPunto(ano[i][j], i, maxTemp, maxAno);
        End;
      maxPromMundial(total/100, i, maxProm, maxAno2);
    End;
  writeln('El año con mayor temperatura promedio a nivel mundial fue el ', maxAno2);
  writeln('El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años fue el ', maxAno);
End.
