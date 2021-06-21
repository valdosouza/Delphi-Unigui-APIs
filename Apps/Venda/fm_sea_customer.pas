unit fm_sea_customer;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.ListView,
  TypesListCollection,ctrl_mob_merchandise, UnFunctions,ctrl_mob_price,
  MainModule, FMX.Effects, ctrl_mob_customer;

type
  TFmSeaCustomer = class(TFrame)
    LayoutMain: TLayout;


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
    Sb_back_callback: TSpeedButton;
    lsv_Search: TListView;
    procedure Sb_searchClick(Sender: TObject);
    procedure lsv_SearchUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Sb_backClick(Sender: TObject);
    procedure Sb_back_callbackClick(Sender: TObject);
    procedure E_buscaChangeTracking(Sender: TObject);

  private
    Page : Integer;

  protected
    procedure getHead;
    procedure FillList(ListObj : TCollSplCustomer);

  public
    Customer : TCtrlMobCustomer;
    procedure InitVariable;
    procedure getList(par:String);

  end;

implementation

{$R *.fmx}

uses cad_entity;

{ TFmSeaCustomer }

procedure TFmSeaCustomer.E_buscaChangeTracking(Sender: TObject);
begin
  getList('');
end;

procedure TFmSeaCustomer.FillList(ListObj: TCollSplCustomer);
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  if ListObj.Count > 0 then
  Begin
    try
      lsv_Search.BeginUpdate;
      for I := 0 to ( ListObj.Count - 1) do
      begin
        LcLVI := lsv_Search.Items.Add;
        LcLVI.Text := ListObj[I].Codigo.ToString;
        LcLVI.Data['Codigo']    := ListObj[I].Codigo.ToString ;
        LcLVI.Data['Nome']   := ListObj[I].NomeRazao;
        LcLVI.Data['Fantasia']  := ListObj[I].ApelidoFantasia;
        LcLVI.Data['Endereco']  := concat(ListObj[I].Logradouro,', ',ListObj[I].NumeroPredial,' - ',ListObj[I].Bairro);
      end;
    finally
      LcLVI.EndUpdate;
    end;
  End;
end;

procedure TFmSeaCustomer.getHead;
Var
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_Search.Items.Clear;
  LcLVI := lsv_Search.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Nome / Razão Social',#13,#10,
                       'Apelido / Nome Fantasia',#13,#10,
                       'Endereco'
                );
  LcLVI.Purpose := TListItemPurpose.Header;

end;




procedure TFmSeaCustomer.getList(par: String);

begin
  getHead;
  if Self.Page <= 0 then
    Self.Page := 1
  else
    Self.Page := Self.Page + 1;
  Customer.Registro.Estabelecimento := UMM.GInstitution.Registro.codigo;
  Customer.getListSpl(getParameter(E_Busca.Text));
  FillList( Customer.ListSpl );
end;

procedure TFmSeaCustomer.InitVariable;
begin
  Customer := TCtrlMobCustomer.Create(Self);
  Ly_list_titlle.Visible := True;
  Ly_quick_search.Visible := False;
end;

procedure TFmSeaCustomer.lsv_SearchUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  try
    try
     lsv_Search.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('Nome');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Fantasia');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Endereco');
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




procedure TFmSeaCustomer.Sb_backClick(Sender: TObject);
begin
  inherited;
  Ly_list_titlle.Visible := True;
  Ly_quick_search.Visible := False;
end;

procedure TFmSeaCustomer.Sb_back_callbackClick(Sender: TObject);
begin
  Ly_list_titlle.Visible := True;
  Ly_quick_search.Visible := False;
end;

procedure TFmSeaCustomer.Sb_searchClick(Sender: TObject);
begin
  Ly_quick_search.Visible := True;
  Ly_list_titlle.Visible := False;
  E_busca.SetFocus;
  getlist('');
end;


end.
