unit project_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniImageList, uniScrollBox, uniPanel;

type
  TProjectModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  ProjectModule: TProjectModule;

implementation

{$R *.dfm}

{ TProjectModule }

procedure TProjectModule.InitVariable;
begin
  inherited;
  ModuloID := 21;
end;

end.
