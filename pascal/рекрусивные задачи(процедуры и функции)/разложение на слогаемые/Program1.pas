var n,t,t1:integer;
    mas:array[0..40] of byte;
fil:text;
procedure stdl(step,min,sum:byte);
var i:byte;
begin
if sum>=min then begin
for i:=min to sum do begin
mas[step]:=i;
stdl(step+1,i,sum-i);
end
end
else begin
if sum=0 then begin
for i:=1 to step-2 do write(fil,mas[i],'+');if step>2 then writeln(fil,min);
end;

end;

end;
begin
//assign(fil,'input.txt');
//reset(fil);
readln(n);
//close(fil);
assign(fil,'output.txt');
rewrite(fil);
for var i:=1 to n div 2 do begin
mas[1]:=i;
stdl(2,i,n-i);
end;
close(fil);
end.