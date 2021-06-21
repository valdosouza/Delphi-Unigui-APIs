unit sea_order_pi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniDateTimePicker,FireDAC.Stan.Param,
  uniRadioButton, uniLabel, uniEdit, uniGroupBox, uniMultiItem, uniComboBox,
  uniPageControl, uniCheckBox, uniRadioGroup, Vcl.Menus, uniMainMenu,unFunctions;

type
  TSeaOrderPi = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchnr_original: TStringField;
    cds_searchnr_internal: TIntegerField;
    cds_searchagency: TStringField;
    cds_searchadvertiser: TStringField;
    cds_searchbroadcaster: TStringField;
    E_nr_original: TUniEdit;
    UniLabel1: TUniLabel;
    E_a_name_company: TUniEdit;
    E_av_name_company: TUniEdit;
    E_bd_name_company: TUniEdit;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    DTP_Date_End: TUniDateTimePicker;
    DTP_Date_Initial: TUniDateTimePicker;
    ChBx_Periodo: TUniCheckBox;
    RG_Data: TUniRadioGroup;
    UniLabel2: TUniLabel;
    E_nr_internal: TUniEdit;
  private
    { Private declarations }
  Protected
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;

  public
    { Public declarations }
  end;

var
  SeaOrderPi: TSeaOrderPi;

implementation

{$R *.dfm}

uses MainModule, openForms;


{ TSeaOrderPi }

procedure TSeaOrderPi.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadOrderPi(lcodigo);
end;

procedure TSeaOrderPi.InnerJoinSql;
begin
  inherited;
      InnerJoinTxt := concat(
                        ' inner join tb_agency a ',
                        ' on (a.id = op.tb_agency_id) ',
                        ' inner join tb_entity ena',
                        ' on (a.id = ena.id) ',
                        ' inner join tb_advertiser av ',
                        ' on (av.id = op.tb_advertiser_id) ',
                        ' inner join tb_entity enav ',
                        ' on (av.id = enav.id) ',
                        ' inner join tb_broadcaster bd ',
                        ' on (bd.id = op.tb_broadcaster_id) ',
                        ' inner join tb_entity enbd ',
                        ' on (bd.id = enbd.id) '
                        );
 end;

procedure TSeaOrderPi.OrderBySql;
begin
  inherited;
  case RG_Data.itemindex of
    0:OrderByTxt := 'order by op.dt_original ';
    1:OrderByTxt := 'order by op.dt_internal ';
    2:OrderByTxt := 'order by op.dt_expiration ';
  end;
end;

procedure TSeaOrderPi.SelectSql;
begin
  SelectTxt := concat(
                ' Select distinct op.id, op.nr_original, op.nr_internal, ena.name_company agency, ',
                'enav.name_company advertiser, enbd.name_company broadcaster, ',
                'op.dt_original, op.dt_internal , op.dt_expiration ',
               ' from tb_order_pi op '
              );
end;

procedure TSeaOrderPi.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if ChBx_Periodo.Checked then
    BEgin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if E_nr_original.Text <> '' then
      ParamByName('nr_original').AsString := E_nr_original.Text;

   if E_nr_internal.Text <> '' then
      ParamByName('nr_internal').AsString := E_nr_internal.Text ;

   if E_a_name_company.Text <> '' then
      ParamByName('name_company').AsString := '%' +   E_a_name_company.Text + '%' ;

   if E_av_name_company.Text <> '' then
      ParamByName('name_company').AsString := '%' + E_av_name_company.Text + '%'  ;

   if E_bd_name_company.Text <> '' then
      ParamByName('name_company').AsString := '%' + E_bd_name_company.Text + '%'  ;
  end;
end;


procedure TSeaOrderPi.SetRegister;
begin
  openCadOrderPi(nil);
end;

procedure TSeaOrderPi.WhereSql;
begin
  inherited;
  WhereTxt := ' where op.tb_institution_id =:tb_institution_id ';

  if ChBx_Periodo.Checked then
  BEgin
    case RG_Data.itemindex of
      0:WhereTxt := WhereTxt + ' and (op.dt_original between :dataini and :datafim) ';
      1:WhereTxt := WhereTxt + 'and (op.dt_internal between :dataini and :datafim) ';
      2:WhereTxt := WhereTxt + 'and (op.dt_expiration between :dataini and :datafim) '
    end;
  End;

  if E_nr_original.Text <> '' then
    WhereTxt := WhereTxt + ' and (op.nr_original =:nr_original)';

  if E_nr_internal.Text <> '' then
    WhereTxt := WhereTxt + ' and (op.nr_internal =:nr_internal)';

  if E_a_name_company.Text <> '' then
    WhereTxt := WhereTxt + ' and (ena.name_company like :name_company)';

  if E_av_name_company.Text <> '' then
    WhereTxt := WhereTxt + ' and (enav.name_company like :name_company)';

  if E_bd_name_company.Text <> '' then
    WhereTxt := WhereTxt + ' and (enbd.name_company like :name_company)';
end;


end.
