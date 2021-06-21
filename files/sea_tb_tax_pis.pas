unit sea_tb_tax_pis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  ControllerTaxPIS, UniDBLookupComboBox;

type
  TSeaTbTaxPis = class(TBaseSearch)
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    UniLabel1: TUniLabel;
    E_Group: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    cds_searchid: TIntegerField;
    cds_searchgroup_tax: TStringField;
    cds_searchdescription: TStringField;

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
  SeaTbTaxPis: TSeaTbTaxPis;

implementation

uses MainModule, openForms;

{$R *.dfm}

{ TSeaTbTaxPis }

procedure TSeaTbTaxPis.GetView;
  Var
  lcodigo : TUniDBLookupComboBox;
begin
  lcodigo := TUniDBLookupComboBox.Create(Self);
  lcodigo.KeyValue := cds_searchid.AsInteger;
  openCadTaxPis(lcodigo);
end;

procedure TSeaTbTaxPis.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by tps.description ';
end;

procedure TSeaTbTaxPis.SelectSql;
begin
  SelectTxt := ' Select distinct tps.id, tps.description, tps.group_tax '+
               ' from tb_tax_pis tps ';
end;

procedure TSeaTbTaxPis.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin


    if E_ID.Text <> '' then
      ParamByName('id').AsString := E_ID.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if E_Group.Text <> '' then
      ParamByName('group_tax').AsString := '%' + E_Group.Text + '%' ;

  end;
end;

procedure TSeaTbTaxPis.SetRegister;
begin
  openCadTaxPis(nil);
end;

procedure TSeaTbTaxPis.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';


  if E_ID.Text <> '' then
    WhereTxt := WhereTxt + ' and (tps.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (tps.description like :description)';

  if E_Group.Text <> '' then
    WhereTxt := WhereTxt + ' and (tps.group_tax like :group_tax)' ;

end;

end.
