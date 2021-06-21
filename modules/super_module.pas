unit super_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  base_module, uniGUIBaseClasses,uniGUIApplication,
  uniGUIClasses, uniPanel, uniLabel, uniImage,
  REST.Json,System.Json,
  Datasnap.DSServer, Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter,
   prm_rep_order, uniHTMLFrame,  uniButton, uniMultiItem,
  uniBitBtn, uniGUIAbstractClasses, uniGUITypes, uniGUIFrame, MainModule,
  System.Actions, Vcl.ActnList, uniImageList, uniSpeedButton, uniScrollBox,
  tas_financial_bills_general, Vcl.StdCtrls, Vcl.Buttons;

type
  TSuperModule = class(TBaseModule)
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;

  public
    { Public declarations }

  end;

var
  SuperModule: TSuperModule;

implementation

{$R *.dfm}

uses tblInterface, Main;



{ TSuperModule }


{ TSuperModule }

procedure TSuperModule.InitVariable;
begin
  inherited;
  ModuloID := 2;
end;

end.
