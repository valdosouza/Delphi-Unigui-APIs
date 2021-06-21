unit tas_nf_55;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_nf, uniPanel, uniPageControl,
  uniBasicGrid, uniDBGrid, uniGUIClasses, uniEdit, uniLabel, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniMemo, uniGroupBox, ControllerInvoiceMerchandise,
  MainModule, msg_form, unmessages, uniDateTimePicker, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, Datasnap.Provider ;

type
  TTasNf55 = class(TTasNf)
    Pg_Principal: TUniPageControl;
    tbs_obs: TUniTabSheet;
    UniDBGrid1: TUniDBGrid;
    MM_Observacao: TUniMemo;
    tbs_dados: TUniTabSheet;
    pnl_dados_emitente: TUniPanel;
    E_ID: TUniEdit;
    E_name_social: TUniEdit;
    E_Cnpj_Cpf: TUniEdit;
    E_IE_RG: TUniEdit;
    DSP: TDataSetProvider;
    cds_search: TClientDataSet;
    ds_search: TDataSource;
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchquantity: TBCDField;
    cds_searchunit_value: TFMTBCDField;
    cds_searchdiscount_value: TFMTBCDField;
    cds_searchoiquantityoiunit_valueoidiscount_value: TFMTBCDField;
    CancelarNotaFiscal1: TUniMenuItem;
    tbs_Items: TUniTabSheet;
    pnl_dados_totalizador: TUniPanel;
    E_BC_ICMS: TUniEdit;
    E_VL_ICMS: TUniEdit;
    E_BC_ICMS_ST: TUniEdit;
    E_VL_ICMS_ST: TUniEdit;
    E_Vl_Product: TUniEdit;
    E_Vl_Invoice: TUniEdit;
    E_VL_IPI: TUniEdit;
    E_VL_Expenses: TUniEdit;
    E_Vl_Assurance: TUniEdit;
    E_Vl_freight: TUniEdit;
    E_Net_Weight: TUniEdit;
    E_Gross_Weight: TUniEdit;
    E_Number: TUniEdit;
    E_Brand: TUniEdit;
    E_Kind: TUniEdit;
    E_Amount: TUniEdit;
    pnl_dados_nota: TUniPanel;
    E_Des_Cfop: TUniEdit;
    E_Cfop: TUniEdit;
    E_Order: TUniEdit;
    E_Invoice: TUniEdit;
    E_Total_Value: TUniEdit;
    Dtp_Emission: TUniDateTimePicker;
    Dtp_Exit: TUniDateTimePicker;
    Pnl_Tittle_issuer: TUniPanel;
    Pnl_Tittle_dados_totalizer: TUniPanel;
    Pnl_Tittle_dados: TUniPanel;
    pnl_dados_nota_row_1: TUniPanel;
    pnl_dados_nota_row_2: TUniPanel;
    pnl_dados_totalizador_row_3: TUniPanel;
    pnl_dados_totalizador_row_2: TUniPanel;
    pnl_dados_totalizador_row_1: TUniPanel;
    procedure CancelarNotaFiscal1Click(Sender: TObject);
    procedure Pg_PrincipalChange(Sender: TObject);
  private

  protected
    FVendedor: Integer;
    FTerminal: Integer;
    FTipoOrdem: Integer;
    procedure InitVariable;Override;
    procedure setVariable;Override;
    procedure FormatScreen;Override;

    procedure ShowData;Override;
    procedure ShowDataTotalizer;
    procedure ShowDataShipping;
    procedure ShowDataInvoice;
    procedure ShowDataOrderSale;
    procedure ShowDataOrderPurchase;
    procedure ShowDataOrderStockAdjust;
    procedure ShowDataEntityFiscal;
    procedure ShowNoData;Override;
    procedure ShowList;
    procedure ShowObservation;

    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    function ValidateSave: boolean;Override;

    procedure setFTerminal(const Value: Integer);
    procedure setFVendedor(const Value: Integer);
    procedure setFTipoOrdem(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    NFMercadoria : TControllerInvoiceMerchandise;
    property Terminal : Integer read FTerminal write setFTerminal;
    property Vendedor : Integer read FVendedor write setFVendedor;
    property TipoOrdem : Integer read FTipoOrdem write setFTipoOrdem;
  end;

var
  TasNf55: TTasNf55;

implementation

{$R *.dfm}

uses UnFunctions,Main, prm_nfe, openForms;

{ TTasNf55 }

procedure TTasNf55.CancelarNotaFiscal1Click(Sender: TObject);
Var
  ParamNfe : TPrmNFe;
begin
  ParamNfe := TPrmNFe.Create;
  ParamNfe.Estabelecimento :=UMM.GInstitution.registro.Codigo;
  ParamNfe.Ordem := NFMercadoria.Registro.Codigo;
  ParamNfe.Operacao := '';
  ParamNfe.Motivo := '';
  OpenAuthorizeNfe55(ParamNfe);
end;

procedure TTasNf55.ClearAllFields;
begin
  inherited;
  NFMercadoria.clear;
end;


procedure TTasNf55.FormatScreen;
begin
  Pg_Principal.ActivePage := tbs_dados;
  cds_search.Active := False;
  MM_Observacao.Text := '';
  case FTipoOrdem of
    1:Self.Caption := 'Nota Fiscal de Mercadorias - Venda';
    2:Self.Caption := 'Nota Fiscal de Mercadorias - Compra';
    3:Self.Caption := 'Nota Fiscal de Mercadorias - Ajustes';
  end;

end;

procedure TTasNf55.Pg_PrincipalChange(Sender: TObject);
begin
  if ( TUniPageControl(Sender).ActivePage = tbs_Items ) then
    ShowList;
  if ( TUniPageControl(Sender).ActivePage = tbs_obs ) then
    ShowObservation;
end;

procedure TTasNf55.InitVariable;
begin
  inherited;
  NFMercadoria  := TControllerInvoiceMerchandise.Create(Self);
end;

procedure TTasNf55.setFTerminal(const Value: Integer);
begin
  FTerminal := Value;
end;

procedure TTasNf55.setFTipoOrdem(const Value: Integer);
begin
  FTipoOrdem := Value;
end;

procedure TTasNf55.setFVendedor(const Value: Integer);
begin
  FVendedor := Value;
end;

procedure TTasNf55.SetVariable;
begin
  with NFMercadoria do
  Begin
    Nota.Registro.Codigo          := CodigoRegistro;
    Nota.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Nota.Registro.Terminal        := FTerminal;
    Nota.getByKey;

    NFMercadoria.Nota.Destinatario.Registro.Codigo  := 0;
    NFMercadoria.Nota.Emitente.Registro.Codigo      := 0;
    if (NFMercadoria.Nota.Registro.Estabelecimento = NFMercadoria.Nota.Registro.Emitente) then
    Begin
      NFMercadoria.Nota.Destinatario.Registro.Codigo := NFMercadoria.Nota.Registro.Destinatario;
      NFMercadoria.Nota.Destinatario.getByKey;
    End
    else
    Begin
      NFMercadoria.Nota.Emitente.Registro.Codigo := NFMercadoria.Nota.Registro.Emitente;
      NFMercadoria.Nota.Emitente.getByKey;
    End;


    Registro.Codigo           := CodigoRegistro;
    Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
    Registro.Terminal         := FTErminal;
    getByKey;

    Entrega.Registro.Codigo           := CodigoRegistro;
    Entrega.Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
    Entrega.Registro.Terminal         := FTErminal;
    Entrega.getByKey;

    Nota.Cfop.Registro.Codigo := Nota.Registro.Cfop;
    Nota.Cfop.getByKey;

    case FTipoOrdem of
      1:getOrderSale(FVendedor);
      2:getOrderPurchase;
      3:getOrderStockAdjust;
    end;
  End;
  inherited;
end;

procedure TTasNf55.ShowData;
begin
  ShowDataInvoice;
  ShowDataEntityFiscal;
  ShowDataTotalizer;
  ShowDataShipping;
  case FTipoOrdem of
    1:ShowDataOrderSale;
    2:ShowDataOrderPurchase;
    3:ShowDataOrderStockAdjust;
  end;

end;

procedure TTasNf55.ShowDataEntityFiscal;
begin
  with NFMercadoria.Nota do
  BEgin
    if Destinatario.Registro.Codigo > 0 then
    Begin
      E_ID.Text               := Destinatario.Registro.Codigo.ToString;
      E_name_social.Text      := Destinatario.Registro.NomeRazao;
      if Destinatario.kindPerson = 'J' then
      Begin
        E_Cnpj_Cpf.Text       := Destinatario.Juridica.Registro.CNPJ;
        E_IE_RG.FieldLabel    := 'I.E.';
        E_IE_RG.Text  := Destinatario.Juridica.Registro.InscricaoEstadual;
      End
      else
      Begin
        E_Cnpj_Cpf.Text       := Destinatario.Fisica.Registro.CPF;
        E_IE_RG.FieldLabel    := 'R.G.';
        E_IE_RG.Text  := Destinatario.Fisica.Registro.RG;
      End;
    End
    else
    Begin
      E_ID.Text               := Emitente.Registro.Codigo.ToString;
      E_name_social.Text      := Emitente.Registro.NomeRazao;
      if Emitente.kindPerson = 'J' then
      Begin
        E_Cnpj_Cpf.Text       := Emitente.Juridica.Registro.CNPJ;
        E_IE_RG.FieldLabel    := 'I.E.';
        E_IE_RG.Text          := Emitente.Juridica.Registro.InscricaoEstadual;
      End
      else
      Begin
        E_Cnpj_Cpf.Text       := Emitente.Fisica.Registro.CPF;
        E_IE_RG.FieldLabel    := 'R.G.';
        E_IE_RG.Text          := Emitente.Fisica.Registro.RG;
      End;
    End;
  End;
end;

procedure TTasNf55.ShowDataInvoice;
begin
  with NFMercadoria.Nota do
  begin
    with Registro do
    Begin
      E_Number.Text := Numero;
      Dtp_Emission.DateTime := Data_Emissao;
      E_Vl_Invoice.Text := FloattoStrf(Valor,ffFixed,10,2);
      E_Total_Value.Text := FloattoStrf(Valor,ffFixed,10,2);
      E_Invoice.Text := Numero;
    End;

    with Cfop do
    begin
      E_Cfop.Text       := Registro.Codigo;
      E_Des_Cfop.text   := registro.Descricao;
    end;
  end;
end;

procedure TTasNf55.ShowDataOrderPurchase;
begin
  E_Order.Text := NFMercadoria.Compra.Registro.Numero.ToString;
end;

procedure TTasNf55.ShowDataOrderSale;
begin
  E_Order.Text := NFMercadoria.Venda.Registro.Numero.ToString;
end;

procedure TTasNf55.ShowDataOrderStockAdjust;
begin
  E_Order.Text := NFMercadoria.Ajuste.Registro.Numero.ToString;
end;

procedure TTasNf55.ShowDataTotalizer;
begin
  with NFMercadoria.Registro do
  Begin
    E_BC_ICMS.Text      := FloattoStrf(ValorBaseIcms,ffFixed,10,2);
    E_VL_ICMS.Text      := FloattoStrf(ValorIcms,ffFixed,10,2);
    E_BC_ICMS_ST.Text   := FloattoStrf(ValorBaseIcmsSt,ffFixed,10,2);
    E_VL_ICMS_ST.Text   := FloattoStrf(ValorIcmsSt, ffFixed,10,2);
    E_Vl_Product.Text   := FloattoStrf(ValorTotal,ffFixed,10,2);
    E_Vl_freight.Text   := FloattoStrf(ValorFrete,ffFixed,10,2);
    E_Vl_Assurance.Text := FloattoStrf(ValorSeguro,ffFixed,10,2);
    E_VL_Expenses.Text  := FloattoStrf(ValorDespesas,ffFixed,10,2);
    E_VL_IPI.Text       := FloattoStrf(ValorIPI,ffFixed,10,2);
    Dtp_Exit.DateTime   := DataSaida;
  End;
end;

procedure TTasNf55.ShowDataShipping;
begin
  with NFMercadoria.Entrega.Registro do
  Begin
    E_Brand.Text := Marca;
    E_Gross_Weight.Text := PesoBruto;
    E_Net_Weight.Text := PesoLiquido;
    E_Amount.Text := FloattoStrf(Quantidade,ffFixed,10,2);
    E_Kind.Text := Classificacao;
  End;
end;

procedure TTasNf55.ShowList;
begin
  if not cds_search.Active then
  Begin
    with UMM.Qr_Crud do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'SELECT oi.id, pro.description, oi.quantity, oi.unit_value, ',
                'oi.discount_value, ((oi.quantity*oi.unit_value)-oi.discount_value)  ',

                'FROM tb_order_item oi ',

                '  INNER JOIN tb_product pro ',
                '  ON pro.id = oi.tb_product_id ',
                '   and (pro.tb_institution_id = oi.tb_institution_id) ',

                'where oi.tb_institution_id =:tb_institution_id ',
                ' AND oi.tb_order_id =:tb_order_id ',
                ' AND oi.terminal =:terminal ',

                'order by pro.description '
              ));
      ParamByName('tb_institution_id').AsInteger  := UMM.GInstitution.registro.Codigo;
      ParamByName('tb_order_id').AsInteger        := NFMercadoria.Nota.Registro.Codigo;
      ParamByName('terminal').AsInteger           := NFMercadoria.Nota.Registro.Terminal;
      Active := True;
      FetchAll;
    End;
    cds_search.Active := True;
  End;
end;

procedure TTasNf55.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasNf55.ShowObservation;
Var
  I : Integer;
begin
  if MM_Observacao.Text = '' then
  Begin
    MM_Observacao.Clear;
    if TRim(NFMercadoria.Nota.Registro.Observacao)<> '' then
      MM_Observacao.Lines.Add( NFMercadoria.Nota.Registro.Observacao );

    with NFMercadoria.Nota.Observacao do
    Begin
      Registro.Estabelecimento := NFMercadoria.Nota.Registro.Estabelecimento;
      Registro.Terminal        := NFMercadoria.Nota.Registro.Terminal;
      Registro.NotaFiscal      := NFMercadoria.Nota.Registro.Codigo;
      getlist;
      for I := 0 to Lista.Count-1 do
      Begin
        MM_Observacao.Lines.Add(Lista[I].Observacao);
      End;
    End;
  End;
end;

function TTasNf55.ValidaInsert: boolean;
begin
  Result := True;
end;

function TTasNf55.ValidateSave: boolean;
begin
 //
end;

end.



