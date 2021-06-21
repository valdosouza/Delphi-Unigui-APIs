unit midia_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,BaseController,
  uniGUIClasses, uniPanel, uniImage, Vcl.Imaging.pngimage, uniLabel,
  uniImageList, uniScrollBox;

type
  TMidiaModule = class(TBaseModule)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  MidiaModule: TMidiaModule;

implementation

{$R *.dfm}

uses openForms;

{ TMidiaModule }

procedure TMidiaModule.InitVariable;
begin
  inherited;
  ModuloID := 8;
end;

end.
