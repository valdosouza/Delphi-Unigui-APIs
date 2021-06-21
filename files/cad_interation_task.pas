unit cad_interation_task;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_interation, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniPanel, uniMemo, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, fm_kind,
  fm_customer, fm_situation, unmessages, msg_form, UnFunctions, MainModule,
  controllerIteration, fm_Project, fm_priority, Fm_User, uniDateTimePicker,
  uniPageControl, Datasnap.Provider, uniFileUpload, uniBasicGrid, uniDBGrid,
  uniHTMLMemo  ;

type
  TCadinterationTask = class(TCadInteration)
    ctn_Kind: TUniContainerPanel;
    ctn_Project: TUniContainerPanel;
    ctn_User: TUniContainerPanel;
    ctn_priority: TUniContainerPanel;
    pnl_interacao_row_2: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
  private
    { Private declarations }
    FrKind        : TFmKind;
    FrProject     : TFmProject;
    FrPriority    : TFmPriority;
    FrUser        : TFmUser;
    procedure ShowKind;
    procedure ShowProject;
    procedure ShowPriority;
    procedure ShowUser;
  protected
    procedure FormatScreen;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure EditionControl;Override;
    //Deletar
    function ValidateDelete():boolean;Override;
    procedure Delete;Override;
    //Salvar
    function ValidateSave():boolean;Override;
    procedure Save;Override;
    function ValidateSaveBeforeAtachament():Boolean;Override;
    procedure SaveBeforeAtachament;Override;
    procedure SaveIteration;override;
    procedure SaveTask;

  public
    { Public declarations }

  end;

var
  CadinterationTask: TCadinterationTask;

implementation

{$R *.dfm}

procedure TCadinterationTask.Delete;
begin
  inherited;
end;


procedure TCadinterationTask.EditionControl;
begin
  inherited;
  EditionControler(FrKind);
  EditionControler(FrProject);
  EditionControler(FrPriority);
  EditionControler(FrUser);
end;

procedure TCadinterationTask.FormatScreen;
begin
  inherited;
  ShowKind;
  ShowProject;
  ShowPriority;
  ShowUser;
end;

procedure TCadinterationTask.Save;
begin
  inherited;
  SaveTask;
end;

procedure TCadinterationTask.SaveBeforeAtachament;
begin
  inherited;
  if (EditionState = 'I') then
    SaveTask;
  //depois de salvar temos que mudar o estado de edidçao para E, evitando cadstro duplo
  EditionState := 'E';
end;

procedure TCadinterationTask.SaveIteration;
begin
  with Interation do
  Begin
    with Registro do
    Begin
      Estabelecimento     := Order.Registro.Estabelecimento ;
      Ordem               := Order.Registro.Codigo;
      Cliente             := FrCustomer.DBLCB_Lista.KeyValue;
      Descricao           := E_Description.text;
      Detalhe             := M_Detail.text;
      Tipo                := kinditeration;//atendimento;
      Situacao            := FrSituation.DBLCB_Lista.KeyValue;
      Anexo               := '';
      Usuario             := FrUser.DBLCB_Lista.KeyValue;
    End;
  End;
  Interation.save;

end;

procedure TCadinterationTask.SaveTask;
begin
  with Interation.task do
  Begin
    with Registro do
    Begin
      Estabelecimento   := Interation.Order.Registro.Estabelecimento ;
      Ordem             := Interation.Order.Registro.Codigo;
      Iteracao          := Interation.registro.codigo;
      Projeto           := FrProject.DBLCB_Lista.KeyValue;
      Responsavel       := FrUser.DBLCB_Lista.KeyValue;
      DataInicial       := DTP_Date_End.DateTime;
      DataFinal         := DTP_Date_Initial.DateTime;
      Prioridade        := FrPriority.DBLCB_Lista.KeyValue;
      Tipo              := FrKind.DBLCB_Lista.KeyValue;

    End;
  End;
  Interation.task.save;
end;

procedure TCadinterationTask.SetVariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Interation.Task.Registro.Iteracao := Interation.registro.codigo;
    Interation.Task.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Interation.Task.Registro.Ordem := Interation.registro.Ordem;
    Interation.Task.getbyKey;
  End;
 inherited;
end;

procedure TCadinterationTask.ShowData;
begin
  inherited;
  FrKind.DBLCB_Lista.KeyValue :=  Interation.Task.Registro.Tipo;
  FrProject.DBLCB_Lista.KeyValue :=  Interation.Task.Registro.Projeto;
  FrPriority.DBLCB_Lista.KeyValue :=  Interation.Task.Registro.Prioridade;
  FrUser.DBLCB_Lista.KeyValue :=  Interation.Task.Registro.Responsavel;
  DTP_Date_Initial.DateTime :=  Interation.Task.Registro.DataInicial;
  DTP_Date_End.DateTime :=  Interation.Task.Registro.DataFinal;
end;

procedure TCadinterationTask.ShowKind;
begin
  FrKind := TFmKind.Create(Self);
  FrKind.Parent := ctn_Kind;
  FrKind.Listar;
  FrKind.Align := alClient;
  FrKind.Show;
end;


procedure TCadinterationTask.ShowPriority;
begin
  FrPriority := TFmPriority.Create(Self);
  FrPriority.Parent := ctn_Priority;
  FrPriority.Listar;
  FrPriority.Align := alClient;
  FrPriority.Show;
end;

procedure TCadinterationTask.ShowProject;
begin
  FrProject := TFmProject.Create(Self);
  FrProject.Parent := ctn_Project;
  FrProject.Listar;
  FrProject.Align := alClient;
  FrProject.Show;
end;

procedure TCadinterationTask.ShowUser;
begin
  FrUser := TFmUser.Create(Self);
  FrUser.Parent := ctn_User;
  FrUser.Listar;
  FrUser.Align := alClient;
  FrUser.Show;
end;

function TCadinterationTask.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadinterationTask.ValidateSave: boolean;
begin
  Result := True;
  if trim(FrCustomer.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Cliente não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrSituation.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Situação não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_Description.Text) = '' then
  begin
      MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
  if trim(m_Detail.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Detalhe não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrKind.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Tipo não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrProject.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Projeto não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrPriority.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Prioridade não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrUser.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Usuario não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;

function TCadinterationTask.ValidateSaveBeforeAtachament: Boolean;
begin
  result := true;
  if not ValidateSave then
  Begin
    result := False;
    exit;
  End;
end;

end.
