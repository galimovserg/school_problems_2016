var x1,y1,x2,y2,x3,y3:real;
    h,s,lena,lenb,lenc,xc,xb,hmin,d:real;
begin
readln(x1,y1,x2,y2,x3,y3);
s:=abs((x2-x1)*(y3-y1)-(x3-x1)*(y2-y1));
lena:=sqrt(sqr(x3-x2)+sqr(y3-y2));
lenb:=sqrt(sqr(x2-x1)+sqr(y2-y1));
lenc:=sqrt(sqr(x3-x1)+sqr(y3-y1));
if lena>0 then begin
h:=s/lena;
xc:=sqrt(lenc*lenc-h*h);
xb:=sqrt(lenb*lenb-h*h);
if (xc>=lena) or (xb>=lena) then 
if lenb<lenc then d:=lenb else
  d:=lenc
 
else  d:=h;

end else  d:=lenc;
writeln(d);
end.