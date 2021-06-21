unit sea_tax_ipi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  ControllerTaxIPI, UniDBLookupComboBox, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaTaxIpi = class(TBaseSearch)
    cds_searchid: TStringField;
    cds_searchdescription: TStringField;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    L_Codigo: TUniLabel;
    E_ID_Search: TUniEdit;

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
    TaxIpi : TControllerTaxIPI;
  end;

var
  SeaTaxIpi: TSeaTaxIpi;

implementation

uses MainModule, openForms;

{$R *.dfm}

{ TSeaTaxIpi }

procedure TSeaTaxIpi.GetView;
begin
  openCadTaxIpi(cds_searchid.AsInteger,nil);
end;

procedure TSeaTaxIpi.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by ti.id ';
end;

procedure TSeaTaxIpi.SelectSql;
begin
  SelectTxt := ' Select distinct ti.id, ti.description '+
               ' from tb_tax_ipi ti ';
end;

procedure TSeaTaxIpi.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin


    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;

end;

procedure TSeaTaxIpi.SetRegister;
begin
  openCadTaxIpi(0,nil);
end;

procedure TSeaTaxIpi.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';


  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (ti.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (ti.description like :description)';
end;

end.
