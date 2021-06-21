unit sea_order_packing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniDateTimePicker,FireDAC.Stan.Param,
  uniCheckBox, UniEdit, UniLabel, fm_entity, fm_situation, uniPageControl,
  Vcl.Menus, uniMainMenu,unFunctions;

type
  TSeaOrderPacking = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchnumber: TIntegerField;
    cds_searchname_company: TStringField;
    cds_searchdescription: TStringField;
    ChBx_Periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    E_Number: TUniEdit;
    L_Codigo: TUniLabel;
    Ctn_Entity: TUniContainerPanel;
    Ctn_Situation: TUniContainerPanel;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure FormatScreen;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
    procedure setImages;Override;
    procedure ChBx_PeriodoClick(Sender: TObject);

  private
    { Private declarations }
    procedure ShowEntity;
    procedure ShowSituation;
  public
    { Public declarations }
    FrEntity : TFmEntity;
    FrSituation : TFmSituation;

  end;

var
  SeaOrderPacking: TSeaOrderPacking;

implementation

{$R *.dfm}

uses openForms, MainModule;


{ TSeaOrderPacking }

procedure TSeaOrderPacking.ChBx_PeriodoClick(Sender: TObject);
begin
  DTP_Date_Initial.Enabled := chbx_periodo.Checked;
  DTP_Date_End.Enabled := chbx_periodo.Checked;
end;

procedure TSeaOrderPacking.FormatScreen;
begin
  inherited;
  ShowEntity;
  ShowSituation;
end;

procedure TSeaOrderPacking.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openTasOrderPacking(lcodigo);
end;

procedure TSeaOrderPacking.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                        ' inner join tb_entity en ',
                        ' on (en.id = opk.tb_entity_id) ',
                        ' inner join tb_situation s',
                        ' on (s.id = opk.tb_situation_id) and  (s.tb_institution_id = opk.tb_institution_id)',
                        ' inner join tb_order ord ',
                        ' on (ord.id = opk.id) and  (ord.tb_institution_id = opk.tb_institution_id)'
                        );

end;

procedure TSeaOrderPacking.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by opk.number ';
end;

procedure TSeaOrderPacking.SelectSql;
begin
  SelectTxt := ' Select distinct opk.id, opk.number, en.name_company, s.description '+
               ' from tb_order_packing opk ';
end;

procedure TSeaOrderPacking.setImages;
begin
  inherited;
 //
end;

procedure TSeaOrderPacking.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if (FrEntity.DBLCB_Lista.KeyValue <> null) then
      ParamByName('en_id').AsInteger := FrEntity.DBLCB_Lista.KeyValue;


    if (FrSituation.DBLCB_Lista.KeyValue <> null) then
      ParamByName('s_id').AsInteger := FrSituation.DBLCB_Lista.KeyValue;


    if E_Number.Text <> '' then
      ParamByName('number').AsString := '%' + E_number.Text + '%' ;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    end;
  End;
end;

procedure TSeaOrderPacking.SetRegister;
begin
  openTasOrderPacking(nil);
end;

procedure TSeaOrderPacking.ShowEntity;
begin
  FrEntity := TFmEntity.Create(Self);
  FrEntity.Parent := Ctn_Entity;
  FrEntity.Align := alClient;
  FrEntity.Listar;
  FrEntity.Show;
end;

procedure TSeaOrderPacking.ShowSituation;
begin
 FrSituation := TFmSituation.Create(Self);
 FrSituation.Parent := Ctn_Situation;
 FrSituation.Listar;
 FrSituation.Align := alClient;
 FrSituation.Show;
end;

procedure TSeaOrderPacking.WhereSql;
begin
  inherited;
  WhereTxt := ' where opk.tb_institution_id =:tb_institution_id ';

  if FrEntity.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (en.id =:en_id)';

  if FrSituation.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (s.id =:s_id)';


  if E_Number.Text <> '' then
     WhereTxt := WhereTxt + ' and (opk.number like :number)';

  if chbx_periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' and (ord.dt_record between :dataini and :datafim)';
  End;

end;

end.
