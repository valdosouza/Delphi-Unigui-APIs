unit cad_contact;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity, Vcl.Menus, uniMainMenu,
  uniMemo, uniPageControl, uniPanel, uniDateTimePicker, uniGUIClasses, uniEdit, fm_state,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, ControllerContact,
  uniRadioGroup,
  pes_cnpjOnLine,
  ControllerCity, ControllerState, ControllerPerson, ControllerCompany, ControllerEntity,
  Data.DB, Datasnap.DBClient, fm_entity, System.StrUtils, System.Math
  ;

type
  TCadContact = class(TCadEntity)
    UniTabSheet1: TUniTabSheet;
    Rg_CadastroAtivo: TUniRadioGroup;
    Ctn_Entity: TUniContainerPanel;
  private
    FrEntity : TfmEntity;
    procedure ShowEntity;
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;

    procedure ShowData;Override;
    procedure ShowNoData;Override;
    //Inserir
    function ValidaInsert:boolean;Override;
    procedure Insert;Override;
    //Alterar
    function ValidateChange:boolean;Override;
    procedure Change;Override;
    //Salvar
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    //Deletar
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;

  public
    Contact : TControllerContact;

    procedure SaveContact;
    procedure ShowDataContact;

  end;

var
  CadContact: TCadContact;

implementation

{$R *.dfm}

uses
  UnFunctions,
  MainModule,
  unmessages,
  msg_form,
  ClasseUtil;

{ TCadContact }

procedure TCadContact.Change;
begin
  inherited;
  E_DateRegistry.SetFocus;
end;

procedure TCadContact.Delete;
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
        Self.Contact.delete;
        Self.Close;
      End;
    end
  );
end;

procedure TCadContact.FormatScreen;
begin
  inherited;
  ShowEntity;
end;

procedure TCadContact.InitVariable;
begin
  inherited;
  Contact := TControllerContact.Create(self);
  Rg_CadastroAtivo.ItemIndex := 0;
end;

procedure TCadContact.Insert;
begin
  inherited;
  ClearAllFields;
  E_DateRegistry.SetFocus;
end;

procedure TCadContact.Save;
begin
  with Contact do
  Begin
    saveEntity(Entidade);
    SaveContact;
    SaveAddress(Registro.Codigo,Entidade.Endereco);
    SavePhone(Registro.Codigo,Entidade.telefone);
    SaveMailing(Registro.Codigo,'contato',Entidade.email);
    SaveSocialMedia(Registro.Codigo,Entidade.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;


procedure TCadContact.SaveContact;
begin
  with Contact.Registro do
  Begin
    codigo := Contact.Entidade.Registro.Codigo;
    if FrEntity.DBLCB_Lista.Text <> '' then
      EntidadePai := FrEntity.DBLCB_Lista.KeyValue
    else
      EntidadePai := 0;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Ativo := IfThen(Rg_CadastroAtivo.ItemIndex=0,'S','N');
  End;
  Contact.save;
end;

procedure TCadContact.SetVariable;
begin
  Contact.Registro.Codigo := CodigoRegistro;
  Contact.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Contact.Entidade.Email.Grupo.Registro.Descricao := 'contato';
  Contact.getAllByKey;
  inherited
end;

procedure TCadContact.ShowData;
begin
  with Contact do Begin
    ShowDataEntity(Entidade);
    ShowDataContact;
    ShowDataAddress(Entidade.Endereco);
    ShowDataPhone(registro.Codigo, Entidade.Telefone);
    ShowDataMailing(Entidade.Email);
    ShowDataSocialMedia(Entidade.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadContact.ShowDataContact;
begin
  //Estabelecimento
  FrEntity.DBLCB_Lista.KeyValue := Contact.Registro.EntidadePai;
  Rg_CadastroAtivo.ItemIndex :=  IfThen(Contact.Registro.Ativo='S',0,1);
end;

procedure TCadContact.ShowEntity;
begin
  FrEntity := TfmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Listar;
  FrEntity.Align := alClient;
  FrEntity.Show;
end;

procedure TCadContact.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadContact.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadContact.ValidateChange: boolean;
begin
  Result := True;
end;

function TCadContact.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadContact.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_NameCompany.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo nome não informado.',
                  'Preencha o campo para continuar']);
    if E_NameCompany.CanFocus then E_NameCompany.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
