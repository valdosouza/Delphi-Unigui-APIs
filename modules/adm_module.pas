unit adm_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_module, uniGUIBaseClasses,BaseController,
  uniGUIClasses, uniPanel, uniLabel, Vcl.Imaging.pngimage, uniImage, uniEdit,
  uniMemo, uniButton, Main,ClientProxy, prm_nfe, base_impressao,uniGUIApplication,
  openReports, MainModule, uniBitBtn, uniSpeedButton, uniImageList, uniToolBar,
  uniMenuButton, Vcl.Menus, uniMainMenu, System.Actions, Vcl.ActnList,
  uniScrollBox;

type
  TAdmModule = class(TBaseModule)
  private
    { Private declarations }

  protected
    procedure InitVariable;Override;
  public
    { Public declarations }
  end;

var
  AdmModule: TAdmModule;

implementation

{$R *.dfm}

uses openForms;

{ TAdmModule }

procedure TAdmModule.InitVariable;
begin
  inherited;
  ModuloID := 3;
end;

end.
