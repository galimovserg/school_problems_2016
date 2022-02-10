{ Разработать алгоритм уменьшения шумовой составляющей на отсканированных
  изображениях документов. Документ имеет правое, левое и нижнее поля размером
  не менее, чем 100 точек. }

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    OpenDialog1: TOpenDialog;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Img1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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
  F_Name: String;    // имя файла
  a: array[0..255,0..255,0..255] of longint;  // массив оттенков
  h,w: integer;      // высота и ширина изображения
  nR,nG,nB: integer; // оттенок с максимальной встречаемостью
  MD,First: Boolean;
  SL: pByteArray;    // для использования Scanline
  x0,y0,xx,yy: integer;

implementation

procedure Noise_1;  // убирает шумовые точки на основе введенной области
var i,j,k,ii,jj,R,G,B: integer;
    SLV: pByteArray;
begin
  for ii:=y0 to yy do
    begin //*****
      SLV:=BitMap.ScanLine[ii];
      jj:=x0*3;
      while jj<xx*3-1 do
      BEGIN
        B:=SLV[jj];
        G:=SLV[jj+1];
        R:=SLV[jj+2];
        If (R<>255) or (G<>255) or (B<>255) then  // пропускаем белые точки
        For i:=0 To h-1 do   // заменяем белым цветом встретившийся оттенок
          begin
            SL:=BitMap.ScanLine[i];
            j:=0;
            While j<3*w-1 do
              begin
                if (SL[j]=B) and (SL[j+1]=G) and (SL[j+2]=R) then
                  begin
                    SL[j]:=255; SL[j+1]:=255; SL[j+2]:=255;
                  end;
                j:=j+3;
              end;
          end;
        jj:=jj+3;
      END;
    end; //*****
  Img1.Canvas.Draw(0,0,BitMap);

  // теперь надо обновить массив <a>, т.к. изменилось исходное изображение
  // обнуляем массив оттенков
  for i:=0 to 255 do
  for j:=0 to 255 do
  for k:=0 to 255 do a[i,j,k]:=0;

  // подсчитываем количество отдельных оттенков
  For i:=0 To h-1 do
  begin
    SL:=BitMap.ScanLine[i];
    j:=0;
    While j<3*w-1 do
    begin
      inc(a[SL[j],SL[j+1],SL[j+2]]);
      j:=j+3;
    end;
  end;
end;

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
var i,j,k: integer;
begin
  if OpenDialog1.Execute then
    begin
      If First=false then
        begin
          Img1.Free;
          BitMap.Free;
        end;
      F_Name:=OpenDialog1.FileName;
      BitMap:=TBitMap.Create;
      BitMap.PixelFormat:=pf24bit;
      BitMap.LoadFromFile(F_Name);
      h:=BitMap.Height;
      w:=BitMap.Width;
      Img1:=TImage.Create(Form1.ScrollBox1);
      Img1.Parent:=Form1.ScrollBox1;
      Img1.OnMouseDown:=Img1MouseDown;
      Img1.OnMouseMove:=Img1MouseMove;
      Img1.OnMouseUp:=Img1MouseUp;
      Img1.Height:=h;
      Img1.Width:=w;
      Img1.Canvas.Draw(0,0,BitMap);
      Img1.Canvas.Pen.Mode:=pmNot;
      Img1.Canvas.Brush.Style:=bsClear;
      Img1.Canvas.Pen.Style:=psDash;

      // обнуляем массив оттенков
      for i:=0 to 255 do
      for j:=0 to 255 do
      for k:=0 to 255 do a[i,j,k]:=0;

      // подсчитываем количество отдельных оттенков
      For i:=0 To h-1 do
      begin
        SL:=BitMap.ScanLine[i];
        j:=0;
        While j<3*w-1 do
        begin
          inc(a[SL[j],SL[j+1],SL[j+2]]);
          j:=j+3;
        end;
      end;
      First:=false;
    end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var i,j,k,kk,kkk: integer;
    max: longint;
begin
  kkk:=UpDown1.Position;
  for kk:=1 to kkk do
  BEGIN
  max:=a[0,0,0];
  for i:=0 to 255 do
    for j:=0 to 255 do
      for k:=0 to 255 do
        if a[i,j,k]>max then
          begin
            max:=a[i,j,k];
            nB:=i; nG:=j; nR:=k;
          end;

  For i:=0 To h-1 do  // заменяем белым цветом максимально встречающийся оттенок
    begin
      SL:=BitMap.ScanLine[i];
      j:=0;
      While j<3*w-1 do
        begin
          if (SL[j]=nB) and (SL[j+1]=nG) and (SL[j+2]=nR) then
            begin
              SL[j]:=255; SL[j+1]:=255; SL[j+2]:=255;
            end;
          j:=j+3;
        end;
    end;
  Img1.Canvas.Draw(0,0,BitMap);
  a[nB,nG,nR]:=0;  // обнуляем оттенок, который заменили белым цветом
  END;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  First:=true;
  MD:=false;
end;

procedure TForm1.Img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if MD=false then
  begin
    MD:=true;
    x0:=x; y0:=y; xx:=x; yy:=y;
  end;
end;

procedure TForm1.Img1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if (SpeedButton3.Down=true) and (MD=true) then
    begin
      Img1.Canvas.Rectangle(x0,y0,xx,yy);
      Img1.Canvas.Rectangle(x0,y0,x,y);
      xx:=x; yy:=y;
    end;
end;

procedure TForm1.Img1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if MD=true then
  begin
    Img1.Canvas.Rectangle(x0,y0,xx,yy);
    Noise_1;
    MD:=false;
  end;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Img1.Picture.SaveToFile(ExtractFileDir(Application.ExeName)+'\new.bmp');
end;

end.
