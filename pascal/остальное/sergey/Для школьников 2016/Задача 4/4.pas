var a,b: array[0..30] of integer;
    i,j,n,m,s,count: integer;
    st: string;
    f,ff: Text;
begin
  assign(f,'in.txt');
  reset(f);
  readln(f,n);
  for i:=0 to n-1 do read(f,b[i]);
  close(f);

  count:=0;
  assign(f,'out1.txt');
  rewrite(f);
  
  for m:=1 to n-1 do
  begin
    for i:=0 to m do a[i]:=i; {�������������� ��������� � ������}
    while i>0 do
    begin
      i:=m; s:=0;
      for j:=1 to m do s:=s+b[a[j]-1]; {������� �����}
      if s=0 then begin  {����� = 0, - ���������� ������� � ����}
                    writeln(f,''); writeln(f,'');
                    inc(count);
                    for j:=1 to m do write(f,b[a[j]-1],'  '); 
                  end;
      while a[i]=n-m+i do dec(i); {���� ������� ��� ���������� ���������}
                                  {(� ������� �����)}
      inc(a[i]);
      for j:=i+1 to m do a[j]:=a[j-1]+1;  {�������� ������ ����� ���������}
    end;
  end;
  close(f);
  
  assign(f,'out.txt');
  assign(ff,'out1.txt');
  rewrite(f);
  reset(ff);
  writeln(f,count);  {���������� ���������� ���� � ������ �����}
  readln(ff,st);
  while not eof(ff) do
  begin
    readln(ff,st);
    writeln(f,st);
  end;
  close(f);
  close(ff);
  erase(ff);
end.