program MapEditor;

uses
  Forms,
  form in 'form.pas' {MainForm},
  newfile in 'newfile.pas' {NewMapForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TNewMapForm, NewMapForm);
  Application.Run;
end.
