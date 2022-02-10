const nmax=100;
      visit=true;
type graf=record
    p:array[1..nmax,1..nmax] of longint;
    v:array[1..nmax] of boolean;
    size:integer;
end;

var my:graf;
    nbegin,nend,i,j,summin:integer;
 
 
procedure deik(sum,point:integer);
  var i:integer;
 begin
 if sum<=summin then begin
   if not my.v[point] then
     begin
      if not(point=nend) then begin
       my.v[point]:=visit;
       for i:=1 to my.size do begin
           if my.p[point,i]<>0 then ; 
       end;
       for i:=1 to my.size do begin
           if my.p[point,i]<>0 then begin deik(sum+my.p[point,i],i); my.v[i]:=not visit;end; 
       end;
       
      end else begin
       if sum<summin then summin:=sum;
      end;
     end;
    end;
 end;

begin
    summin:=100000000;
    readln(my.size);
    for i:=1 to my.size do 
    begin
        for j:=1 to my.size do 
        begin
            read(my.p[i,j]);
        end;
        readln;
    end;
    for i:=1 to my.size do my.v[i]:=not visit;

    readln(nbegin,nend);
    deik(0,nbegin);
    writeln(summin);
end.