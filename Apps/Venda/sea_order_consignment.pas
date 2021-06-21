unit sea_order_consignment;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_search, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.Actions, FMX.ActnList, FMX.TabControl,
  FMX.Gestures, System.ImageList, FMX.ImgList, FMX.Edit,
  FMX.Controls.Presentation, FMX.Objects, FMX.ListView, FMX.Layouts,
  tas_order_consignment,TypesListCollection, ctrl_mob_order_consignment, FMX.Ani,
  FMX.Effects, fm_sea_order_sale;

type
  TSeaOrderConsignment = class(TBaseSearch)
    lsv_Search: TListView;
    FmSeaOrderSale: TFmSeaOrderSale;
    
    procedure Sb_InsertClick(Sender: TObject);
    procedure lsv_SearchUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
    ListaOrderConsignment : TCollSplOrderConsignment;
  protected
    procedure InitVariable;Override;
    procedure getHead;Override;
    procedure getItem(AItem: TListViewItem);override;
    procedure getList(par: String);override;
    procedure FillList(ListObj : TCollSplOrderConsignment);
  public
    { Public declarations }
    OrderConsinga : TCtrlMobOrderConsignment;
  end;

var
  SeaOrderConsignment: TSeaOrderConsignment;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses UnFunctions, MainModule;

procedure TSeaOrderConsignment.FillList(ListObj: TCollSplOrderConsignment);
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
      LcLVI.Data['Nome']      := ListObj[I].NomeRazao;
      LcLVI.Data['Fantasia']  := ListObj[I].ApelidoFantasia;
    End;
  Finally
    lsv_Search.EndUpdate;
  End;
end;

procedure TSeaOrderConsignment.getHead;
Var
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_Search.Items.Clear;
  LcLVI := lsv_Search.Items.Add;
  LcLVI.Height := 35;
  LcLVI.Text := concat('Razão Social ',#13,#10,
                       'Nome Fantasia'
                );
  LcLVI.Purpose := TListItemPurpose.Header;
  ListaOrderConsignment := TCollSplOrderConsignment.Create;

end;

procedure TSeaOrderConsignment.getItem(AItem: TListViewItem);
Var
  Form : TTasOrderConsignment;
begin
  CodigoRegistro := StrToInt(AItem.Text);
  if  CodigoRegistro > 0 then
  Begin
    //Mostra a lista das consginaçãoes deste cliente
    Form := TTasOrderConsignment.Create(Self);
    Form.CodigoRegistro := Self.CodigoRegistro;
    Form.ShowModal(
      procedure(ModalResult : TModalResult)
      begin
        getlist('');
        Form := nil;
      end);
  End;
end;

procedure TSeaOrderConsignment.getList(par: String);
begin
  inherited;
  OrderConsinga.orderby := ' order by ord.updated_at desc ';
  OrderConsinga.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsinga.getListSpl(getParameter(FmSeaOrderSale.E_Busca.Text));
  ListaOrderConsignment := OrderConsinga.ListSpl;
  FillList( ListaOrderConsignment );

end;

procedure TSeaOrderConsignment.InitVariable;
begin
  inherited;
  OrderConsinga := TCtrlMobOrderConsignment.Create(Self);
  OrderConsinga.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsinga.updateTbInstituition;
  OrderConsinga.MOperacoes.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  OrderConsinga.MOperacoes.updateTbInstituition;

end;

procedure TSeaOrderConsignment.lsv_SearchUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     lsv_Search.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('Nome');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Fantasia');
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

procedure TSeaOrderConsignment.Sb_InsertClick(Sender: TObject);
Var
  Form : TTasOrderConsignment;
begin
  Form := TTasOrderConsignment.Create(Self);
  Form.CodigoRegistro := 0;
  Form.Parent := Self;
  Form.ShowModal(
    procedure(ModalResult : TModalResult)
    begin
      getlist('');
      Form := nil;
    end);

end;

end.
