unit sea_situation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniCheckBox,FireDAC.Stan.Param,
  Vcl.StdCtrls, uniEdit, uniLabel, ControllerSituation, uniMultiItem,
  uniComboBox, UniDBLookupComboBox, uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaSituation = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchdescription: TStringField;
    cds_searchmodulo: TStringField;
    UniLabel1: TUniLabel;
    E_Description: TUniEdit;
    E_ID_Search: TUniEdit;
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    Cb_Modulo: TUniComboBox;
    chbx_cad_active: TUniCheckBox;

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
    Situation: TControllerSituation;
  end;

var
  SeaSituation: TSeaSituation;

implementation

{$R *.dfm}

uses openForms, MainModule ;

{ SeaSituation }

procedure TSeaSituation.GetView;
begin
  openCadSituation(cds_searchid.AsInteger,nil);
end;

procedure TSeaSituation.InnerJoinSql;
begin
 //
end;

procedure TSeaSituation.OrderBySql;
begin
  inherited;
  OrderByTxt := ' order by s.description ';

end;

procedure TSeaSituation.SelectSql;
begin
   SelectTxt := ' Select s.id, s.description, s.modulo '+
               ' from tb_situation s ';

end;

procedure TSeaSituation.SetParameters;
begin
  with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if E_ID_Search.Text <> '' then
      ParamByName('id').AsString := E_ID_Search.Text;

    if E_Description.Text <> '' then
      ParamByName('description').AsString := '%' + E_Description.Text + '%' ;

    if Cb_Modulo.Text <> '' then
      ParamByName('modulo').AsInteger := Cb_Modulo.ItemIndex;

    if chbx_cad_active.Checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N';
  end;

end;

procedure TSeaSituation.SetRegister;
begin
  openCadSituation(0,nil);
end;

procedure TSeaSituation.WhereSql;
begin
  inherited;
  WhereTxt := ' where s.tb_institution_id =:tb_institution_id ';

  WhereTxt := WhereTxt + ' and (s.active =:active) ';

  if E_ID_Search.Text <> '' then
    WhereTxt := WhereTxt + ' and (s.id =:id)';

  if E_Description.Text <> '' then
    WhereTxt := concat(WhereTxt,
                        ' and (s.description like :description) ');

  if Cb_Modulo.Text <> '' then
    WhereTxt := WhereTxt + ' and (s.modulo =:modulo)';

end;

end.
