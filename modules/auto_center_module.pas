unit auto_center_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniLabel, uniImage, uniImageList, uniScrollBox;

type
  TAutoCenterModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  AutoCenterModule: TAutoCenterModule;

implementation

{$R *.dfm}

uses openForms;

{ TAutoCenterModule }

procedure TAutoCenterModule.InitVariable;
begin
  inherited;
  ModuloID := 6;
end;

end.
