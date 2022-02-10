const N=1000;
var pointx,pointy:array[1..N] of integer;
m:integer;
i,t,f:integer;
current,currentstart:integer;
len,cs,cso,lenmax,csmax,dx,dy:real;
p:real;
begin
readln(m);
readln(pointx[1],pointy[1]);
current:=1;
for i:=2 to m do begin
readln(pointx[i],pointy[i]);
if pointy[i]<pointy[current] then current:=i else
if pointy[i]=pointy[current] then if pointx[i]<pointx[current] then current:=i;
end;
currentstart:=current;

p:=0;
f:=0;
dx:=-1;
dy:=0;

repeat 
  csmax:=-2;
  lenmax:=0;
 for i:=1 to m do begin
  
  cs:=dx*(pointx[i]-pointx[current])+dy*(pointy[i]-pointy[current]);
  len:=sqrt(sqr(pointx[i]-pointx[current])+sqr(pointy[i]-pointy[current]));
   
  if (len>0.001) then begin
   cso:=cs/len;
   if cso>csmax then begin
   
    t:=i;
    lenmax:=len;
    csmax:=cso;
   end;
  end else cso:=-2;
 end;
 dy:=(pointy[t]-pointy[current])/lenmax;
 dx:=(pointx[t]-pointx[current])/lenmax;
 //writeln('была  ',current,' стало ',t,' его длина  ',lenmax);
 current:=t;
 
 p:=p+lenmax;
 //writeln('периметр на данный момент ',p);
until current=currentstart;
writeln(p:0:1);
end.