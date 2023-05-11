program final1
Type
    participante = Record
        dni: integer;
        nombre: string;
        apellido: string;
        categoria: 1..5;
        fechaI:string;
    end;
    lista =^nodo;
    nodo = Record
    dato: participante;
    sig:lista;  
    end;    

    vectorParticipantes = array[1..5000] of participante; // se dispone
    vectorContador = array [1..5] of integer;

procedure cargarVector(var v: vectorParticipantes; var dimL:integer); // Se dispone

procedure inicializarVector(var vc: vectorContador);
var i: integer;
begin
    for i:= 1 to 5 do 
        vc[i]:= 0;
end;

procedure procesarVector (var vc: vectorContador; v: vectorParticipantes; var l:lista; dimL:integer);
var i: integer;
begin
    for i:= 1 to dimL do
        vc[v[i].categoria]:=vc[v[i].categoria]+1;
    
    for i:= 1 to dimL do 
        if (vc[v[i].categoria]>=50) Then
            agregarAdelante(l,v[i]);
end;

procedure agregarAdelante(var l:lista; p: participante);
var aux:lista;
begin
    new(aux);
    aux^.dato:= p;
    aux^.sig= nil;
    if (l<>nil) Then
        l:= aux;
    else
    begin
        aux^.sig:= l;
        l:=aux;
    end;
end;

var l: lista;
v: vectorParticipantes;
vc: vectorContador;
dimL:integer
begin
    L:= nil;
    dimL:=0;
    cargarVector(v,dimL); // Se dispone
    inicializarVector(vc);
    procesarVector(vc,v,l,dimL);
end.