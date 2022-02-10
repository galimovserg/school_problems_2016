unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    edt1: TEdit;
    edt2: TEdit;
    lbl1: TLabel;
    btn4: TButton;
    lbl2: TLabel;
    tmr1: TTimer;
    lbl3: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure FormClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }
    end;

var
  Form1: TForm1;
   i,j,n,m,r,x1,y1:INTEGER;
  mass:array of array of byte;
      s:string;
            fail:Text;
             mouse:TMouse;
implementation

{$R *.dfm}
  procedure sergey(x,y:integer);
begin
      if mass[x,y]=1 then begin
   mass[x,y]:=0;
     Form1.Canvas.Rectangle(x*10-10,y*10-10,x*10,y*10);
      m:=m+1;
sergey(x+1,y);
sergey(x-1,y);
sergey(x,y+1);
sergey(x,y-1);
end;
end;


procedure TForm1.btn2Click(Sender: TObject);
begin
  m:=0;
      x1:=StrToInt(edt1.Text);
      y1:=strtoint(edt2.Text);
      Canvas.Pen.Color:=RGB(20,250,25);
               Canvas.Brush.Color:= RGB(25,25,250);
sergey(x1+1,y1+1);
lbl3.Caption:=IntToStr(m);
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  AssignFile(fail,'1.txt');
  Reset(fail);
     n:=0;
     m:=0;
readln(fail,r);
SetLength(mass,r+2,r+2);
for j:=1 to r do begin
readln(fail,s);
for i:=1 to r do begin
if s[i]='.' then begin
mass[j+1,i+1]:=1;
     Canvas.Pen.Color:=RGB(250,250,250);
     Canvas.Brush.Color:= RGB(250,250,250);
     Canvas.Rectangle(j*10,i*10,j*10+10,i*10+10);


end else
begin
mass[j+1,i+1]:=0;
     Canvas.Pen.Color:=RGB(0,0,0);
     Canvas.Brush.Color:= RGB(0,0,0);
     Canvas.Rectangle(j*10,i*10,j*10+10,i*10+10);
end;
end;
end;
  CloseFile(fail);
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
tmr1.Enabled:=True;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
   n:=0;
   m:=0;
  for x1:=1 to r do begin

  for y1:=1 to r do begin
 Canvas.Pen.Color:=RGB(Random(250),Random(250),Random(250));
               Canvas.Brush.Color:= RGB(Random(250),Random(250),Random(250));
                  if mass[x1+1,y1+1]=1 then begin


               sergey(x1+1,y1+1);
                n:=n+1;

               end;
end;
end;

 Form1.lbl2.Caption:=IntToStr(n);
tmr1.Enabled:=False;
end;
procedure TForm1.FormClick(Sender: TObject);
begin
  n:=n+1;
end;

end.
