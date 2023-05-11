
Program Practica13;

Const 
  dF = 3600;

Type 
  str20 = string[20];
  usuInfo = Record
    email: str20;
    rol: 1..4;
    revista: str20;
    cantDias: integer;
  End;
  usuario = array[1..dF] Of usuInfo;
  rol = array[1..4] Of integer;
  lista = ^nodo;
  economica = Record
    cantDias: integer;
    email: str20;
  End;
  nodo = Record
    dato: economica;
    sig: lista;
  End;

Procedure insertarOrdenado(Var L: lista; cantDias: integer; email: str20);

Var 
  nuevo, act, ant: lista;
Begin
  new(nuevo);
  nuevo^.dato.cantDias := cantDias;
  nuevo^.dato.email := email;
  nuevo^.sig := Nil;
  act := L;
  ant := L;
  While (act<>Nil) And  (act^.dato.cantDias<cantDias) Do
    Begin
      ant := act;
      act := act^.sig;
    End;
  If (ant = act) Then
    L := nuevo
  Else
    ant^.sig := nuevo;
  nuevo^.sig := act;
End;

Procedure analizarLista(L: lista);
Begin
  While (L<>Nil) Do
    Begin
      writeln('El usuario ', L^.dato.email, ' no entra hace ', L^.dato.cantDias,' dias.');
      L := L^.sig;
    End;
End;

Procedure inicializarArreglo(A: rol);

Var 
  i: integer;
Begin
  For I:= 1 To 4 Do
    A[i] := 0;
End;

Procedure max(dias: integer; email: str20; Var cant1, cant2: integer; Var usu1,
              usu2: str20);
Begin
  If (dias>cant1) Then
    Begin
      cant2 := cant1;
      cant1 := dias;
      usu2 := usu1;
      usu1 := email;
    End
  Else If (dias>cant2) Then
         Begin
           cant2 := dias;
           usu2 := email;
         End;
End;

Var 
  usuarios: usuario;
  roles: rol;
  pri: lista;
  i, cantDiasMax1, cantDiasMax2: integer;
  usuMax1, usuMax2: str20;
Begin
  cantDiasMax1 := -9999;
  cantDiasMax2 := -9999;
  // Se dispone cargarArreglo(usuarios);
  pri := Nil;
  inicializarArreglo(roles);
  For i:= 1 To dF Do
    Begin
      If (usuarios[i].revista = 'Economica') Then
        insertarOrdenado(pri, usuarios[i].cantDias, usuarios[i].email);
      analizarLista(pri);
      max(usuarios[i].cantDias, usuarios[i].email, cantDiasMax1, cantDiasMax2, usuMax1, usuMax2);
      roles[usuarios[i].rol] := roles[usuarios[i].rol] + 1;
    End;
  For i:= 1 To 4 Do
    writeln('La cantidad de usuarios en el rol ', i, ' son ', roles[i]);
  writeln('Los dos usuarios que hace mas tiempo no ingresan son ', usuMax1,' y ', usuMax2);
End.
