var c1,c2,c3,d,e,i,i1,g1,g,l1,l2,l3,x,z,x1,z1,min,max,y,o:integer;
a:array[1..600,1..600]of byte;
b1:array[1..600]of longint;
a1:array[1..600]of longint;
b2:array[1..600]of longint;
a2:array[1..600]of longint;
f:text;
begin
y:=1;
o:=1;
assign(f,'xxx.txt');
reset(f);
for i:=1 to 200 do begin
for g:=1 to 600 do begin
read(f,c1,c2,c3);
if (c1=255) and (c2=255) and (c3 =255) then a[i,g]:=0 else a[i,g]:=1;
end;end;
close(f);
for i:=1 to 600 do begin
l3:=l2;l2:=0;
for g:=1 to 600 do begin
if (a[g,i]=1) and (l1=0) then begin l1:=i;l2:=l1;end;
if (a[g,i]=1) and (l1<>0) then l2:=i;
end;
if (l1<>0) and (l2=0) then begin
min:=600;
max:=0;
 for x:=l1 to l3 do begin
 for z:=1 to 600 do begin
 if (a[z,x]=1) and (z>max) then max:=z;
  if (a[z,x]=1) and (z<min) then min:=z;
  end;end;
   a1[y]:=l1;
   a2[y]:=l3;
   b1[y]:=min;
   b2[y]:=max;
   y:=y+1;
  l1:=0;end;
   end;
   writeln;
   {for i:=1 to y-1  do
    writeln (a1[i],' ',a2[i],' ',b1[i],' ',b2[i]);}
     for i:=1 to (y-1) div 2 do begin
    for x:=a1[i] to a2[i] do begin
    for x1:= a1[y-i] to a2[y-i] do begin
    for z:=b1[i] to b2[i] do begin
    for z1:= b1[y-i] to b2[y-i] do begin

    if (a[x,z]<>a[x1,z1]) and ((b2[i]-z)=(b2[y-i]-z1)) and ((a2[i]-x)=(a2[y-i]-x1)) then begin write(1); o:=0;end;end;end;end;end;end;
 assign(f,'out.txt');
 rewrite(f);
 if o=1 then write(f,'Да')else write (f,'Нет');
 close(f);

 end.