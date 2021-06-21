unit builder_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniLabel, uniImage, openReports, uniImageList,
  uniScrollBox;

type
  TBuilderModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }

  end;

var
  BuilderModule: TBuilderModule;

implementation

{$R *.dfm}

uses openForms;

{ TBuilderModule }

{ TBuilderModule }

procedure TBuilderModule.InitVariable;
begin
  inherited;
  ModuloID := 20;
end;

end.
