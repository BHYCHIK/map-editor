unit form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Menus, ExtCtrls;

type
  TMainForm = class(TForm)
    SettingsPanel: TGroupBox;
    seRadius: TSpinEdit;
    lblRadius: TLabel;
    sePower: TSpinEdit;
    lblPower: TLabel;
    mmMenu: TMainMenu;
    mmFile: TMenuItem;
    mmSave: TMenuItem;
    mmOpen: TMenuItem;
    mmExit: TMenuItem;
    pbMap: TPaintBox;
    ScrollBox1: TScrollBox;
    lblGradient: TLabel;
    seGradient: TSpinEdit;
    mmNew: TMenuItem;
    odOpenMap: TOpenDialog;
    sdSaveRawFile: TSaveDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

end.
