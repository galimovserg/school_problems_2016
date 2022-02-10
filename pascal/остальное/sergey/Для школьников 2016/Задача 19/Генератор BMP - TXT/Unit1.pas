unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, ComCtrls;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  BitMap: TBitMap;
  R,G,B,h,w: integer;
  First: Boolean;
  F_Name: String;
  f: Text;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
var i,j: integer;
begin
  if OpenDialog1.Execute then
    BEGIN
      If First=false then
        begin
          BitMap.Free;
        end;
      F_Name:=OpenDialog1.FileName;
      BitMap:=TBitMap.Create;
      BitMap.PixelFormat:=pf24bit;
      BitMap.LoadFromFile(F_Name);
      h:=BitMap.Height;
      w:=BitMap.Width;

      AssignFile(f,ExtractFileDir(Application.ExeName)+'\xxx.txt');
      Rewrite(f);
      writeln(f,w,' ',h);
      for i:=0 to h-1 do
        begin
        for j:=0 to w-1 do
          begin
            R:=GetRValue(BitMap.Canvas.Pixels[j,i]);
            G:=GetGValue(BitMap.Canvas.Pixels[j,i]);
            B:=GetBValue(BitMap.Canvas.Pixels[j,i]);
            write(f,R,' ',G,' ',B,' ');
          end;
        Form1.ProgressBar1.Position:=Trunc(100*i/(h-1));
        Application.ProcessMessages;
        end;
      CloseFile(f);
      First:=false;
    END;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  First:=true;
end;

end.
