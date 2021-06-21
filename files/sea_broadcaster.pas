unit sea_broadcaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, FireDAC.Stan.Param,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, sea_entity_fiscal,MainModule,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel,UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaBroadcaster = class(TSeaEntityFiscal)
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
  SeaBroadcaster: TSeaBroadcaster;

implementation

{$R *.dfm}

uses openForms;

{ TSeaBroadcaster }

procedure TSeaBroadcaster.GetView;
begin
 openCadBroadcaster(cds_searchid.AsInteger,nil);
end;

procedure TSeaBroadcaster.InnerJoinSql;
begin
  inherited;
    InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_broadcaster bd '+
                  ' on (bd.id = en.id) ';
    InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_broadcaster bd '+
                  ' on (bd.id = en.id) ';

end;

procedure TSeaBroadcaster.SetParameters;
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

procedure TSeaBroadcaster.SetRegister;
begin
  openCadBroadcaster(0,nil);
end;

procedure TSeaBroadcaster.WhereSql;
 begin
  inherited;
  if ChBx_Periodo.Checked then
  Begin
    WhereTxt := WhereTxt + ' AND ( bd.created_at between :dataini and :datafim ) ';
    WhereTxt_1 := WhereTxt_1 + ' AND ( bd.created_at between :dataini and :datafim ) ';
  end;

  WhereTxt := WhereTxt + ' and (bd.tb_institution_id =:tb_institution_id)'+
                         ' and (bd.active=:active) ';

  WhereTxt_1 := WhereTxt_1 + ' and (bd.tb_institution_id =:tb_institution_id)'+
                                   ' and (bd.active=:active) ';
 end;

end.
