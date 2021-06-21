program mediacotacao;

uses

  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UMM: TUniGUIMainModule},
  Mainm in 'Mainm.pas' {MainmForm: TUnimForm},
  ctrl_mob_step_advertise in 'controller\ctrl_mob_step_advertise.pas',
  step_advertise in 'controller\step_advertise.pas',
  ControllerBroadcaster in '..\..\controller\ControllerBroadcaster.pas',
  BaseController in '..\..\controller\BaseController.pas',
  tblBroadcaster in '..\..\model\tblBroadcaster.pas',
  unFunctions in 'unFunctions.pas',
  Md5 in '..\..\share\function\Md5.pas',
  tblDskPromotion in 'D:\Gestao2016\module\tblDskPromotion.pas',
  unMessages in '..\function\unMessages.pas',
  intCity in '..\..\Interface\intCity.pas',
  intMedFormats in '..\..\Interface\intMedFormats.pas',
  msg_alert in 'msg_alert.pas' {MsgAlert: TUnimForm},
  img_view in 'img_view.pas' {ImgView: TUnimForm},
  define_page_views in 'define_page_views.pas' {DefinePageViews: TUnimForm},
  tblBudgAdvertise in '..\..\model\tblBudgAdvertise.pas',
  ControllerBudgAdvertise in '..\..\controller\ControllerBudgAdvertise.pas',
  tblBudgAdvertiseImp in '..\..\model\tblBudgAdvertiseImp.pas',
  ControllerBudgAdvertiseImp in '..\..\controller\ControllerBudgAdvertiseImp.pas',
  tblBudgAdvertiseweb in '..\..\model\tblBudgAdvertiseweb.pas',
  ControllerBudgAdvertiseWeb in '..\..\controller\ControllerBudgAdvertiseWeb.pas',
  uReportMediaCC in '..\..\restClient\apiReport\uReportMediaCC.pas',
  uReportCC in '..\..\restClient\apiReport\uReportCC.pas',
  prm_rep_budg_advertise in '..\..\parameter\prm_rep_budg_advertise.pas',
  reportBudgetAdvertise in 'reportBudgetAdvertise.pas',
  uReportCM in '..\..\restClient\apiReport\uReportCM.pas' {ReportCM_old: TDataModule};

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  TUSM.Create(Application);
  Application.Run;
end.
