unit sea_discharge_icms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniLabel,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel, ControllerDischargeIcms, UniDBLookupComboBox, uniPageControl,
  Vcl.Menus, uniMainMenu;

type
  TSeadischargeIcms = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    L_Codigo: TUniLabel;
    E_ID_Search: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
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
  SeadischargeIcms: TSeadischargeIcms;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TSeadischargeIcms }

procedure TSeadischargeIcms.GetView;
begin
  openCadDischargeIcms(cds_searchid.AsInteger,nil);
end;

procedure TSeadischargeIcms.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by dgi.id ';
end;

procedure TSeadischargeIcms.SelectSql;
begin
  SelectTxt := ' Select distinct dgi.id, dgi.description '+
               ' from tb_discharge_icms  dgi ';
end;

procedure TSeadischargeIcms.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

  end;
end;

procedure TSeadischargeIcms.SetRegister;
begin
  openCadDischargeIcms(0,nil);
end;

procedure TSeadischargeIcms.WhereSql;
begin
  inherited;
  WhereTxt := ' where id is not null ';


  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (dgi.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (dgi.description like :description)';

end;

end.
