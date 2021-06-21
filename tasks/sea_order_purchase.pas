unit sea_order_purchase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniRadioGroup, FireDAC.Stan.Param,
  uniDateTimePicker, uniCheckBox, uniEdit, uniLabel, uniGroupBox, fm_provider,
  uniPageControl, uniMultiItem, uniComboBox,unFunctions, Vcl.Menus, uniMainMenu;

type
  TSeaOrderPurchase = class(TBaseSearch)
    cds_searchdt_record: TDateField;
    cds_searchnumber: TIntegerField;
    cds_searchname_company: TStringField;
    cds_searchtotal_value: TBCDField;
    cds_searchid: TAutoIncField;
    chbx_periodo: TUniCheckBox;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    E_Number: TUniEdit;
    ctn_Provider: TUniContainerPanel;
    RG_approved: TUniRadioGroup;
    L_Codigo: TUniLabel;
    cb_Status: TUniComboBox;
    UniLabel1: TUniLabel;

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
    procedure ShowProvider;

  public
    { Public declarations }
    FrProvider : TFmProvider;

  end;

var
  SeaOrderPurchase: TSeaOrderPurchase;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaOrderPurchase }

procedure TSeaOrderPurchase.chbx_periodoClick(Sender: TObject);
begin
  DTP_Date_Initial.Enabled := chbx_periodo.Checked;
  DTP_Date_End.Enabled := chbx_periodo.Checked;
end;

procedure TSeaOrderPurchase.FormatScreen;
begin
  inherited;
  ShowProvider;
end;

procedure TSeaOrderPurchase.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openTasOrderPurchase(lcodigo);
end;

procedure TSeaOrderPurchase.InitVariable;
begin
  DTP_Date_Initial.DateTime := Date - 30;
  DTP_Date_End.DateTime := Date;
end;

procedure TSeaOrderPurchase.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                  ' inner join tb_order_purchase op ',
                  ' on (ord.id = op.id) ',

                  ' Inner join tb_order_totalizer ot ',
                  ' on (ord.id = ot.id) ',

                  ' inner join tb_entity en ',
                  'on (en.id = op.tb_provider_id)'

                  );
end;

procedure TSeaOrderPurchase.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by en.name_company '
end;

procedure TSeaOrderPurchase.SelectSql;
begin
  SelectTxt := ' Select distinct ord.id, ord.dt_record, op.number, en.name_company, ot.total_value '+
               ' from tb_order ord ';
end;

procedure TSeaOrderPurchase.SetParameters;

begin
  with UMM.Qr_Crud do
  Begin

    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if (FrProvider.DBLCB_Lista.KeyValue <> null) then
      ParamByName('en_id').AsInteger := FrProvider.DBLCB_Lista.KeyValue ;

    if chbx_periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if E_Number.Text <> '' then
      ParamByName('number').AsString :=  E_Number.Text ;
  end;
end;

procedure TSeaOrderPurchase.SetRegister;
begin
  openTasOrderPurchase(nil);
end;

procedure TSeaOrderPurchase.ShowProvider;
begin
  FrProvider := TFmProvider.Create(Self);
  FrProvider.Parent := Ctn_Provider;
  FrProvider.Align := alClient;
  FrProvider.listar;
  FrProvider.Show;
end;

procedure TSeaOrderPurchase.WhereSql;
begin
  inherited;
  //Origem I = Importação XML - M = Manual
  WhereTxt := concat(' where ord.tb_institution_id =:tb_institution_id ',
                     ' and ( ord.origin = ''M'' )'
              );

  if FrProvider.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (en.id =:en_id)';

  if E_Number.Text <> '' then
    WhereTxt := WhereTxt + ' and (op.number =:number)';

  if chbx_periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' and (ord.dt_record between :dataini and :datafim)';
  End;

  case RG_approved.ItemIndex of
    0:WhereTxt := WhereTxt + ' and ( op.approved = ''N'') ';
    1:WhereTxt := WhereTxt + ' and ( op.approved = ''S'') ';
  end;

  case cb_status.ItemIndex of
    0:WhereTxt := WhereTxt + ' and ( ord.status = ''P'') ';
    1:WhereTxt := WhereTxt + ' and ( ord.status = ''F'') ';
  end;
end;

end.
