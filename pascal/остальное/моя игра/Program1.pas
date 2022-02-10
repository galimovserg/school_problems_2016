program my_game;//��� ����
//��������� ������� ������� ������
uses
  graphabc ;//���������� ����������

type
  serg = 0..4;

var
  mass: array[,] of serg;//������ ������ ��� ����� ��������� ���� ����
  i, j, n, r, count, maxcount, f, play: integer;//��������
  ni, nj, gi, gj, z: integer;//����������, ���������� � �������� �������
  cr, cg, cb, cs: byte;
  s, namel: string;
  
  sound: system.Media.SoundPlayer;
  fail: TextFile;
  col: array[0..6] of color;//�����

label 1, 2;
procedure key(asa: integer);
begin
  if asa = vk_f1 then if play = 1 then begin f := -f; end;
  if asa = VK_ESCAPE then begin CloseWindow; end;
end;

procedure MouseDown(x, y, m: integer);//������� ������� ������ ����
var
  y1, x1: integer;
begin
        //��� ������ ��������� �������
  y1 := y div r;
  x1 := x div r;
  if play = 1 then 
    if (x1 < n + 1) and (x1 > 0) and (y1 < n + 1) and (y1 > 0) then begin//�������� ��� ������� �� ������� �� ������� ����
      if mass[x1, y1] = 0 then begin//���� ����� �� ������ ������ ����� ������� ������ 
        mass[x1, y1] := 1;
        count := count + 1;
        brush.Color := col[1];
        FillRect(x1 * r, y1 * r, x1 * r + r, y1 * r + r);
      end else if mass[x1, y1] = 1 then begin
        mass[x1, y1] := 0;
        count := count + 1;
        brush.Color := col[0];
        Rectangle(x1 * r, y1 * r, x1 * r + r, y1 * r + r);        
      end; end else begin end;
end;

begin
  OnKeyDown := Key;
  //���������
  Assign(fail, 'bin/seting.txt');Reset(fail);
  //�������� ������� � �������������
  Readln(fail, s);Readln(fail, z);
  //������ ������ ��������
  Readln(fail, s);Readln(fail, r);
  //����
  Readln(fail, s);Readln(fail, cs);
  //�����
  Readln(fail, s);Readln(fail, cr, cg, cb);col[0] := RGB(cr, cg, cb);//���� ���������� ������������
  Readln(fail, s);Readln(fail, cr, cg, cb);col[1] := RGB(cr, cg, cb);//���� ������� �����
  Readln(fail, s);Readln(fail, cr, cg, cb);col[2] := RGB(cr, cg, cb);//���� ����������
  Readln(fail, s);Readln(fail, cr, cg, cb);col[3] := RGB(cr, cg, cb);//���� ���� 
  Readln(fail, s);Readln(fail, cr, cg, cb);col[4] := RGB(cr, cg, cb);//���� �������
  Readln(fail, s);Readln(fail, cr, cg, cb);col[5] := RGB(cr, cg, cb);//���� ������
  Readln(fail, s);Readln(fail, cr, cg, cb);col[6] := RGB(cr, cg, cb);//���� ���� � ����
  Close(fail);
  brush.Color := RGB(253, 253, 253);
  2:
  pen.Mode := 1;
  Font.Size := r div 2;
  Font.Color := col[5];
  textout(1, 1, '������� ��� ������ �� 1 �� 9 ��� �� a �� z(���� ������ ����� �� ������� 0)');
  Readln(namel);
  if namel = 'speed' then begin
    Readln(z);
    goto 2;
  end else
  if namel = 'size' then begin
    Readln(r);
    goto 2;
  end else
  if namel = 'sound' then begin
    Readln(cs);
    goto 2;
  end else
  if not (namel = '0') then begin
    //�������� ������ �� ����� ������ � ���������� ����
    Assign(fail, 'bin/' + namel + '.lv');Reset(fail);
    Readln(fail, n);//������ ������ ������� (����)
    SetLength(mass, n + 2, n + 2);//������������ ������
    window.Height := n * r + 2 * r;
    window.Width := (n + 10) * r;
    Brush.Hatch := bhPercent90;
    Brush.Style := bsHatch;
    Brush.Color := col[6];
    Rectangle(0, 0, 1360, 990);
    Brush.Style := bsSolid;
    
    for j := 1 to n do 
    begin
      readln(fail, s);//��������� �������
      for i := 1 to n do 
      begin
        case s[i] of //������ ����
          '0': begin mass[i, j] := 0; brush.Color := col[0]; Rectangle(i * r, j * r, i * r + r, j * r + r); end;//0-��������� ���������
          '1': begin mass[i, j] := 1; brush.Color := col[1]; FillRect(i * r, j * r, i * r + r, j * r + r); end;//1-������� �����
          '2': begin mass[i, j] := 2; brush.Color := col[2]; FillRect(i * r, j * r, i * r + r, j * r + r); end;//2-����������
          '3': begin mass[i, j] := 3; brush.Color := col[3]; FillRect(i * r, j * r, i * r + r, j * r + r); end;//3- ����
        end;
      end;
    end;
    Readln(fail, maxcount);
    Readln(fail, ni, nj);
    Close(fail);//��������� ����
    
    Font.Size := r div 2;
    brush.Color := col[0];
    TextOut((n + 2) * r, r, '��������� �������');
    TextOut(r, (n + 1) * r, '������� ��� ����� ������ ����� ��� �������� � ������');
    brush.Color := col[1]; 
    TextOut((n + 2) * r, r + r, '������� �����');
    brush.Color := col[2];
    TextOut((n + 2) * r, 3 * r, '����������');
    brush.Color := col[3];
    TextOut((n + 2) * r, 4 * r, '����');
    f := 1;
    play := 1;
    i := ni;j := nj;gj := 1;gi := 1;//��������� ���������
    if cs = 1 then begin
      sound := new system.Media.SoundPlayer;
      sound.SoundLocation := 'bin/1.wav';//��������� ����
      sound.PlayLooping;//�������� ������������� ����
    end;
    OnMouseDown := MouseDown;SetSmoothingOn;//������ �������� ����� MouseDown � OnMouseDown
    while not (mass[i, j] = 3) do 
    begin//�������� ���� 
      if f = 1 then begin
        brush.Color := col[mass[i, j]];
        Rectangle(i * r, j * r, i * r + r, j * r + r);
        j := j + gj;
        i := i + gi;
        
        brush.Color := col[4];
        FillRect(i * r, j * r, i * r + r, j * r + r);
        sleep(z);//��������
        1:
        if (mass[i + gi, j] = 1) or (mass[i + gi, j] = 2) then begin gi := -1 * gi;system.Console.Beep(1500, 100);goto 1; end;
        if (mass[i, j + gj] = 1) or (mass[i, j + gj] = 2) then begin gj := -1 * gj;system.Console.Beep(2000, 100);goto 1; end;
        if (mass[i + gi, j + gj] = 1) or (mass[i + gi, j + gj] = 2) then begin gi := -1 * gi;gj := -1 * gj;goto 1;  end;
      end; end;
    if cs = 1 then begin
      sound.Stop;//��������� ������� ������
      sound := new system.Media.SoundPlayer;
      sound.SoundLocation := 'bin/2.wav';//��������� ����
      sound.Play;//�������� ������������� ����
    end;
    graphabc.ClearWindow;//������� ������
    Font.Size := r;
    brush.Color := RGB(253, 253, 253); 
    TextOut((n div 2) * r, (n div 2) * r, '��� ����= ' + count);
    TextOut((n div 2) * r, (n div 2) * r + r + r, '������= ' + maxcount);
    count := 0;
    play := 0;
    goto 2;
  end;
  
  CloseWindow;//�������� ������������ ����
end.