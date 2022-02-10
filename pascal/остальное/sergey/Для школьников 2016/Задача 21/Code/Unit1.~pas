unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SpeedButton2: TSpeedButton;
    ProgressBar1: TProgressBar;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Image: TImage;
  BitMap,BitMap_F: TBitMap;
  F_Name: String;
  L_Image, H_Image: Integer;
  OK: Boolean;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
var i,j: integer;
    f: textfile;
begin
  If OK=True then Image.Picture:=nil;
  If OpenDialog1.Execute Then
  BEGIN
    OK:=True;
    F_Name:=OpenDialog1.FileName;
    BitMap:=TBitMap.Create;
    Bitmap.PixelFormat:=pf24bit;
    BitMap.LoadFromFile(F_Name);
    L_Image:=BitMap.Width;
    H_Image:=BitMap.Height;

    BitMap_F:=TBitMap.Create;
    BitMap_F.PixelFormat:=pf24bit;
    BitMap_F.LoadFromFile(F_Name);

    Image:=TImage.Create(Form1);
    Image.Parent:=Form1.ScrollBox1;
    Image.Width:=L_Image;
    Image.Height:=H_Image;
    Image.Canvas.Draw(0,0,BitMap);

    AssignFile(f,'input.txt');
    Rewrite(f);
    writeln(f,L_Image,' ',H_Image);
    for i:=0 to H_Image-1 do
      for j:=0 to L_Image-1 do
        if Image.Canvas.Pixels[j,i]<>clwhite then
          write(f,'1') else write(f,'0');
    CloseFile(f);
  END;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Image.Free;
  BitMap.Free;
  BitMap_F.Free;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i,j,s1,s2: Integer;
    x,y,k,b,max: Double;
    S_L,S_LF: array[0..3000] of pByteArray;
    f: textfile;
begin
  max:=15;
  k:=-max;
  Image.Picture:=nil;
  For i:=0 to H_Image-1 do begin
                             S_L[i]:=BitMap.ScanLine[i];
                             S_LF[i]:=BitMap_F.ScanLine[i];
                           end;
  While k<=max do
  BEGIN
    b:=-H_Image;
    While b<=H_Image do
      begin //*****************************************
        s1:=0; s2:=0;
        x:=0;
        While x<=L_Image-1 do //смотрим, сколько точек лежат на проверяемой линии
          begin               //(общее число точек на линии и "активных" точек)
            y:=k*x+b;
            If (y>=0) and (y<=H_Image-1) then
              begin
                If (S_L[Round(y)][Round(3*x)]<>255) or
                   (S_L[Round(y)][Round(3*x+1)]<>255) or
                   (S_L[Round(y)][Round(3*x+2)]<>255) then s1:=s1+1;
                s2:=s2+1; //общее число точек на проверяемой линии
              end;
            x:=x+1;
          end;
          If s1>0.65*s2 Then //больше половины точек на линии "активные" - стираем линию...
            BeGiN //####################################
              x:=0;
              While x<=L_Image-1 do
                begin
                  y:=k*x+b;
                  If (y>=0) and (y<=H_Image-1) then
                    begin
                      S_LF[Round(y)][Round(3*x)]:=255;
                      S_LF[Round(y)][Round(3*x+1)]:=255;
                      S_LF[Round(y)][Round(3*x+2)]:=255;
                    end;
                  x:=x+1;
                end;
            EnD;  //####################################
        b:=b+0.1;
        Application.ProcessMessages;
      end;  //*****************************************
    k:=k+0.01;
    Image.Canvas.Draw(0,0,BitMap_F);
    ProgressBar1.Position:=Round(50*(k+max)/max);
  END;
  Image.Canvas.Draw(0,0,BitMap_F);

  AssignFile(f,'output.txt');
    Rewrite(f);
    writeln(f,L_Image,' ',H_Image);
    for i:=0 to H_Image-1 do
      for j:=0 to L_Image-1 do
        if Image.Canvas.Pixels[j,i]<>clwhite then
          write(f,'1') else write(f,'0');
    CloseFile(f);
  ShowMessage('OK');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.OpenDialog1.InitialDir:=ExtractFileDir(application.ExeName);
end;

end.
