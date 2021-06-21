unit cad_interation_progress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_interation, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniPanel, uniMemo, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniDateTimePicker, controllerProgress, MainModule, uniPageControl,
  Datasnap.Provider, uniFileUpload, uniBasicGrid, uniDBGrid, unmessages,
  fm_customer, fm_situation, uniHTMLMemo,fm_User, msg_form, UnFunctions;

type
  TCadInterationProgress = class(TCadInteration)
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    ctn_User: TUniContainerPanel;
  private
    { Private declarations }
    FrUser        : TFmUser;
    procedure ShowUser;
  protected
    procedure FormatScreen;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;

    //Deletar
    function ValidateDelete():boolean;Override;
    procedure Delete;Override;
    //Salvar
    function ValidateSave():boolean;Override;
    procedure Save;Override;
    function ValidateSaveBeforeAtachament():Boolean;Override;
    procedure SaveBeforeAtachament;Override;
    procedure SaveIteration;override;
    procedure SaveProgress;

  public
    { Public declarations }
  end;

var
  CadInterationProgress: TCadInterationProgress;

implementation

{$R *.dfm}

{ TCadInterationProgress }

procedure TCadInterationProgress.Delete;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      //Anexo
      self.Interation.Anexo.registro.Estabelecimento := self.Interation.Registro.Estabelecimento;
      self.Interation.Anexo.registro.Ordem           := self.Interation.Registro.Ordem;
      self.Interation.Anexo.registro.Codigo          := self.Interation.Registro.Codigo;
      self.Interation.Anexo.deletebyIteration;
      //Has Interation
      self.Interation.HasInteration.registro.Estabelecimento  := self.Interation.Registro.Estabelecimento;
      self.Interation.HasInteration.registro.Ordem            := self.Interation.Registro.Ordem;
      self.Interation.HasInteration.registro.MasterId         := self.Interation.Registro.Codigo;
      self.Interation.HasInteration.deletebyIteration;
      //Interation
      self.Interation.registro.Estabelecimento  := self.Interation.Registro.Estabelecimento;
      self.Interation.registro.Ordem            := self.Interation.Registro.Ordem;
      self.Interation.registro.Codigo           := self.Interation.Registro.Codigo;
      self.Interation.delete;
      //order

      Self.Close;
    End;
  end
  );

end;

procedure TCadInterationProgress.FormatScreen;
begin
  inherited;
  ShowUser;
end;

procedure TCadInterationProgress.Save;
begin
  inherited;
  SaveProgress;
end;

procedure TCadInterationProgress.SaveBeforeAtachament;
begin
  inherited;
  if (EditionState = 'I') then
    SaveProgress;
  //depois de salvar temos que mudar o estado de edidçao para E, evitando cadstro duplo
  EditionState := 'E';
end;

procedure TCadInterationProgress.SaveIteration;
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

procedure TCadInterationProgress.SaveProgress;
begin
  with Interation.Progress do
  Begin
    with Registro do
    Begin
      Estabelecimento   := Interation.Order.Registro.Estabelecimento ;
      Ordem             := Interation.Order.Registro.Codigo;
      Iteracao          := Interation.registro.codigo;
      Responsavel       := UMM.GInstitution.user.Registro.codigo;
      DataInicial       := DTP_Date_End.DateTime;
      DataFinal         := DTP_Date_Initial.DateTime;
    End;
  End;
  Interation.Progress.save;
end;

procedure TCadInterationProgress.SetVariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Interation.Progress.Registro.Iteracao := Interation.registro.codigo;
    Interation.Progress.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Interation.Progress.Registro.Ordem := Interation.registro.Ordem;
    Interation.Progress.getbyKey;
  End;
  inherited;
end;

procedure TCadInterationProgress.ShowData;
begin
  inherited;
  DTP_Date_Initial.DateTime :=  Interation.Progress.Registro.DataInicial;
  DTP_Date_End.DateTime :=  Interation.Progress.Registro.DataFinal;
end;

procedure TCadInterationProgress.ShowUser;
begin
  FrUser := TFmUser.Create(Self);
  FrUser.Parent := ctn_User;
  FrUser.Listar;
  FrUser.Align := alClient;
  FrUser.Show;
end;

function TCadInterationProgress.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadInterationProgress.ValidateSave: boolean;
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
                  'Campo Sittuação não informado.',
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

end;

function TCadInterationProgress.ValidateSaveBeforeAtachament: Boolean;
begin
  result := true;
  if not ValidateSave then
  Begin
    result := False;
    exit;
  End;
end;

end.
