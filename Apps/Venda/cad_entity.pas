unit cad_entity;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_registry, FMX.TabControl, FMX.Layouts, FMX.Controls.Presentation,
  System.Threading,CnpjReceita, FMX.Platform, FMX.VirtualKeyboard,
  FMX.Edit, FMX.Effects, FMX.Objects, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.ComboEdit, FMX.ListBox,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,FMX.DialogService,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait,REST.Json,System.Json,
  prm_customer, tblPhone, FMX.TreeView, FMX.DateTimeCtrls, FMX.ScrollBox,
  FMX.Memo, ctrl_mob_customer, tblAddress, ctrl_mob_config,ctrl_mob_state,ctrl_mob_city,
  System.ImageList, FMX.ImgList, Network, api_receita_ws, FMX.Ani,
  VertScrollBoxWithKBHandling, lista_combo_state, lista_combo_city,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView;

type
  TCadEntity = class(TBaseRegistry)
    tab_dados: TTabControl;
    tbs_tittle_entity: TTabItem;
    tbs_tittle_address: TTabItem;
    tbs_tittle_Phone: TTabItem;
    Ly_Entity: TVertScrollBox;
    Ly_address: TVertScrollBox;
    Ly_fones: TVertScrollBox;
    Grp_kind_person: TGroupBox;
    rb_Juridica: TRadioButton;
    RB_fisica: TRadioButton;
    Lb_Name: TLabel;
    E_Name: TEdit;
    E_Nick: TEdit;
    Lb_Nick: TLabel;
    E_Doc: TEdit;
    Lb_Doc: TLabel;
    E_IE_RG: TEdit;
    Lb_IE_RG: TLabel;
    E_email: TEdit;
    lb_email: TLabel;
    Lb_zip_code: TLabel;
    E_ZipCode: TEdit;
    Lb_state: TLabel;
    Lb_city: TLabel;
    Lb_street: TLabel;
    Lb_Number: TLabel;
    lb_Complement: TLabel;
    Lb_neighborhood: TLabel;
    Lb_Phone_Celular: TLabel;
    Lb_Phone_Principal: TLabel;
    e_Phone: TEdit;
    E_Celular: TEdit;
    E_state: TEdit;
    E_City: TEdit;
    E_Street: TEdit;
    E_complem: TEdit;
    E_Neighborhood: TEdit;
    Bds_city: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField2: TLinkListControlToField;
    Ly_kind_person: TRectangle;
    Ly_name_company: TRectangle;
    Ly_nick_trade: TRectangle;
    Ly_doc_fiscal: TRectangle;
    Ly_doc_id: TRectangle;
    Ly_email: TRectangle;
    ly_zip_code: TRectangle;
    Ly_state: TRectangle;
    Ly_city: TRectangle;
    Ly_street: TRectangle;
    Ly_number: TRectangle;
    Ly_complem: TRectangle;
    Ly_neighborhood: TRectangle;
    Ly_Fone: TRectangle;
    Ly_Celular: TRectangle;
    Grp_kind_customer: TGroupBox;
    Rb_Dealer: TRadioButton;
    Rb_Consumer: TRadioButton;
    Ly_Kind_customer: TRectangle;
    E_number: TEdit;
    Sb_search_city: TSearchEditButton;
    Sb_search_state: TSearchEditButton;
    Sb_CNPJ: TSearchEditButton;
    Sb_zip_code: TSearchEditButton;

    procedure rb_JuridicaChange(Sender: TObject);
    procedure RB_fisicaChange(Sender: TObject);
    procedure e_PhoneKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure E_ZipCodeKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure E_DocKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure E_CelularKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Sb_search_cityClick(Sender: TObject);
    procedure Sb_search_stateClick(Sender: TObject);
    procedure Sb_CNPJClick(Sender: TObject);
    procedure tbs_tittle_entityClick(Sender: TObject);
    procedure tbs_tittle_addressClick(Sender: TObject);
    procedure tbs_tittle_PhoneClick(Sender: TObject);
    procedure Sb_zip_codeClick(Sender: TObject);
  private
    { Private declarations }
    Estados : TCtrlMobState;
    Cidades: TCtrlMobCity;

    procedure GetZipCode(Number:String);
    function validaAbreListaCidade:Boolean;
    function validaBuscaCNPJ:Boolean;
    procedure HideKeyboard;
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;

    procedure DealWithPerson;
    procedure GetDataDocument;
    procedure fillDataByCNPJ(pData:TCnpjReceita);
    //Salva Entidade
    procedure InsertEntity;
    procedure UpdateEntity;
    procedure SaveEntity;
    procedure ShowDataEntity;
    //Fiscal
    procedure saveEntityFiscal;
    procedure ShowDataFiscal;

    //Endereço
    procedure SaveAddress;
    procedure ShowDataAddress;
    //TeleFone
    procedure SavePhone;
    procedure ShowDataPhone;
    //Email
    procedure SaveMailing;
    procedure ShowDataMailing;
    //Site do cadastro
    procedure SaveSocialMedia;
    procedure ShowDataSocialMedia;

    procedure SaveCustomer;
    procedure ShowDataCustomer;

    function validateSave:Boolean;Override;
    procedure save;Override;

    function ValidateCancel():boolean;Override;
    procedure Cancel;Override;


    procedure hideProcess;Override;
  public
    Customer : TCtrlMobCustomer;
    { Public declarations }
  end;

var
  CadEntity: TCadEntity;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses MainModule, prm_address, uAuthCM, uDataCM, UnFunctions;
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TCadEntity.GetZipCode(Number:String);
Var
  Lc_Address : TPrmAddress;
  LcStrJSon : String;
begin
  //Desabilita o Botão
  Number := unMaskField(Number);
  if Length(Number)=8 then
  Begin
    Try
      Lc_Address := TPrmAddress.Create;
      LcStrJSon := DataCM.SMServicesClient.getZipCode(Number);
      Lc_Address := TJson.JsonToObject<TPrmAddress>(LcStrJson);
      with Lc_Address do
      Begin
        if ZipCode <> '0' then
        Begin
          //Posiciona o Estado na Lista
          Estados.Registro.Codigo := Lc_Address.State;
          Estados.getByKey;
          E_state.Text := UpperCase( concat(Estados.Registro.Nome,' - ',Estados.Registro.Abreviatura) ) ;
          Cidades.Registro.Codigo := Lc_Address.City;
          Cidades.Registro.CodigoEstado := Lc_Address.State;
          Cidades.getByKey;
          E_City.Tag := Cidades.Registro.Codigo;
          E_City.Text := UpperCase( Cidades.Registro.Nome );
          E_Street.Text := Street;
          E_complem.Text := Complement;
          E_Neighborhood.Text := Neighborhood;
          E_number.SetFocus;
        End;
      End;
    Finally
      Lc_Address.DisposeOf;
    End;
  end;
end;

procedure TCadEntity.HideKeyboard;
var
  KeyboardService: IFMXVirtualKeyboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(KeyboardService)) then
    KeyboardService.HideVirtualKeyboard;
end;

procedure TCadEntity.hideProcess;
begin
  inherited;
end;

procedure TCadEntity.InitVariable;
begin
  inherited;
  Customer  := TCtrlMobCustomer.Create(Self);
  Estados   := TCtrlMobState.Create(Self);
  Cidades   := TCtrlMobCity.Create(Self);
end;

procedure TCadEntity.InsertEntity;
begin
  with Customer.MFiscal do
  Begin
    Registro.Codigo := 0;
    Registro.RegistroCriado := Now;
    Registro.NomeRazao := E_Name.Text;
    Registro.ApelidoFantasia := E_Nick.Text;
    Registro.RamoAtividade := 0;
  End;
  Customer.MFiscal.Insert;

end;

procedure TCadEntity.Cancel;
begin
  Self.Close;
end;

procedure TCadEntity.SaveAddress;
begin
  //Enderecos
  with Customer.MFiscal.MEndereco.Registro do
  Begin
    Customer.MFiscal.MEndereco.Registro.Codigo := Customer.MFiscal.Registro.Codigo;
    Tipo := 'COMERCIAL';
    Principal := 'S';
    cep := unMaskField(E_ZipCode.Text);
    logradouro := E_street.Text;
    NumeroPredial := E_Number.Text;

    Complemento := E_complem.Text;
    bairro := E_Neighborhood.Text;
    CodigoPais := 1058;
    CodigoEstado := E_state.Tag;
    CodigoCidade := E_City.Tag;
  end;
  Customer.MFiscal.MEndereco.save;

end;

procedure TCadEntity.SaveCustomer;
begin
  Customer.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  Customer.Registro.Codigo := Customer.MFiscal.Registro.Codigo;
  if Rb_Dealer.IsChecked then
    Customer.Registro.ConsumidorFinal := 'N'
  else
    Customer.Registro.ConsumidorFinal := 'S';
  Customer.save;
end;

procedure TCadEntity.SaveEntity;
begin
  with Customer.MFiscal do
  Begin
    Registro.RegistroCriado := Now;
    Registro.NomeRazao := E_Name.Text;
    Registro.ApelidoFantasia := E_Nick.Text;
    Registro.RamoAtividade := 0;
  End;
  Customer.MFiscal.save;
end;

procedure TCadEntity.SaveMailing;
begin
  //Verifica o GRupo
  Customer.MFiscal.MEmail.MGrupo.Registro.Descricao := 'principal';
  Customer.MFiscal.MEmail.MGrupo.getByDescription;
  //Não deleta o email do mailing, apenas delete o vinculo deste email à Entidade
  Customer.MFiscal.MEmail.deleteHasEntity(Customer.MFiscal.Registro.Codigo,
                          Customer.MFiscal.MEmail.MGrupo.Registro.Codigo );
  //Mailing
  if (E_email.Text <> '') then
  Begin
    Customer.MFiscal.MEmail.Registro.Email := E_email.Text;
    Customer.MFiscal.MEmail.save;
    //Entidade Has Mailin
    Customer.MFiscal.MEmail.MEntityHas.Registro.Entidade := Customer.MFiscal.Registro.Codigo;
    Customer.MFiscal.MEmail.MEntityHas.Registro.Mailing  := Customer.MFiscal.MEmail.Registro.Codigo;
    Customer.MFiscal.MEmail.MEntityHas.Registro.Grupo    := Customer.MFiscal.MEmail.MGrupo.Registro.Codigo;
    Customer.MFiscal.MEmail.MEntityHas.Save;
  End;
end;

procedure TCadEntity.SavePhone;
Var
  Lc_Fone:String;
begin
  with Customer.MFiscal.MTelefone do
  Begin
    Registro.Codigo := Customer.MFiscal.Registro.Codigo;
    Registro.Tipo := 'Fone';
    Lc_Fone := unMaskField(E_Phone.Text);
    Registro.Numero := Lc_Fone;
    Registro.TipoEndereco := 'Comercial';
    if (Lc_Fone <> '' ) then
      Customer.MFiscal.MTelefone.save
    else
      Customer.MFiscal.MTelefone.delete;

    Customer.MFiscal.MTelefone.clear;
    Registro.Codigo := Customer.MFiscal.Registro.Codigo;
    Registro.Tipo := 'Celular';
    Lc_Fone := unMaskField(E_Celular.Text);
    Registro.Numero := Lc_Fone;
    Registro.TipoEndereco := 'Comercial';
    if (Lc_Fone <> '' ) then
      Customer.MFiscal.MTelefone.save
    else
      Customer.MFiscal.MTelefone.delete
  End;
end;

procedure TCadEntity.SaveSocialMedia;
begin
  //Não é solicitado or enquanto
end;

procedure TCadEntity.Sb_search_cityClick(Sender: TObject);
Var
  LcForm : TListaComboCity;
begin
  if validaAbreListaCidade then
  Begin
    LcForm := TListaComboCity.Create(Self);
    LcForm.Obj.Registro.CodigoEstado := E_state.Tag;
    LcForm.ShowModal(
    procedure(ModalResult : TModalResult)
    begin
      self.E_City.Tag := LcForm.Obj.Registro.Codigo;
      self.E_City.Text := UpperCase( LcForm.Obj.Registro.Nome );
      LcForm := nil;
    end);
  End;
end;

procedure TCadEntity.Sb_search_stateClick(Sender: TObject);
Var
  LcForm : TListaComboState;
begin
  LcForm := TListaComboState.Create(Self);
  LcForm.ShowModal(
  procedure(ModalResult : TModalResult)
  begin
    self.E_state.Tag := LcForm.Obj.Registro.Codigo;
    self.E_state.Text := UpperCase( concat(LcForm.Obj.Registro.Nome,' - ', LcForm.Obj.Registro.Abreviatura) );
    LcForm := nil;
  end);

end;

procedure TCadEntity.Sb_CNPJClick(Sender: TObject);
begin
  if validaBuscaCNPJ then
    GetDataDocument;
end;

procedure TCadEntity.Sb_zip_codeClick(Sender: TObject);
begin
  if (E_ZipCode.Text = '') then
  begin
    TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
    TDialogService.ShowMessage(
        Concat('A T E N Ç Ã O!',
                Char(10),Char(13),
                Char(10),Char(13),
                'Informe o Número do Cep.',
                Char(10),Char(13)
              )
      );
    Exit;
  end;
  if not verificaConexaoServidor then
  Begin
    exit;
  End;

  GetZipCode(E_ZipCode.Text);

end;

procedure TCadEntity.SetVariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Customer.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Customer.Registro.Codigo := CodigoRegistro;
    Customer.getAllByKey;
  End;
  inherited
end;

procedure TCadEntity.ShowData;
begin
  ShowDataEntity;
  ShowDataFiscal;
  ShowDataCustomer;
  ShowDataAddress;
  ShowDataPhone;
  ShowDataMailing;
  ShowDataSocialMedia;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Customer.MFiscal.Registro.Codigo;
end;

procedure TCadEntity.ShowDataAddress;
begin
  //Enderecos
  with Customer do
  Begin
    //Endereco
    E_ZipCode.Text := MFiscal.MEndereco.Registro.Cep;
    MaskCep(E_ZipCode);
    MFiscal.MEndereco.MEstado.Registro.Codigo := MFiscal.MEndereco.Registro.CodigoEstado;
    MFiscal.MEndereco.MEstado.getByKey;
    E_state.Tag   := MFiscal.MEndereco.Registro.CodigoEstado;
    E_state.Text  := UpperCase( concat(MFiscal.MEndereco.MEstado.Registro.Nome,' - ',MFiscal.MEndereco.MEstado.Registro.Abreviatura) );
    //Posiciona o Cidade na Lista
    MFiscal.MEndereco.MCidade.Registro.Codigo := MFiscal.MEndereco.Registro.CodigoCidade;
    MFiscal.MEndereco.MCidade.getByKey;
    E_City.Tag   := MFiscal.MEndereco.Registro.CodigoCidade;
    E_City.Text  := UpperCase( MFiscal.MEndereco.MCidade.Registro.Nome );
    E_Street.Text       := MFiscal.MEndereco.Registro.Logradouro;
    E_number.Text       := MFiscal.MEndereco.Registro.NumeroPredial;
    E_complem.Text      := MFiscal.MEndereco.Registro.Complemento;
    E_Neighborhood.Text := MFiscal.MEndereco.Registro.Bairro;
  end;
end;

procedure TCadEntity.ShowDataCustomer;
begin
  if Customer.Registro.ConsumidorFinal = 'N' then
    Rb_Dealer.IsChecked := True
  else
    Rb_Consumer.IsChecked := True
end;

procedure TCadEntity.ShowDataEntity;
begin
  //Entidade
  with Customer.MFiscal do
  Begin
    with Registro do
    Begin
      E_Name.Text := NomeRazao;
      E_Nick.Text := ApelidoFantasia;
    End;
  End;
end;

procedure TCadEntity.ShowDataFiscal;
begin
  //Pessoa Juridica  - Fiscal
  with customer.MFiscal do
  Begin
    if MJuridica.exist then
    Begin
      with MJuridica.Registro do
      Begin
        rb_Juridica.IsChecked := True;
        E_Doc.Text := CNPJ;
        MaskCNPJ(E_Doc);
        E_IE_RG.Text := InscricaoEstadual;
      End;
    End
    else
    Begin
      with MFisica.Registro do
      Begin
        RB_Fisica.IsChecked := True;
        E_Doc.Text := CPF;
        MaskCPF(E_Doc);
        E_IE_RG.Text := RG;
      End;
    End;
  End;
end;

procedure TCadEntity.ShowDataMailing;
begin
 //Email
  with Customer.MFiscal.MEmail.Registro do
  Begin
    E_email.Text := Email;
    E_email.Tag := Codigo;
  end;
end;

procedure TCadEntity.ShowDataPhone;
begin
  With Customer do
  Begin
    MFiscal.MTelefone.Registro.Codigo :=  Registro.Codigo;
    MFiscal.MTelefone.Registro.Tipo := 'Fone';
    MFiscal.MTelefone.getByKey;
    if MFiscal.MTelefone.exist then
    Begin
      e_Phone.Text := MFiscal.MTelefone.Registro.Numero;
      MaskPhone(e_Phone);
    End;

    MFiscal.MTelefone.Registro.Codigo :=  Registro.Codigo;
    MFiscal.MTelefone.Registro.Tipo := 'Celular';
    MFiscal.MTelefone.getByKey;
    if MFiscal.MTelefone.exist then
    Begin
      //CElular
      E_Celular.Text := MFiscal.MTelefone.Registro.Numero;
      MaskPhone(E_Celular);
    End;
  end;
end;

procedure TCadEntity.ShowDataSocialMedia;
begin

end;

procedure TCadEntity.ShowNoData;
begin
  inherited;
  ClearAllFields;
  Estados.getList;
  E_state.tag   := Estados.Lista[0].Codigo;
  E_state.Text  := UpperCase(concat(Estados.Lista[0].Nome,' - ', Estados.Lista[0].Abreviatura));
end;


procedure TCadEntity.tbs_tittle_addressClick(Sender: TObject);
begin
  inherited;
  HideKeyboard;
end;

procedure TCadEntity.tbs_tittle_entityClick(Sender: TObject);
begin
  inherited;
  HideKeyboard;
end;

procedure TCadEntity.tbs_tittle_PhoneClick(Sender: TObject);
begin
  inherited;
  HideKeyboard;
end;

procedure TCadEntity.UpdateEntity;
begin
  with Customer.MFiscal do
  Begin
    Registro.RegistroCriado := Now;
    Registro.NomeRazao := E_Name.Text;
    Registro.ApelidoFantasia := E_Nick.Text;
    Registro.RamoAtividade := 0;
  End;
  Customer.MFiscal.update;

end;

function TCadEntity.validaAbreListaCidade: Boolean;
begin
  REsult := True;
  if ( E_state.Text = '' ) then
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Estado não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar'));
    REsult := False;
    exit;
  End;
end;

function TCadEntity.validaBuscaCNPJ: Boolean;
begin
  REsult := True;
  if not rb_Juridica.IsChecked then
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Esta funcionalidade',Char(13),
                   'está disponível apenas',Char(13),
                   'para pessoa jurídica',
                   Char(10),Char(13),
                   'Preencha o campo para continuar'));
    REsult := False;
    exit;
  End;

  if ( E_Doc.Text = '' ) then
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo C.N.P.J não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar'));
    REsult := False;
    exit;
  End;
end;

procedure TCadEntity.DealWithPerson;
begin
  if rb_Juridica.IsChecked then
  Begin
    Lb_Name.Text := 'Razão Social';
    Lb_Nick.Text := 'Nome Fantasia';
    Lb_Doc.Text := 'C.N.P.J.';
    Lb_IE_RG.Text := 'Inscrição Estadual';
    Sb_CNPJ.Visible := True;
  End
  else
  Begin
    Lb_Name.Text := 'Nome';
    Lb_Nick.Text := 'Apelido';
    Lb_Doc.Text := 'C.P.F.';
    Lb_IE_RG.Text := 'R.G.';
    Sb_CNPJ.Visible := False;
  End;
end;

procedure TCadEntity.E_CelularKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  MaskPhone(TEdit(Sender));
end;

procedure TCadEntity.E_DocKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if rb_Juridica.IsChecked then
    MaskCNPJ(TEdit(Sender))
  else
    MaskCPF(TEdit(Sender));
end;

procedure TCadEntity.e_PhoneKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
BEgin
  MaskPhone(TEdit(Sender));
end;

procedure TCadEntity.E_ZipCodeKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
Begin
  MaskCep(Sender as TEdit);
end;

procedure TCadEntity.fillDataByCNPJ(pData: TCnpjReceita);
Var
  LcPos : Integer;
begin
  with pData do
  BEgin
    E_Name.Text         := RazaoSocial;
    E_Nick.Text         := Fantasia;
    //E_Doc.Text          := Preenchido pelo Usuario
    E_IE_RG.Text        := '';
    E_email.Text        := EndEletronico;

    LcPos := Pos('/',Telefone);
    e_Phone.Text        := RemoveCaracterInformado( Copy(Telefone,1,LcPos-1),['/','(',')',' ','-']);
    MaskPhone(e_Phone);
    E_Celular.Text      := RemoveCaracterInformado( Copy(Telefone,LcPos+1,Length( Telefone )-LcPos),['/','(',')',' ','-']);
    MaskPhone(E_Celular);
    E_Street.Text       := Endereco;
    E_number.Text       := Numero;
    E_complem.Text      := Complemento;
    E_Neighborhood.Text := Bairro;
    E_ZipCode.Text      := RemoveCaracterInformado( CEP, ['.','-']);
    //Posiciona o Estado na Lista
    Estados.Registro.Abreviatura := UF;
    Estados.getByAbreviatura;
    E_state.Tag  := Estados.Registro.Codigo;
    E_state.Text := UpperCase( Estados.Registro.Nome );
    //Posiciona o Cidade na Lista
    Cidades.Registro.CodigoEstado := Estados.Registro.Codigo;
    Cidades.Registro.Nome := UpperCase(Cidade);
    Cidades.getByName;
    E_City.Tag  := Cidades.Registro.Codigo;
    E_City.Text := UpperCase( Cidades.Registro.Nome );

  End;
end;

procedure TCadEntity.FormatScreen;
begin
  inherited;
  tab_dados.ActiveTab := tbs_tittle_entity;
end;

procedure TCadEntity.GetDataDocument;
Var
  LcApi : TApiReceitaWs;
begin
  try
    showProcess('Buscando Dados');
    LcApi := TApiReceitaWs.Create(Self);
    LcApi.CNPJ := RemoveCaracterInformado(E_Doc.Text,['.','/','-']);
    fillDataByCNPJ(LcApi.getDados);
  finally
    LcApi.DisposeOf;
    hideProcess;
  end;
end;

procedure TCadEntity.RB_fisicaChange(Sender: TObject);
begin
  DealWithPerson;
end;

procedure TCadEntity.rb_JuridicaChange(Sender: TObject);
begin
  DealWithPerson;
end;

procedure TCadEntity.save;
begin
  with Customer do
  Begin
    saveEntityFiscal;
    SaveCustomer;
    SaveAddress;
    SavePhone;
    SaveMailing;
    SaveSocialMedia;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
  End;
end;

procedure TCadEntity.saveEntityFiscal;
begin
  with Customer.MFiscal do
  Begin
    //Garantir que a entity tenha zero, para pesquisar por doc fiscal
    MFisica.Registro.Codigo := 0;
    MJuridica.Registro.Codigo := 0;
    if RB_Fisica.IsChecked then
    Begin
      MFisica.Registro.Codigo := MFisica.getIDbyCPF(RemoveCaracterInformado(E_Doc.Text,['.','/','-']));
    End
    else
    Begin
      MJuridica.Registro.Codigo := MJuridica.getIDbyCNPJ(RemoveCaracterInformado(E_Doc.Text,['.','/','-']));
    End;
    if (MFisica.Registro.Codigo = 0) and (MJuridica.Registro.Codigo = 0)  then
    Begin
      //Entidade
      InsertEntity;
      if RB_Fisica.IsChecked then
      Begin
        //Fisica
        MFisica.Registro.Codigo := Registro.Codigo;
        MFisica.Registro.CPF := RemoveCaracterInformado(E_Doc.Text,['.','/','-']);
        MFisica.Registro.RG := E_IE_RG.Text;
        MFisica.insert;
      End
      else
      Begin
        //Juridica
        MJuridica.Registro.Codigo := Registro.Codigo;
        MJuridica.Registro.CNPJ :=  RemoveCaracterInformado(E_Doc.Text,['.','/','-']);
        MJuridica.Registro.InscricaoEstadual := E_IE_RG.Text;
        MJuridica.insert;
      End;
    end
    else
    Begin
      //Altera os dados da entidade que existe
      if RB_Fisica.IsChecked then
        Registro.Codigo  := MFisica.Registro.Codigo
      else
        Registro.Codigo  := MJuridica.Registro.Codigo;
      //Entidade
      UpdateEntity;
    End;
  End;
end;

function TCadEntity.ValidateCancel: boolean;
begin
  REsult := True;
end;

function TCadEntity.validateSave: Boolean;
Var
  Lc_Aux : String;
begin
  Result := True;
  TDialogService.PreferredMode := TDialogService.TPreferredMode.Platform;
  if trim(E_Name.Text) = '' then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Nome não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar'));
    Result := False;
    exit;
  end;

  if trim(E_Nick.Text) = '' then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Codnome/Apelido não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar'));
    if E_Nick.CanFocus then E_Nick.SetFocus;
    Result := False;
    exit;
  end;

  if ( Length(unMaskField(E_Zipcode.Text)) < 8) then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo CEP não informado ou incorreto.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar.'));
    Result := False;
    exit;
  end;

  if trim(e_state.Text) = '' then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Estado não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar.'));
    Result := False;
    exit;
  end;

  if trim(E_City.Text) = '' then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Cidade não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar.'));
    Result := False;
    exit;
  end;

  if trim(E_Street.Text) = '' then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo logradouro não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar.'));
    Result := False;
    exit;
  end;

  if trim(E_Number.Text) = '' then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Número não informado.',
                   Char(10),Char(13),
                   'Preencha o campo para continuar.'));
    Result := False;
    exit;
  end;

  if trim(E_Neighborhood.Text) = '' then
  begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Campo Bairro não informado.',
                   Char(10),Char(13),
                  'Preencha o campo para continuar.'));
    Result := False;
    exit;
  end;

  Lc_Aux := TRIM(unMaskField(E_Doc.Text));
  if ( Length(Lc_Aux) = 11 ) then
  begin
    if not (CalculoCpf(Lc_Aux)) then
    begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Número de C.P.F. Inválido.',
                   Char(10),Char(13),
                   'Verifique e tente novamente.'));
       Result := False;
       exit;
    end;
  end
  else
  begin
    if not (CalculoCnpj(Lc_Aux)) then
    begin
      TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!.',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Número de C.N.P.J. Inválido.',
                   Char(10),Char(13),
                   'Verifique e tente novamente.'));
      Result := False;
      exit;
    end;
  end;

end;
end.




