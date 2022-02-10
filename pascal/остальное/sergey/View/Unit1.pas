unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure SpeedButton2Click(Sender: TObject);
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

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i,j,R,G,B: integer;
    F_Name: String;
begin
  if OpenDialog1.Execute then
  BEGIN
    F_Name:=OpenDialog1.FileName;
    AssignFile(f,F_Name);
    Reset(f);
    for i:=0 to 199 do
      for j:=0 to 599 do
        begin
          read(f,R,G,B);
          Image1.Canvas.Pixels[j,i]:=RGB(R,G,B);
        end;
    CloseFile(f);
  END;
end;

end.
