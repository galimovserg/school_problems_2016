Uses Crt;
Type Mas=array [0..1000000] of Longint;
Const a: ^Mas=nil;
Var i,n: Longint;
    f: Text;
Begin
  assign(f,'in.txt');
  reset(f);
  readln(f,n);
  GetMem(a,n*SizeOf(Longint));

  for i:=0 to n-1 do read(f,a[i]);
  close(f);

  for i:=0 to n-1 do inc(a[(a[i] mod (n+1))-1],n+1);  // собственно, само решение

  assign(f,'out.txt');
  rewrite(f);
  for i:=0 to n-1 do if (trunc(a[i]/(n+1)) = 1) then write(f,i+1,' ');
  close(f);

  FreeMem(a,n*SizeOf(Longint));
  a:=nil;
End.
