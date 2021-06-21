unit sea_deter_base_tax_icms_st;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,UniLabel,UniEdit, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaDeterBaseTaxIcmsST = class(TBaseSearch)
    cds_searchid: TStringField;
    cds_searchdescription: TStringField;
    L_Codigo: TUniLabel;
    E_ID_Search: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    procedure SelectSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaDeterBaseTaxIcmsST: TSeaDeterBaseTaxIcmsST;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaDeterBaseTaxIcmsST }

procedure TSeaDeterBaseTaxIcmsST.GetView;
begin
  openCadDeterBaseTaxIcmsST(cds_searchid.AsInteger,nil);
end;


procedure TSeaDeterBaseTaxIcmsST.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by dbt.id ';
end;
procedure TSeaDeterBaseTaxIcmsST.SelectSql;
begin
  SelectTxt := ' Select distinct dbt.id, dbt.description '+
               ' from tb_deter_base_tax_icms_st dbt ';
end;


procedure TSeaDeterBaseTaxIcmsST.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaDeterBaseTaxIcmsST.SetRegister;
begin
  openCadDeterBaseTaxIcmsST(0,nil);
end;

procedure TSeaDeterBaseTaxIcmsST.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';

  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (dbt.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (dbt.description like :description)';
end;

end.
