unit cad_merchandise;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  cad_product, uniMainMenu,Data.DB,
  uniCheckBox, uniMemo, uniPanel, uniPageControl, uniGUIClasses, uniEdit,uniGUITypes,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniMultiItem, uniComboBox, uniRadioGroup, uniRadioButton, uniGroupBox,
  uniBasicGrid, uniStringGrid, fm_brand, fm_package, fm_measure, fm_color,
  uniSpinEdit, uniDateTimePicker, System.AnsiStrings, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, uniDBGrid,ControllerPrice,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,MainModule,ControllerStockBalance,
  ControllerMerchandise, tblprice,ControllerPriceList, tblPriceList, tblStockList,
  ControllerStockList, UnFunctions, Vcl.Menus, Vcl.Controls, Vcl.Forms,
  Vcl.Grids ;

type
  TCadMerchandise = class(TCadProduct)
    UniLabel2: TUniLabel;
    E_CodeBar: TUniEdit;
    E_CodigoProvider: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    E_CodigoNCM: TUniEdit;
    UniLabel5: TUniLabel;
    E_codigoCEST: TUniEdit;
    chbx_Imprime: TUniCheckBox;
    chbx_Serie: TUniCheckBox;
    chbx_ForaLinha: TUniCheckBox;
    chbx_Exclusivo: TUniCheckBox;
    tbs_estoque: TUniTabSheet;
    tbs_preco: TUniTabSheet;
    tbs_aplication: TUniTabSheet;
    E_aplication: TUniMemo;
    Sb_ncm: TUniSpeedButton;
    Sb_CEST: TUniSpeedButton;
    tbs_tributacao: TUniTabSheet;
    chbx_Ctrl_Estoque: TUniCheckBox;
    UniPanel1: TUniPanel;
    UniLabel14: TUniLabel;
    E_VL_Fabrica: TUniEdit;
    UniLabel15: TUniLabel;
    E_VL_CustoReal: TUniEdit;
    UniLabel16: TUniLabel;
    E_VL_Custo: TUniEdit;
    dbg_PriceList: TUniDBGrid;
    UniHiddenPanel1: TUniHiddenPanel;
    E_PriceTag: TUniFormattedNumberEdit;
    E_Aliq_kickback: TUniNumberEdit;
    UniPanel2: TUniPanel;
    UniLabel17: TUniLabel;
    Cb_OrigemMercadoria: TUniComboBox;
    Rg_ST: TUniRadioGroup;
    Cb_Finalidade: TUniComboBox;
    UniLabel18: TUniLabel;
    UniPanel3: TUniPanel;
    ctn_Brand: TUniContainerPanel;
    ctn_package: TUniContainerPanel;
    ctn_Measure: TUniContainerPanel;
    ctn_color: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel13: TUniLabel;
    E_Divisor: TUniEdit;
    Cb_kind: TUniComboBox;
    E_Qtde_Min: TUniEdit;
    UniLabel8: TUniLabel;
    E_Local: TUniEdit;
    UniLabel9: TUniLabel;
    E_Peso: TUniEdit;
    UniLabel10: TUniLabel;
    E_Largura: TUniEdit;
    UniLabel11: TUniLabel;
    E_Comprimento: TUniEdit;
    l_height: TUniLabel;
    E_Altura: TUniEdit;
    dbg_StockList: TUniDBGrid;
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
    cds_stock_listreg_status: TStringField;
    Ds_stock_list: TDataSource;
    cds_stock_listtb_product_id: TIntegerField;
    Composio1: TUniMenuItem;
    UniLabel12: TUniLabel;
    cb_comp: TUniComboBox;

    procedure Stg_ListaPrecoSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure Stg_ListaPrecoDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
    procedure E_codigoCESTExit(Sender: TObject);
    procedure cds_price_listCalcFields(DataSet: TDataSet);
    procedure Sb_ncmClick(Sender: TObject);
    procedure Sb_CESTClick(Sender: TObject);
    procedure Composio1Click(Sender: TObject);
  private
    { Private declarations }
    FrBrand   : TFmBrand;
    FrPackage : TFmPackage;
    FrMeasure : TFmMeasure;
    FrColor   : TFmColor;
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
    procedure SavePriceList;
    procedure SaveStockList;

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

uses msg_form, unMessages , openForms;

{ TCadMerchandise }

procedure TCadMerchandise.cds_price_listCalcFields(DataSet: TDataSet);
begin
  umm.regUpdater(DataSet);
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

procedure TCadMerchandise.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        Self.Mercadoria.delete;
        Self.Close;
      End;
    end
  );
end;


procedure TCadMerchandise.EditionControl;
begin
  inherited;
  EditionControler(FrBrand);
  EditionControler(FrMeasure);
  EditionControler(FrPackage);
  EditionControler(FrColor);
end;

procedure TCadMerchandise.E_codigoCESTExit(Sender: TObject);
begin
  UniSession.AddJS('setTimeout(function(){'+ FrCategory.DBLCB_Lista.JSName +'.focus()}, 100)');
end;

procedure TCadMerchandise.FormatScreen;
begin
  inherited;
  Pg_Main.ActivePage := tbs_estoque;
  ShowBrand;
  ShowPackage;
  ShowMeasure;
  ShowColor;
end;

procedure TCadMerchandise.InitVariable;
begin
  inherited;
  Mercadoria:= TControllerMerchandise.Create(Self);
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
  self.Mercadoria.Produto.Registro.Codigo := 0;
  self.Mercadoria.Registro.Codigo := 0;
  self.Mercadoria.Registro.CodigoInterno := '';
  self.Mercadoria.Estoque.Registro.Mercadoria := 0;
  self.Mercadoria.Estoque.Registro.CodigoBarra := '';
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

procedure TCadMerchandise.Save;
begin
  inherited;
  SaveProduct;
  SaveMerchandise;
  SaveStock;
  SavePriceList;
  SaveStockList;
  E_ID.Text     := IntToStr(Mercadoria.Registro.codigo);
  E_Identifier.Text := Mercadoria.Produto.Registro.Identificador;
 //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Mercadoria.Registro.Codigo;
end;

procedure TCadMerchandise.SaveMerchandise;
Begin
  //Merchandise
  with Mercadoria.Registro  do
  Begin
    Codigo            := Mercadoria.Produto.Registro.Codigo;
    Estabelecimento   := GbInstitution;
    if ( E_Identifier.Text <> '' ) then
      CodigoInterno     := E_Identifier.Text
    else
      CodigoInterno     := IntToStr(Mercadoria.Produto.Registro.Codigo);
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
End;

procedure TCadMerchandise.SaveStock;
Begin
  //Estoque
  with Mercadoria.Estoque.Registro do
  Begin
    Mercadoria:= self.Mercadoria.Registro.Codigo;
    Estabelecimento := self.Mercadoria.Registro.Estabelecimento;
    //Este campo esta sendo setado com zero, pois houve um erro de conceito e no futuro poderá ser excluido
    Embalagem:= FrPackage.DBLCB_Lista.KeyValue;
    Medida:= FrMeasure.DBLCB_Lista.KeyValue;
    if FrColor.DBLCB_Lista.KeyValue <> null then
      Cor:= FrColor.DBLCB_Lista.KeyValue
    else
      Cor:= 0;
    CodigoBarra := E_CodeBar.Text;
    if Rg_ST.ItemIndex = 0 then
      TemST := 'S'
    else
      TemST := 'N';
    //Controlado por outros meios
    //Qtde:= ;
    QtdeMinima:= StrToFloatDef(E_Qtde_Min.Text,0);
    Divisor:= StrToIntDef(E_Divisor.Text,0);
    Localizacao:= E_Local.Text;
    Peso:= StrToFloatDef(E_Peso.Text,0);
    Largura:= StrToFloatDef(E_Largura.Text,0);
    Comprimento:= StrToFloatDef(E_Comprimento.Text,0);
    Altura:= StrToFloatDef(E_Altura.Text,0);
    CustoFabrica:= StrToFloatDef(E_VL_Fabrica.Text,0);
    CustoReal:= StrToFloatDef(E_VL_CustoReal.Text,0);
    PrecoCusto:= StrToFloatDef(E_VL_Custo.Text,0);
    if chbx_Ctrl_Estoque.Checked then
      EstoqueNegativa:= 'S'
    else
      EstoqueNegativa:= 'N';
    if chbx_ForaLinha.Checked then
      ForaDeLinha := 'S'
    else
      ForaDeLinha := 'N';
    RegistroCriado:= Now;
    RegistroAlterado:= Now;
  End;
  Mercadoria.Estoque.save;
End;

procedure TCadMerchandise.SaveStockList;
Var
  LcOperacao : String;
begin
  cds_stock_list.First;
  while not cds_stock_list.eof do
  Begin
    if not (cds_stock_listtb_product_id.AsInteger > 0) then
    begin
      with Mercadoria.SaldoEstoque do
      Begin
        Registro.Estabelecimento  := Mercadoria.Registro.Estabelecimento;
        Registro.Tabela           := cds_stock_list.FieldByName('id').AsInteger;
        Registro.Mercadoria       := Mercadoria.Registro.Codigo;
        Registro.Quantidade       := 0;
        Registro.Minimo           := 0;
      end;
      Mercadoria.SaldoEstoque.save;
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

procedure TCadMerchandise.SavePriceList;
Var
  LcOperacao : String;
begin
  if cds_price_list.ChangeCount > 0 then
  Begin
    cds_price_list.First;
    while not cds_price_list.eof do
    Begin
      with Mercadoria.ListaPreco.Preco do
      Begin
        Registro.Estabelecimento  := Mercadoria.Registro.Estabelecimento;
        Registro.Tabela           := cds_price_list.FieldByName('tb_price_list_id').AsInteger;
        Registro.Produto          := Mercadoria.Registro.Codigo;
        Registro.Preco            := cds_price_list.FieldByName('price_tag').AsFloat;
        Registro.MargemLucro      := cds_price_list.FieldByName('aliq_kickback').AsFloat;
        Registro.Comissao         := cds_price_list.FieldByName('aliq_profit').AsFloat;
        Registro.Quantidade       := cds_price_list.FieldByName('quantity').AsFloat;
        case cds_price_list.UpdateStatus of
          usModified: Mercadoria.ListaPreco.Preco.update;
          usInserted: Mercadoria.ListaPreco.Preco.insert;
          usDeleted: Mercadoria.ListaPreco.Preco.delete
        end;
      End;
      cds_price_list.next;
    End;
  End;
End;


procedure TCadMerchandise.SaveProduct;
begin
  with Mercadoria.Produto.Registro do
  Begin
    Identificador   := E_Identifier.Text;
    Estabelecimento := GbInstitution;
    Descricao       := E_Description.Text;
    Categoria := FrCategory.DBLCB_Lista.KeyValue;
    if chbx_promotion.Checked  then  Promocao  := 'S'  else  Promocao      := 'N';
    if ChBx_highlights.Checked  then  Destaque  := 'S'  else  Destaque      := 'N';
    if ChBx_active.Checked     then  Ativo     := 'S'  else  Ativo         := 'N';
    if chbx_published.Checked   then  Publicado := 'S'  else  Publicado     := 'N';
    Observaocao     := E_note.Text;
  End;
  Mercadoria.Produto.save;
end;

procedure TCadMerchandise.SetVariable;
begin
  //Mercadoria
  Mercadoria.Registro.Codigo := CodigoRegistro;
  Mercadoria.Registro.Estabelecimento := GbInstitution;
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

procedure TCadMerchandise.ShowColor;
begin
  FrColor := TFmColor.Create(Self);
  FrColor.Align := alclient;
  FrColor.Parent := ctn_Color;
  FrColor.Listar;
  FrColor.Show;
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
  LcITem : TPriceList;
  LcPriceList : TControllerPriceList;
begin
  lcItem := TPriceList.Create;
  LcPriceList := TControllerPriceList.Create(Self);
  LcPriceList.Registro.Estabelecimento := GbInstitution;
  LcPriceList.getList;
  with self.cds_price_list  do
  Begin
    Active := False;
    CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to LcPriceList.Lista.Count - 1 do
    Begin
      LcITem := TPriceList.create;
      lcItem := LcPriceList.Lista[I];
      Append;
      FieldByName('tb_price_list_id').AsInteger  := lcItem.Codigo;
      FieldByName('description').AsString := lcItem.Descricao;
      //Dados da Tabela
      Mercadoria.ListaPreco.Preco.Registro.Estabelecimento := lcItem.Estabelecimento;
      Mercadoria.ListaPreco.Preco.Registro.Tabela := lcItem.Codigo;
      Mercadoria.ListaPreco.Preco.Registro.Produto := Mercadoria.Registro.Codigo;
      Mercadoria.ListaPreco.Preco.getByKey;
      with Mercadoria.ListaPreco.Preco.Registro do
      Begin
        FieldByName('price_tag').AsFloat := Preco;
        FieldByName('aliq_kickback').AsFloat := MargemLucro;
        FieldByName('aliq_profit').AsFloat := Comissao;
        FieldByName('quantity').AsFloat := Quantidade;
      End;
      Post;
    End;
  End;
  FreeAndNil(LcPriceList);
  cds_price_list.LogChanges := True;
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
  LcStockList : TControllerStockList;
begin
  LcStockList := TControllerStockList.Create(Self);
  LcStockList.Registro.Estabelecimento := GbInstitution;
  LcStockList.getList;
  with self.cds_stock_list  do
  Begin
    Active := False;
    CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to LcStockList.Lista.Count - 1 do
    Begin
      lcItem := LcStockList.Lista[I];
      Append;
      FieldByName('id').AsInteger  := lcItem.Codigo;
      FieldByName('description').AsString := lcItem.Descricao;
      //Dados da Tabela
      Mercadoria.SaldoEstoque.Registro.Estabelecimento := lcItem.Estabelecimento;
      Mercadoria.SaldoEstoque.Registro.Tabela      := lcItem.Codigo;
      Mercadoria.SaldoEstoque.Registro.Mercadoria  := Mercadoria.Registro.Codigo;
      Mercadoria.SaldoEstoque.getByKey;
      if Mercadoria.SaldoEstoque.exist then
      Begin
        FieldByName('quantity').AsFloat := Mercadoria.SaldoEstoque.Registro.Quantidade;
        FieldByName('tb_product_id').AsFloat := Mercadoria.SaldoEstoque.Registro.Mercadoria;
      End
      else
      Begin
        FieldByName('quantity').AsFloat := 0;
        FieldByName('tb_product_id').AsFloat := 0;
      End;
      Post;
    End;
  End;
  FreeAndNil(LcStockList);
  cds_stock_list.LogChanges := True;
end;

procedure TCadMerchandise.Stg_ListaPrecoDrawCell(Sender: TObject; ACol,
  ARow: Integer; var Value: string; Attribs: TUniCellAttribs);
Var
  S : String;
begin
  {
  with  TUniStringGrid(Sender) do
  Begin
    If (arow > 0) and (acol >0) then // testa se não é a primeira linha (fixa)
    Begin
      If (acol >0) then // Só pega as colunas com valores
      Begin
        // Pega o texto da célula
        //s := FloatToStrF(StrToFloatDef(Cells[acol, ARow],0),ffFixed,10,2);
        s := FloatToStrF(StrToFloatDef(Cells[acol, ARow],0),ffFixed,10,2);
        Attribs.Style.Padding.ToDouble(s)
        //Cells[acol, ARow] := s;
      End;
    end;
  end;
  }
end;

procedure TCadMerchandise.Stg_ListaPrecoSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
Var
  list : TUniStringGrid;
begin
  list := TUniStringGrid.Create(Self);
  list := TUniStringGrid(sender);
  if ACol < 2 then
    list.Options := list.Options - [goEditing]
  else
    list.Options := list.Options + [goEditing];
end;

function TCadMerchandise.ValidaInsert: boolean;
begin
  result := true;
end;

function TCadMerchandise.ValidateDelete: boolean;
begin
  Result := True;
  if Mercadoria.existBond then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não é possível excluir este registro.',
                  'Há vínculos no sistema que impedem esta ação.',
                  'Se possível, inative o registro']);
    Result := False;
    exit;
  End;
end;

function TCadMerchandise.ValidateSave: boolean;
begin
  if not ValidateSaveMerchandise then
  Begin
    Result := false;
    Exit;
  end;
end;

function TCadMerchandise.ValidateSaveMerchandise: boolean;
begin
  Result := True;
  if not ValidateSaveProduct then
  Begin
    Result := false;
    Exit;
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
