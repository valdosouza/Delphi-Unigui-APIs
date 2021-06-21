unit sea_tax_icms_nr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaTaxIcmsNr = class(TBaseSearch)
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
  SeaTaxIcmsNr: TSeaTaxIcmsNr;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaTaxIcmsNr }

procedure TSeaTaxIcmsNr.GetView;
begin
  openCadTaxIcmsNr(cds_searchid.AsInteger,nil);
end;

procedure TSeaTaxIcmsNr.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by tinr.id ';
end;

procedure TSeaTaxIcmsNr.SelectSql;
begin
  SelectTxt := ' SELECT tinr.id, tinr.description '+
               ' FROM tb_tax_icms_nr tinr  ';
end;

procedure TSeaTaxIcmsNr.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin


    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;


procedure TSeaTaxIcmsNr.SetRegister;
begin
  openCadTaxIcmsNr(0,nil);
end;

procedure TSeaTaxIcmsNr.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';


  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (tinr.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (tinr.description like :description)';
end;
end.
