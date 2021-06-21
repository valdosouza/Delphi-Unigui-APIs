unit sea_order_Stock_Adjust;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniDateTimePicker, uniCheckBox, fm_entity_fiscal, uniPageControl, Vcl.Menus,
  uniMainMenu,unFunctions;

type
  TSeaOrderStockAdjust = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdt_record: TDateField;
    cds_searchnumber: TIntegerField;
    cds_searchname_company: TStringField;
    chbx_periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    ctn_Entity: TUniContainerPanel;

    procedure InitVariable;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure FormatScreen;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
    procedure chbx_periodoClick(Sender: TObject);

  private
    { Private declarations }
    procedure ShowEntity;
  public
    { Public declarations }
    FrEntity : TFmEntityFiscal;
  end;

var
  SeaOrderStockAdjust: TSeaOrderStockAdjust;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TBaseSearch1 }

procedure TSeaOrderStockAdjust.chbx_periodoClick(Sender: TObject);
begin
  DTP_Date_Initial.Enabled := chbx_periodo.Checked;
  DTP_Date_End.Enabled := chbx_periodo.Checked;
end;

procedure TSeaOrderStockAdjust.FormatScreen;
begin
  inherited;
  ShowEntity;
end;

procedure TSeaOrderStockAdjust.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openTasOrderStockAdjust(lcodigo);
end;

procedure TSeaOrderStockAdjust.InitVariable;
begin
  inherited;
  DTP_Date_Initial.DateTime := Date - 30;
  DTP_Date_End.DateTime := Date;
end;

procedure TSeaOrderStockAdjust.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                  ' inner join tb_order_stock_adjust osa ',
                  ' on (ord.id = osa.id) ',

                  ' inner join tb_entity en ',
                  'on (en.id = osa.tb_entity_id)'
                  );
end;

procedure TSeaOrderStockAdjust.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by en.name_company '
end;

procedure TSeaOrderStockAdjust.SelectSql;
begin
  SelectTxt := ' Select distinct ord.id, ord.dt_record, osa.number, en.name_company'+
               ' from tb_order ord ';
end;

procedure TSeaOrderStockAdjust.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if (FrEntity.DBLCB_Lista.KeyValue <> null) then
      ParamByName('en_id').AsInteger := FrEntity.DBLCB_Lista.KeyValue;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if E_Number.Text <> '' then
      ParamByName('number').AsString := E_Number.Text;
  end;
end;

procedure TSeaOrderStockAdjust.SetRegister;
begin
  openTasOrderStockAdjust(nil);
end;

procedure TSeaOrderStockAdjust.ShowEntity;
begin
  FrEntity := TFmEntityFiscal.Create(Self);
  FrEntity.Parent := ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.listar;
  FrEntity.Show;
end;

procedure TSeaOrderStockAdjust.WhereSql;
begin
  inherited;
  WhereTxt := ' where ord.tb_institution_id =:tb_institution_id ';

  if FrEntity.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (en.id =:en_id)';

  if E_Number.Text <> '' then
    WhereTxt := WhereTxt + ' and (osa.number =:number)';

    if chbx_periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' and (ord.dt_record between :dataini and :datafim)';
  End;

end;

end.
