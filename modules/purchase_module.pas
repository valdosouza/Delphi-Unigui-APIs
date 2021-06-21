unit purchase_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniLabel, uniImage, openReports, uniImageList,
  uniScrollBox;


type
  TPurchaseModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  PurchaseModule: TPurchaseModule;

implementation

{$R *.dfm}

uses openForms;

{ TPurchaseModule }

procedure TPurchaseModule.InitVariable;
begin
  inherited;
  ModuloID := 4;
end;

end.
