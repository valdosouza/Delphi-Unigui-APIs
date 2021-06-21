unit sea_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniPageControl,
  uniGUIBaseClasses, uniPanel, uniMultiItem, uniComboBox, uniEdit, uniLabel,
  MainModule;

type
  TSeaKind = class(TBaseSearch)
    UniLabel1: TUniLabel;
    L_Codigo: TUniLabel;
    L_Description: TUniLabel;
    E_ID_Search: TUniEdit;
    E_Description: TUniEdit;
    Cb_Custo: TUniComboBox;
    cds_searchid: TIntegerField;
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
  end;

var
  SeaKind: TSeaKind;

implementation

{$R *.dfm}

uses openForms;

{ TSeaKind }

procedure TSeaKind.GetView;
begin
  openCadKind(cds_searchid.AsInteger,nil);
end;

procedure TSeaKind.OrderBySql;
begin
  inherited;
  OrderByTxt := ' order by k.description '
end;

procedure TSeaKind.SelectSql;
begin
   SelectTxt := ' Select k.id, k.description, k.cost_owner '+
               ' from tb_kind k ';
end;

procedure TSeaKind.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if Cb_Custo.Text <> '' then
      ParamByName('cost_owner').AsInteger := Cb_Custo.ItemIndex;

  end;
end;

procedure TSeaKind.SetRegister;
begin
  openCadKind(0,nil);
end;

procedure TSeaKind.WhereSql;
begin
  inherited;
  WhereTxt := ' where k.tb_institution_id =:tb_institution_id ';

  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (k.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := concat(WhereTxt,
                        ' and (k.description like :description) ');

  if Cb_Custo.Text <> '' then
    WhereTxt := WhereTxt + ' and (k.cost_owner =:cost_owner)';
end;

end.
