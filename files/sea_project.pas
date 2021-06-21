unit sea_project;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniPageControl,
  uniGUIBaseClasses, uniPanel, uniEdit, uniLabel, MainModule;

type
  TSeaProject = class(TBaseSearch)
    L_Codigo: TUniLabel;
    L_Description: TUniLabel;
    E_ID_Search: TUniEdit;
    E_Description: TUniEdit;
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
  SeaProject: TSeaProject;

implementation

{$R *.dfm}

uses openForms;

{ TSeaProject }

procedure TSeaProject.GetView;
begin
  openCadProject(cds_searchid.AsInteger,nil);
end;

procedure TSeaProject.OrderBySql;
begin
  inherited;
  OrderByTxt := ' order by p.description '
end;

procedure TSeaProject.SelectSql;
begin
   SelectTxt := ' Select p.id, p.description '+
               ' from tb_project p ';
end;

procedure TSeaProject.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

  end;
end;

procedure TSeaProject.SetRegister;
begin
  openCadProject(0,nil);
end;

procedure TSeaProject.WhereSql;
begin
  inherited;
  WhereTxt := ' where p.tb_institution_id =:tb_institution_id ';

  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (p.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := concat(WhereTxt,
                        ' and (p.description like :description) ');

end;

end.
