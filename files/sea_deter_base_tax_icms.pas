unit sea_deter_base_tax_icms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel, FireDAC.Stan.Param,
  ControllerDeterBaseTaxIcms,UniDBLookupComboBox, uniPageControl, Vcl.Menus,
  uniMainMenu;

type
  TSeaDeterBaseTaxIcms = class(TBaseSearch)
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
    DeterBaseTaxIcms : TControllerDeterBaseTaxIcms;
  end;

var
  SeaDeterBaseTaxIcms: TSeaDeterBaseTaxIcms;

implementation

uses MainModule, openForms;

{$R *.dfm}

{ TSeaDeterBaseTaxIcms }

procedure TSeaDeterBaseTaxIcms.GetView;
begin
  openCadDeterBaseTaxIcms(cds_searchid.AsInteger,nil);
end;

procedure TSeaDeterBaseTaxIcms.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by dbt.id ';
end;

procedure TSeaDeterBaseTaxIcms.SelectSql;
begin
  SelectTxt := ' Select distinct dbt.id, dbt.description '+
               ' from tb_deter_base_tax_icms dbt ';
end;

procedure TSeaDeterBaseTaxIcms.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin


    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;
procedure TSeaDeterBaseTaxIcms.SetRegister;
begin
  openCadDeterBaseTaxIcms(0,nil);
end;

procedure TSeaDeterBaseTaxIcms.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';

  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (dbt.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (dbt.description like :description)';
end;

end.
