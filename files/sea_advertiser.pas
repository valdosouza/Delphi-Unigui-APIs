unit sea_advertiser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,MainModule,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, sea_entity_fiscal, FireDAC.Stan.Param,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaAdvertiser = class(TSeaEntityFiscal)
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
  SeaAdvertiser: TSeaAdvertiser;

implementation

{$R *.dfm}

uses openForms;

{ TSeaAdvertiser }

procedure TSeaAdvertiser.GetView;
begin
  openCadAdvertiser(cds_searchid.AsInteger,nil);
end;

procedure TSeaAdvertiser.InnerJoinSql;
begin
  inherited;
    InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_advertiser av '+
                  ' on (av.id = en.id) ';
    InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_advertiser av '+
                  ' on (av.id = en.id) ';

end;

procedure TSeaAdvertiser.SetParameters;
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


procedure TSeaAdvertiser.SetRegister;
begin
  openCadAdvertiser(0,nil);
  end;

procedure TSeaAdvertiser.WhereSql;
begin
  inherited;
  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( av.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( av.created_at between :dataini and :datafim ) ';
  end;

  WhereTxt := WhereTxt + ' and (av.tb_institution_id =:tb_institution_id)'+
                         ' and (av.active=:active) ';

  WhereTxt_1 := WhereTxt_1 + ' and (av.tb_institution_id =:tb_institution_id)'+
                                   ' and (av.active=:active) ';
end;

end.
