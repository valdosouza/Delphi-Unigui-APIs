unit sea_tax_pis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  ControllerTaxPIS, UniDBLookupComboBox, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaTaxPis = class(TBaseSearch)
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
    TaxPis : TControllerTaxPIS;
  end;

var
  SeaTaxPis: TSeaTaxPis;

implementation

uses MainModule, openForms;

{$R *.dfm}

{ TSeaTbTaxPis }

procedure TSeaTaxPis.GetView;
begin
  openCadTaxPis(cds_searchid.AsInteger,nil);
end;

procedure TSeaTaxPis.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by tps.description ';
end;

procedure TSeaTaxPis.SelectSql;
begin
  SelectTxt := ' Select distinct tps.id, tps.description '+
               ' from tb_tax_pis tps ';
end;

procedure TSeaTaxPis.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin


    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaTaxPis.SetRegister;
begin
  openCadTaxPis(0,nil);
end;

procedure TSeaTaxPis.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';


  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (tps.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (tps.description like :description)';
end;

end.
