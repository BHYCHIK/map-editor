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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    isModified: Boolean;
    procedure ExitProcedure();
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ExitProcedure;
begin
  if isModified then
  begin
    mmSave.Click;
  end;
  Application.Terminate;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ExitProcedure;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  isModified := false;
end;

end.
