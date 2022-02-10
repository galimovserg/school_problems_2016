program nod3;
var a,p,b,c,l,z,k:longint;

procedure nod(m,n:longint);
begin
if m<n then begin z:=m;k:=n; end else begin z:=n; k:=m; end;
repeat
l:=k;
k:=z;
z:=l mod k;
until z=0;
end;

begin

readln(a,b,c);

nod(a,b);
p:=(a*b) div k;
nod(c,p);
writeln('nok=',p*c/k);
end.