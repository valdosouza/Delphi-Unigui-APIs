unit sea_salesman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity_fiscal, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel,FireDAC.Stan.Param,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,MainModule, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaSalesman = class(TSeaEntityFiscal)
  procedure InnerJoinSql;Override;
  procedure WhereSql;Override;
  procedure SetParameters;Override;
  procedure GetView;Override;
  procedure SetRegister;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaSalesman: TSeaSalesman;

implementation

{$R *.dfm}

uses openForms;

{ TSeaSalesman }

procedure TSeaSalesman.GetView;
begin
 openCadSalesman(cds_searchid.AsInteger,nil);
end;
procedure TSeaSalesman.InnerJoinSql;
begin
  inherited;
       InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_salesman s '+
                  ' on (s.id = en.id) ';
       InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_salesman s '+
                  ' on (s.id = en.id) '

end;

procedure TSeaSalesman.SetParameters;
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

procedure TSeaSalesman.SetRegister;
begin
  openCadSalesman(0,nil);
end;

procedure TSeaSalesman.WhereSql;
begin
 inherited;
  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( en.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( en.created_at between :dataini and :datafim ) ';
  end;

  WhereTxt := WhereTxt + ' and (s.tb_institution_id =:tb_institution_id)'+
                         ' and (s.active=:active) ';
  WhereTxt_1 := WhereTxt_1 + ' and (s.tb_institution_id =:tb_institution_id)'+
                                   ' and (s.active=:active) ';
end;
end.
