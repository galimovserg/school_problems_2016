unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Math;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
Var i,j,n,m,mm,k,min_N: integer;
    kk,min: Real;
    s,ss: String;
begin
  ss:=Edit1.Text;
  mm:=Length(ss);
  min:=1E+10;

  n:=Memo1.Lines.Count;
  for i:=1 to n do
  begin
    kk:=0;
    s:=Memo1.Lines[i-1];
    m:=Length(s);
    if m>mm then k:=m else k:=mm;
    for j:=1 to k do
      if j>mm Then kk:=kk+power(abs(ord(s[j])),0.125)
        else begin if j>m Then kk:=kk+power(abs(ord(ss[j])),0.125)
                     else kk:=kk+power(abs(ord(s[j])-ord(ss[j])),0.125);
             end;
  if kk<min then begin
                   min:=kk;
                   min_N:=i;              
                 end;
  end;
  ShowMessage(Memo1.Lines[min_N-1]);
end;

end.
