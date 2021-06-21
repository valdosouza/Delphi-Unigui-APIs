program Chamado;

uses
  {$IFDEF DEBUG}
  FastMM4 in 'D:\FastMM\FastMM4.pas',
  {$ENDIF }
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UMM: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  ControllerIteration in '..\controller\ControllerIteration.pas',
  TblIteration in '..\model\TblIteration.pas',
  base_form in 'repository\base_form.pas' {BaseForm: TUniForm},
  base_register in 'repository\base_register.pas' {BaseRegister: TUniForm},
  base_frame in 'repository\base_frame.pas' {BaseFrame: TUniFrame},
  base_search in 'repository\base_search.pas' {BaseSearch: TUniFrame},
  sea_interation in 'sea_interation.pas' {SeaInteration: TUniFrame},
  sea_iteration in 'sea_iteration.pas' {SeaIteration: TUniFrame},
  cad_interation in 'cad_interation.pas' {CadInteration: TUniForm},
  tblDskPromotion in 'D:\Gestao2016\module\tblDskPromotion.pas',
  tblDskPromotionItems in 'D:\Gestao2016\module\tblDskPromotionItems.pas',
  LoginFrm in 'LoginFrm.pas' {UniLogin: TUniLoginForm};

{$R *.res}

begin
    {$IFDEF DEBUG}
    FullDebugModeScanMemoryPoolBeforeEveryOperation := True;
    ReportMemoryLeaksOnShutdown := True;
    SuppressMessageBoxes := FAlse;
    {$ENDIF}
  Application.Initialize;
  TUniServerModule.Create(Application);
  Application.Run;

end.
