unit estrategic_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniImageList, uniScrollBox, uniPanel;

type
  TEstrategicModule = class(TBaseModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitVariable;Override;
  end;

var
  EstrategicModule: TEstrategicModule;

implementation

{$R *.dfm}

{ TEstrategicModule }

procedure TEstrategicModule.InitVariable;
begin
  inherited;
  ModuloID := 23;
end;

end.
