unit sea_measure;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel;

type
  TSeaMeasure = class(TBaseSearch)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_Codigo: TUniEdit;
    chbx_cadAtivo: TUniCheckBox;
    UniLabel1: TUniLabel;
    E_Abbreviation: TUniEdit;
    procedure FormatScreen;Override;
    procedure InitVariable;Override;
    procedure VerifyParameters;Override;

    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure GroupBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure Search;Override;
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
uses MainModule;

{ TSeaMeasure }

procedure TSeaMeasure.FormatScreen;
begin
  inherited;
  //
end;

procedure TSeaMeasure.GetView;
begin
  inherited;
  //
end;

procedure TSeaMeasure.GroupBySql;
begin
  inherited;
  //
end;

procedure TSeaMeasure.InitVariable;
begin
  inherited;
  //
end;

procedure TSeaMeasure.InnerJoinSql;
begin
  InnerJoinTxt := '  inner join tb_institution_has_brand i '+
                  '  on (b.id = i.tb_brand_id)  ';
end;

procedure TSeaMeasure.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by b.description ';
end;

procedure TSeaMeasure.Search;
begin
  inherited;
  //
end;

procedure TSeaMeasure.SelectSql;
begin
  SelectTxt := ' Select distinct id, description '+
               ' from tb_Measure m ';
end;

procedure TSeaMeasure.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := GbInstitution;

    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if chbx_cadAtivo.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';
  end;
end;

procedure TSeaMeasure.SetRegister;
begin
  inherited;
  //
end;

procedure TSeaMeasure.VerifyParameters;
begin
  inherited;
  //
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
end;

end.
