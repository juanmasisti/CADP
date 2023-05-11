
Program Practica7;

Type 
  str20 = string[20];
  Investigacion = Record
    nombre : str20;
    Universidad : str20;
    cantInvestig : integer;
    cantBecarios : integer;
  End;

Procedure Leer(Var inv: Investigacion);
Begin
  Writeln('Cantidad de Investigadores: ');
  readln(inv.cantInvestig);
  If (inv.cantInvestig<>0) Then
    Begin
      Writeln('Nombre del Centro de I: ');
      readln(inv.nombre);
      Writeln('Cantidad de becarios: ');
      readln(inv.cantBecarios); 
      Writeln('Universidad del Centro de I: ');
      readln(inv.Universidad);
    End;
End;

Procedure max(cantInvestigUni: integer; uni: str20; Var cantInvestigUniMax:
              integer; Var uniMax: str20 );
Begin
  If (cantInvestigUni>cantInvestigUniMax) Then
    Begin
      cantInvestigUniMax := cantInvestigUni;
      uniMax := uni;
    End;
End;

Procedure min(inv: Investigacion; Var invMin1, invMin2: Investigacion);
Begin
  If (inv.cantBecarios<invMin1.cantBecarios) Then
    Begin
      invMin2:= invMin1;
      invMin1:= inv;
    End
  Else
    If (inv.cantBecarios<invMin2.cantBecarios) Then
      Begin
        invMin2:= inv;
      End;
End;

Var 
  inv, invMin1, invMin2 : Investigacion;
  cantCentrosUni, cantInvestigUni, cantInvestigUniMax: integer;
  uni, uniMax : str20;
Begin
  leer(inv);
  uniMax:= '';
  invMin1.cantBecarios:= 9999;
  invMin2.cantBecarios:= 9999;
  While (inv.cantInvestig<>0) Do
    Begin
      cantCentrosUni := 0;
      cantInvestigUni := 0;
      uni := inv.Universidad;
      While (inv.cantInvestig<>0) And (uni=inv.Universidad) Do
        Begin
          cantCentrosUni := cantCentrosUni + 1;
          cantInvestigUni := cantInvestigUni + inv.cantInvestig;
          min(inv, invMin1, invMin2);
          leer(inv);
        End;
      max(cantInvestigUni, uni, cantInvestigUniMax, uniMax);
      Writeln('La universidad ', uni, ' tiene ', cantCentrosUni, ' centros de Investigacion');
    End;
  writeln('La universidad con mayor cantidad de investigadores es ', uniMax);
  writeln('Los centros con menor cantidad de becarios son ', invMin1.nombre, ' y ', invMin2.nombre);
End.
