Uses crt;
Var S: array[1..20,1..20] of Char;
    i,j,x,y,Bomba: Integer;
    c,old_c: Char;

procedure MONSTR;
var a: Integer;
begin
  GotoXY(x,y);
  Write(' ');
  a:=random(4);
  Case a of
    0: If x<20 Then If S[x+1,y]<>'#' Then x:=x+1;
    1: If x>1  Then If S[x-1,y]<>'#' Then x:=x-1;
    2: If y>1  Then If S[x,y-1]<>'#' Then y:=y-1;
    3: If y<20 Then If S[x,y+1]<>'#' Then y:=y+1;
  End; {Case}
  S[x,y]:=' ';
  TextColor(9);
  GotoXY(x,y);
  Write(chr(4));
  TextColor(15);
  Delay(100);
end;

begin
  Clrscr;
  Randomize();
  For i:=1 To 20 do
    For j:=1 To 20 do
      begin
        If random(100)<30 Then S[i,j]:='#' else S[i,j]:=' ';
        If random(100)<3 Then S[i,j]:='Г';
        If S[i,j]='Г' Then TextColor(11) else TextColor(14);
        GotoXY(i,j);
        Write(S[i,j]);
      end;
  TextColor(15);
  GotoXY(10,10);
  Write(chr(2));
  c:=#10; i:=10; j:=10; S[10,10]:=' ';
    TextColor(9);
    x:=20; y:=20;
    GotoXY(x,y);
    Write(chr(4));
    TextColor(15);
  Bomba:=10;
  GotoXY(25,2);
  Write('Гранат: ',Bomba);
  while c<>#27 do begin
                    while Not KeyPressed do MONSTR;
                    c:=ReadKey;
                    GotoXY(i,j);
                    Write(' ');
                    Case ord(c) of
                      72: If j>1 Then If S[i,j-1]<>'#' Then j:=j-1;
                      75: If i>1 Then If S[i-1,j]<>'#' Then i:=i-1;
                      77: If i<20 Then If S[i+1,j]<>'#' Then i:=i+1;
                      80: If j<20 Then If S[i,j+1]<>'#' Then j:=j+1;
                      32: If Bomba>0 Then
                          begin {----------------------------------}
                            Bomba:=Bomba-1;
                            GotoXY(25,2);
                            Write('Гранат: ',Bomba,'  ');
                            Case ord(old_c) of
                              72: If j>1 Then begin
                                                S[i,j-1]:=' ';
                                                GotoXY(i,j-1);
                                                Write(' ');
                                              end;
                              75: If i>1 Then begin
                                                S[i-1,j]:=' ';
                                                GotoXY(i-1,j);
                                                Write(' ');
                                              end;
                              77: If i<20 Then begin
                                                 S[i+1,j]:=' ';
                                                 GotoXY(i+1,j);
                                                 Write(' ');
                                               end;
                              80: If j<20 Then begin
                                                 S[i,j+1]:=' ';
                                                 GotoXY(i,j+1);
                                                 Write(' ');
                                               end;
                            End; {Case}
                          end; {-----------------------------------}
                    End; {Case}
                      If S[i,j]='Г' Then begin
                                           Bomba:=Bomba+5;
                                           S[i,j]:=' ';
                                           GotoXY(25,2);
                                           Write('Гранат: ',Bomba,'  ');
                                         end;
                      GotoXY(i,j);
                      Write(chr(2));
                      old_c:=c;
                  end;
end.
