unit cad_salesman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_collaborator, Vcl.Menus,unmessages,
  uniMainMenu, Data.DB, Datasnap.DBClient, uniMultiItem, uniComboBox,
  uniCheckBox, uniMemo, uniPageControl, uniRadioGroup, uniPanel,ControllerUSer,
  uniDateTimePicker, uniGUIClasses, uniEdit, uniLabel, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses,ControllerEntityHasMailing,
  ControllerSalesman, MainModule, cad_user,unFunctions;

type
  TCadSalesman = class(TCadCollaborator)
    tbs_comissao: TUniTabSheet;
    UniLabel12: TUniLabel;
    E_Aliq_Kickback: TUniEdit;
    Chbx_kickback_product: TUniCheckBox;
    E_Vl_Flex: TUniEdit;
    UniLabel14: TUniLabel;
    Usurio1: TUniMenuItem;
    procedure Usurio1Click(Sender: TObject);
  private
    { Private declarations }
    function ValidateCreateUSer:Boolean;
  protected

    procedure InitVariable;Override;
    procedure Save;Override;
    procedure SaveSalesMan;

    procedure ShowData;Override;
    procedure ShowDataSalesMan;

    procedure setvariable;override;
    procedure getRegistroExistente;Virtual;
  public
    { Public declarations }
    salesman : TControllerSalesman;
  end;

var
  CadSalesman: TCadSalesman;

implementation

{$R *.dfm}

{ TCadCollaborator1 }


procedure TCadSalesman.getRegistroExistente;
begin
  with salesman.Colaborador do
  Begin
    if ( RG_Pessoa.ItemIndex = 0 ) then
    Begin
      CodigoRegistro := Fiscal.Fisica.getIDbyCPF(unMaskField(E_DocFiscal.Text));
    End
    else
    Begin
      CodigoRegistro := Fiscal.Juridica.getIDbyCnpj(unMaskField(E_DocFiscal.Text));
    End;
    if ( CodigoRegistro > 0 ) then
    Begin
      ShowRegistroExistente(Fiscal);
    End;
  end;

end;

procedure TCadSalesman.InitVariable;
begin
  inherited;
  salesman := TControllerSalesman.Create(self);
end;

procedure TCadSalesman.Save;
begin
  inherited;
  SaveSalesman;
end;

procedure TCadSalesman.SaveSalesMan;
begin
  Salesman.Registro.codigo := Collaborator.Registro.Codigo;
  Salesman.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Salesman.Registro.AliquotaComissao := StrToFloatDef (E_Aliq_Kickback.Text,0);
  Salesman.Registro.ValorFlex := StrToFloatDef (E_Vl_Flex.Text,0);
  //ComissaoProduto := Chbx_kickback_product.Checked;
  if Rg_CadastroAtivo.ItemIndex = 0 then
    Salesman.Registro.Ativo := 'S'
  else
    Salesman.Registro.Ativo := 'N';
  Salesman.save;

end;

procedure TCadSalesman.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Salesman.Registro.Codigo := CodigoRegistro;
    Salesman.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Salesman.Colaborador.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Salesman.getAllByKey;
  End;
  inherited
end;

procedure TCadSalesman.ShowData;
begin
  with salesman do
  Begin
    ShowDataEntity(Colaborador.Fiscal);
    ShowDataAddress(Colaborador.Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Colaborador.Fiscal.Telefone);
    ShowDataMailing(Colaborador.Fiscal.Email);
    ShowDataSocialMedia(Colaborador.Fiscal.MidiaSocial);
    ShowDataFiscal(Colaborador.Fiscal);
    ShowDataSalesman;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;

end;

procedure TCadSalesman.ShowDataSalesMan;
begin
  with Salesman.Registro do
  Begin
    E_Aliq_Kickback.Text := FloatToStrF(AliquotaComissao, ffFixed ,10, 2) ;
    E_Vl_Flex.Text := FloatToStrF(ValorFlex, ffFixed ,10, 2) ;
    //Chbx_kickback_product.Checked := ComissaoProduto;
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;
  End;
end;

procedure TCadSalesman.Usurio1Click(Sender: TObject);
Var
  Form : TCadUser;
  LcUser:TControllerUser;
  LcEntidadeHasMailing: TControllerEntityHasMailing;
begin
  if ValidateCreateUSer then
  Begin
    Try
      LcEntidadeHasMailing := TControllerEntityHasMailing.Create(nil);
      LcUser := TControllerUser.Create(nil);
      LcUser.HasInstitution.Registro.Estabelecimento := self.salesman.Registro.Estabelecimento;
      LcUser.Registro.Codigo := self.salesman.Registro.Codigo;
      LcUser.getbyKey;
      if not LcUser.exist then
      Begin
        with LcUser do
        Begin
          LcUser.Mailing.Registro.Email := E_email.Text;
          LcUser.Mailing.save;

          with LcEntidadeHasMailing.Registro do
          Begin
            Entidade  := Self.salesman.Registro.Codigo;
            Mailing   := LcUser.Mailing.Registro.Codigo;
            Grupo     := 2;
          End;
          LcEntidadeHasMailing.Save;

          Registro.Codigo := self.salesman.Registro.Codigo;
          Registro.Password := LcUser.encryptPassword('12345');
          Registro.Tipo := 'sistema';
          Registro.Salt := '';
          Registro.Dispositivo := 0;
          Registro.Ativo := 'S';
          Registro.ChaveAtivacao := '';
          Save;

          //Institution has User
          with HasInstitution.Registro do
          Begin
            Estabelecimento := UMM.GInstitution.registro.Codigo;
            Usuario := LcUser.Registro.Codigo;
            Ativo := 'S'
          End;
          HasInstitution.Save;
        End;
      End;
    Finally
      FreeAndNil(LcUser);
      FreeAndNil(LcEntidadeHasMailing);
    End;
    if Form = nil then
      Form := TCadUser.Create(UniApplication);
    Form.CodigoRegistro := salesman.Registro.Codigo;
    Form.InstitutionID := UMM.GInstitution.registro.Codigo;
    Form.Show(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        Form := nil;
      end
    );
  End;

end;

function TCadSalesman.ValidateCreateUSer: Boolean;
begin
  Result := True;
  if (EditionState <> 'B') then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Termine a edição para acessar O cadastro de Usuário.',
                  'Impossível continuar.']);
    Result := False;
    exit;

  End;

  if (Self.salesman.Registro.Codigo = 0 ) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Registre o vendedor antes de criar o Usuário.',
                  'Verifique e tente novamente.']);
    Result := False;
    exit;
  End;

  salesman.Colaborador.Fiscal.Email.Registro.Email := E_email.Text;
  if not salesman.Colaborador.Fiscal.Email.Valida then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'e-mail inválido ou não informado.',
                  'Verifique e tente novamente.']);
    Result := False;
    exit;
  End;

end;

end.
