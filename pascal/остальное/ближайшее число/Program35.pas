var mas:array[1..1001] of integer;
   n,x,i,z:integer;
    begin
    readln(n);
    for i:=1 to n do read(mas[i]);
    readln();
    readln(x);
    z:=mas[1];
    for i:=2 to n do begin
     if abs(mas[i]-x)<abs(z-x) then z:=mas[i];
    end;
    writeln(z);
    
    
    end.