Uses crt;
Var S: array[1..20,1..20] of Char;
    M: array[1..20,1..20] of Integer;
    MM: array[1..200,1..2] of Integer;
    i,j,x,y,aa,bb,Bomba: Integer;
    c,old_c: Char;

procedure MONSTR;
begin
  If aa>=1 then
  BEGIN
    GotoXY(x,y);
    Write(' ');
    TextColor(9);
    x:=MM[bb+1,1]; y:=MM[bb+1,2];
    GotoXY(x,y);
    Write(chr(4));
    TextColor(15);
    Delay(150);
  aa:=aa-1;
  bb:=bb+1;
  If (x=i) and (y=j) Then Halt;
 END;
end;

procedure Clear;
Var x1,y1: Integer;
begin
   for x1:=1 to 20 do
     for y1:=1 to 20 do M[x1,y1]:=0;
   for x1:=1 to 200 do begin MM[x1,1]:=0; MM[x1,2]:=0; end;
end;

procedure Road;
Var k,x1,y1,x2,y2,xx,yy: Integer;
begin
  Clear;
  M[x,y]:=1;
  k:=1;
  repeat
    k:=k+1;
    for x1:=1 to 20 do
      for y1:=1 to 20 do
        if M[x1,y1]=k-1 then
        begin
          if (y1<20) and (M[x1,y1+1]=0) and (S[x1,y1+1]<>'#') then M[x1,y1+1]:=k;
          if (y1>1) and (M[x1,y1-1]=0) and (S[x1,y1-1]<>'#') then M[x1,y1-1]:=k;
          if (x1<20) and (M[x1+1,y1]=0) and (S[x1+1,y1]<>'#') then M[x1+1,y1]:=k;
          if (x1>1) and (M[x1-1,y1]=0) and (S[x1-1,y1]<>'#') then M[x1-1,y1]:=k;
        end;
  until (M[i,j]>0) or (k>400);
  k:=M[i,j]; xx:=i; yy:=j;
  aa:=k;

  While k>=1 do
  BEGIN
    For x2:=1 to 20 do
      For y2:=1 to 20 do
        If (k-M[x2,y2]=1) and (S[x2,y2]<>'#') and (abs(xx-x2)+abs(yy-y2)=1) Then
          begin
            MM[k,1]:=xx; MM[k,2]:=yy;
            xx:=x2; yy:=y2;
          end;
    k:=k-1;
  END;
  bb:=1;
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
    x:=20; y:=20; S[20,20]:=' ';
    GotoXY(x,y);
    Write(chr(4));
    TextColor(15);
  Bomba:=10;
  GotoXY(25,2);
  Write('Гранат: ',Bomba);
  while c<>#27 do begin
                    Road;
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
