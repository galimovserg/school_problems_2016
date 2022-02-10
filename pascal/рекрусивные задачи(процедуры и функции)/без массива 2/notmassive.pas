var
  n, x1: integer;
Z:BYTE;
procedure sthet(x1: integer);
begin
  readLN(x1);
  if not (X1 = 0) then begin
    n := n - 1;
    sthet(x1);
    IF TRUNC(SQRT(X1))=SQRT(X1)THEN BEGIN
  write(x1,' ');Z:=1;END;
  end;
  
end;

begin
  sthet(x1);
  IF Z=0 THEN WRITE('0');
end.