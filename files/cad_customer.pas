unit cad_customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,fm_carrier,ControllerSalesman,
  uniMainMenu, uniMemo, uniPanel, uniPageControl, uniRadioGroup,  uniDateTimePicker, uniGUIClasses, uniEdit, uniLabel, uniButton, uniBitBtn,fm_Salesman,
  uniSpeedButton, uniGUIBaseClasses, uniMultiItem, uniComboBox, uniCheckBox, ControllerCustomer,
  Data.DB, Datasnap.DBClient;

type
  TCadCustomer = class(TCadEntityFiscal)
    chbx_Consumidor: TUniCheckBox;
    Rg_SituacaoCredito: TUniRadioGroup;
    E_VL_Credito: TUniEdit;
    E_Multiplicador: TUniEdit;
    Rg_HabilitaCarteira: TUniRadioGroup;
    Rg_CadastroAtivo: TUniRadioGroup;
    Ctn_Salesman: TUniContainerPanel;
    Ctn_Carrier: TUniContainerPanel;
    pnl_other_row_1: TUniPanel;
    pnl_other_row_2: TUniPanel;


  private
    { Private declarations }
    FrCarrier : TFmCarrier;
    FrSalesman : TFmSalesman;
    procedure ShowCarrier;
    procedure ShowSalesman;
  protected
    procedure FormatScreen;Override;
    procedure InitVariable;Override;
    procedure EditionControl;Override;

    procedure Save;Override;
    procedure SaveCustomer;

    procedure ShowData;Override;
    procedure ShowDataCustumer;

    procedure setvariable;override;
    procedure getRegistroExistente;Override;
  public
    { Public declarations }
    Customer : TControllerCustomer;
    Salesman : TControllerSalesman;
  end;

var
  CadCustomer: TCadCustomer;

implementation

{$R *.dfm}

uses MainModule, UnFunctions;




procedure TCadCustomer.EditionControl;
begin
  inherited;
  EditionControler(FrCarrier);
  EditionControler(FrSalesman);
end;

procedure TCadCustomer.FormatScreen;
begin
  inherited;
  ShowCarrier;
  ShowSalesman;
end;

procedure TCadCustomer.getRegistroExistente;
begin
  with Customer do
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
  End;

end;

procedure TCadCustomer.InitVariable;
begin
  inherited;
  Customer := TControllerCustomer.Create(self);
end;

procedure TCadCustomer.Save;
begin
  with Customer do
  Begin
    saveEntityFiscal(Fiscal);
    SaveCustomer;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.Email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;

end;




procedure TCadCustomer.SaveCustomer;
begin
  inherited;
  with Customer do
  Begin
    with Registro do
    Begin
      Codigo := Customer.Fiscal.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      if ( Rg_SituacaoCredito.ItemIndex = 0 ) then
        SituacaoCredito := 'L'
      else
        SituacaoCredito := 'B';

      ValorCredito := StrToFloatDef(E_VL_Credito.Text,0);

      if (Rg_HabilitaCarteira.ItemIndex = 0 ) then
        VendeEmCarteira := 'S'
      else
        VendeEmCarteira := 'N';

      if chbx_Consumidor.Checked then
        ConsumidorFinal := 'S'
      else
        ConsumidorFinal := 'N';

      if ( Rg_CadastroAtivo.ItemIndex = 0 ) then
         Ativo := 'S'
      else
        Ativo := 'N';

      Multiplicador := StrToFloatDef(E_Multiplicador.Text,0);

      if Chbx_IgnoraST.Checked then
        IgnoraST := 'S'
      else
        IgnoraST := 'N';

      if FrSalesman.DBLCB_Lista.KeyValue <> null then
        Vendedor := FrSalesman.DBLCB_Lista.KeyValue
      else
        Vendedor := 0;

      if FrCarrier.DBLCB_Lista.KeyValue <> null then
        Transportador := FrCarrier.DBLCB_Lista.KeyValue
      else
        Transportador := 0;

    End;
    save;
  End;
end;


procedure TCadCustomer.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Customer.Registro.Codigo := CodigoRegistro;
    Customer.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Customer.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Customer.getAllByKey;
  End;
  inherited
end;

procedure TCadCustomer.ShowData;
begin
  with Customer do
  Begin
    ShowDataEntity(Fiscal);
    ShowDataAddress(Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing(Fiscal.Email);
    ShowDataSocialMedia(Fiscal.MidiaSocial);
    ShowDataFiscal(Fiscal);
    ShowDataCustumer;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadCustomer.ShowDataCustumer;
begin
  inherited;
  with Customer.Registro do
  Begin

    if ( SituacaoCredito = 'L' ) then
      Rg_SituacaoCredito.ItemIndex := 0
    else
      Rg_SituacaoCredito.ItemIndex := 1;
    E_VL_Credito.Text := FloatToStrF( ValorCredito, ffFixed,10,2);
    if (VendeEmCarteira = 'S' ) then
      Rg_HabilitaCarteira.ItemIndex := 0
    else
      Rg_HabilitaCarteira.ItemIndex := 1;

    chbx_Consumidor.Checked := ( ConsumidorFinal = 'S' );
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;
    E_Multiplicador.Text := FloatToStrF( Multiplicador, ffFixed ,10, 2);
    Chbx_IgnoraST.Checked := ( IgnoraST = 'S' );

    FrSalesman.DBLCB_Lista.KeyValue := Vendedor;
    FrCarrier.DBLCB_Lista.KeyValue := Transportador;
  End;
end;

procedure TCadCustomer.ShowCarrier;
begin
  FrCarrier := TFmCarrier.Create(Self);
  FrCarrier.Parent := Ctn_Carrier;
  FrCarrier.Listar;
  FrCarrier.Show;
  FrCarrier.Align := alClient;
end;

procedure TCadCustomer.ShowSalesman;
begin
  FrSalesman := TFmSalesman.Create(Self);
  FrSalesman.Parent := Ctn_Salesman;
  FrSalesman.Listar;
  FrSalesman.Show;
  FrSalesman.Align := alClient;
end;


end.
