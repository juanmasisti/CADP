
Program Practica5.pas;

Type 
  str20 = string[20];
  Auto = Record
    marca: str20;
    modelo: str20;
    precio: real;
  End;

Procedure leer(Var aut: Auto);
Begin
  writeln('Marca del auto: ');
  readln(aut.marca);
  If (aut.marca<>'ZZZ') Then
    Begin
      writeln('Modelo del auto: ');
      readln(aut.modelo);
      writeln('Precio del auto: ');
      readln(aut.precio);
    End;
End;

Procedure max(aut: auto; Var autMax: auto);
Begin
  If (aut.precio>autMax.precio) Then
    autMax := aut;
End;

Var 
  autos, autoMax: auto;
  precioTotal: real;
  marca: str20;
  autoMarcaT: integer;
Begin
  leer(autos);
  autoMax.precio := -1;
  While (autos.marca<>'ZZZ') Do
    Begin
      precioTotal := 0;
      autoMarcaT := 0;
      marca := autos.marca;
      While (autos.marca<>'ZZZ') And (marca=autos.marca) Do
        Begin
          precioTotal := precioTotal + autos.precio;
          autoMarcaT := autoMarcaT + 1;
          max(autos,autoMax);
          leer(autos);
        End;
      writeln('El precio promedio de ', marca, ' es $', precioTotal/
              autoMarcaT:2:2);
    End;
  writeln('La marca del auto mas caro es: ', autoMax.marca,
          ' y su modelo es: ',
          autoMax.modelo);
End.
