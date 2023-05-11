program final2;
Type
    venta =  Record
        codigoV:integer;
        codigoP:integer;
        cant:integer;
    end;

    lista = ^nodo
    nodo = Record
        dato: venta;
        sig:lista;
    end;


procedure cargarRegistro(var r:venta);
begin
    writeln('Ingrese codigo de venta');
    readln(r.codigoV);
    if (r.codigoV <> 9999) Then
        writeln('Ingrese codigo de producto');
        readln(r.codigoP);
        writeln('Ingrese cantidad vendida');
        readln(r.cant);
end;

procedure insertarOrdenado(var L:lista; r: venta);
var ant, act, nuevo: lista;;
begin
    ant:= L;
    act:= L;
    new(nuevo);
    nuevo^.dato:= r;
    nuevo^.sig:= nil;
    while (act <> nil) and (act^.dato.codigoP>r.codigoP) do
    begin  
        ant:= act;
        act:= act^.sig;
    end;
    if (act=ant) Then   
        L:= nuevo;
    else
        ant^.sig:= nuevo;
        nuevo^.sig:= act;
end;

procedure cargarLista(var l:lista);
var r: venta;
begin
    cargarRegistro(r);
    while (r.codigoP<>9999) do 
    begin 
        insertarOrdenado(l,r);
        cargarRegistro(r);
    end;
end;

procedure procesarUnProducto(codigo: integer; var cantVendidos:integer);
begin
    while (L<>nil) do 
        if (l^.dato.codigoP = codigo) Then  
            cantVendidos:= cantVendidos+1;
        l:= l^.sig;
end;

var L:lista;
codigo:integer;
begin
    L:= nil;
    cargarLista(L);
    writeln('Ingrese codigo a buscar');
    readln(codigo);
    procesarUnProducto(codigo,0);
end.