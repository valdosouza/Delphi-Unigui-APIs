unit sea_color;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, FireDAC.Stan.Param,
  uniPanel, UniDBLookupComboBox, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaColor = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_Codigo: TUniEdit;
    chbx_cadAtivo: TUniCheckBox;
    procedure FormatScreen;Override;
    procedure InitVariable;Override;

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
  SeaColor: TSeaColor;

implementation

{$R *.dfm}

uses MainModule, openForms;

{ TSeaColor }

procedure TSeaColor.FormatScreen;
begin
  inherited;
  //
end;

procedure TSeaColor.GetView;
begin
  openCadColor(cds_searchid.AsInteger,nil);
end;

procedure TSeaColor.GroupBySql;
begin
  inherited;
  //
end;

procedure TSeaColor.InitVariable;
begin
  inherited;
  //
end;

procedure TSeaColor.InnerJoinSql;
begin
  InnerJoinTxt := '  inner join tb_institution_has_color i '+
                  '  on (c.id = i.tb_color_id)  ';
end;

procedure TSeaColor.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by c.description ';
end;

procedure TSeaColor.Search;
begin
  inherited;
  //
end;

procedure TSeaColor.SelectSql;
begin
  SelectTxt := ' Select distinct id, description '+
               ' from tb_color c ';
end;

procedure TSeaColor.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

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

procedure TSeaColor.SetRegister;
begin
   openCadColor(0,nil);
end;

procedure TSeaColor.WhereSql;
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
