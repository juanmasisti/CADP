
Program Practica5_A;

Var 
  caramelos: integer;
  clientes: integer;
Begin
  Writeln('Ingresar la cantidad de caramelos:');
  Readln(caramelos);
  Writeln('Ingresar la cantidad de clientes:');
  Readln(clientes);
  Writeln('Caramelos por cliente: ', caramelos Div clientes,
          ' Caramelos sobrantes: ', caramelos Mod clientes);
End.
