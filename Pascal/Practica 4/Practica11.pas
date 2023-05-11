
Program Practica8;

Const 
  tam = 200;

Type 
  str20 = string[20];
  fotoPropertie = Record
    titulo: str20;
    autor: str20;
    like: integer;
    clics: integer;
    comentarios: integer;
  End;
  fotos = array[1..tam] Of fotoPropertie;

Procedure cargarVector(Var foto: fotos);

Var 
  i: integer;
  reg: fotoPropertie;
Begin
  writeln('Ingrese las publicaciones.');
  For i:= 1 To tam Do
    Begin
      leer(reg);
      foto[i] := reg;
    End;
End;

Procedure leer(Var reg: fotoPropertie);
Begin
  writeln('Titulo de la foto: ');
  readln(reg.titulo);
  writeln('Autor de la foto: ');
  readln(reg.autor);
  writeln('Cantidad de likes: ');
  readln(reg.like);
  writeln('Cantidad de Clics: ');
  readln(reg.clics);
  writeln('Cantidad de comentarios: ');
  readln(reg.comentarios);
End;


Procedure max(clics: integer; titulo: str20; Var clicsMax: integer; Var
              tituloMax: str20);
Begin
  If (clics>clicsMax) Then
    Begin
      clicsMax := clics;
      tituloMax := titulo;
    End
End;

Function autorFoto(autor: str20): boolean;
Begin
  autorFoto := autor ='Art Vandelay';
End;

Var 
  foto: fotos;
  i, clicsMax, mgVandelay: integer;
  tituloMax: str20;
Begin
  clicsMax := -9999;
  mgVandelay := 0;
  cargarVector(foto);
  For i:= 1 To tam Do
    Begin
      max(foto[i].clics, foto[i].titulo, clicsMax, tituloMax);
      If (autorFoto(foto[i].autor)) Then
        mgVandelay := mgVandelay + foto[i].like;
      writeln('La foto de titulo ', foto[i].titulo, ' tiene ', foto[i].
              comentarios, ' comentarios')
    End;
  writeln('El titulo de la foto con mas clics es ', tituloMax);
  writeln('La cantidad de MG en las fotos de Art Vandelay son ', mgVandelay);
End.
