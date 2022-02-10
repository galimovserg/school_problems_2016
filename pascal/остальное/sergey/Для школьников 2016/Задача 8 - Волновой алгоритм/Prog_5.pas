Uses crt;
Const n1=50; n2=20; zxa=Trunc(n1*n2/2);
Var S: array[1..n1,1..n2] of Char;
    M: array[1..n1,1..n2] of Integer;
    MM: array[1..500,1..2] of Integer;
    i,j,x,y,aa,bb,Bomba,Life: Integer;
    c,old_c: Char;

procedure MONSTR; {Отображение противника}
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
  aa:=aa-1; {Уменьшаем количество шагов (осталось сделать шагов)}
  bb:=bb+1; {Номер очередного шага}
  If (x=i) and (y=j) Then Halt; {Противник догнал игрока - выходим}
 END;
end;

procedure Clear;
Var x1,y1: Integer;
begin
   for x1:=1 to n1 do
     for y1:=1 to n2 do M[x1,y1]:=0;
   for x1:=1 to Trunc(n1*n2/2) do begin MM[x1,1]:=0; MM[x1,2]:=0; end;
end;

procedure Road; {Рассчитываем путь от противника до игрока}
Var k,x1,y1,x2,y2,xx,yy: Integer;
begin
  Clear;
  M[x,y]:=1; {x,y - первоначальные координаты расположения противника}
  k:=1;
  repeat
    k:=k+1;
    for x1:=1 to n1 do
      for y1:=1 to n2 do
        if M[x1,y1]=k-1 then
        begin
          if (y1<n2) and (M[x1,y1+1]=0) and (S[x1,y1+1]<>#177) then M[x1,y1+1]:=k;
          if (y1>1) and (M[x1,y1-1]=0) and (S[x1,y1-1]<>#177) then M[x1,y1-1]:=k;
          if (x1<n1) and (M[x1+1,y1]=0) and (S[x1+1,y1]<>#177) then M[x1+1,y1]:=k;
          if (x1>1) and (M[x1-1,y1]=0) and (S[x1-1,y1]<>#177) then M[x1-1,y1]:=k;
        end;
  until (M[i,j]>0) or (k>n1*n2);
  k:=M[i,j]; xx:=i; yy:=j;
  aa:=k;

  While k>=1 do {Формируем последовательность движения противника в массив MM}
  BEGIN
    For x2:=1 to n1 do
      For y2:=1 to n2 do {ищем, чтобы ячейки с номером шага были рядом}
        If (k-M[x2,y2]=1) and (S[x2,y2]<>#177) and (abs(xx-x2)+abs(yy-y2)=1) Then
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
  For i:=1 To n1 do {Формируем лабиринт}
    For j:=1 To n2 do
      begin
        If random(100)<30 Then S[i,j]:=#177 else S[i,j]:=' ';
        If random(100)<3 Then S[i,j]:='Г'; {Ящик с гранатами}
        If random(100)<3 Then S[i,j]:=chr(3); {Жизнь}
        If S[i,j]='Г' Then TextColor(11) else
          If S[i,j]=chr(3) Then TextColor(12) else TextColor(14);
        GotoXY(i,j);
        Write(S[i,j]);
      end;
  TextColor(15);
  GotoXY(1,1);
  Write(chr(2));
  c:=#10; i:=1; j:=1; S[1,1]:=' '; {Начальное положение игрока}
    TextColor(9);
    x:=n1; y:=n2; S[n1,n2]:=' ';   {Начальное положение противника}
    GotoXY(x,y);
    Write(chr(4));
    TextColor(15);
  Bomba:=10;
  Life:=50;
  GotoXY(n1+5,2);
  Write('Гранат: ',Bomba);
  GotoXY(n1+5,4);
  Write('Жизнь: ',Life);
  while c<>#27 do begin
                    Road; {Получаем путь от противника до игрока}
                    while Not KeyPressed do MONSTR;
                    c:=ReadKey;
                    GotoXY(i,j);
                    Write(' ');
                    Case ord(c) of
                      72: If j>1 Then If S[i,j-1]<>#177 Then begin
                                                               j:=j-1;
                                                               Life:=Life-1;
                                                             end;
                      75: If i>1 Then If S[i-1,j]<>#177 Then begin
                                                               i:=i-1;
                                                               Life:=Life-1;
                                                             end;
                      77: If i<n1 Then If S[i+1,j]<>#177 Then begin
                                                                i:=i+1;
                                                                Life:=Life-1;
                                                              end;
                      80: If j<n2 Then If S[i,j+1]<>#177 Then begin
                                                                j:=j+1;
                                                                Life:=Life-1;
                                                              end;
                      32: If Bomba>0 Then
                          begin {- взрываем стену по направлению движения -}
                            Bomba:=Bomba-1;
                            GotoXY(n1+5,2);
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
                              77: If i<n1 Then begin
                                                 S[i+1,j]:=' ';
                                                 GotoXY(i+1,j);
                                                 Write(' ');
                                               end;
                              80: If j<n2 Then begin
                                                 S[i,j+1]:=' ';
                                                 GotoXY(i,j+1);
                                                 Write(' ');
                                               end;
                            End; {Case}
                          end; {-----------------------------------}
                      115,235: begin {- ставим стену по нажатию клавиши s -}
                                 Case ord(old_c) of
                                   80: If j>1 Then begin
                                                     S[i,j-1]:=#177;
                                                     GotoXY(i,j-1);
                                                     Write(#177);
                                                   end;
                                   77: If i>1 Then begin
                                                     S[i-1,j]:=#177;
                                                     GotoXY(i-1,j);
                                                     Write(#177);
                                                   end;
                                   75: If i<n1 Then begin
                                                      S[i+1,j]:=#177;
                                                      GotoXY(i+1,j);
                                                      Write(#177);
                                                    end;
                                   72: If j<n2 Then begin
                                                      S[i,j+1]:=#177;
                                                      GotoXY(i,j+1);
                                                      Write(#177);
                                                    end;
                                 End; {Case}
                               end; {--------------------------------------}
                    End; {Case}
                      If S[i,j]='Г' Then begin
                                           Bomba:=Bomba+5;
                                           S[i,j]:=' ';
                                           GotoXY(n1+5,2);
                                           Write('Гранат: ',Bomba,'  ');
                                         end;
                      If S[i,j]=chr(3) Then begin
                                              Life:=Life+10;
                                              S[i,j]:=' ';
                                              GotoXY(n1+5,4);
                                              Write('Жизнь: ',Life,'  ');
                                            end;
                      GotoXY(i,j);
                      Write(chr(2));

                      GotoXY(n1+5,4);
                      Write('Жизнь: ',Life,'  ');

                      IF (i=n1) AND (j=n2) THEN {Выиграли}
                        BEGIN
                          For x:=1 To n1 do
                            For y:=1 To n2 do
                              begin
                                S[x,y]:=#177;
                                GotoXY(x,y);
                                write('#');
                              end;
                          ReadKey;
                          Halt;
                        END;

                      IF Life<=0 Then Halt;

                      old_c:=c;
                  end;
end.
