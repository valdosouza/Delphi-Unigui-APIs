unit sea_agency;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, sea_entity_fiscal,MainModule,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaAgency = class(TSeaEntityFiscal)
  private
  protected
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  public
  end;

var
  SeaAgency: TSeaAgency;

implementation

{$R *.dfm}

uses openForms;

{ TSeaAgency }

procedure TSeaAgency.GetView;
begin
  openCadAgency(cds_searchid.AsInteger,nil);
end;

procedure TSeaAgency.InnerJoinSql;
begin
  inherited;
    InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_agency a '+
                  ' on (a.id = en.id) ';
    InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_agency a '+
                  ' on (a.id = en.id) ';

end;

procedure TSeaAgency.SetParameters;
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

procedure TSeaAgency.SetRegister;
begin
  openCadAgency(0,nil);
end;

procedure TSeaAgency.WhereSql;
begin
  inherited;
  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( a.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( a.created_at between :dataini and :datafim ) ';
  end;

  WhereTxt := WhereTxt + ' and (a.tb_institution_id =:tb_institution_id)'+
                         ' and (a.active =:active) ';

  WhereTxt_1 := WhereTxt_1 + ' and (a.tb_institution_id =:tb_institution_id)'+
                                   ' and (a.active =:active) ';
end;

end.
