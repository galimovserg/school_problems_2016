var
    mas2:array[1..1000000] of longint;
    mas:array[1..1000009]of boolean;
    i,j,len,count,nk:longint;
    a,b,nm,m,nz:int64;
    label 1;

function prst():boolean;

    label gids;

   begin
    nm:=trunc(sqrt(m));
    j:=2;
       while mas2[j]<=nm do begin
        if m mod mas2[j]=0 then
        begin
         prst:=false; goto gids
        end;
        inc(j);
       end;
   prst:=true;
   gids:
   end;
 begin

    readln(a,b);


    mas2[1]:=1; mas[1]:=true;
    mas2[2]:=2; mas[2]:=true;
    len:=2;
    for i:=3 to trunc(sqrt(b))+1 do begin
     m:=i;
     if prst=true then begin
      inc(len);mas[i]:=true;
      mas2[len]:=i; end;


   end;
   nz:=b;
   nk:=1;
   while nz>0 do begin
    nz:=nz div 2;
    inc(nk);
   end;
   count:=0;

   for i:=2 to len do begin
     nm:=mas2[i];
     for j:=2 to nk do begin
      nm:=nm*mas2[i];
      if nm>b then begin  goto 1; end else
      if (nm>=a) then begin
       m:=j+1; if mas[j+1]=true then begin inc(count);end;
      end;
     end;
     1:
   end;
  writeln(b-a+1-count)

end.
