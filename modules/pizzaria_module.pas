unit pizzaria_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniImageList, uniGUIClasses, uniScrollBox, uniPanel;

type
  TPizzariaModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  PizzariaModule: TPizzariaModule;

implementation

{$R *.dfm}

{ TPizzariaModule }

procedure TPizzariaModule.InitVariable;
begin
  inherited;
  ModuloID := 12;
end;

end.
