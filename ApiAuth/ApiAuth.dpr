program ApiAuth;
{$APPTYPE GUI}

uses
  {$IFDEF DEBUG}

  {$ENDIF }
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uMain in 'uMain.pas' {Main},
  uSM in 'uSM.pas' {SM: TDataModule},
  uWM in 'uWM.pas' {VM: TWebModule},
  UnFunctions in 'UnFunctions.pas',
  tblDevices in '..\model\tblDevices.pas',
  tblDskPromotion in 'd:\Gestao2016\module\tblDskPromotion.pas',
  tblDskPromotionItems in 'd:\Gestao2016\module\tblDskPromotionItems.pas',
  ControllerDevices in '..\controller\ControllerDevices.pas',
  BaseController in '..\controller\BaseController.pas',
  MainModule in 'MainModule.pas',
  UnTrataExcecao in 'UnTrataExcecao.pas',
  uAuthCM in '..\restClient\autentica\uAuthCM.pas' {AuthCM: TDataModule},
  uDataCM in '..\restClient\apiData\uDataCM.pas' {DataCM: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TAuthCM, AuthCM);
  Application.CreateForm(TDataCM, DataCM);
  Application.Run;


end.
