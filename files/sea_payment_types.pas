unit sea_payment_types;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,FireDAC.Stan.Param,
  uniPanel,MainModule, UniDBLookupComboBox, uniPageControl, Vcl.Menus,
  uniMainMenu;

type
  TSeaPaymentTypes = class(TBaseSearch)
    cds_searchid: TAutoIncField;
    cds_searchdescription: TStringField;
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    chbx_cadAtivo: TUniCheckBox;
    E_Code: TUniEdit;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure OrderBySql;Override;
    procedure WhereSql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaPaymentTypes: TSeaPaymentTypes;

implementation

{$R *.dfm}

uses openForms;

{ TSeaPaymentTypes }

procedure TSeaPaymentTypes.GetView;
begin
  openCadPaymentTypes(cds_searchid.AsInteger,nil);
end;

procedure TSeaPaymentTypes.InnerJoinSql;
begin
  InnerJoinTxt := '  inner join tb_institution_has_payment_types i '+
                  '  on (pt.id = i.tb_payment_types_id)  ';
end;

procedure TSeaPaymentTypes.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by pt.description '
end;

procedure TSeaPaymentTypes.SelectSql;
begin
   SelectTxt := ' Select distinct pt.id, pt.description '+
               '  from tb_payment_types pt ';
end;

procedure TSeaPaymentTypes.SetParameters;
begin
  inherited;
     with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Code.Text <> '' then
      ParamByName('id').AsString := E_Code.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if chbx_cadAtivo.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';

  end;
end;

procedure TSeaPaymentTypes.SetRegister;
begin
 openCadPaymentTypes(0,nil);
end;

procedure TSeaPaymentTypes.WhereSql;
begin
  inherited;
   WhereTxt := ' where i.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (i.active =:active) ';

  if E_Code.Text <> '' then
    WhereTxt := WhereTxt + ' and (pt.id =:id )';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (pt.description like :description )';
end;

end.
