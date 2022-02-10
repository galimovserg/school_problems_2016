var
  n, x1: integer;

procedure sthet(x1: integer);
begin
  read(x1);
  if not (n = 1) then begin
    n := n - 1;
    sthet(x1);
  end;
  write(x1, ' ');
end;

begin
  readln(n);
  sthet(x1);
  
end.