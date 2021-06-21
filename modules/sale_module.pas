unit sale_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniLabel, uniImage, uniImageList, uniScrollBox;

type
  TSaleModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  SaleModule: TSaleModule;

implementation

{$R *.dfm}



{ TSaleModule }

procedure TSaleModule.InitVariable;
begin
  inherited;
  ModuloID := 5;
end;

end.
