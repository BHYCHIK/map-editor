unit newfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin;

type
  TNewMapForm = class(TForm)
    btOK: TButton;
    btCancel: TButton;
    seLength: TSpinEdit;
    lblLength: TLabel;
    lblWidth: TLabel;
    seWidth: TSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewMapForm: TNewMapForm;

implementation

{$R *.dfm}

end.
