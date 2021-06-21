unit employee_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniLabel, uniImage, uniImageList, uniScrollBox;

type
  TEmployeeModule = class(TBaseModule)

  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  EmployeeModule: TEmployeeModule;

implementation

{$R *.dfm}



{ TEmployeeModule }

procedure TEmployeeModule.InitVariable;
begin
  inherited;
  ModuloID := 18;
end;

end.
