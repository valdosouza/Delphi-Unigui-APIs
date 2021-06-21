unit sea_tax_cofins;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniLabel,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, UniDBLookupComboBox,
  uniPanel, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaTaxCofins = class(TBaseSearch)
    cds_searchid: TStringField;
    cds_searchdescription: TStringField;
    L_Codigo: TUniLabel;
    E_ID_Search: TUniEdit;
    E_Description: TUniEdit;
    L_NameCompany: TUniLabel;
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
  SeaTaxCofins: TSeaTaxCofins;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaTaxCofins }

procedure TSeaTaxCofins.GetView;
begin
  openCadTaxCofins(cds_searchid.AsInteger,nil);
end;


procedure TSeaTaxCofins.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by tc.description ';
end;

procedure TSeaTaxCofins.SelectSql;
begin
  SelectTxt := ' Select distinct tc.id, tc.description '+
               ' from tb_tax_cofins tc ';
end;

procedure TSeaTaxCofins.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaTaxCofins.SetRegister;
begin
  openCadTaxCofins(0,nil);
end;

procedure TSeaTaxCofins.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';


  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (tc.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (tc.description like :description)';

end;


end.
