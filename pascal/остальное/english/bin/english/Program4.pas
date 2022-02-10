var str:array[1..40,1..2] of string;
s:string;
i,count:integer;
tex:text;
begin
assignfile(tex,'1.txt');
reset(tex);
while not eof(tex) do begin
i:=i+1;
readln(tex,str[i,1]);
readln(tex,str[i,2]);
end;
repeat
randomize;
i:=random(35)+1;
writeln(str[i,1]);
readln(s);
until not(s=str[i,2]);
writeln('false');
closefile(tex);
end.