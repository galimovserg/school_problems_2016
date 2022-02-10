    var s,p,a,x,y,k,l:real;
     n,i:integer;
    begin
      readln(a,n);
      l:=a;
      x:=4/3;
      y:=4/9;
      k:=3/4;
      s:=1;
      for i:=1 to n do begin
         l:=l*x;
         k:=k*y;
         s:=s+k;
      end;
      writeln(l*3);
      writeln(s*a*a*sqrt(3)/4)
    end.