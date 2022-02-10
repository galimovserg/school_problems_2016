 program e;
 var a,b,zx,j,ex,itog:real;
     q,c:real;
     z,i,count,x:integer;

     function in10s(s:real):real;
        var i:byte;
         itog,zx:real;
     begin
        itog:=s;
       for i:=1 to 9 do begin
         itog:=itog+s;
       end;
        in10s:=itog;
       end;
       
     function express(x: byte): real;
     var s0,rez: real;
         i,j: byte;
     begin
       s0:=1E-10;
       rez:=s0;
       for i:=1 to 10-x do
         begin
           for j:=1 to 9 do rez:=rez+s0;
           s0:=rez;
         end;
       express:=rez;
     end;
       
 begin
   z:=0;
 readln(a,b);
 count:=-1;
 if ((a>0) and (b>0)) or ((a<0)and(b<0)) then q:=1 else q:=0-1;
  c:=b;
    while a-c>=0 do begin
      b:=c;
      c:=in10s(c);
      inc(count);
    end;
    x:=0;

    while a-b>=0 do begin
      x:=x+1;
      a:=a-b;
                    end;
    j:=1;
    for i:=1 to count do j:=in10s(j);

    itog:=j;
    q:=itog;
    for i:=1 to x-1 do itog:=itog+j;

    x:=0;

  repeat

    x:=0;
    a:=in10s(a);
    while a-b>=0 do begin
      x:=x+1;
      a:=a-b;
    end;
    z:=z+1;
      j:=express(z);
         for
 //itog:=itog+q*j*x;
    x:=0;
  until z>9;
      writeln(itog);
 end.