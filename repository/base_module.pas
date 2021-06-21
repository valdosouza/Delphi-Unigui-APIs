unit base_module;

interface

uses
  Winapi.Windows, Messages, Variants, Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Dialogs, System.SysUtils,uniGUIApplication,
  uniGUITypes, uniGUIAbstractClasses, uniGUIClasses, uniGUIFrame, uniPanel,
  uniGUIBaseClasses, uniImage,uniBitBtn, uniImageList, uniScrollBox,tblinterface,
  uniHTMLFrame,
  BaseController,  uniToolBar, System.Actions, Vcl.ActnList,
  ControllerInterface ;

type
  TBaseModule = class(TUniFrame)
    Pnl_Module: TUniPanel;
    Pnl_Cadastros: TUniPanel;
    Pnl_Tarefas: TUniPanel;
    Pnl_Relatorios: TUniPanel;
    uImg16: TUniImageList;
    uImg32: TUniImageList;
    ScB_Cadastros: TUniScrollBox;
    ScB_Relatorios: TUniScrollBox;
    Scb_Tarefas: TUniScrollBox;
    procedure UniFrameCreate(Sender: TObject);
  private

  protected
    ModuloID : Integer;
    Inter_face : TControllerInterface;
    procedure InitVariable;Virtual;
    procedure SetVariable;Virtual;
    function createPanel(pScroll: TWincontrol; pSeq: Integer):TUniPanel;
    procedure createBitBTN(pPanel:TwinControl;pReginterface:Tinterface);
    procedure MontaCadastro;Virtual;
    procedure MontaTarefa;Virtual;
    procedure MontaRelatorio;Virtual;
  public
  end;

implementation


{$R *.dfm}

uses MainModule, super_module, sea_institution, Main, UnFunctions;




procedure TBaseModule.createBitBTN(pPanel:TwinControl;pReginterface:Tinterface);
var
  LcBotao : TUniBitBtn;
begin
  LcBotao := TUniBitBtn.Create(pPanel);
  with LcBotao do
  Begin
    parent := pPanel;
    Align := alLeft;
    IconAlign := iaTop;
    Width := 90;
    Images := uImg32;
    ImageIndex  := pReginterface.ImagemIndex;
    Caption     := pReginterface.Descricao;
    //OnClick :=  TAction(umm.actlstMenu.Actions[pReginterface.AcaoIndex]).OnExecute;
    if trim(pReginterface.AcaoBotao)<> '' then
      OnClick := TAction(LocalizaComponentePorNome(UMM, TAction,pReginterface.AcaoBotao,0)).OnExecute;

  End;
end;

function TBaseModule.createPanel(pScroll: TWincontrol; pSeq: Integer):TUniPanel;
Var
  LcNamePanel : String;
begin
  Result := TUniPanel.Create(pScroll);
  with Result do
  BEgin
    Parent := pScroll;
    Align := alTop;
    Alignment := taCenter;
    Height := 76;
    LcNamePanel := concat('Fnd_Cadastro_',pSeq.ToString);
    Name := LcNamePanel;
    BorderStyle := ubsNone;
  End;
end;

procedure TBaseModule.InitVariable;
begin
  Inter_face := TControllerInterface.create(self);;
  Pnl_Cadastros.Align := alNone;
  Pnl_Tarefas.Align := alNone;
  Pnl_Relatorios.Align := alNone;
end;

procedure TBaseModule.MontaCadastro;
Var
  LcPanel : TUniPanel;
  LcQtBotao : Integer;
  I : Integer;
  LcContador : Integer;
  LcReginterface : Tinterface;
begin
  try
    Pnl_Cadastros.Width := MainForm.Width- 180;
    LcQtBotao := Trunc((MainForm.Width- 140) / 90);
    Inter_face.getUsedList(ModuloID,'Cadastro');
    LcContador := 0;
    I := 0;
    while I <= (Inter_face.Lista.Count - 1) do
    Begin
      if LcContador = 0 then
      Begin
        LcPanel := createPanel(ScB_Cadastros,I);
      End;
      //Cria os botões conforme a largura do panel
      repeat
        LcReginterface := Tinterface.create;
        LcReginterface := Inter_face.Lista[I];
        createBitBTN(LcPanel,LcReginterface);
        inc(LcContador);
        inc(I);
      until (LcContador = LcQtBotao) or (I > (Inter_face.Lista.Count - 1)) ;
      LcContador := 0;
    End;
  except
    on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);

  end;
end;

procedure TBaseModule.MontaRelatorio;
Var
  LcPanel : TUniPanel;
  LcQtBotao : Integer;
  I : Integer;
  LcContador : Integer;
  LcReginterface : Tinterface;
begin
  Pnl_Relatorios.Width := MainForm.Width- 180;
  LcQtBotao := Trunc((MainForm.Width- 140) / 90);
  Inter_face.getUsedList(ModuloID,'Relatorio');
  LcContador := 0;
  I := 0;
  while I <= (Inter_face.Lista.Count - 1) do
  Begin
    if LcContador = 0 then
    Begin
      LcPanel := createPanel(ScB_Relatorios,I);
    End;
    //Cria os botões conforme a largura do panel
    repeat
      LcReginterface := Tinterface.create;
      LcReginterface := Inter_face.Lista[I];
      createBitBTN(LcPanel,LcReginterface);
      inc(LcContador);
      inc(I);
    until (LcContador = LcQtBotao) or (I > (Inter_face.Lista.Count - 1)) ;
    LcContador := 0;
  End;

end;

procedure TBaseModule.MontaTarefa;
Var
  LcPanel : TUniPanel;
  LcQtBotao : Integer;
  I : Integer;
  LcContador : Integer;
  LcReginterface : Tinterface;
begin
  Pnl_Tarefas.Width := MainForm.Width- 180;
  LcQtBotao := Trunc((MainForm.Width- 140) / 90);
  Inter_face.getUsedList(ModuloID,'Tarefa');
  LcContador := 0;
  I := 0;
  while I <= (Inter_face.Lista.Count - 1) do
  Begin
    if LcContador = 0 then
    Begin
      LcPanel := createPanel(Scb_Tarefas,I);
    End;
    //Cria os botões conforme a largura do panel
    repeat
      LcReginterface := Tinterface.create;
      LcReginterface := Inter_face.Lista[I];
      createBitBTN(LcPanel,LcReginterface);
      inc(LcContador);
      inc(I);
    until (LcContador = LcQtBotao) or (I > (Inter_face.Lista.Count - 1)) ;
    LcContador := 0;
  End;
end;

procedure TBaseModule.SetVariable;
begin

end;

procedure TBaseModule.UniFrameCreate(Sender: TObject);
begin
  try
    InitVariable;
    MontaCadastro;
    MontaTarefa;
    MontaRelatorio;
  except
    on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

end.
