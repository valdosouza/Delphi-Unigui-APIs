unit sea_clin_professional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity_fiscal, Vcl.Menus,
  uniMainMenu, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton,
  uniBitBtn, uniSpeedButton, uniBasicGrid, uniDBGrid, uniRadioGroup, uniEdit,
  uniDateTimePicker, uniGUIClasses, uniCheckBox, uniPageControl,
  uniGUIBaseClasses, uniPanel,controllerprovider;

type
  TSeaClinProfessional = class(TSeaEntityFiscal)
  private
    { Private declarations }
  protected
    procedure InitVariable; Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  public
    { Public declarations }
  end;

var
  SeaClinProfessional: TSeaClinProfessional;

implementation

{$R *.dfm}

uses MainModule, openForms;


{ TSeaClinProfessional }

procedure TSeaClinProfessional.GetView;
begin
  openCadClinProfessional(cds_searchid.AsInteger,nil);
end;

procedure TSeaClinProfessional.InitVariable;
begin
  PInterface := 48;
  inherited;
end;

procedure TSeaClinProfessional.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_clin_professional p '+
                  ' on (p.id = en.id) ';
  InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_clin_professional p '+
                  ' on (p.id = en.id) ';

end;

procedure TSeaClinProfessional.SetParameters;
begin
  inherited;
   with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    if chbx_Active.checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N'
  end;
end;

procedure TSeaClinProfessional.SetRegister;
begin
  openCadClinProfessional(0,nil);
end;

procedure TSeaClinProfessional.WhereSql;
begin
  inherited;
  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( p.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( p.created_at between :dataini and :datafim ) ';
  end;

  WhereTxt := WhereTxt + ' and (p.tb_institution_id =:tb_institution_id) '+
                         ' and (p.active=:active) ';
  WhereTxt_1 := WhereTxt_1 + ' and (p.tb_institution_id =:tb_institution_id)'+
                                   ' and (p.active=:active) ';

end;

end.
