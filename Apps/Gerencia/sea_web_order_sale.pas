unit sea_web_order_sale;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_search, FMX.ListView.Types, FMX.ListView.Appearances,REST.Json,System.Json,
  FMX.ListView.Adapters.Base, System.Actions, FMX.ActnList, FMX.TabControl,
  FMX.Gestures, System.ImageList, FMX.ImgList, FMX.ListView, FMX.Effects,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation, FMX.Ani, FMX.Layouts,
  FMX.DateTimeCtrls,TypesListCollection, prm_order_sale, uDataCM;

type
  TSeaWebOrderSale = class(TBaseSearch)
    Ly_dt_Initial: TLayout;
    E_dt_initial: TDateEdit;
    Lb_dt_Initial: TLabel;
    Ly_dt_Final: TLayout;
    E_dt_final: TDateEdit;
    Lb_dt_final: TLabel;
    procedure Sb_ApplyClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure getHead;Override;
    procedure getItem(AItem: TListViewItem);override;
    procedure getList(par: String);override;
    procedure FillListSaleByHour(ListObj : TCollSplValue);

  public
    { Public declarations }
  end;

var
  SeaWebOrderSale: TSeaWebOrderSale;

implementation

{$R *.fmx}

uses MainModule, UnFunctions;
{$R *.LgXhdpiPh.fmx ANDROID}

{ TSeaWebOrderSale }

procedure TSeaWebOrderSale.FillListSaleByHour(ListObj: TCollSplValue);
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
      LcLVI.Text := '0';
      LcLVI.Data['description'] := ListObj[I].Descricao;
      LcLVI.Data['value']       := FloatToStrF(ListObj[I].Valor,ffNumber,10,2);
    End;
  Finally
    lsv_Search.EndUpdate;
  End;


end;

procedure TSeaWebOrderSale.getHead;
Var
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_Search.Items.Clear;
  LcLVI := lsv_Search.Items.Add;
  LcLVI.Height := 50;
  LcLVI.Text := concat('Hora / Valor');
  LcLVI.Purpose := TListItemPurpose.Header;
end;

procedure TSeaWebOrderSale.getItem(AItem: TListViewItem);
begin
  inherited;

end;

procedure TSeaWebOrderSale.getList(par: String);
Var
  LcParamOrderSale : TPrmOrderSale;
  LcMsg : String;
  LcStrJSon : String;
  LcJson : TJSONObject;
  LcLista : TCollSplValue;
begin
  inherited;
  TRy
    ShowProcess('Buscando Vendas');
    LcParamOrderSale := TPrmOrderSale.Create;
    //LcParamOrderSale.Estabelecimento  := UMM.GInstitution.Registro.Codigo;
//    LcParamOrderSale.Terminal         := GbTerminal;
    LcParamOrderSale.DataInicial      := E_dt_initial.Date;
    LcParamOrderSale.DataFinal        := E_dt_final.Date;
    try
      LcStrJSon := TJson.ObjectToJsonString(LcParamOrderSale);
//      LcJSon := DataCM.SMOrderSaleClient.getListSplByDate(LcStrJSon);
      LcLista := TJson.JsonToObject<TCollSplValue>(LcJSon);
      FillListSaleByHour( LcLista );
    Except
      on E: Exception do
      Begin
        GeralogCrashlytics('getListSplByHour - ',e.Message);
      End;
    end;
    ShowProcess('Buscando Vendas - Finalizado');
  finally
    LcParamOrderSale.DisposeOf;
    LcLista.DisposeOf;
    hideProcess;
  end;
end;

procedure TSeaWebOrderSale.InitVariable;
begin
  inherited;
  E_dt_initial.Date := DAte;
  E_dt_final.Date := DAte;
end;

procedure TSeaWebOrderSale.Sb_ApplyClick(Sender: TObject);
begin
  getlist('');
  inherited;
end;

end.
