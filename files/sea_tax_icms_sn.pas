unit sea_tax_icms_sn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,UniEdit,UniLabel, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaTaxIcmsSn = class(TBaseSearch)
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
  SeaTaxIcmsSn: TSeaTaxIcmsSn;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaTaxIcmsSn }

procedure TSeaTaxIcmsSn.GetView;
begin
  openCadTaxIcmsSN(cds_searchid.AsInteger,nil);
end;

procedure TSeaTaxIcmsSn.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by tisn.id ';
end;

procedure TSeaTaxIcmsSn.SelectSql;
begin
  SelectTxt := ' SELECT tisn.id, tisn.description '+
               ' FROM tb_tax_icms_sn tisn ';
end;

procedure TSeaTaxIcmsSn.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaTaxIcmsSn.SetRegister;
begin
  openCadTaxIcmsSn(0,nil);
end;

procedure TSeaTaxIcmsSn.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';

  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (tisn.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (tisn.description like :description)';
end;

end.
