unit sea_carrier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity_fiscal, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,FireDAC.Stan.Param,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel,MainModule,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaCarrier = class(TSeaEntityFiscal)
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
  SeaCarrier: TSeaCarrier;

implementation

{$R *.dfm}

uses openForms;

{ TSeaCarrier }

procedure TSeaCarrier.GetView;
begin
  openCadCarrier(cds_searchid.AsInteger,nil);
end;


procedure TSeaCarrier.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_carrier c '+
                  ' on (c.id = en.id) ';
  InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_carrier c '+
                  ' on (c.id = en.id) ';
end;

procedure TSeaCarrier.SetParameters;
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


procedure TSeaCarrier.SetRegister;
begin
  inherited;
  openCadCarrier(0,nil);
end;

procedure TSeaCarrier.WhereSql;
begin
  inherited;
  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( c.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( c.created_at between :dataini and :datafim ) ';
  end;

  WhereTxt := WhereTxt + ' and (c.tb_institution_id =:tb_institution_id)'+
                         ' and (c.active=:active) ';
  WhereTxt_1 := WhereTxt_1 + ' and (c.tb_institution_id =:tb_institution_id)'+
                                   ' and (c.active=:active) ';
end;
end.
