
Program Practica6.pas;

Type 
  str20 = string[20];
  Microprocesador = Record
    marca: str20;
    linea: str20;
    cantCores: integer;
    relojGhz: real;
    tamanoNm: real;
  End;
  max14nm = Record
    marca: str20;
    cantProce14nm: integer;
  End;

Procedure leer(Var micro: Microprocesador);
Begin
  writeln('Colocar la cantidad de Cores: ');
  readln(micro.cantCores);
  If (micro.cantCores<>0) Then
    Begin
      writeln('Marca del Microprocesador: ');
      readln(micro.marca);
      writeln('Linea del Microprocesador: ');
      readln(micro.linea);
      writeln('Reloj en Gigaherzios: ');
      readln(micro.relojGhz);
      writeln('Tamaño en Nanometros: ');
      readln(micro.tamanoNm);
    End;
End;

Function DosCore22nm(micro: Microprocesador): boolean;
Begin
  DosCore22nm := (micro.cantCores>2) And (micro.tamanoNm<=22);
End;

Function intelAMDEspecifico(micro: Microprocesador): boolean;
Begin
  intelAMDEspecifico := ((micro.marca= 'Intel') Or (micro.marca= 'AMD')) And (
                        micro.cantCores>1) And (micro.relojGhz>=2);
End;

Procedure max(proce14nm: integer; marca: str20; Var max14nm1, max14nm2: max14nm)
;
Begin
  If (proce14nm>max14nm1.cantProce14nm) Then
    Begin
      max14nm2.cantProce14nm := max14nm1.cantProce14nm;
      max14nm1.cantProce14nm := proce14nm;
      max14nm2.marca := max14nm1.marca;
      max14nm1.marca := marca;
    End
  Else
    If (proce14nm>max14nm2.cantProce14nm) Then
      Begin
        max14nm2.cantProce14nm := proce14nm;
        max14nm2.marca := marca;
      End;
End;

Var 
  micro: Microprocesador;
  max14nm1, max14nm2: max14nm;
  marca: str20;
  proce14nm, intelAMD: integer;
Begin
  leer(micro);
  max14nm1.cantProce14nm := 0;
  max14nm2.cantProce14nm := 0;
  max14nm1.marca := '';
  max14nm2.marca := '';
  intelAMD := 0;
  While (micro.cantCores<>0) Do
    Begin
      marca := micro.marca;
      proce14nm := 0;
      While (micro.cantCores<>0) And (marca=micro.marca) Do
        Begin
          If (DosCore22nm(micro)) Then
            writeln('El micropocesador de marca ', micro.marca, ' y linea ',
                    micro.linea,
                    ' tiene mas de 2 Nucleos y a lo sumo un tamañano de 22nm');
          If (intelAMDEspecifico(micro)) Then
            intelAMD := intelAMD + 1;
          If (micro.tamanoNm=14) Then
            proce14nm := proce14nm + 1;
          leer(micro);
        End;
      max(proce14nm, marca, max14nm1, max14nm2);
    End;
  writeln(
'Las dos marcas con mayor cantidad de procesadores con transitores de 14nm son: '
          , max14nm1.marca, ' y ', max14nm2.marca);
  writeln(
'La Cantidad de procesadores multicore de Intel o AMD, cuyos relojes alcanzan velocidades de al menos 2 Ghz son: '
          , intelAMD);
End.
