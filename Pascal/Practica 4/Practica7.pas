
Program Practica7;

Const 
  tam = 9;

Type 
  digitos = array[0..tam] Of integer;

Procedure cargarVector(num: integer; Var dig: digitos);
Begin
  While (num<>0) Do
    Begin
      dig[num MOD 10] := dig[num Mod 10] + 1;
      num := num Div 10;
    End;
End;

Procedure max(num, pos: integer; Var posMax, max: integer);
Begin
  If (num>max) Then
    Begin
      max := num;
      posMax := pos;
    End;
End;

Procedure imprimirDigito(dig: digitos);

Var 
  i: integer;
Begin
  For i:= 0 To tam Do
    If (dig[i]=0) Then
      write(i, ', ');
End;

Var 
  num, i, maxNum, posMax: integer;
  dig: digitos;
Begin
  maxNum := -9999;
  For i:= 0 To tam Do
    dig[i] := 0;
  writeln('Ingrese numeros enteros: ');
  readln(num);
  While (num<>-1) Do
    Begin
      cargarVector(num, dig);
      readln(num);
    End;
  For i:= 0 To tam Do
    Begin
      max(dig[i], i, posMax, maxNum);
      If (dig[i]>0) Then
        writeln('Numero ', i ,': ', dig[i], ' veces');
    End;
  writeln('El digito mas leido fue ', posMax);
  write('Los digitos que no tuvieron ocurrencias fue/ron ');
  imprimirDigito(dig);
End.
