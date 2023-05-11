
Program Practica14;

Const 
  dmL = 1000;

Type 
  str20 = string[20];
  cod = [1..1000];
  rol = [1..5];
  devs = Record
    pais: str20;
    codigo: cod;
    nomProy: str20;
    rolProy: rol;
    cantHoras: real;
  End;
  desarrollador = array[1..dmL] Of devs;

Function argentino(pais: str20): boolean;
Begin
  argentino := (pais='Argentina');
End;

Function montoTInvertido(rolDev: rol; horas: real): real;

Var 
  dolar: real;
Begin
  Case rolDev Of 
    1: dolar := 35.20;
    2: dolar := 27.45;
    3: dolar := 31.03;
    4: dolar := 44.28;
    4: dolar := 39.87;
  End;
  montoTInvertido := dolar * horas;
End;

Function adminBD(rol: rol): boolean;
Begin
  adminBD := (rol='Administrador de bases de datos');
End;

Var 
  i: integer;
  dev: desarrollador;
Begin
  cargarVector(dev);
  //Se dispone vector
  For i:= 1 To dmL Do
    Begin
      If (argentino(dev[i].pais)) Then
        montoT := montoT + montoTInvertido(dev[i].rol, dev[i].cantHoras);
      If (adminBD(dev[i].rol)) Then
        cantHorasBD := cantHorasBD + dev[i].cantHoras;
    End;
End.
