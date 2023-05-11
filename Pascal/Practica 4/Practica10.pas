
Program Practica8;

Const 
  tam = 300;

Type 
  salarios = array[1..tam] Of real;

Procedure cargarVector(Var empSalario: salarios; Var dmL: integer);

Var 
  salario: integer;
Begin
  dmL := 0;
  writeln('Ingrese los salarios: ');
  read(salario);
  While (salario<>0) And (dmL<=tam) Do
    Begin
      dmL := dmL + 1;
      empSalario[dmL] := salario;
      read(salario);
    End;
End;

Procedure aumentarSalario(Var empSalario: salarios; dmL, incremento: real);

Var 
  i: integer;
Begin
  For i:= 1 To dmL Do
    Begin
      empSalario[i] := empSalario[i] + (empSalario[i]*incremento/100);
    End;
End;

Procedure salarioPromedio(empSalario: salarios; dmL: integer);

Var 
  i: integer;
  salarioT: real;
Begin
  salarioT := 0;
  For i:= 1 To dmL Do
    Begin
      salarioT := salarioT + empSalario[i];
    End;
  writeln('El salario promedio es ', salarioT/dmL:2:2);
End;

Var 
  empSalario: salarios;
  dmL: integer;
Begin
  cargarVector(empSalario, dmL);
  salarioPromedio(empSalario, dmL);
  aumentarSalario(empSalario, dmL, 15);

End.
