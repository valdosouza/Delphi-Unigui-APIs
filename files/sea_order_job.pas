unit sea_order_job;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniPanel,
  uniDateTimePicker, uniEdit, uniLabel, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, ControllerOrderJob, Fm_customer,
  uniCheckBox, MainModule, uniPageControl, Vcl.Menus, uniMainMenu,unFunctions;

type
  TSeaOrderJob = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchnumber: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchname_company: TStringField;
    cds_searchdt_record: TDateField;
    L_Codigo: TUniLabel;
    E_Number: TUniEdit;
    Ctn_Customer: TUniContainerPanel;
    ChBx_Periodo: TUniCheckBox;
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

    procedure ShowCustomer;
    procedure ChBx_PeriodoClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    FrCustomer : TFmCustomer;
  end;

var
  SeaOrderJob: TSeaOrderJob;

implementation

{$R *.dfm}

uses openForms;

{ TSeaOrderJob }

procedure TSeaOrderJob.ChBx_PeriodoClick(Sender: TObject);
begin
  DTP_Date_Initial.Enabled := chbx_periodo.Checked;
  DTP_Date_End.Enabled := chbx_periodo.Checked;
end;

procedure TSeaOrderJob.FormatScreen;
begin
  inherited;
  ShowCustomer;
end;

procedure TSeaOrderJob.GetView;
begin
  openTasOrderJob(cds_searchid.AsInteger);
end;

procedure TSeaOrderJob.InitVariable;
begin
//
end;

procedure TSeaOrderJob.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                  ' inner join tb_order ord ',
                  ' on (ord.id = ordj.id) and (ord.tb_institution_id = ordj.tb_institution_id) ',

                  ' inner join tb_Entity en ',
                  ' on (en.id = ordj.tb_customer_id) '

                  );

end;

procedure TSeaOrderJob.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by ordj.number '
end;

procedure TSeaOrderJob.SelectSql;
begin
  SelectTxt := concat(
                  'Select Ordj.id, Ordj.tb_institution_id, Ordj.number, ',
                  'Ordj.description, en.name_company, ord.dt_record ',
                  'from tb_order_job ordj '
                );
end;

procedure TSeaOrderJob.SetParameters;
begin
with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if (FrCustomer.DBLCB_Lista.KeyValue <> null) then
      ParamByName('en_id').AsInteger := FrCustomer.DBLCB_Lista.KeyValue;

    if E_Number.Text <> '' then
      ParamByName('number').AsString := E_Number.Text;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    end;
  End;
end;

procedure TSeaOrderJob.SetRegister;
begin
  openTasOrderJob(0);
end;

procedure TSeaOrderJob.ShowCustomer;
begin
  FrCustomer := TFmCustomer.Create(Self);
  FrCustomer.Parent := Ctn_Customer;
  FrCustomer.Listar;
  FrCustomer.Align := alClient;
  FrCustomer.Show;
end;

procedure TSeaOrderJob.WhereSql;
begin
  inherited;
  WhereTxt := ' where ordj.tb_institution_id =:tb_institution_id ';

  if  FrCustomer.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (en.id =:en_id)';

  if E_Number.Text <> '' then
    WhereTxt := WhereTxt + ' and (ordj.number =:number)';

  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( ordj.created_at between :dataini and :datafim ) ';
  end;

end;

end.
