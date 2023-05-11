program p;
var 
a,b,c: integer;

procedure calcular(b:integer; var a: integer);
begin
    c:= c+b;
    a:= (b+c)*5;
    b:= (a+b) MOD 10;
    writeln(a,' ',b,' ',c);
end;

begin
    a:= 15;
    b:= 20;
    c:= b-a;
    calcular(a,c);
    writeln(a,' ',b,' ',c);
end.