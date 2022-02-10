program e1;
var a,b,d,i,z,x:int64;
begin

    readln(a);
    x:=0;
    d:=2;
    b:=a;
    z:=trunc(sqrt(a));
    while d<=z do begin
     if b mod d =0 then begin
        b:=b div d;
        if b=1 then write(d) else
        write(d,'*');
        
        x:=1;
     end else begin
     inc(d);
     
     end;
    
    end;
    if x=0 then write(a) else if b>1 then write(b);
    writeln();
   





end.
