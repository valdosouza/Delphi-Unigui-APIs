unit sea_priority;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniLabel,
  Vcl.Menus, uniMainMenu, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniPageControl, uniGUIBaseClasses, uniPanel, MainModule;

type
  TSeaPriority = class(TBaseSearch)
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
    procedure DSPAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaPriority: TSeaPriority;

implementation

{$R *.dfm}
uses openForms;

procedure TSeaPriority.DSPAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  inherited;

end;

procedure TSeaPriority.GetView;
begin
  openCadPriority(cds_searchid.AsInteger,nil);
end;

procedure TSeaPriority.OrderBySql;
begin
  inherited;
  OrderByTxt := ' order by pr.description '
end;

procedure TSeaPriority.SelectSql;
begin
   SelectTxt := ' Select pr.id, pr.description '+
               ' from tb_priority pr ';
end;

procedure TSeaPriority.SetParameters;
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

procedure TSeaPriority.SetRegister;
begin
  openCadPriority(0,nil);
end;

procedure TSeaPriority.WhereSql;
begin
  inherited;
  WhereTxt := ' where pr.tb_institution_id =:tb_institution_id ';

  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (pr.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := concat(WhereTxt,
                        ' and (pr.description like :description) ');

end;

end.
