unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniEdit,
  uniButton, uniLabel, uniBitBtn, uniPanel,  uniMainMenu,
  uniGUIVars, uniGUIApplication,  uniSpeedButton,
  uniImageList, uniTreeView, DBXDataSnap, Data.DBXCommon, IPPeerClient,
  System.Actions,  Data.DB, Data.SqlExpr, uniScrollBox,
  uniStatusBar,   uniImage,pngimage,
   uniRadioGroup, uniPageControl,  BaseController,
   tblmodule, uniMultiItem, uniListBox, uniHTMLFrame,
  System.JSON, Data.DBXJSON,
   uniMemo,
   Vcl.ActnList, uniTimer ;

type

  TMainForm = class(TUniForm)
    pnl_modules: TUniPanel;
    Scb_Modules: TUniScrollBox;
    Container: TUniContainerPanel;
    sb_Status: TUniStatusBar;
    SQLConnect: TSQLConnection;
    actlstModule: TActionList;
    ActModSair: TAction;
    ActModSuper: TAction;
    ActModSistema: TAction;
    ActModMidia: TAction;
    ActModCompras: TAction;
    ActModVendas: TAction;
    ActModAutoCenter: TAction;
    ActModEstoque: TAction;
    ActModExtintor: TAction;
    ActModFabrica: TAction;
    ActModMetalurgica: TAction;
    ActModPizzaria: TAction;
    ActModCRM: TAction;
    ActModCaixa: TAction;
    ActModBancario: TAction;
    ActModContasPagar: TAction;
    ActModContasReceber: TAction;
    ActModPessoal: TAction;
    ActModComissao: TAction;
    ActModConstrucao: TAction;
    ActModProjeto: TAction;
    ActModDashboard: TAction;
    uImg32: TUniImageList;
    tm_Session: TUniTimer;
    Btn_TestArea: TUniBitBtn;
    ActModClinic: TAction;
    procedure formatScreen;
    procedure UniFormShow(Sender: TObject);
    procedure ActModSairExecute(Sender: TObject);
    procedure ActModSuperExecute(Sender: TObject);
    procedure ActModSistemaExecute(Sender: TObject);
    procedure ActModComprasExecute(Sender: TObject);
    procedure ActModVendasExecute(Sender: TObject);
    procedure ActModAutoCenterExecute(Sender: TObject);
    procedure ActModEstoqueExecute(Sender: TObject);
    procedure ActModMidiaExecute(Sender: TObject);
    procedure ActModExtintorExecute(Sender: TObject);
    procedure ActModCaixaExecute(Sender: TObject);
    procedure ActModBancarioExecute(Sender: TObject);
    procedure ActModContasPagarExecute(Sender: TObject);
    procedure ActModContasReceberExecute(Sender: TObject);
    procedure ActModPessoalExecute(Sender: TObject);
    procedure ActModConstrucaoExecute(Sender: TObject);
    procedure ActModProjetoExecute(Sender: TObject);
    procedure Btn_TestAreaClick(Sender: TObject);
    procedure ActModClinicExecute(Sender: TObject);
    procedure ActModPizzariaExecute(Sender: TObject);
  private
    { Private declarations }
    function createPanel(pModule : TModule):TUniPanel;
    procedure createLabel(pPanel:TwinControl;pModule : TModule);
    procedure createImage(pPanel:TwinControl;pModule : TModule);
    procedure createBitBTN(pPanel:TwinControl;pModule : TModule);
    procedure CloseModuleOpen;
    procedure ShowModules;
  public
    { Public declarations }

  end;

function MainForm: TMainForm;

implementation

uses
  base_module,
  UnFunctions,
  ControllerAddress,
  ControllerModule,
  openForms, MainModule;


{$R *.dfm}

function MainForm: TMainForm;
begin
  Result := TMainForm(UMM.GetFormInstance(TMainForm));
end;

procedure TMainForm.CloseModuleOpen;
Var
  I : Integer;
  Comp : TComponent;
Begin
  for I := 0 to Container.ComponentCount - 1 do
  begin
    Comp := Container.Components[I];
    FreeAndNil(Comp);
  end;

  for I := 0 to Scb_Modules.ComponentCount - 1 do
  begin
    if (Scb_Modules.Components[I].ClassName = 'TUniPanel') then
      TUniPanel(Scb_Modules.Components[I]).Enabled := True;
  end;

end;

procedure TMainForm.createBitBTN(pPanel:TwinControl;pModule: TModule);
var
  LcBotao : TUniBitBtn;
begin
  LcBotao := TUniBitBtn.Create(pPanel);
  with LcBotao do
  Begin
    parent := pPanel;
    Align := alClient;
    Caption := '';
    Name        := pModule.NomeTecnico;
    tag := pModule.Codigo;
    LcBotao.Action := pPanel.Action;
//    if Trim(pModule.AcaoBotao)<>'' then
//      OnClick := TAction(LocalizaComponentePorNome(Self,TAction,pModule.AcaoBotao,0)).OnExecute;
    ClientEvents.ExtEvents.Add(
      'added=function added(sender, container, pos, eOpts){sender.addCls(''BotaoBranco'');}'
      );
  End;
end;


procedure TMainForm.createImage(pPanel: TwinControl; pModule: TModule);
Var
  LcImg : TUniImage;
  P : TPngImage;
begin
  try
    P := TPngImage.Create;
    LcImg := TUniImage.create(pPanel);
    LcImg.Parent := pPanel;
    LcImg.Height := 32;
    LcImg.Width := 32;
    LcImg.Top := 4;
    LcImg.Left := 4;
    uImg32.GetPng(pModule.ImagemIndex, P);
    LcImg.Picture.Graphic.Assign(P);
    tag := pModule.Codigo;
    LcImg.Action := pPanel.Action;
//    if Trim(pModule.AcaoBotao)<>'' then
//      LcImg.OnClick := TAction(LocalizaComponentePorNome(Self,TAction,pModule.AcaoBotao,0)).OnExecute;
  finally
    P.Free;
  end;
end;

procedure TMainForm.createLabel(pPanel: TwinControl; pModule: TModule);
Var
  LcLAbel : TUniLabel;
begin
  LcLAbel := TUniLabel.Create(pPanel);
  LcLAbel.Parent := pPanel;
  LcLAbel.Top := 14;
  LcLAbel.Left := 41;
  LcLAbel.Caption := pModule.Descricao;
  LcLAbel.Font.Style := [fsBold];
  LcLAbel.Font.Size := 8;
  tag := pModule.Codigo;
  LcLAbel.Action := pPanel.Action;
end;

function TMainForm.createPanel(pModule: TModule): TUniPanel;
Var
  LcNamePanel : String;
begin
  Result := TUniPanel.Create(Scb_Modules);
  with Result do
  BEgin
    Parent := Scb_Modules;
    Align := alTop;
    BorderStyle := ubsDefault;
    Alignment := taLeftJustify;
    Height := 41;
    LcNamePanel := concat('pnl_modulo_',pModule.Codigo.ToString);
    Name := LcNamePanel;
    BorderStyle := ubsNone;
    if Trim(pModule.AcaoBotao)<>'' then
      Result.OnClick := TAction(LocalizaComponentePorNome(Self,TAction,pModule.AcaoBotao,0)).OnExecute;

  End;

end;

procedure TMainForm.ShowModules;
Var
  I,J:Integer;
  lcCtlmodule :TControllerModule;
  LcTblModule : TModule;
  Img  : TComponent;
  LcPanel : TUniPanel;
begin
  //Botão Padrão
  try
    lcCtlmodule  := TControllerModule.Create(nil);
    lcCtlmodule.getUsedList(UMM.GInstitution.registro.Codigo);
    for I := 0 to lcCtlmodule.Lista.Count - 1 do
    Begin
      LcPanel := createPanel(lcCtlmodule.Lista[I]);
      createBitBTN(LcPanel,lcCtlmodule.Lista[I]);
      createImage(LcPanel,lcCtlmodule.Lista[I]);
      createLabel(LcPanel,lcCtlmodule.Lista[I]);
    End;
  finally
    lcCtlmodule.DisposeOf;
  end;
end;

procedure TMainForm.formatScreen;
begin
  {$IFDEF DEBUG}
    Btn_TestArea.Visible := True;
  {$ENDIF}
  ShowModules;
  sb_Status.Panels[0].Text := concat('Data Atual: ', DateToStr(Date));
  sb_Status.Panels[1].Text := 'Versão: 2.019 - Gestão Web';
  sb_Status.Panels[2].Text := concat('Usuário: ', UniApplication.Cookies.Values['_email']);
  sb_Status.Panels[3].Text := concat('Empresa: ' + UniApplication.Cookies.Values['_empresa']);
end;

procedure TMainForm.ActModCaixaExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openCashierModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModClinicExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openClinicModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModContasPagarExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openFinancialPaymentModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModAutoCenterExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openAutoCenter(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModBancarioExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openBankModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModComprasExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openPurchaseModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModConstrucaoExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openBuilderModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModContasReceberExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openFinancialBillsModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModEstoqueExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openStockModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModExtintorExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openExtintorModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModMidiaExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openMidiaModule(Container);
  finally
    self.HideMask;
  end;

end;

procedure TMainForm.ActModPessoalExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openEmployeeModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModPizzariaExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openPizzariaModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModProjetoExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openProjectModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModSairExecute(Sender: TObject);
begin
  UniApplication.Cookies.SetCookie('_loginname','',Date-1);
  UniApplication.Cookies.SetCookie('_pwd','',Date-1);
  UniApplication.Restart;
end;

procedure TMainForm.ActModSistemaExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openAdmModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModSuperExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openSuperModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.ActModVendasExecute(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    TUniBitBtn(Sender).Enabled := False;
    openSaleModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.Btn_TestAreaClick(Sender: TObject);
begin
  try
    Self.showMask('Montando o Módulo...');
    UniSession.Synchronize();
    CloseModuleOpen;
    openTestModule(Container);
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
  FormatScreen;
  {$IFDEF DEBUG}
    openTestModule(Container);
  {$Else}
    case UMM.GInstitution.Registro.Codigo of
      1 :openSuperModule(Container);     //Setes
      16 :openMidiaModule(Container);    //Merconeti
      6475 :openClinicModule(Container); //Clinica
      16350 :openPizzariaModule(Container); //Pizzaria
      6820 :openPizzariaModule(Container); //Pizzaria
    else
      openAdmModule(Container);//Geral
    end;

  {$ENDIF}
end;


initialization
  RegisterAppFormClass(TMainForm);
end.
