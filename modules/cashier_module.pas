unit cashier_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniLabel, uniImage, uniImageList, uniScrollBox;

type
  TCashierModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  CashierModule: TCashierModule;

implementation

{$R *.dfm}



{ TCashierModule }

procedure TCashierModule.InitVariable;
begin
  inherited;
  ModuloID := 14;
end;

end.
