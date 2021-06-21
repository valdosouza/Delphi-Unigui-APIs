unit sea_order_production;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniDateTimePicker, uniCheckBox, fm_merchandise, uniPageControl, Vcl.Menus,
  uniMainMenu,unFunctions;

type
  TSeaOrderProduction = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchnumber: TIntegerField;
    cds_searchdt_record: TDateField;
    cds_searchdescription: TStringField;
    cds_searchtb_institution_id: TIntegerField;
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    ChBx_Periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    Ctn_Merchandise: TUniContainerPanel;

    procedure InitVariable;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure FormatScreen;Override;
    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;

    procedure ShowMerchandise;
    procedure ChBx_PeriodoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    FrMerchandise : TFmMerchandise;

  end;

var
  SeaOrderProduction: TSeaOrderProduction;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaOrderProduction }

procedure TSeaOrderProduction.ChBx_PeriodoClick(Sender: TObject);
begin
  DTP_Date_Initial.Enabled := chbx_periodo.Checked;
  DTP_Date_End.Enabled := chbx_periodo.Checked;
end;

procedure TSeaOrderProduction.FormatScreen;
begin
  inherited;
  ShowMerchandise;
end;

procedure TSeaOrderProduction.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openTasOrderProduction(lcodigo);
end;

procedure TSeaOrderProduction.InitVariable;
begin
//
end;

procedure TSeaOrderProduction.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                  ' inner join tb_institution inst ',
                  ' on (inst.id = prod.tb_institution_id) ',

                  ' inner join tb_product pro ',
                  ' on (pro.id = prod.tb_merchandise_id)  ',

                  ' inner join tb_order ord ',
                  ' on (ord.id = prod.id) '
                  );
end;
procedure TSeaOrderProduction.OrderBySql;
begin
  inherited;
  //
end;

procedure TSeaOrderProduction.SelectSql;
begin
  SelectTxt := concat(
              ' Select prod.id, prod.tb_institution_id, prod.number, pro.description, ord.dt_record',
              ' from tb_order_production prod'
              );
end;

procedure TSeaOrderProduction.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if FrMerchandise.DBLCB_Lista.KeyValue <> null then
      ParamByName('tb_merchandise_id').AsInteger := FrMerchandise.DBLCB_Lista.KeyValue;

    if E_Number.Text <> '' then
      ParamByName('Number').AsInteger := E_Number.Tag;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    end;
  End;
end;
procedure TSeaOrderProduction.SetRegister;
begin
  openTasOrderProduction(nil);
end;

procedure TSeaOrderProduction.ShowMerchandise;
begin
  FrMerchandise := TFmMerchandise.Create(Self);
  FrMerchandise.Parent := Ctn_Merchandise;
  FrMerchandise.listar;
  FrMerchandise.Align := alClient;
  FrMerchandise.Show;
end;

procedure TSeaOrderProduction.WhereSql;
begin
  inherited;
  WhereTxt := ' where prod.tb_institution_id =:tb_institution_id ';

  if  FrMerchandise.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (prod.tb_merchandise_id =:tb_merchandise_id)';

  if E_Number.Text <> '' then
    WhereTxt := WhereTxt + ' and (prod.number =:number)';

   if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( prod.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( prod.created_at between :dataini and :datafim ) ';
  end;

end;


end.
