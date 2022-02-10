unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Img1: TImage;
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
    begin
      If First=false then
        begin
          Img1.Free;
          BitMap.Free;
        end;
      F_Name:=OpenDialog1.FileName;
      AssignFile(f,F_Name);
      Reset(f);
      read(f,w,h);
      BitMap:=TBitMap.Create;
      BitMap.PixelFormat:=pf24bit;
      BitMap.Height:=h;
      BitMap.Width:=w;
      for i:=0 to h-1 do
        for j:=0 to w-1 do
          begin
            read(f,R,G,B);
            BitMap.Canvas.Pixels[j,i]:=RGB(R,G,B);
          end;
      Img1:=TImage.Create(Form1.ScrollBox1);
      Img1.Parent:=Form1.ScrollBox1;
      Img1.Height:=h;
      Img1.Width:=w;
      Img1.Canvas.Draw(0,0,BitMap);
      First:=false;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  First:=true;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  if First=False then Img1.Picture.SaveToFile(ExtractFileDir(Application.ExeName)+'\new.bmp')
     else MessageDLG('Файл не выбран',mtInformation,[mbOk],0);
end;

end.
