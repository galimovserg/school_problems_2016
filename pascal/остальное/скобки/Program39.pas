program scb;
var n,i,c:integer;
s:array of char;
ch:char;
begin
readln(n);
c:=1;
setlength(s,n+1);
read(s[1]);
for i:=1 to n-1 do begin
read(ch);
if ((ch=')') and (s[c]='('))or((ch='}') and (s[c]='{'))or((ch=']') and (s[c]='[')) then begin
c:=c-1;

end else begin c:=c+1;s[c]:=ch;if (ch=')')or (ch='}') or (ch=']') then break;  end;
end;
if c=0 then
writeln('Yes') else writeln('No')
end.