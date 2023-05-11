
Program Practica7_C;

Type 
  lista = ^nodo;

  dispositivo = Record
    version: real;
    tamano: real;
    RAM: real;
  End;

  nodo = Record
    dato: dispositivo;
    sig: lista;
  End;

Function Gb3Tam5(Ram, Pulgada: real): boolean;
Begin
  Gb3Tam5 := (Ram>3) And (Pulgada<=5);
End;
Procedure analizarLista(L: lista);

Var 
  ver, tamT: real;
  cantVer, Gb3Tam5cant, cantT: integer;
Begin
  cantVer := 0;
  Gb3Tam5cant := 0;
  tamT := 0;
  cantT := 0;
  While (L<>Nil) Do
    Begin
      ver := L^.dato.version;
      cantVer := 0;
      While (L<>Nil) And (L^.dato.version = ver) Do
        Begin
          cantVer := cantVer + 1;
          If (Gb3Tam5(L^.dato.RAM, L^.dato.tamano)) Then
            Gb3Tam5cant := Gb3Tam5cant + 1;
          tamT := tamT + L^.dato.tamano;
          cantT := cantT + 1;
          L := L^.sig;
        End;
      cantT := cantT + cantVer;
      writeln('La cantidad de dispositivos para la version ', ver, ' es ',
              cantVer);
    End;
  writeln('La cantidad de dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas son ', Gb3Tam5cant);
  writeln('El promedio de tamaño de pantalla es ', tamT/cantT:2:2);
End;

Var 
  pri: lista;
Begin
  pri := Nil;
  //cargarLista(pri); Se dispone
  analizarLista(pri);
End.
