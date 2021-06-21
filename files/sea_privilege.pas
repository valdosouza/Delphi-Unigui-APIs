unit sea_privilege;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaPrivilege = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    L_Codigo: TUniLabel;
    E_ID_Search: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
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
  SeaPrivilege: TSeaPrivilege;

implementation

{$R *.dfm}
uses MainModule, openForms;

{ TSeaPrivilege }



{ TSeaPrivilege }

procedure TSeaPrivilege.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadPrivilege(lcodigo);
end;

procedure TSeaPrivilege.InnerJoinSql;
begin
//
end;

procedure TSeaPrivilege.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by pv.description ';
end;

procedure TSeaPrivilege.SelectSql;
begin
  SelectTxt := ' Select distinct pv.id, pv.description '+
               ' from tb_privilege pv ';
end;

procedure TSeaPrivilege.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

  end;
end;

procedure TSeaPrivilege.SetRegister;
begin
  openCadPrivilege(nil);
end;

procedure TSeaPrivilege.WhereSql;
begin
  inherited;
  WhereTxt := ' where pv.id is not null ';


  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (pv.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (pv.description like :description)';


end;

end.
