unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus;

type
  TForm1 = class(TForm)
    btn1: TButton;
    btn2: TButton;
    mm1: TMainMenu;
    menu1: TMenuItem;
    testconst1: TMenuItem;
    Exit1: TMenuItem;
    help1: TMenuItem;
    help2: TMenuItem;
    about1: TMenuItem;
    lbl1: TLabel;
    dict1: TMenuItem;
    cbb1: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
