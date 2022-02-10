var x,x0,a,e,j: double;
    i: integer;
    f: Text;

begin
  assign(f,'in.txt');
  reset(f);
  read(f,x,e);
  close(f);
  
  x0:=1; i:=0; j:=e;
  a:=(x-x0*x0*x0)/(3*x0*x0);
  if a<0 then e:=-a else e:=a;
  while e>=1E-10 do
    begin
      x0:=x0+a; i:=i+1;
      a:=(x-x0*x0*x0)/(3*x0*x0);
      if a<0 then e:=-a else e:=a;
    end;
  
  i:=0;
  while j<1 do begin     {определяем число знаков после запятой}
                 inc(i);
                 j:=j*10;
               end;  
  assign(f,'out.txt');
  rewrite(f);
  write(f,x0:0:i);
  close(f);
end.