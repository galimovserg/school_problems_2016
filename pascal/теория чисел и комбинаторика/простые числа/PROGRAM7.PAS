  program deel;
 var z,n,s,i,t,l,k:int64;
    x:byte;
   
  label 1;
 begin
 readln(z,t);
 
  s:=1;k:=1;l:=1;
      x:=0;
     for n:=z to t do begin
      
     for i:=2 to trunc(sqrt(n)) do begin
       if n mod i =0 then goto 1;
     end;
     
     writeln(n*k*l);  k:=n; l:=n*k;
     x:=1;
     1:
     end;
     if x=0 then writeln('Absent');
 end.
