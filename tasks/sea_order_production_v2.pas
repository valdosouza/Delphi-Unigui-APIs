unit sea_order_production_v2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniPageControl, uniGUIBaseClasses, uniPanel,
  uniDateTimePicker, uniCheckBox, uniEdit, uniLabel, ControllerOrderProduction,
  fm_situation, msg_form, unMessages, Vcl.Menus, uniMainMenu,unFunctions;

type
  TSeaOrderProductionV2 = class(TBaseSearch)
    cds_searchtb_institution_id: TIntegerField;
    cds_searchnumber: TIntegerField;
    cds_searchdt_record: TDateField;
    cds_searchdt_start: TDateField;
    cds_searchdt_end: TDateField;
    cds_searchid: TIntegerField;
    ChBx_Periodo: TUniCheckBox;
    E_Number: TUniEdit;
    L_Codigo: TUniLabel;
    Ctn_Situacao: TUniContainerPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;

    procedure InitVariable;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure FormatScreen;Override;
    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;




  protected
    frSituacao : TFmSituation;

  private
    { Private declarations }
    procedure ShowSituacao;


  public
    { Public declarations }
  end;

var
  SeaOrderProductionV2: TSeaOrderProductionV2;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaOrderProductionV2 }


{ TSeaOrderProductionV2 }

procedure TSeaOrderProductionV2.FormatScreen;
begin
  inherited;
  ShowSituacao;
end;

procedure TSeaOrderProductionV2.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openTasOrderProductionV2(lcodigo);
end;

procedure TSeaOrderProductionV2.InitVariable;
begin
  //
end;

procedure TSeaOrderProductionV2.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                  '  INNER JOIN tb_order ord ',
                  '  on (ord.id = prod.id) and (ord.tb_institution_id = prod.tb_institution_id) '
                  );

end;

procedure TSeaOrderProductionV2.OrderBySql;
begin
  inherited;
  //
end;

procedure TSeaOrderProductionV2.SelectSql;
begin
  SelectTxt := concat(
                 'Select prod.id, prod.tb_institution_id, prod.number, ord.dt_record, dt_start, dt_end ',
                 'from tb_order_production prod '

              );
end;

procedure TSeaOrderProductionV2.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if frSituacao.DBLCB_Lista.KeyValue <> null then
      ParamByName('tb_situation_id').AsInteger := frSituacao.DBLCB_Lista.KeyValue;

    if E_Number.Text <> '' then
      ParamByName('Number').AsInteger := E_Number.Tag;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    end;
  End;
end;

procedure TSeaOrderProductionV2.SetRegister;
begin
  openTasOrderProductionV2(nil);
end;

procedure TSeaOrderProductionV2.ShowSituacao;
begin
  FrSituacao := TFmSituation.Create(Self);
  FrSituacao.Parent := Ctn_Situacao;
  FrSituacao.listar;
  FrSituacao.Align := alClient;
  FrSituacao.Show;
end;

procedure TSeaOrderProductionV2.WhereSql;
begin
  inherited;
  WhereTxt := ' where prod.tb_institution_id =:tb_institution_id ';

  if  FrSituacao.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (prod.tb_situation_id =:tb_situation_id)';

  if E_Number.Text <> '' then
    WhereTxt := WhereTxt + ' and (prod.number =:number)';

   if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( prod.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( prod.created_at between :dataini and :datafim ) ';
  end;

end;

end.
