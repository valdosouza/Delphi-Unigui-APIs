unit sea_clin_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Vcl.Menus, uniMainMenu,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniBasicGrid, uniDBGrid, uniEdit, uniGUIClasses, uniCheckBox,
  uniPageControl, uniGUIBaseClasses, uniPanel, MainModule;

type
  TSeaClinModule = class(TBaseSearch)
    pnl_row_1: TUniPanel;
    E_Codigo: TUniEdit;
    E_Description: TUniEdit;
    cds_searchid: TIntegerField;
    cds_searchsequence_id: TIntegerField;
    cds_searchdescription: TStringField;
  private
    { Private declarations }
  protected
    procedure InitVariable; Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  public
    { Public declarations }
  end;

var
  SeaClinModule: TSeaClinModule;

implementation

{$R *.dfm}

uses openForms;

{ TSeaClinModule }

procedure TSeaClinModule.GetView;
begin
  openCadClinModule(cds_searchid.AsInteger,nil);
end;

procedure TSeaClinModule.InitVariable;
begin
  PInterface := 49;
  inherited;
end;

procedure TSeaClinModule.InnerJoinSql;
begin
  inherited;
end;

procedure TSeaClinModule.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by description ';
end;

procedure TSeaClinModule.SelectSql;
begin
  inherited;
  SelectTxt := ' Select  * '+
               ' from tb_clin_module ';
end;

procedure TSeaClinModule.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_Codigo.Text <> '' then
      ParamByName('id').AsString := E_Codigo.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;
  end;
end;

procedure TSeaClinModule.SetRegister;
begin
  openCadClinModule(0,nil);
end;

procedure TSeaClinModule.WhereSql;
begin
  inherited;
  WhereTxt := ' where tb_institution_id =:tb_institution_id ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (description like :description)';

end;

end.
