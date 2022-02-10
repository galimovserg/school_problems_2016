unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    Button1: TButton;
    idhtp1: TIdHTTP;
      mmo1:TMemo;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

  TMyThread = class(TThread)
    private
    { Private declarations }
    ii:Integer;
    mm:TIdHTTP;
    s:WideString;
   // str:TMemo;
  protected
    procedure Execute; override;
    procedure UpdateCaption;
  end;

var
  Form1: TForm1;
  MyThread: TMyThread;
    i:Integer;
implementation

{$R *.dfm}

procedure TMyThread.UpdateCaption;

begin
 Form1.mmo1.Text:=s;
 Form1.Caption:=IntToStr(ii);
end;

procedure TMyThread.Execute;

begin

  while True do
   begin
     
       s:=Form1.idhtp1.Get('http://sergalru.esy.es/cursorpos.in');

      ii:=ii+1;
     Synchronize(UpdateCaption);
     sleep(50);
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  MyThread:=TMyThread.Create(false);

  MyThread.Priority:=tpNormal;
  MyThread.FreeOnTerminate:=true;
end;

end.
