unit sea_linebusiness;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniLabel,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, FireDAC.Stan.Param,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel,MainModule, uniCheckBox, UniDBLookupComboBox, uniPageControl,
  Vcl.Menus, uniMainMenu;

type
  TSeaLinebusiness = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    L_Codigo: TUniLabel;
    E_Codigo: TUniEdit;
    E_Description: TUniEdit;
    L_descricao: TUniLabel;
    chbx_cadAtivo: TUniCheckBox;
  private
  protected
    procedure InitVariable;Override;

    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;

    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  public
  end;

var
  SeaLinebusiness: TSeaLinebusiness;

implementation

{$R *.dfm}

uses openForms;

{ TSeaLinebusiness }

procedure TSeaLinebusiness.GetView;
begin
  openCadLineBusiness(cds_searchid.AsInteger,nil);
end;

procedure TSeaLinebusiness.InitVariable;
begin
  inherited;
  chbx_cadAtivo.Checked := True;
end;

procedure TSeaLinebusiness.InnerJoinSql;
begin
  InnerJoinTxt := '  inner join tb_institution_has_linebusiness i '+
                  '  on (l.id = i.tb_linebusiness_id)  ';
end;

procedure TSeaLinebusiness.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by l.description ';
end;

procedure TSeaLinebusiness.SelectSql;
begin
  SelectTxt := ' Select distinct id, description '+
               ' from tb_linebusiness l ';
end;

procedure TSeaLinebusiness.SetParameters;
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

procedure TSeaLinebusiness.SetRegister;
begin
  openCadLineBusiness(0,nil);
end;

procedure TSeaLinebusiness.WhereSql;
begin
  inherited;
  WhereTxt := ' where i.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (i.active =:active) ';

  if E_Codigo.Text <> '' then
    WhereTxt := WhereTxt + ' and (l.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := WhereTxt + ' and (l.description like :description)';
end;

end.
