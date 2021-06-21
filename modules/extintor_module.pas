unit extintor_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniLabel, uniImage,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniImageList, uniScrollBox;

type
  TExtintorModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  ExtintorModule: TExtintorModule;

implementation

{$R *.dfm}


{ TExtintorModule }

procedure TExtintorModule.InitVariable;
begin
  inherited;
  ModuloID := 9;
end;

end.
