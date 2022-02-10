Uses crt;
Var S: array[1..20,1..20] of Char;
    i,j: Integer;
    c: Char;
begin
  Clrscr;
  TextColor(14);
  Randomize();
  For i:=1 To 20 do
    For j:=1 To 20 do
      begin
        If random(100)<30 Then S[i,j]:='#' else S[i,j]:=' ';
        GotoXY(i,j);
        Write(S[i,j]);
      end;
  TextColor(15);
  GotoXY(10,10);
  Write(chr(2));
  c:=#10;
  i:=10;
  j:=10;
  while c<>#27 do begin
                    c:=ReadKey;
                    GotoXY(i,j);
                    Write(' ');
                    Case ord(c) of
                      72: If j>1 Then If S[i,j-1]<>'#' Then j:=j-1;
                      75: If i>1 Then If S[i-1,j]<>'#' Then i:=i-1;
                      77: If i<20 Then If S[i+1,j]<>'#' Then i:=i+1;
                      80: If j<20 Then If S[i,j+1]<>'#' Then j:=j+1;
                    End;
                      GotoXY(i,j);
                      Write(chr(2));
                  end;
end.
