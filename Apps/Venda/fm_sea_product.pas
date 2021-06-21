unit fm_sea_product;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.ListView,
  TypesListCollection,ctrl_mob_merchandise, UnFunctions,ctrl_mob_price,
  MainModule, FMX.Effects;

type
  TFmSeaProduct = class(TFrame)
    LayoutMain: TLayout;
    lsv_Search: TListView;
    Ly_Result_top: TLayout;
    Rc_result_top: TRectangle;
    Ly_list_titlle: TLayout;
    Lb_name_tittle: TLabel;
    Sb_search: TSpeedButton;
    Sb_Insert: TSpeedButton;
    Ly_quick_search: TLayout;
    E_busca: TEdit;
    Sb_back: TSpeedButton;
    Ly_selected: TLayout;
    Rc_selected: TRectangle;
    Ly_id_produto: TLayout;
    Lb_desc_produto: TLabel;
    Lb_cod_produto: TLabel;
    Ly_vl_preco: TLayout;
    Gpl_botao: TGridPanelLayout;
    Sb_tab_01: TButton;
    Sb_tab_03: TButton;
    Sb_tab_04: TButton;
    Sb_tab_05: TButton;
    Sb_tab_06: TButton;
    Sb_tab_07: TButton;
    Sb_back_product_callback: TSpeedButton;
    ShadowEffect3: TShadowEffect;
    procedure lsv_SearchItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Sb_searchClick(Sender: TObject);
    procedure lsv_SearchUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure E_buscaChangeTracking(Sender: TObject);
    procedure Sb_backDblClick(Sender: TObject);
    procedure Sb_backTap(Sender: TObject; const Point: TPointF);
  private
    { Private declarations }
    procedure getHead;
    procedure getItem(AItem: TListViewItem);

    procedure FillList(ListObj : TCollSplMerchandise);
    procedure CleanSelectedProduto;
    procedure SetPriceSelectedProduto(IdProduct:Integer);

  public
    { Public declarations }
    procedure getList(par:String);
  end;

implementation

{$R *.fmx}

{ TFmSeaProduct }

procedure TFmSeaProduct.CleanSelectedProduto;
begin
  try
    Lb_cod_produto.Text   := '0000';
    Lb_desc_produto.Text  := 'Nenhum produto selecionado';
    Sb_tab_01.Text := '0,00';
    Sb_tab_03.Text := '0,00';
    Sb_tab_04.Text := '0,00';
    Sb_tab_05.Text := '0,00';
    Sb_tab_06.Text := '0,00';
    Sb_tab_07.Text := '0,00';
  except
    on E : Exception do
          ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;
end;

procedure TFmSeaProduct.E_buscaChangeTracking(Sender: TObject);
begin
  getList('');
end;

procedure TFmSeaProduct.FillList(ListObj: TCollSplMerchandise);
Var
  I : Integer;
  LcLVI : TListViewItem;
  LcStrJSon : String;
begin
  if (ListObj.Count > 0) then
  Begin
    //Desabilita o Botão
    Try
      lsv_search.BeginUpdate;
      for I := 0 to ( ListObj.Count - 1) do
      Begin
        LcLVI := lsv_Search.Items.Add;
        LcLVI.Text := ListObj[I].Codigo.ToString;
        LcLVI.Data['Codigo'] := StrZero(ListObj[I].Codigo,4,0);
        LcLVI.Data['Produto'] := ListObj[I].Descricao;
        LcLVI.Data['Estoque'] := concat('Estoque : ', FloatToStrF(ListObj[I].Estoque,ffNumber,10,2));
        LcLVI.Data['Embalagem'] := concat('Embalagem : ', ListObj[I].Embalagem);
      End;
    Finally
      lsv_Search.EndUpdate;
    End;
  End;
end;

procedure TFmSeaProduct.getHead;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_Search.Items.Clear;
  LcLVI := lsv_Search.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Descrição',#13,#10,
                       'Embalagem/Estoque',#13,#10
                );
  LcLVI.Purpose := TListItemPurpose.Header;


end;

procedure TFmSeaProduct.getItem(AItem: TListViewItem);
Var
  LcLVI : TListViewItem;
  LcCodID : Integer;
begin
  LcLVI := lsv_Search.Items[AItem.Index];
  LcCodID := StrToInt(AItem.Text);
  if LcCodID > 0 then
  Begin
    Lb_cod_produto.Text   := LcLVI.Data['Codigo'].AsString;
    Lb_desc_produto.Text  := LcLVI.Data['Produto'].AsString;
    SetPriceSelectedProduto(LcCodID);
  end
  else
  Begin
    CleanSelectedProduto;
  End;
end;

procedure TFmSeaProduct.getList(par: String);
Var
  LcMerchandise : TCtrlMobMerchandise;
begin
  Try
    getHead;
    LcMerchandise := TCtrlMobMerchandise.Create(self);
    LcMerchandise.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcMerchandise.getListSpl(getParameter(E_Busca.Text));
    FillList( LcMerchandise.CollListaSpl );
  Finally
    LcMerchandise.DisposeOf;
  End;
end;

procedure TFmSeaProduct.lsv_SearchItemClick(const Sender: TObject;
  const AItem: TListViewItem);
Begin
  getItem(AItem);
end;

procedure TFmSeaProduct.lsv_SearchUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     lsv_Search.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('Codigo');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Produto');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Estoque');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Embalagem');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    lsv_Search.EndUpdate;
  end;


end;

procedure TFmSeaProduct.Sb_backDblClick(Sender: TObject);
begin
  Ly_list_titlle.Visible := True;
  Ly_quick_search.Visible := False;
  E_busca.Text := '';
end;

procedure TFmSeaProduct.Sb_backTap(Sender: TObject; const Point: TPointF);
begin
  Ly_list_titlle.Visible := True;
  Ly_quick_search.Visible := False;
  E_busca.Text := '';
end;

procedure TFmSeaProduct.Sb_searchClick(Sender: TObject);
begin
  Ly_list_titlle.Visible := False;
  Ly_quick_search.Visible := True;
  E_busca.SetFocus;
  getlist('');
end;

procedure TFmSeaProduct.SetPriceSelectedProduto(IdProduct: Integer);
Var
  LcPrice : TCtrlMobPrice;
begin
  TRy
    LcPrice := TCtrlMobPrice.Create(Self);
    LcPrice.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcPrice.Registro.Produto := IdProduct;

    LcPrice.Registro.Tabela := 1;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_01.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_01.Text := '0,00';

    //TAbela codigo 2 é de promoção do Sistema Gestão

    LcPrice.Registro.Tabela := 3;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_03.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_03.Text := '0,00';

    LcPrice.Registro.Tabela := 4;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_04.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_04.Text := '0,00';

    LcPrice.Registro.Tabela := 5;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_05.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_05.Text := '0,00';

    LcPrice.Registro.Tabela := 6;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_06.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_06.Text := '0,00';

    LcPrice.Registro.Tabela := 7;
    LcPrice.getByKey;
    if LcPrice.exist then
      Sb_tab_07.Text :=FloatToStrF(LcPrice.Registro.Preco,ffFixed,10,2)
    else
      Sb_tab_07.Text := '0,00';
  Finally
    LcPrice.DisposeOf;
  End;

end;

end.
