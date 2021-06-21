unit sea_order_budget_pi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniGroupBox, uniEdit,
  uniDateTimePicker, uniLabel, uniCheckBox, uniPageControl, Vcl.Menus,
  uniMainMenu,unFunctions;

type
  TSeaOrderBudgetPi = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchtb_institution_id: TIntegerField;
    cds_searchnumber: TIntegerField;
    cds_searchdt_record: TDateField;
    cds_searchadvertiser: TStringField;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_end: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    E_cotacao: TUniEdit;
    E_name_company: TUniEdit;
    UniLabel2: TUniLabel;
    UniCheckBox1: TUniCheckBox;
    UniCheckBox2: TUniCheckBox;
    chbx_date: TUniCheckBox;

    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
    procedure setImages;Override;



  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  SeaOrderBudgetPi: TSeaOrderBudgetPi;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaOrderBudgetPi }

procedure TSeaOrderBudgetPi.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openTasOrderBudgetPi(lcodigo);
end;

procedure TSeaOrderBudgetPi.InnerJoinSql;
begin
  InnerJoinTxt := Concat (
                '  INNER JOIN tb_order ord  ',
                '  ON ord.id = obm.id       ',
                '  and ord.tb_institution_id = obm.tb_institution_id  ',
                '  INNER JOIN tb_entity enav ',
                '  ON (enav.id = obm.tb_advertiser_id ) ',
                ' Inner Join tb_entity ena ',
                ' on (ena.id = obm.tb_agency_id) '
                )
end;

procedure TSeaOrderBudgetPi.OrderBySql;
begin
  inherited;
  OrderByTxt := 'Order By enav.name_company ';
end;

procedure TSeaOrderBudgetPi.SelectSql;
begin
  SelectTxt := Concat(
              ' SELECT ord.id , obm.tb_institution_id, obm.number, ord.dt_record, enav.name_company advertiser ',
              ' FROM tb_order_budged_media obm '
               )
end;

procedure TSeaOrderBudgetPi.setImages;
begin
  inherited;
//
end;

procedure TSeaOrderBudgetPi.SetParameters;
Begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if chbx_date.Checked then 
    begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    end;

    if (E_cotacao.Text <> '') then
    ParamByName('number').Text := E_cotacao.Text;

    if (E_name_company.Text <> '') then
    ParamByName('name_company').Text := '%' + E_name_company.Text + '%' ;
  End;
end;

procedure TSeaOrderBudgetPi.SetRegister;
begin
  openTasOrderBudgetPi(nil);
end;

procedure TSeaOrderBudgetPi.WhereSql;
begin
  WhereTxt := ' WHERE obm.tb_institution_id =:tb_institution_id ';

  if (chbx_date.Checked) then
  WhereTxt := WhereTxt + ' AND ( ord.dt_record between :dataini and :datafim ) ';

  if (E_cotacao.Text <> '') then
  WhereTxt := WhereTxt + ' and ( obm.number =:number) ';

  if (E_name_company.Text <> '') then
  WhereTxt := WhereTxt + Concat (
                                  ' and ( ( enav.name_company like :name_company ) ',
                                  ' or (    ena.name_company like :name_company ) ) '
                                 )
end;

end.
