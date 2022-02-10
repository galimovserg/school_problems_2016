program perewod;

var
  a, i: int64;
  l: string;

procedure wri(t, i: longint);
var b: int64;
begin
  if t > 0 then begin
    b := t mod i;
    wri(t div i, i);
    if b < 10 then l := l + chr(b + 48) else l := l + chr(b + 55);
  end;
end;

begin
  readln(a);
  readln(i);
  wri(a, i);
  writeln(l);
end.