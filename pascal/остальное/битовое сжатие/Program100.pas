//������ ��������� ������� ���������� "�������� ������"
//��������: ������� ��������� ����� ����������� � �������?
//���� ������ � �������������� ������� �� ����������� 8 ����, ����� ����� -1.
//����������� ��������� �� ��������� 1 ����
const n=1000000001;
var mas2:array[0..n] of byte;//�������� ������
    mad:array[0..255,0..7] of boolean;//������� �������� 1(��� ������)
    mad2:array[0..255,0..7] of byte;//������� �������� 2(��� ������)
  
    zdiv,zmod:int64;
    
    i,mn,count:int64;

procedure deltes();
 var i,j,m:int64;
     step:array[0..7] of byte;//������� 2-��
 begin
{//�� ���� ����������
 for i:=1 to n do 
   mas2[i]:=0;}  
 for i:=0 to 255 do 
  for j:=0 to 7 do   mad[i,j]:=false;
 //����������� ������� ����� ����� �� ����������� �� 1 ���� ���
 step[0]:=1;
 for j:=1 to 7 do
   step[j]:=step[j-1]*2;
 for i:=0 to 255 do begin
  for j:=0 to 7 do begin
  if i+step[j]<256 then
    mad2[i,j]:=i+step[j];
  end;
 end;
 //����� ����� �������� ������� �������� ����� � �������� �������
 for i:=0 to 255 do begin
   m:=i;
   for j:=0 to 7 do begin
    if m mod 2=1 then
    mad[i,j]:=true;
    m:=m div 2;
   end;
 end; 
end;

//������ �������� �� �������
function reads():boolean;
 begin
  reads:=mad[mas2[zdiv],zmod];
 end;

//������ �������� � ������
procedure writes();
 begin
   mas2[zdiv]:=mad2[mas2[zdiv],zmod];
 end;
begin
  deltes;//���������� ������� 
  writeln('ok');
  count:=0;
  read(mn);
  while not(mn=-1) do begin
  //���� ����� ��� ������ �� ����������� ������� count � �������� ��� ������� ����
   zmod:=(mn and 7); zdiv:=mn -zmod;
   if reads()=false then begin 
   inc(count);
   writes(); end;
   read(mn);
  end;
 
  writeln(count);
end.