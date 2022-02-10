program e1;

var
  m: integer;
  s, a: real;

procedure enot2;
begin
  if m > 0 then begin
    if m mod 2 = 0 then 
    begin
      m := m div 2;
      enot2;
      s := s * s;
    end else
    begin
      m := m - 1;
      enot2;
      s := s * a;
    end;
  end;
end;


begin
  readln(a, m);
  s := 1;
  enot2;
  writeln(s);
end.