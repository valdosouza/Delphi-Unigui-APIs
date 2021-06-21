unit fm_sea_order_sale;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.ListView,
  TypesListCollection,ctrl_mob_merchandise, UnFunctions,ctrl_mob_price,
  MainModule, FMX.Effects, ctrl_mob_order_sale;

type
  TFmSeaOrderSale = class(TFrame)
    LayoutFmMain: TLayout;
    lsv_Search: TListView;
    Ly_Result_top: TLayout;
    Rc_result_top: TRectangle;
    Ly_list_titlle: TLayout;
    Lb_name_tittle: TLabel;
    Sb_search: TSpeedButton;
    Sb_Insert: TSpeedButton;
    Sb_filter: TSpeedButton;
    Ly_quick_search: TLayout;
    E_busca: TEdit;
    Sb_back: TSpeedButton;
    ShadowEffect1: TShadowEffect;
    procedure Sb_InsertClick(Sender: TObject);
    procedure Sb_searchClick(Sender: TObject);
    procedure Sb_backClick(Sender: TObject);
    procedure E_buscaChangeTracking(Sender: TObject);
  private
    Page : Integer;
    procedure getHead;
    procedure FillList(ListObj : TCollSplOrderSale);
  public
    Ordersale : TCtrlMobOrderSale;
    procedure InitVariable;
    procedure getList(par:String);
  end;

implementation

uses
  tas_order_sale;

{$R *.fmx}

{ TFmSeaOrderSale }


procedure TFmSeaOrderSale.E_buscaChangeTracking(Sender: TObject);
begin
  getList('');
end;

procedure TFmSeaOrderSale.FillList(ListObj : TCollSplOrderSale);
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Desabilita o Botão
  Try
    lsv_Search.BeginUpdate;
    for I := 0 to ( ListObj.Count - 1) do
    Begin
      LcLVI := lsv_Search.Items.Add;
      LcLVI.Text := ListObj[I].Codigo.ToString;
      LcLVI.Data['Pedido']  := concat('Pedido : ', ListObj[I].Pedido);
      LcLVI.Data['Data']    := concat('Data : ', DateToStr(ListObj[I].Data));
      LcLVI.Data['Cliente'] := concat('Cliente : ', ListObj[I].NomeCliente);
      LcLVI.Data['Valor']   := concat('Valor : ', FloatToStrF(ListObj[I].ValorPedido,ffNumber,10,2));
    End;
  Finally
    lsv_Search.EndUpdate;
  End;
end;

procedure TFmSeaOrderSale.getHead;
Var
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_Search.Items.Clear;
  LcLVI := lsv_Search.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Pedido / Data',#13,#10,
                       'Nome do Cliente ',#13,#10,
                       'Valor Pedido'
                );
  LcLVI.Purpose := TListItemPurpose.Header;

end;


procedure TFmSeaOrderSale.getList(par: String);
begin
  lsv_Search.Items.Clear;
  getHead;
  if Self.Page <= 0 then
    Self.Page := 1
  else
    Self.Page := Self.Page + 1;
  Ordersale.orderby := ' order by ord.updated_at desc ';
  Ordersale.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  Ordersale.getListSpl(getParameter(E_Busca.Text));
  FillList( Ordersale.ListSpl );

end;

procedure TFmSeaOrderSale.InitVariable;
begin
  Ordersale := TCtrlMobOrderSale.Create(Self);
  Ly_list_titlle.Visible := True;
  Ly_quick_search.Visible := False;
end;

procedure TFmSeaOrderSale.Sb_backClick(Sender: TObject);
begin
  inherited;
  Ly_list_titlle.Visible := True;
  Ly_quick_search.Visible := False;
end;

procedure TFmSeaOrderSale.Sb_InsertClick(Sender: TObject);
Var
  Form : TTasOrderSale;
begin
  Form := TTasOrderSale.Create(Self);
  Form.CodigoRegistro := 0;
  Form.Parent := Self;
  Form.ShowModal(
      procedure(ModalResult : TModalResult)
      begin
        getlist('');
        Form := nil;
      end);
end;



procedure TFmSeaOrderSale.Sb_searchClick(Sender: TObject);
Var
  I :Integer;
begin
  Ly_quick_search.Visible := True;
  Ly_list_titlle.Visible := False;
  E_busca.SetFocus;
  getlist('');
end;

end.
