program stepen;

var
  a, b, x, sm: real;
  n, m, st: longint;

procedure enot2;
begin
  if st > 0 then begin
    if st mod 2 = 0 then
    begin
      st := st div 2;enot2; sm := sm * sm;
    end else begin st := st - 1; enot2;sm := sm * a end;
  end;
end;

begin
  readln(b);
  readln(m, n);
  a := 1;
  repeat
    sm := 1;
    st := n;
    enot2;
    x := (b / sm - 1) / n;
    a := x + a;
  until abs(x) < 0.00000000001;
  sm := 1;
  st := abs(m);
  enot2;
  if m < 0 then 
    writeln(1 / sm:13:13) else writeln(sm:13:13);   
end.