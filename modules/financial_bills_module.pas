unit financial_bills_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniLabel, uniImage, openReports, uniImageList,
  uniScrollBox;

type
  TFinancialBillsModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  FinancialBillsModule: TFinancialBillsModule;

implementation

{$R *.dfm}



{ TFinancialBillsModule }

procedure TFinancialBillsModule.InitVariable;
begin
  inherited;
  ModuloID := 17;
end;

end.
