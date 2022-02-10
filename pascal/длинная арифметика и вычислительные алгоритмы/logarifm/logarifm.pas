var t,z,m,k,q:double;
    i:integer;
begin

write('введите основание ');
readln(t);
write('введите число ');
readln(z);

m:=0;
k:=1;
q:=1;
if t<1 then begin 
 q:=-q;
 t:=1/t;
end;
if z<1 then begin
 q:=-q;
 z:=1/z;
end;
while not(abs(z/t)=1)and not(m>1.0e+100) do begin
   if z<t then begin 
                 m:=m*2;
                 k:=k*2;
                 z:=z*z;
               end else begin
                          z:=z/t;
                          m:=m+1;
                        end;


end;
writeln('логарифм равен ',q*(m+1)/k);

readln();
end.