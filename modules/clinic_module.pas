unit clinic_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniImageList, uniScrollBox, uniPanel;

type
  TClinicModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  ClinicModule: TClinicModule;

implementation

{$R *.dfm}

{ TClinicModule }

procedure TClinicModule.InitVariable;
begin
  inherited;
  ModuloID := 23;

end;

end.
