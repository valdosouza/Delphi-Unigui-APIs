unit bank_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniLabel,
  uniImage, uniGUIBaseClasses, uniGUIClasses, uniPanel, uniImageList,
  uniScrollBox;

type
  TBankModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  BankModule: TBankModule;

implementation

{$R *.dfm}

uses openForms;

{ TBankModule }

procedure TBankModule.InitVariable;
begin
  inherited;
  ModuloID := 15;
end;

end.
