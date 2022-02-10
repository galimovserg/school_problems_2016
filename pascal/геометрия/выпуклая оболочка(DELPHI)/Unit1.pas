unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    btn1: TButton;
    edt1: TEdit;
    lbl1: TLabel;
    edt2: TEdit;
    lbl2: TLabel;
    mmo1: TMemo;
    lbl3: TLabel;
    mmo2: TMemo;
    lbl4: TLabel;
    pb1: TPaintBox;
    edt3: TEdit;
    lbl5: TLabel;
    btn2: TButton;
    lbl6: TLabel;
    btn3: TButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    btn4: TButton;
    btn5: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure pb1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pb1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure pb1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  const N=1000;
var
  Form1: TForm1;

var pointx,pointy:array[1..N] of integer;
m:integer;
i,t:integer;
xc,yc:Integer;
current,currentstart,z:integer;
len,cs,cso,lenmax,csmax,dx,dy:real;
p,s:real;
f:Text;
implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);

begin
  pb1.Canvas.brush.Color:=clWhite;
  pb1.Canvas.Rectangle(0,0,500,500);
  mmo1.Lines.Clear;
  mmo2.Lines.Clear;
  Randomize;

    m:= StrToInt(edt1.text);
//readln(pointx[1],pointy[1]);
current:=1;
pb1.Canvas.Font.Size:=15;
pb1.Canvas.Pen.Width:=1;
for i:=1 to m do begin
//readln(pointx[i],pointy[i]);
pointy[i]:=Random(400)+25;
pointx[i]:=Random(400)+25;
mmo2.Lines.Add(IntToStr(pointy[i])+' '+ inttostr(pointx[i]));

pb1.Canvas.font.Color:= clred;
pb1.Canvas.Ellipse(pointy[i],pointx[i],pointy[i]+8,pointx[i]+8);

if pointy[i]<pointy[current] then current:=i else
if pointy[i]=pointy[current] then if pointx[i]<pointx[current] then current:=i;
end;

currentstart:=current;
   pb1.Canvas.moveTo(pointy[currentstart],pointx[currentstart]);
   mmo1.Lines[0]:=IntToStr(pointy[currentstart])+' '+ IntToStr(pointx[currentstart]);
p:=0;
 s:=0;
dx:=-1;
dy:=0;
    z:=0;
repeat
  csmax:=-2;
  lenmax:=0;
 for i:=1 to m do begin

  cs:=dx*(pointx[i]-pointx[current])+dy*(pointy[i]-pointy[current]);
  len:=sqrt(sqr(pointx[i]-pointx[current])+sqr(pointy[i]-pointy[current]));

  if (len>0.001) then begin
   cso:=cs/len;
   if cso>csmax then begin

    t:=i;
    lenmax:=len;
    csmax:=cso;
   end;
  end else cso:=-2;
 end;
 if lenmax>0 then begin
 dy:=(pointy[t]-pointy[current])/lenmax;
 dx:=(pointx[t]-pointx[current])/lenmax;
  Sleep(300);
  inc(z);
  mmo1.Lines.Add(' ');
  mmo1.Lines[z]:=IntToStr(pointy[t])+' '+ IntToStr(pointx[t]);
  pb1.Canvas.MoveTo(pointy[t],pointx[t]);
  pb1.Canvas.LineTo(pointy[current],pointx[current]);
  p:=p+lenmax;
  s:=s+(pointx[current]-pointx[currentstart])*(pointy[t]-pointy[currentstart])-(pointx[t]-pointx[currentstart])*(pointy[current]-pointy[currentstart]);
 //writeln('была  ',current,' стало ',t,' его длина  ',lenmax);
  current:=t;
  end;

 //writeln('периметр на данный момент ',p);
until current=currentstart;
 edt2.Text:=FloatToStr(p);
  edt3.Text:=FloatToStr(Abs(s)/2);

end;

procedure TForm1.btn2Click(Sender: TObject);

begin
  pb1.Canvas.brush.Color:=clWhite;
  pb1.Canvas.Rectangle(0,0,500,500);
  mmo1.Lines.Clear;
 mmo2.Lines.SaveToFile('1.txt');
  AssignFile(f,'1.txt');
  Reset(f);
  m:=mmo2.Lines.Count;
  current:=1;
  for i:=1 to m do begin
  Readln(f,pointy[i],pointx[i]) ;
    pb1.Canvas.Ellipse(pointy[i],pointx[i],pointy[i]+4,pointx[i]+4);
if pointy[i]<pointy[current] then current:=i else
if pointy[i]=pointy[current] then if pointx[i]<pointx[current] then current:=i;
    end;
    CloseFile(f);
     currentstart:=current;
   pb1.Canvas.moveTo(pointy[currentstart],pointx[currentstart]);
   mmo1.Lines[0]:=IntToStr(pointy[currentstart])+' '+ IntToStr(pointx[currentstart]);
p:=0;
 s:=0;
dx:=-1;
dy:=0;
    z:=0;
repeat
  csmax:=-2;
  lenmax:=0;
 for i:=1 to m do begin

  cs:=dx*(pointx[i]-pointx[current])+dy*(pointy[i]-pointy[current]);
  len:=sqrt(sqr(pointx[i]-pointx[current])+sqr(pointy[i]-pointy[current]));

  if (len>0.001) then begin
   cso:=cs/len;
   if cso>csmax then begin

    t:=i;
    lenmax:=len;
    csmax:=cso;
   end;
  end else cso:=-2;
 end;
 if lenmax>0 then begin
 dy:=(pointy[t]-pointy[current])/lenmax;
 dx:=(pointx[t]-pointx[current])/lenmax;
  Sleep(300);
  inc(z);
  mmo1.Lines.Add(' ');
  mmo1.Lines[z]:=IntToStr(pointy[t])+' '+ IntToStr(pointx[t]);
  pb1.Canvas.MoveTo(pointy[t],pointx[t]);
  pb1.Canvas.LineTo(pointy[current],pointx[current]);
  p:=p+lenmax;
  s:=s+(pointx[current]-pointx[currentstart])*(pointy[t]-pointy[currentstart])-(pointx[t]-pointx[currentstart])*(pointy[current]-pointy[currentstart]);
 //writeln('была  ',current,' стало ',t,' его длина  ',lenmax);
  current:=t;
  end;

 //writeln('периметр на данный момент ',p);
until current=currentstart;
 edt2.Text:=FloatToStr(p);
  edt3.Text:=FloatToStr(Abs(s)/2);
  end;


procedure TForm1.pb1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var m:TPoint;
begin
  GetCursorPos(m);
  m:=Form1.ScreenToClient(m);
   lbl6.Caption:=IntToStr(m.X)+' '+IntToStr(m.y);
end;

procedure TForm1.pb1Click(Sender: TObject);
var m:TPoint;
begin

   GetCursorPos(m);
  m:=Form1.ScreenToClient(m);
   mmo2.Lines.Add(IntToStr(m.X)+' '+IntToStr(m.y));
   pb1.Canvas.Ellipse(m.X,m.Y,m.x+4,m.Y+4);
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
mmo2.Lines.Clear;
mmo1.Lines.Clear;
pb1.Canvas.brush.Color:=clWhite;
  pb1.Canvas.Rectangle(0,0,500,500);
  edt2.Text:='0';
  edt3.Text:='0';
end;

procedure TForm1.pb1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
  var m,m2:TPoint;
begin
  GetCursorPos(m);
   GetCursorPos(m2);
    m2:=Form1.ScreenToClient(m2);
    xc:=m2.X;yc:=m2.Y;
 pm1.Popup(M.x,m.Y);
end;

procedure TForm1.btn4Click(Sender: TObject);
var
nm,i,xl,yl:Integer;
pon:array of TPoint;
begin
mmo2.Lines.SaveToFile('1.txt');
 nm:=mmo2.Lines.Count;
 SetLength(pon,nm);
AssignFile(f,'1.txt');
Reset(f);

for i:=0 to nm-1 do begin
  Readln(f,xl,yl);
  pon[i].X:=xl;
  pon[i].Y:=yl;
end;
CloseFile(f);
pb1.Canvas.Brush.Color:=clBlue;
pb1.Canvas.Polygon(pon);
     end;

procedure TForm1.btn5Click(Sender: TObject);
var
nm,i,xl,yl:Integer;
pon:array of TPoint;
begin
mmo1.Lines.SaveToFile('1.txt');
 nm:=mmo1.Lines.Count;
 SetLength(pon,nm);
AssignFile(f,'1.txt');
Reset(f);

for i:=0 to nm-1 do begin
  Readln(f,xl,yl);
  pon[i].X:=xl;
  pon[i].Y:=yl;
end;
CloseFile(f);
pb1.Canvas.Brush.Color:=clBlue;
pb1.Canvas.Polygon(pon);
     end;

end.
