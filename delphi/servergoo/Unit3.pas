unit Unit3;

interface

uses
  Classes,IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  MyThread = class(TThread)
  private
    { Private declarations }
  protected
   
    procedure Execute; override;
  end;

implementation

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure MyThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ MyThread }

procedure MyThread.Execute;
begin
  { Place thread code here }
end;

end.
 