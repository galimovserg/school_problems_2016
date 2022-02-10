Uses Crt;

Type Pixel = record
               x,y: double;
               bound: boolean;
             end;

Var a: array[1..10000] of Pixel;
    a1,a2: Pixel;
    i, j, n, k: integer;
    cos_a, x, y, x0, y0, vrem, s: double;
    f: Text;

Begin
  clrscr;
  assign(f,'d:\In.txt');
  reset(f);
  n:=0;
  while not eof(f) do
    begin
      n:=n+1;
      readln(f,a[n].x,a[n].y);
    end;
  close(f);

  k:=1; s:=0;
  for i:=2 to n do
    if a[i].x<a[k].x then k:=i;
  x:=a[k].x; x0:=x;
  y:=a[k].y; y0:=y;
  a[k].bound:=true;

  writeln('Versh:');
  writeln('  ',x:3:3,', ',y:3:3);
  a1.x:=0; a1.y:=1;
  i:=1;

  While i<=n do
    BEGIN //------------------------------------------------
      cos_a:=-2;
      for j:=1 to n do
        if ((a[j].bound=false) or ( (i>1) and (a[j].bound=true) and
                                    (a[j].x=x0) and (a[j].y=y0) ) ) then
          begin
            a2.x:=a[j].x-x;
            a2.y:=a[j].y-y;
            vrem:=(a1.x*a2.x+a1.y*a2.y)/sqrt(a2.x*a2.x+a2.y*a2.y)
                                       /sqrt(a1.x*a1.x+a1.y*a1.y);
            if vrem>cos_a then begin
                                 cos_a:=vrem;
                                 k:=j;
                               end;
          end;
      s:=s+sqrt(sqr(a[k].x-x)+sqr(a[k].y-y));
      a1.x:=a[k].x-x;
      a1.y:=a[k].y-y;
      x:=a[k].x;
      y:=a[k].y;
      a[k].bound:=true;
      writeln('  ',x:3:3,', ',y:3:3);
      i:=i+1;
      if (a[k].x=x0) and (a[k].y=y0) then i:=n+1;
    END;  //------------------------------------------------

  writeln('L= ',s:3:3);

  assign(f,'d:\Out.txt');
  rewrite(f);
  write(f,s:3:3);
  close(f);

  readln;
End.
