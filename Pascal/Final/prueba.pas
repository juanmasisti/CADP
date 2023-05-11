program prueba;
var c: integer;

procedure calcular(var b, a: integer);
begin
    b:= 10;
    while (b>0) do begin
        a:= a+b; // a: 90 98 104 108 110
        b:=b-2; // 8  6  4  2  0
        c:= c-b; // 22 16 12 10
    end;
    writeln('a= ',a,' b= ',b,' c= ',c); // a: 110  ; b: 0 ; c: 10
end;

var a,b:integer;
begin
    b:=80;
    c:=30;
    writeln('a= ',a,' b= ',b,' c= ',c); // a: basura ; b: 80 ; c: 30
    calcular(a,b);
    writeln('a= ',a,' b= ',b,' c= ',c); // 0 ; b: 110 ; c: 10
end.