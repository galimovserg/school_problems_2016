unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    ComboBox2: TComboBox;
    SpeedButton2: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  f: Text;

implementation

{$R *.dfm}

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  form1.StatusBar1.Panels[0].Text:=inttostr(x)+'  '+inttostr(y);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var s: string;
    i,n,dy,dx,x,xx,y: integer;
begin
  Image1.Picture:=nil;
  s:=Edit1.Text;
  n:=length(s);
  x:=20;
  dx:=UpDown1.Position;
  dy:=UpDown2.Position;
  Image1.Canvas.Font.Size:=StrToInt(ComboBox1.Text);
  Image1.Canvas.Font.Name:=ComboBox2.Text;
  for i:=1 to n do
    begin
      y:=100-Trunc(Image1.Canvas.TextHeight(s[i])/2)+random(2*dy)-dy;
      xx:=random(dx);
      Image1.Canvas.Font.Color:=RGB(random(255),random(255),random(255));
      Image1.Canvas.TextOut(x,y,s[i]);
      x:=x+Image1.Canvas.TextWidth(s[i])+20+xx;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var i,n: integer;
begin
  randomize;
  n:=Screen.Fonts.Count;
  for i:=0 to n-1 do
    ComboBox2.Items.Add(Screen.Fonts.Strings[i]);
  ComboBox2.Text:='Times New Roman';
  image1.Canvas.Pixels[0,0]:=clwhite;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i,j,R,G,B: integer;
begin
  AssignFile(f,ExtractFileDir(Application.ExeName)+'\xxx.txt');
  Rewrite(f);
  for i:=0 to 199 do
    for j:=0 to 599 do
      begin
        R:=GetRValue(Image1.Canvas.Pixels[j,i]);
        G:=GetGValue(Image1.Canvas.Pixels[j,i]);
        B:=GetBValue(Image1.Canvas.Pixels[j,i]);
        write(f,R,' ',G,' ',B,' ');
      end;
  CloseFile(f);
end;

end.
