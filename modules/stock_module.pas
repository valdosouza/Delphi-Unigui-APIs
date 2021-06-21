unit stock_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniLabel, uniImage, uniEdit, openReports,
  uniImageList, uniScrollBox;

type
  TStockModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  StockModule: TStockModule;

implementation

{$R *.dfm}

uses openForms;


{ TStockModule }

procedure TStockModule.InitVariable;
begin
  inherited;
    ModuloID := 7;
end;

end.
