unit financial_payment_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniLabel, uniImage, openReports, uniImageList,
  uniScrollBox;

type
  TFinancialPaymentModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  FinancialPaymentModule: TFinancialPaymentModule;

implementation

{$R *.dfm}



{ TFinancialPaymentModule }

procedure TFinancialPaymentModule.InitVariable;
begin
  inherited;
  ModuloID := 16;
end;

end.
