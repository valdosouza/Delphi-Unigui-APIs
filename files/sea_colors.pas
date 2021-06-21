unit sea_colors;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel;

type
  TSeaColors = class(TBaseSearch)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_Codigo: TUniEdit;
    chbx_cadAtivo: TUniCheckBox;
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
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
  SeaColors: TSeaColors;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaBrand }

procedure TSeaColors.FormatScreen;
begin
  inherited;
  //
end;

procedure TSeaColors.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadColor(lcodigo);
end;

procedure TSeaColors.GroupBySql;
begin
  inherited;
  //
end;

procedure TSeaColors.InitVariable;
begin
  inherited;
  //
end;

procedure TSeaColors.InnerJoinSql;
begin
  InnerJoinTxt := '  inner join tb_institution_has_colors i '+
                  '  on (c.id = i.tb_colors_id)  ';
end;

procedure TSeaColors.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by c.description ';
end;

procedure TSeaColors.Search;
begin
  inherited;
  //
end;

procedure TSeaColors.SelectSql;
begin
  SelectTxt := ' Select distinct id, description '+
               ' from tb_colors c ';
end;

procedure TSeaColors.SetParameters;
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

procedure TSeaColors.SetRegister;
begin
   openCadInstitution(nil);
end;

procedure TSeaColors.VerifyParameters;
begin
  inherited;
  //
end;

procedure TSeaColors.WhereSql;
begin
  inherited;
  WhereTxt := ' where i.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (i.active =:active) ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (c.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (c.description like :description)';
end;


end.
