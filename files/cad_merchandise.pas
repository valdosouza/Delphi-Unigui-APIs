unit cad_merchandise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniEdit, uniRadioGroup,
  uniCheckBox, uniMemo, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox,
  uniPageControl, uniLabel,ACBrUtil,
  ControllerMerchandise,ControllerOrderItem,
  unmessages,UnFunctions,msg_form,
  fm_category, fm_brand, fm_package, fm_measure, fm_color, System.AnsiStrings,
  tblPriceList, ControllerPriceList, tblStockList, ControllerStockList,
  uniGUIApplication, ACBrBase, ACBrValidador;

type
  TCadMerchandise = class(TBaseRegistry)
    ctn_Category: TUniContainerPanel;
    Pg_Main: TUniPageControl;
    tbs_estoque: TUniTabSheet;
    pnl_estoque_linha_3: TUniPanel;
    dbg_StockList: TUniDBGrid;
    tb_Obs: TUniTabSheet;
    E_note: TUniMemo;
    ChBx_highlights: TUniCheckBox;
    ChBx_active: TUniCheckBox;
    chbx_published: TUniCheckBox;
    chbx_promotion: TUniCheckBox;
    chbx_Imprime: TUniCheckBox;
    chbx_Serie: TUniCheckBox;
    chbx_ForaLinha: TUniCheckBox;
    chbx_Exclusivo: TUniCheckBox;
    chbx_Ctrl_Estoque: TUniCheckBox;
    tbs_tributacao: TUniTabSheet;
    pnl_tributacao: TUniPanel;
    Cb_OrigemMercadoria: TUniComboBox;
    Rg_ST: TUniRadioGroup;
    Cb_Finalidade: TUniComboBox;
    tbs_preco: TUniTabSheet;
    pnl_price_list: TUniPanel;
    dbg_PriceList: TUniDBGrid;
    UniHiddenPanel1: TUniHiddenPanel;
    E_PriceTag: TUniFormattedNumberEdit;
    E_Aliq_kickback: TUniNumberEdit;
    tbs_aplication: TUniTabSheet;
    E_aplication: TUniMemo;
    cds_price_list: TClientDataSet;
    cds_price_listtb_price_list_id: TIntegerField;
    cds_price_listdescription: TStringField;
    cds_price_listprice_tag: TFMTBCDField;
    cds_price_listaliq_profit: TBCDField;
    cds_price_listaliq_kickback: TBCDField;
    cds_price_listquantity: TBCDField;
    cds_price_listregister: TStringField;
    Ds_price_list: TDataSource;
    cds_stock_list: TClientDataSet;
    cds_stock_listtb_institution_id: TIntegerField;
    cds_stock_listdescription: TStringField;
    cds_stock_listquantity: TBCDField;
    cds_stock_listtb_product_id: TIntegerField;
    cds_stock_listreg_status: TStringField;
    Ds_stock_list: TDataSource;
    Configurao1: TUniMenuItem;
    Composio1: TUniMenuItem;
    cds_price_listtb_product_id: TIntegerField;
    pnl_linha_1: TUniPanel;
    E_ID: TUniEdit;
    E_Identifier: TUniEdit;
    E_CodeBar: TUniEdit;
    E_CodigoProvider: TUniEdit;
    E_CodigoNCM: TUniEdit;
    Sb_ncm: TUniSpeedButton;
    pnl_linha_2: TUniPanel;
    E_Description: TUniEdit;
    E_codigoCEST: TUniEdit;
    Sb_CEST: TUniSpeedButton;
    pnl_estoque_linha_1: TUniPanel;
    ctn_Brand: TUniContainerPanel;
    ctn_Measure: TUniContainerPanel;
    pnl_estoque_linha_2: TUniPanel;
    ctn_package: TUniContainerPanel;
    ctn_color: TUniContainerPanel;
    pnl_estoque_linha_3_left: TUniPanel;
    pnl_price_linha_1: TUniPanel;
    E_VL_Fabrica: TUniEdit;
    E_VL_CustoReal: TUniEdit;
    E_VL_Custo: TUniEdit;
    pnl_estoque_linha_3_1_left: TUniPanel;
    E_Qtde_Min: TUniEdit;
    Cb_kind: TUniComboBox;
    E_Divisor: TUniEdit;
    pnl_estoque_linha_3_4_left: TUniPanel;
    E_Peso: TUniEdit;
    E_Largura: TUniEdit;
    E_Comprimento: TUniEdit;
    E_Altura: TUniEdit;
    pnl_estoque_linha_3_3_left: TUniPanel;
    E_Local: TUniEdit;
    pnl_estoque_linha_3_2_left: TUniPanel;
    cb_comp: TUniComboBox;
    pnl_tributacao_linha_2: TUniPanel;
    pnl_tributacao_linha_1: TUniPanel;
    ACBrValidador: TACBrValidador;
    procedure cds_price_listCalcFields(DataSet: TDataSet);
    procedure Sb_ncmClick(Sender: TObject);
    procedure Sb_CESTClick(Sender: TObject);
    procedure Composio1Click(Sender: TObject);
    procedure dbg_PriceListCellClick(Column: TUniDBGridColumn);
    procedure E_VL_CustoRealExit(Sender: TObject);
    procedure E_VL_CustoExit(Sender: TObject);
    procedure Configurao1Click(Sender: TObject);
    procedure E_VL_FabricaExit(Sender: TObject);
    procedure E_CodeBarExit(Sender: TObject);
    procedure E_IdentifierExit(Sender: TObject);
  private
    { Private declarations }
    FrCategory : TFmCategory;
    FrBrand   : TFmBrand;
    FrPackage : TFmPackage;
    FrMeasure : TFmMeasure;
    FrColor   : TFmColor;

    function validateBarCode:Boolean;
    procedure ProcuraCodigoBarras;
    procedure ProcuraCodigoIdentifier;

    procedure ShowCategory;
    procedure ShowBrand;
    procedure ShowPackage;
    procedure ShowMeasure;
    procedure ShowColor;

    procedure ShowProduct;
    procedure ShowMerchandise;
    procedure ShowStock;
    procedure ShowPriceList;
    procedure ShowStockList;
    procedure InsertNew;
    procedure InsertCopy;
    procedure SaveProduct;
    procedure SaveMerchandise;
    procedure SaveStock;
    procedure DeletePriceList;
    procedure SavePriceList;
    procedure SaveStockList;

    Procedure UpdatePriceListByMarkup(CostValue:Real);

    function  SetPriceByProfitAliq(CostValue,ProfitALiq:real;DecimalNumber:Integer):Real;
    function  setProfitByPrice(CostValue,PriceValue:real;DecimalNumber:Integer):Real;

    procedure ChangePriceByAliqProfit(Sender: TField);
    procedure ChangePriceByValue(Sender: TField);

  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    function ValidateSaveMerchandise: boolean;Virtual;
    procedure Save;Override;

    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
    procedure EditionControl;Override;
  public
    { Public declarations }
    Mercadoria : TControllerMerchandise;
  end;

var
  CadMerchandise: TCadMerchandise;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TCadMerchandise }

procedure TCadMerchandise.cds_price_listCalcFields(DataSet: TDataSet);
begin
  inherited;
  umm.regUpdater(DataSet);
end;

procedure TCadMerchandise.ChangePriceByAliqProfit(Sender: TField);
Var
  Lc_Vl_Margem : real;
begin
  Try
    cds_price_listprice_tag.OnChange := nil;
    IF (Configuracao('L','PRO_G_AUTO_CALC_PRICETAG','S') = 'S') then
    Begin
      Lc_Vl_Margem := sender.DataSet.FieldByName('aliq_profit').AsFloat;
      if Lc_Vl_Margem > 0 then
      Begin
        if ( Configuracao('L','PRO_G_FROM_UPDATE_PRICETAG','R') = 'R') then
        Begin
          sender.DataSet.FieldByName('price_tag').AsFloat := SetPriceByProfitAliq(
                                                StrTofloatDef(E_VL_CustoReal.Text,0),
                                                Lc_Vl_Margem,
                                                2);
        end
        else
        Begin
          sender.DataSet.FieldByName('price_tag').AsFloat := SetPriceByProfitAliq(
                                                  StrTofloatDef(E_VL_Custo.Text,0),
                                                  Lc_Vl_Margem,
                                                  2);
        end;
      end;
    end;
  Finally
    cds_price_listprice_tag.OnChange := ChangePriceByValue;
  End;
end;

procedure TCadMerchandise.ChangePriceByValue(Sender: TField);
Var
  Lc_Valor : real;
begin
  Try
    cds_price_listaliq_profit.OnChange := nil;
    IF (Configuracao('L','PRO_G_AUTO_CALC_PRICETAG','S') = 'S') then
    Begin
      Lc_Valor := sender.DataSet.FieldByName('price_tag').AsFloat;
      if Lc_Valor > 0 then
      Begin
        if (Configuracao('L','PRO_G_FROM_UPDATE_PRICETAG','R') = 'R') then
        Begin
          sender.DataSet.FieldByName('aliq_profit').AsFloat := setProfitByPrice(
                                                                    StrToFloatDef(E_VL_CustoReal.Text,0),
                                                                    Lc_Valor,
                                                                    2);
        end
        else
        BEgin
          sender.DataSet.FieldByName('aliq_profit').AsFloat := setProfitByPrice(
                                                                     StrToFloatDef(E_VL_Custo.Text,0),
                                                                      Lc_Valor,
                                                                      2);
        end;
      end;
    end;
  Finally
    cds_price_listaliq_profit.OnChange := ChangePriceByAliqProfit;
  End;

end;

procedure TCadMerchandise.ClearAllFields;
begin
  inherited;
  Mercadoria.clear;
  ClearFields(Self);
  ClearFields(FrBrand);
  ClearFields(FrPackage);
  ClearFields(FrMeasure);
end;

procedure TCadMerchandise.Composio1Click(Sender: TObject);
begin
  inherited;
  openCadMerchandiseItems(Mercadoria.Registro.Codigo);
end;

procedure TCadMerchandise.Configurao1Click(Sender: TObject);
begin
  inherited;
  openTasConfigGProduct(0);
end;

procedure TCadMerchandise.dbg_PriceListCellClick(Column: TUniDBGridColumn);
begin
  if not  (Ds_price_list.State in [dsEdit]) then
    cds_price_list.Edit;
end;



procedure TCadMerchandise.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'Este Produto será desativado no cadastro',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          Mercadoria.desactive;
          Self.Close;
        End;
      end
    );
end;


procedure TCadMerchandise.DeletePriceList;
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_price_list.ChangeCount > 0 then
  Begin
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_price_list.Delta;
    cds_temp.First;
    cds_price_list.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      if cds_temp.UpdateStatus = usDeleted then
      Begin
        //Detalhe
        Mercadoria.ListaPreco.Preco.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
        Mercadoria.ListaPreco.Preco.Registro.Tabela := cds_price_list.FieldByName('tb_price_list_id').AsInteger;
        Mercadoria.ListaPreco.Preco.Registro.Produto := Mercadoria.Registro.Codigo;
        Mercadoria.ListaPreco.Preco.delete;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;

procedure TCadMerchandise.EditionControl;
begin
  inherited;

end;

procedure TCadMerchandise.E_CodeBarExit(Sender: TObject);
begin
  if ( EditionState <> 'B' ) AND (TRIM(E_CodeBar.Text) <>'') then
  Begin
    if validateBarCode then
      ProcuraCodigoBarras;
  End;
end;

procedure TCadMerchandise.E_IdentifierExit(Sender: TObject);
begin
  inherited;
  if ( EditionState <> 'B' ) AND (TRIM(E_Identifier.Text) <>'') then
    ProcuraCodigoIdentifier;

end;

procedure TCadMerchandise.E_VL_CustoExit(Sender: TObject);
Var
  Lc_Valor : real;
begin
  Lc_Valor := StrToFloatDef(E_VL_Custo.Text,0);
  IF (Configuracao('L','PRO_G_AUTO_CALC_PRICETAG','S') = 'S') then
  Begin
    if Lc_Valor > 0 then
    Begin
      if (Configuracao('L','PRO_G_FROM_UPDATE_PRICETAG','C') = 'C') then
      Begin
        UpdatePriceListByMarkup( Lc_Valor );
      end;
    end;
  end;
  E_VL_Custo.Text := FloatToStrF(Lc_Valor,ffFixed,10,2);
end;

procedure TCadMerchandise.E_VL_CustoRealExit(Sender: TObject);
Var
  Lc_Valor : real;
begin
  Lc_Valor := StrToFloatDef(E_VL_CustoReal.Text,0);
  IF (Configuracao('L','PRO_G_AUTO_CALC_PRICETAG','S') = 'S') then
  Begin

    if Lc_Valor > 0 then
    Begin
      if (Configuracao('L','PRO_G_FROM_UPDATE_PRICETAG','R') = 'R') then
      Begin
        UpdatePriceListByMarkup( Lc_Valor );
      end;
    end;
  end;
  E_VL_CustoReal.Text := FloatToStrF(Lc_Valor,ffFixed,10,2);
end;

procedure TCadMerchandise.E_VL_FabricaExit(Sender: TObject);
VAr
  LcValue : Real;
begin
  LcValue := StrToFloatDef(E_VL_Fabrica.Text,0);
  E_VL_Fabrica.Text := FloatToStrF(LcValue,ffFixed,10,2);
end;

procedure TCadMerchandise.FormatScreen;
begin
  inherited;
  Pg_Main.ActivePage := tbs_estoque;
  ShowCategory;
  ShowBrand;
  ShowPackage;
  ShowMeasure;
  ShowColor;

end;

procedure TCadMerchandise.InitVariable;
begin
  inherited;
  Mercadoria:= TControllerMerchandise.Create(self);
end;

procedure TCadMerchandise.Insert;
Var
  lBotao : Integer;
begin
  if ( Mercadoria.Registro.Codigo > 0 ) then
  Begin
    MensagePadrao('Mensagem de Confirmação',
                  ['Infome o tipo de Operação.'],
                  ['Novo','Cópia','Cancelar'],
                  [bNormal,bNormal,bEscape],
                  mpConfirmacao);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        lBotao := (Sender as TMsgForm).BotaoEscolhido;
        case lBotao of
          0:InsertNew;
          1:InsertCopy;
        end;
      end
    );
  End
  else
  Begin
    InsertNew;
  End;


end;

procedure TCadMerchandise.InsertCopy;
begin
  //Interface
  E_id.Clear;
  E_Identifier.Clear;
  E_CodeBar.Clear;
  E_CodigoProvider.Clear;
  //Dados
  self.Mercadoria.Produto.Registro.Codigo       := 0;
  self.Mercadoria.Registro.Codigo               := 0;
  self.Mercadoria.Registro.CodigoInterno        := '';
  self.Mercadoria.Estoque.Registro.Mercadoria   := 0;
  self.Mercadoria.Estoque.Registro.CodigoBarra  := '';
  ShowPriceList;
  ShowStockList;

end;

procedure TCadMerchandise.InsertNew;
begin
  ClearAllFields;
  ChBx_active.Checked := True;
  E_Identifier.SetFocus;
  ShowPriceList;
  ShowStockList;

end;


procedure TCadMerchandise.ProcuraCodigoBarras;
begin
  try
    Self.showMask('Verificando código de barras...');
    UniSession.Synchronize();
    Mercadoria.Estoque.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Mercadoria.Estoque.Registro.Mercadoria  := StrtoIntDef(E_ID.Text,0);
    Mercadoria.Estoque.Registro.CodigoBarra := E_CodeBar.Text;
    Mercadoria.Estoque.getbyBarCode;
  finally
    self.HideMask;
  end;
  if Mercadoria.Estoque.exist then
  Begin
    MensageYesNo(['C O N F I R M A Ç Ã O!',
                  '',
                  'Já existe Produto cadastrado com este código de Barras.',
                  'Deseja Visualiza-lo agora ?'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          Self.CodigoRegistro := Mercadoria.Estoque.Registro.Mercadoria;
          self.SetVariable;
        End
        else
        Begin
          E_CodeBar.Clear;
          setFocus(E_CodeBar.JSName);
         End;
      end
      );
  End;
end;

procedure TCadMerchandise.ProcuraCodigoIdentifier;
BEgin
  try
    Self.showMask('Verificando Cód. Fábrica/Montadora...');
    UniSession.Synchronize();
    Mercadoria.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Mercadoria.Registro.Codigo  := StrtoIntDef(E_ID.Text,0);
    Mercadoria.Registro.CodigoInterno  := E_Identifier.Text;
    Mercadoria.getByIdentifier;
  finally
    self.HideMask;
  end;
  if Mercadoria.exist then
  Begin
    MensageYesNo(['C O N F I R M A Ç Ã O!',
                  '',
                  'Já existe Produto cadastrado com este código de Fábrica/Montadora.',
                  'Deseja Visualiza-lo agora ?'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          Self.CodigoRegistro := Mercadoria.Registro.Codigo;
          self.SetVariable;
        End
        else
        Begin
          E_Identifier.Clear;
          setFocus(E_Identifier.JSName);
        End;
      end
      );
  End;


end;

procedure TCadMerchandise.Save;
begin
  inherited;
  SaveProduct;
  SaveMerchandise;
  SaveStock;
  DeletePriceList;
  SavePriceList;
    ShowPriceList;
  SaveStockList;
    ShowStockList;
  E_ID.Text     := IntToStr(Mercadoria.Registro.codigo);
  E_Identifier.Text := Mercadoria.Produto.Registro.Identificador;
 //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Mercadoria.Registro.Codigo;
  GeraLogOperation('GRAVOU',
                    concat('Produto : ',
                        Mercadoria.Registro.Codigo.ToString, ' - ',
                        Mercadoria.Produto.Registro.Descricao  )
                  );
end;

procedure TCadMerchandise.SaveMerchandise;
begin
  //Merchandise
  with Mercadoria.Registro  do
  Begin
    Codigo            := Mercadoria.Produto.Registro.Codigo;
    Estabelecimento   := UMM.GInstitution.registro.Codigo;
    if ( E_Identifier.Text <> '' ) then
      CodigoInterno   := E_Identifier.Text
    else
      CodigoInterno   := IntToStr(Mercadoria.Produto.Registro.Codigo);
    Fornecedor        := StrToIntDef(E_CodigoProvider.Text,0);
    NCM               := E_CodigoNCM.Text;
    CEST              := E_codigoCEST.Text;
    TipoTributacao    := IntToStr(Cb_Finalidade.ItemIndex + 1);
    Origem            := IntToStr( Cb_OrigemMercadoria.ItemIndex );
    case Cb_kind.ItemIndex of
      0:Tipo := 'P';
      1:Tipo := 'M';
      2:Tipo := 'C';
      3:Tipo := 'A';
    end;
    Marca             := FrBrand.DBLCB_Lista.KeyValue;
    if chbx_Imprime.Checked   then Imprime        := 'S'    else Imprime          := 'N';
    if chbx_Serie.Checked     then ControlarSerie := 'S'    else ControlarSerie   := 'N';
    if chbx_Exclusivo.Checked then ExclusivoRevenda := 'S'  else ExclusivoRevenda := 'N';
    Aplicacao         := E_aplication.Text;


    TipoComposicao := intToStr(cb_comp.ItemIndex);

  End;
  Mercadoria.save;
end;

procedure TCadMerchandise.SavePriceList;
Var
  LcOperacao : String;
begin
  if cds_price_list.ChangeCount > 0 then
  Begin
    cds_price_list.First;
    while not cds_price_list.eof do
    Begin
      with Mercadoria.ListaPreco,cds_price_list do
      Begin
        Preco.clear;
        Preco.Registro.Estabelecimento  := Mercadoria.Registro.Estabelecimento;
        Preco.Registro.Tabela           := FieldByName('tb_price_list_id').AsInteger;
        Preco.Registro.Produto          := Mercadoria.Registro.Codigo;
        Preco.Registro.Preco            := FieldByName('price_tag').AsFloat;
        Preco.Registro.MargemLucro      := FieldByName('aliq_profit').AsFloat;
        Preco.Registro.Comissao         := FieldByName('aliq_kickback').AsFloat;
        Preco.Registro.Quantidade       := FieldByName('quantity').AsFloat;
        if FieldByName('tb_product_id').AsInteger = 0 then
        Begin
          Mercadoria.ListaPreco.Preco.insert;

        End
        else
        Begin
          case cds_price_list.UpdateStatus of
            usModified: Mercadoria.ListaPreco.Preco.update;
          end;
        end;
      End;
      cds_price_list.next;
    End;
  End;

end;

procedure TCadMerchandise.SaveProduct;
begin
  with Mercadoria.Produto.Registro do
  Begin
    Identificador   := E_Identifier.Text;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Descricao       := E_Description.Text;
    Categoria       := FrCategory.DBLCB_Lista.KeyValue;
    if chbx_promotion.Checked  then  Promocao  := 'S'  else  Promocao      := 'N';
    if ChBx_highlights.Checked  then  Destaque  := 'S'  else  Destaque      := 'N';
    if ChBx_active.Checked     then  Ativo     := 'S'  else  Ativo         := 'N';
    if chbx_published.Checked   then  Publicado := 'S'  else  Publicado     := 'N';
    Observaocao     := E_note.Text;
  End;
  Mercadoria.Produto.save;
end;

procedure TCadMerchandise.SaveStock;
begin
  //Estoque
  with Mercadoria.Estoque.Registro do
  Begin
    Mercadoria        := self.Mercadoria.Registro.Codigo;
    Estabelecimento   := self.Mercadoria.Registro.Estabelecimento;
    Embalagem         := FrPackage.DBLCB_Lista.KeyValue;
    Medida            := FrMeasure.DBLCB_Lista.KeyValue;
    if FrColor.DBLCB_Lista.KeyValue <> null then
      Cor             := FrColor.DBLCB_Lista.KeyValue
    else
      Cor             := 0;
    CodigoBarra       := E_CodeBar.Text;
    if Rg_ST.ItemIndex = 0 then
      TemST           := 'S'
    else
      TemST           := 'N';
    //Controlado por outros meios
    //Qtde:= 0;
    QtdeMinima        := StrToFloatDef(E_Qtde_Min.Text,0);
    Divisor           := StrToIntDef(E_Divisor.Text,0);
    Localizacao       := E_Local.Text;
    Peso              := StrToFloatDef(E_Peso.Text,0);
    Largura           := StrToFloatDef(E_Largura.Text,0);
    Comprimento       := StrToFloatDef(E_Comprimento.Text,0);
    Altura            := StrToFloatDef(E_Altura.Text,0);
    CustoFabrica      := StrToFloatDef(E_VL_Fabrica.Text,0);
    CustoReal         := StrToFloatDef(E_VL_CustoReal.Text,0);
    PrecoCusto        := StrToFloatDef(E_VL_Custo.Text,0);
    if chbx_Ctrl_Estoque.Checked then
      EstoqueNegativa := 'S'
    else
      EstoqueNegativa := 'N';
    if chbx_ForaLinha.Checked then
      ForaDeLinha     := 'S'
    else
      ForaDeLinha     := 'N';
    RegistroCriado    := Now;
    RegistroAlterado  := Now;
  End;
  Mercadoria.Estoque.save;
end;

procedure TCadMerchandise.SaveStockList;
Var
  LcOperacao : String;
begin
  cds_stock_list.First;
  while not cds_stock_list.eof do
  Begin
    if not (cds_stock_listtb_product_id.AsInteger > 0) then
    begin
      with Mercadoria.ListaEstoque.balance do
      Begin
        Registro.Estabelecimento  := Mercadoria.Registro.Estabelecimento;
        Registro.Tabela           := cds_stock_list.FieldByName('id').AsInteger;
        Registro.Mercadoria       := Mercadoria.Registro.Codigo;
        Registro.Quantidade       := 0;
        Registro.Minimo           := 0;
      end;
      Mercadoria.ListaEstoque.balance.save;
    end;
    cds_stock_list.next;
  End;
end;

procedure TCadMerchandise.Sb_CESTClick(Sender: TObject);
begin
  inherited;
  openSeacest(E_codigoCEST);
end;

procedure TCadMerchandise.Sb_ncmClick(Sender: TObject);
begin
  inherited;
  openSeaNcm(E_CodigoNCM);
end;

function TCadMerchandise.SetPriceByProfitAliq(CostValue, ProfitALiq: real;
  DecimalNumber: Integer): Real;
begin
 Result := 0;
  If (CostValue > 0) then
  Begin
    if (Configuracao('L','PRO_G_FORMULA_UPDATE_PRICETAG','1') = '1') then
    Begin
      //Preço de Custo / [( 100 - Taxa de Lucro ) / 100 ]
      Result := CostValue / (( 100 - ProfitALiq) /100);
    end
    else
    Begin
      //Preço de Custo + (Preço de Custo * Taxa de Lucro)
      Result := CostValue + ( CostValue * (ProfitALiq/100));
    end;
    //casa decimal zero, arredonda para cima para evitar prejuizos
    {
    if CasaDecimal = 0  then
    Begin
      //casa decimal zero, arredonda para cima para evitar prejuizos
      LcInt := trunc(Result);
      LcFrac := Frac(Result);
      if LcFrac > 0 then
        Result := LcInt + 1;
    End
    else
    Begin
      Result := RoundABNT(Result,CasaDecimal);
    End;
    }
    Result := RoundABNT(Result,DecimalNumber);
  end;
end;

function TCadMerchandise.setProfitByPrice(CostValue, PriceValue: real;
  DecimalNumber: Integer): Real;
begin
  if (Configuracao('L','PRO_G_FORMULA_UPDATE_PRICETAG','1') = '1') then
  Begin
    //Preço de Custo / [( 100 - Taxa de Lucro ) / 100 ]
    if PriceValue > 0 then
      Result := ( 1 - ( CostValue / PriceValue ) ) * 100
    else
      Result := ( 1 - ( CostValue / 1 ) ) * 100;
    Result := RoundABNT(Result,2);
  end
  else
  Begin
    //Preço de Custo + (Preço de Custo * Taxa de Lucro)
    if (CostValue > 0) then
      Result := ( ( PriceValue - CostValue ) / CostValue ) * 100
    else
      Result := ( ( PriceValue - CostValue ) / 1 ) * 100;
    Result := RoundABNT(Result,2);
  end;

end;

procedure TCadMerchandise.SetVariable;
begin
  //Mercadoria
  Mercadoria.Registro.Codigo := CodigoRegistro;
  Mercadoria.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Mercadoria.getAllByKey;
  inherited;


end;

procedure TCadMerchandise.ShowBrand;
begin
  FrBrand := TFmBrand.Create(Self);
  FrBrand.Parent := ctn_Brand;
  FrBrand.Align := alclient;
  FrBrand.listar;
  FrBrand.Show;

end;

procedure TCadMerchandise.ShowCategory;
begin
  FrCategory := TFmCategory.Create(Self);
  FrCategory.Parent := ctn_Category;
  FrCategory.Align := alClient;
  FrCategory.Listar;
  FrCategory.Show;
end;

procedure TCadMerchandise.ShowColor;
begin
  FrColor := TFmColor.Create(Self);
  FrColor.Align := alclient;
  FrColor.Parent := ctn_Color;
  FrColor.Listar;
  FrColor.Show;
end;

procedure TCadMerchandise.ShowData;
begin
  ShowProduct;
  ShowMerchandise;
  ShowStock;
  ShowPriceList;
  ShowStockList;
  inherited;

end;

procedure TCadMerchandise.ShowMeasure;
begin
  FrMeasure := TFmMeasure.Create(Self);
  FrMeasure.Parent := ctn_Measure;
  FrMeasure.Listar;
  FrMeasure.Align := alclient;
  FrMeasure.Show;
end;

procedure TCadMerchandise.ShowMerchandise;
begin
  //Merchandise
  with Mercadoria.Registro do
  Begin
    E_CodigoProvider.Text := IntToStr(Fornecedor);
    E_CodigoNCM.Text := NCM;
    E_codigoCEST.Text := CEST;
    Cb_Finalidade.ItemIndex := StrToIntDef( TipoTributacao ,1) - 1;
    Cb_OrigemMercadoria.ItemIndex := StrToIntDef( Origem,1) ;
    case AnsiIndexStr(UpperCase(Tipo), ['P','M','C','A']) of
      0:Cb_kind.ItemIndex := 0;
      1:Cb_kind.ItemIndex := 1;
      2:Cb_kind.ItemIndex := 2;
      3:Cb_kind.ItemIndex := 3;
    end;
    //Marca
    FrBrand.DBLCB_Lista.KeyValue := Marca;
    chbx_Imprime.Checked := ( Imprime = 'S' );
    chbx_Serie.Checked := ( ControlarSerie = 'S' );
    chbx_Exclusivo.Checked := ( ExclusivoRevenda = 'S' );
    E_aplication.Text := Aplicacao;
    cb_comp.ItemIndex := StrToIntDef(TipoComposicao,0);
  End;
end;

procedure TCadMerchandise.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadMerchandise.ShowPackage;
begin
  FrPackage := TFmPackage.Create(Self);
  FrPackage.Parent := ctn_package;
  FrPackage.Align := alclient;
  FrPackage.listar;
  FrPackage.Show;

end;

procedure TCadMerchandise.ShowPriceList;
Var
  I : Integer;
begin
  Mercadoria.ListaPreco.Parametro.Tabela.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Mercadoria.ListaPreco.getList;
  cds_price_listaliq_profit.OnChange := nil;
  cds_price_listprice_tag.OnChange := nil;
  with self.cds_price_list,Mercadoria.ListaPreco  do
  Begin
    Active := False;
    CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to Mercadoria.ListaPreco.Lista.Count - 1 do
    Begin
      Append;
      FieldByName('tb_price_list_id').AsInteger := Lista[I].Codigo;
      FieldByName('description').AsString       := Lista[I].Descricao;
      //Dados da Tabela
      Mercadoria.ListaPreco.Preco.Registro.Estabelecimento  := Lista[I].Estabelecimento;
      Mercadoria.ListaPreco.Preco.Registro.Tabela           := Lista[I].Codigo;
      Mercadoria.ListaPreco.Preco.Registro.Produto          := Mercadoria.Registro.Codigo;
      Mercadoria.ListaPreco.Preco.getByKey;
      if Mercadoria.ListaPreco.Preco.exist then
      Begin
        with Mercadoria.ListaPreco.Preco.Registro do
        Begin
          FieldByName('tb_product_id').AsInteger  := Produto;
          FieldByName('price_tag').AsFloat        := Preco;
          FieldByName('aliq_kickback').AsFloat    := Comissao;
          FieldByName('aliq_profit').AsFloat      := MargemLucro;
          FieldByName('quantity').AsFloat         := Quantidade;
        End;
      End
      else
      Begin
        FieldByName('tb_product_id').AsInteger  := 0;
        FieldByName('price_tag').AsFloat        := 0;
        FieldByName('aliq_kickback').AsFloat    := 0;
        FieldByName('aliq_profit').AsFloat      := Lista[I].MargemLucro;
        FieldByName('quantity').AsFloat         := 0;
      End;
      Post;
    End;
    LogChanges := True;
    cds_price_listaliq_profit.OnChange := ChangePriceByAliqProfit;
    cds_price_listprice_tag.OnChange := ChangePriceByValue;
  End;
end;

procedure TCadMerchandise.ShowProduct;
begin
  with Mercadoria.Produto do
  Begin
    with Registro do
    Begin
      E_ID.Text := IntToStr(codigo);
      E_Identifier.Text := Identificador;;
      E_Description.Text := Descricao;
      FrCategory.DBLCB_Lista.Text := Category.Registro.Descricao;
      FrCategory.DBLCB_Lista.KeyValue  := Categoria;
      chbx_promotion.Checked       := ( Promocao = 'S');
      ChBx_highlights.Checked       := ( Destaque = 'S');
      ChBx_active.Checked          := ( Ativo    = 'S');
      chbx_published.Checked        := ( Publicado= 'S');
      E_note.Text := Observaocao;
    End;
  End;

end;

procedure TCadMerchandise.ShowStock;
begin
  with Mercadoria.Estoque do
  Begin
    //Embalagem
    FrPackage.DBLCB_Lista.KeyValue := Mercadoria.Estoque.Embalagem.Registro.Codigo;
    FrPackage.DBLCB_Lista.Text := Mercadoria.Estoque.Embalagem.Registro.Descricao;
    //Medida
    FrMeasure.DBLCB_Lista.KeyValue := Mercadoria.Estoque.Medida.Registro.Codigo;
    FrMeasure.DBLCB_Lista.Text := Mercadoria.Estoque.Medida.Registro.Descricao;
    //Cor
    FrColor.DBLCB_Lista.KeyValue := Cor.Registro.Codigo;
    FrColor.DBLCB_Lista.Text := Cor.Registro.Descricao;
    E_CodeBar.Text := Registro.CodigoBarra ;
    if ( Registro.TemST = 'S' ) then
      Rg_ST.ItemIndex := 0
    else
      Rg_ST.ItemIndex := 1;
  End;
 //Controlado por outros meios
  with Mercadoria.Estoque.Registro do
  Begin
    //Qtde:= ;
    E_Qtde_Min.Text := FloatToStrF(QtdeMinima,ffFixed,10,2);
    E_Divisor.Text  := FloatToStrF(Divisor,ffFixed,10,2);
    E_Local.Text := Localizacao;
    E_Peso.Text := FloatToStrF(Peso,ffFixed,10,2);
    E_Largura.Text := FloatToStrF(Largura,ffFixed,10,2);
    E_Comprimento.Text := FloatToStrF(Comprimento,ffFixed,10,2);
    E_Altura.Text := FloatToStrF(Altura,ffFixed,10,2);
    E_VL_Fabrica.Text := FloatToStrF( CustoFabrica,ffFixed,10,2);
    E_VL_CustoReal.Text := FloatToStrF( CustoReal,ffFixed,10,2);
    E_VL_Custo.Text := FloatToStrF( PrecoCusto,ffFixed,10,2);
    chbx_Ctrl_Estoque.Checked := ( EstoqueNegativa = 'S' );
    chbx_ForaLinha.Checked := ( ForaDeLinha = 'S');
  End;
end;

procedure TCadMerchandise.ShowStockList;
Var
  I : Integer;
  LcITem : TStockList;
begin
  Mercadoria.ListaEstoque.Parametro.Tabela.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Mercadoria.ListaEstoque.getList;
  with self.cds_stock_list  do
  Begin
    Active := False;
    CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to Mercadoria.ListaEstoque.Lista.Count - 1 do
    Begin
      lcItem := Mercadoria.ListaEstoque.Lista[I];
      Append;
      FieldByName('id').AsInteger  := lcItem.Codigo;
      FieldByName('description').AsString := lcItem.Descricao;
      //Dados da Tabela
      Mercadoria.ListaEstoque.balance.Registro.Estabelecimento := lcItem.Estabelecimento;
      Mercadoria.ListaEstoque.balance.Registro.Tabela      := lcItem.Codigo;
      Mercadoria.ListaEstoque.balance.Registro.Mercadoria  := Mercadoria.Registro.Codigo;
      Mercadoria.ListaEstoque.balance.getByKey;
      if Mercadoria.ListaEstoque.balance.exist then
      Begin
        FieldByName('quantity').AsFloat := Mercadoria.ListaEstoque.balance.Registro.Quantidade;
        FieldByName('tb_product_id').AsFloat := Mercadoria.ListaEstoque.balance.Registro.Mercadoria;
      End
      else
      Begin
        FieldByName('quantity').AsFloat := 0;
        FieldByName('tb_product_id').AsFloat := 0;
      End;
      Post;
    End;
    LogChanges := True;
  End;
end;

procedure TCadMerchandise.UpdatePriceListByMarkup(CostValue: Real);
Var
  Lc_Aq_Margem : real;
  Lc_Vl_Preco : Real;
Begin
  if not cds_price_list.Active then cds_price_list.Active := True;
  cds_price_list.First;
  cds_price_listaliq_profit.OnChange := nil;
  cds_price_listprice_tag.OnChange := nil;
  while not cds_price_list.Eof do
   Begin
    //Verifica existe margem especifica do produto
    Lc_Aq_Margem := cds_price_listaliq_profit.AsFloat;
    //Verifica se a margem está com zero e procura margem geral na Tabela de preco
    //if Lc_Aq_Margem = 0 then Lc_Aq_Margem := Cds_Tabela_Preco.FieldByName('TPR_MAR_LRC').AsFloat;
    if Lc_Aq_Margem > 0 then
    Begin
      Lc_Vl_Preco := SetPriceByProfitAliq(
                                          CostValue,
                                          Lc_Aq_Margem,
                                          2);
      Lc_Aq_Margem := setProfitByPrice(
                                      CostVAlue,
                                      Lc_Vl_Preco,
                                      2);//calculo pela margem sempre com duas casas
      cds_price_list.edit;
      cds_price_listprice_tag.AsFloat  := Lc_Vl_Preco;
      cds_price_listaliq_profit.AsFloat := Lc_Aq_Margem;
      cds_price_list.Post;
    end;
    cds_price_list.Next;
  end;
  cds_price_listaliq_profit.OnChange := ChangePriceByAliqProfit;
  cds_price_listprice_tag.OnChange := ChangePriceByValue;
end;

function TCadMerchandise.ValidaInsert: boolean;
begin
  result := true;
end;

function TCadMerchandise.validateBarCode: Boolean;
Var
  Lc_Aux : String;
  Lc_ValidaEANGTIN : TACBrValidador;
begin
  Result:=true;
  if (Length(Trim( E_CodeBar.Text) ) > 0) then
  BEgin
    Try
      Lc_ValidaEANGTIN := TACBrValidador.Create(nil);
      Lc_ValidaEANGTIN.TipoDocto := docGTIN;
      Lc_ValidaEANGTIN.Documento := TRIM(E_CodeBar.Text);
      if not Lc_ValidaEANGTIN.Validar then
      Begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'O código EAN/GTIN está incorreto.',
                    'Verifique e tente novamente.']);
        Result := False;
        exit;
      end;
    Finally
      Lc_ValidaEANGTIN.DisposeOf;
    End;
  end;

end;

function TCadMerchandise.ValidateDelete: boolean;
var
  LcItem : TControllerOrderItem;
begin
  try
    Result := TRue;
    LcItem := TControllerOrderItem.Create(nil);
    LcItem.Registro.Estabelecimento := Mercadoria.Registro.Estabelecimento;
    LcItem.Registro.Produto         := Mercadoria.Registro.Codigo;
    if LcItem.ThereStatement then
    begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Existe movimentação deste produto.',
                    'Não é possivel excluir. ',
                    'Uma opção é deativar o produto. ']);
      Result := False;
    end;
  finally
    LcItem.DisposeOf;
  end;
end;

function TCadMerchandise.ValidateSave: boolean;
begin
  if (Ds_price_list.State in [dsEdit]) then
    cds_price_list.post;

  if not ValidateSaveMerchandise then
  Begin
    Result := false;
    Exit;
  end;

end;

function TCadMerchandise.ValidateSaveMerchandise: boolean;
begin
  Result := True;
  if not validateBarCode then
  Begin
    Result := False;
    exit;
  End;


  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;

  if trim(FrCategory.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Categoria não informado.',
                  'Preencha o campo para continuar']);
    if FrCategory.DBLCB_Lista.CanFocus then FrCategory.DBLCB_Lista.SetFocus;
    Result := False;
    exit;
  end;

  if trim(E_CodigoNCM.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo N.C.M não informado.',
                  'Preencha o campo para continuar']);
    if E_CodigoNCM.CanFocus then E_CodigoNCM.SetFocus;
    Result := False;
    exit;
  end;

  if trim(FrBrand.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Marca não informado.',
                  'Preencha o campo para continuar']);
    if FrBrand.DBLCB_Lista.CanFocus then FrBrand.DBLCB_Lista.SetFocus;
    Result := False;
    exit;
  end;

  if trim(FrPackage.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Embalagem não informado.',
                  'Preencha o campo para continuar']);
    if FrPackage.DBLCB_Lista.CanFocus then FrPackage.DBLCB_Lista.SetFocus;
    Result := False;
    exit;
  end;

  if trim(FrMeasure.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Medida não informado.',
                  'Preencha o campo para continuar']);
    if FrMeasure.DBLCB_Lista.CanFocus then FrPackage.DBLCB_Lista.SetFocus;
    Result := False;
    exit;
  end;


end;

end.
