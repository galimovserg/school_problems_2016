unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    dlgColor1: TColorDialog;
    dlgColor2: TColorDialog;
    dlgColor3: TColorDialog;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    lbl1: TLabel;
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    edt1: TEdit;
    btn7: TButton;
    edt2: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  col1,col2,col3:TColor;
  ert1,ert2,ert3:Integer;
  s:Integer;
  f:Text;
implementation

{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
begin
   if dlgColor1.Execute then begin
      shp1.Brush.Color:=dlgColor1.Color;
      col1:=dlgColor1.Color;
   end;
end;

procedure TForm3.btn2Click(Sender: TObject);
begin
  if dlgColor2.Execute then begin
      shp2.Brush.Color:=dlgColor2.Color;
      col2:=dlgColor2.Color;
   end;
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
  if dlgColor3.Execute then begin

      shp3.Brush.Color:=dlgColor3.Color;
      col3:=dlgColor3.Color;
   end;
end;

procedure TForm3.FormCreate(Sender: TObject);
var fname:string;

begin
 fname:=ExtractFileDir(Application.ExeName);
 if FileExists(fname+'\seting.inc') then begin
     AssignFile(f,fname+'\seting.inc');
     Reset(f);
     Readln(f,col1);
     Readln(f,col2);
     Readln(f,col3);
     Readln(f,ert1);
     Readln(f,ert2);
     Readln(f,ert3);
     edt1.Text:=IntToStr(ert1);
     edt2.Text:=IntToStr(ert2);
     dlgColor1.Color:=col1;
     dlgColor2.Color:=col2;
     dlgColor3.Color:=col3;
     shp1.Brush.Color:=col1;
     shp2.Brush.Color:=col2;
     shp3.Brush.Color:=col3;
     CloseFile(f);
 end;
end;

procedure TForm3.btn5Click(Sender: TObject);
var fname:string;

begin
 fname:=ExtractFileDir(Application.ExeName);

     AssignFile(f,fname+'\seting.inc');
     Rewrite(f);
     Writeln(f,col1);
     Writeln(f,col2);
     writeln(f,col3);
     ert1:=StrToInt(edt1.text);
     Writeln(f,ert1);
     ert2:=StrToInt(edt2.text);
     Writeln(f,ert2);
     writeln(f,ert3);
     CloseFile(f);

end;

end.
