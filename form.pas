unit form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Menus, ExtCtrls, newfile;

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
    procedure mmExitClick(Sender: TObject);
    procedure mmOpenClick(Sender: TObject);
    procedure pbMapPaint(Sender: TObject);
    procedure mmSaveClick(Sender: TObject);
    procedure mmNewClick(Sender: TObject);
  private
    isModified: Boolean;
    map: TBitmap;
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
  map.Free;
  Application.Terminate;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ExitProcedure;
end;


procedure TMainForm.FormCreate(Sender: TObject);
begin
  map := TBitMap.Create;
  isModified := false;
end;

procedure TMainForm.mmExitClick(Sender: TObject);
begin
  ExitProcedure;
end;

procedure TMainForm.mmNewClick(Sender: TObject);
begin
  if newfile.NewMapForm.ShowModal = mrOk then
  begin
    pbmap.Left := 0;
    pbmap.Top := 0;
    map.Width := newfile.NewMapForm.seWidth.Value;
    map.Height := newfile.NewMapForm.seLength.Value;
    pbMap.Width := map.Width;
    pbMap.Height := map.Height;
    map.Canvas.Brush.Color := RGB(255, 255, 255);
    map.Canvas.Brush.Style := bsSolid;
    map.Canvas.Rectangle(-1, -1, map.Height + 2, map.Width + 2);
  end;
end;

procedure TMainForm.mmOpenClick(Sender: TObject);
begin
  if odOpenMap.Execute then
  begin
    map.LoadFromFile(odOpenMap.FileName);
    pbMap.Width := map.Width;
    pbmap.Height := map.Height;
    pbMap.Left := 0;
    pbMap.Top := 0;
    isModified := false;
  end;

end;

procedure TMainForm.mmSaveClick(Sender: TObject);
begin
  if sdSaveRawFile.Execute then
  begin
    map.SaveToFile(sdSaveRawFile.FileName);
    isModified := false;
  end;
end;

procedure TMainForm.pbMapPaint(Sender: TObject);
begin
  pbMap.Canvas.Draw(0,0, map);
end;

end.
