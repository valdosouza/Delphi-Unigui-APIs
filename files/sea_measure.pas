unit sea_measure;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,  FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, UniDBLookupComboBox,
  uniPanel, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaMeasure = class(TBaseSearch)
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
  SeaMeasure: TSeaMeasure;

implementation

{$R *.dfm}
uses MainModule, openForms;

{ TSeaMeasure }


{ TSeaMeasure }

procedure TSeaMeasure.GetView;
begin
  openCadMeasure(cds_searchid.AsInteger,nil);
end;

procedure TSeaMeasure.InnerJoinSql;
begin
  InnerJoinTxt := '  inner join tb_institution_has_measure i '+
                  '  on (m.id = i.tb_measure_id)  ';
end;

procedure TSeaMeasure.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by m.description ';
end;

procedure TSeaMeasure.SelectSql;
begin
  SelectTxt := ' Select distinct m.id, m.description, m.abbreviation '+
               ' from tb_measure m ';
end;


procedure TSeaMeasure.SetParameters;
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

procedure TSeaMeasure.SetRegister;
begin
  openCadMeasure(0,nil);
end;

procedure TSeaMeasure.WhereSql;
begin
  inherited;
  WhereTxt := ' where i.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (i.active =:active) ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (m.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (m.description like :description)';

  if E_Abbreviation.Text <> '' then
    WhereTxt := WhereTxt + ' and (m.abbreviation like :abbreviation)';
end;

end.
