program nod1;
var m,n,nod,z:longint;
begin
 readln(m,n);
 if m<n then begin z:=m;m:=n;n:=z; end;
 z:=m;
 while (m>0)and(n>0) do begin
 if m>n then m:=m-n else n:=n-m;
 
 end;
 write(abs(m-n));
end.