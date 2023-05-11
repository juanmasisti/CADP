{4.- Escribir un programa que:
a. Implemente un módulo recursivo que genere un vector de 20 números enteros “random” mayores a 0 y menores a 100. 
b. Implemente un módulo recursivo que devuelva el máximo valor del vector. 
c. Implementar un módulo recursivo que devuelva la suma de los valores contenidos en el vector.}
program ej4;        
type                        
    vector=array[1..20] of integer;
procedure cargarVector(var v:vector;i:integer);
begin
    if (i<=20) then begin
    v[i]:=random(100);
    i:=i+1;
    cargarVector(v,i);
    end;
end; 

function Maximo(v:vector;max:integer;i:integer):integer;
begin
  if (i<=20) then begin 
    if (v[i]>max) then 
      max:=v[i];  
      max:=Maximo(v,max,i+1);  
  end; 
  Maximo:=max; 
end;

function sumaValores(v:vector;i:integer;sum:integer):integer;
begin   
    if (i<=20) then begin 
        sum:=sum+v[i];
        sumaValores(v,i+1,sum);
    end;   
    sumaValores:=sum; 
end;

var v:vector;
i:integer;
begin
    i:=1;
    Randomize;
    cargarVector(v,i);
    writeln('Maximo: ',Maximo(v,-1,i));
    writeln('Sumatoria: ',sumaValores(v,i,0));
    for i:= 1 to 20 do   
    writeln(v[i]);
end.                           