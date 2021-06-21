unit sea_package;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,FireDAC.Stan.Param,
  uniPanel, UniDBLookupComboBox, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaPackage = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchabbreviation: TStringField;
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_Codigo: TUniEdit;
    chbx_cadAtivo: TUniCheckBox;
    UniLabel1: TUniLabel;
    E_Abbreviation: TUniEdit;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
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
  SeaPackage: TSeaPackage;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaPackage }

procedure TSeaPackage.GetView;
begin
  openCadPackage(cds_searchid.AsInteger,nil);
end;

procedure TSeaPackage.InnerJoinSql;
begin
  InnerJoinTxt := '  inner join tb_institution_has_package i '+
                  '  on (p.id = i.tb_package_id)  ';
end;

procedure TSeaPackage.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by p.description ';
end;

procedure TSeaPackage.SelectSql;
begin
  SelectTxt := ' Select distinct p.id, p.description, p.abbreviation '+
               ' from tb_package p ';
end;

procedure TSeaPackage.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if E_Abbreviation.Text <> '' then
      ParamByName('abbreviation').AsString := '%' + E_Abbreviation.Text + '%' ;

    if chbx_cadAtivo.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';
  end;
end;

procedure TSeaPackage.SetRegister;
begin
  openCadPackage(0,nil);
end;

procedure TSeaPackage.WhereSql;
begin
  inherited;
  WhereTxt := ' where i.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (i.active =:active) ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (p.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (p.description like :description)';

  if E_Abbreviation.Text <> '' then
    WhereTxt := WhereTxt + ' and (p.abbreviation like :abbreviation)';
end;


end.
