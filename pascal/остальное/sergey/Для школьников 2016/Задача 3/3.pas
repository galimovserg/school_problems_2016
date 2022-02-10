Var a,b: Longint;
    f: Text;
Begin
  assign(f,'in.txt');
  reset(f);
  b:=0;
  while not eof(f) do
  begin
    read(f,a); write(a,' ');
    if not eof(f) then b:= b xor a;
  end;
  close(f);

  assign(f,'out.txt');
  rewrite(f);
  write(f,b);
  close(f);
End.