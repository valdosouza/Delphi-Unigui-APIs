unit sea_ext_tester;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, uniGroupBox, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniPanel, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaExtTester = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchtester: TStringField;
    UniLabel1: TUniLabel;
    E_name_company: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure SetParameters;Override;
    procedure OrderBySql;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaExtTester: TSeaExtTester;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeaExtTester }

procedure TSeaExtTester.GetView;
begin
 openCadExtTester(cds_searchid.AsInteger,nil);
end;

procedure TSeaExtTester.InnerJoinSql;
begin
  inherited;
    InnerJoinTxt := concat(
                  ' inner join tb_entity en '+
                  ' on (en.id = et.id) '
                  )


end;

procedure TSeaExtTester.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by en.name_company ';
end;

procedure TSeaExtTester.SelectSql;
begin
  SelectTxt := ' Select distinct et.id, en.id tester_id, en.name_company tester '+
               ' from tb_ext_tester et ';

end;

procedure TSeaExtTester.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_name_company.Text <> '' then
      ParamByName('name_company').AsString := '%' + E_name_company.Text + '%' ;

    if chbx_cad_active.checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N'
  end;
end;

procedure TSeaExtTester.SetRegister;
begin
  openCadExtTester(0,nil);;
end;

procedure TSeaExtTester.WhereSql;
begin
  inherited;
  WhereTxt := ' where et.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (et.active =:active) ';

  if E_name_company.Text <> '' then
    WhereTxt := WhereTxt + ' and (en.name_company like :name_company)';
end;

end.
