unit sea_provider;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity_fiscal, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel,MainModule, FireDAC.Stan.Param,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, UniDBLookupComboBox,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaProvider = class(TSeaEntityFiscal)
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
  SeaProvider: TSeaProvider;

implementation

{$R *.dfm}

uses openForms;

{ TSeaProvider }

procedure TSeaProvider.GetView;
begin
  openCadProvider(cds_searchid.AsInteger,nil);
end;

 procedure TSeaProvider.InnerJoinSql;
begin
  inherited;
    InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_provider p '+
                  ' on (p.id = en.id) ';
    InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_provider p '+
                  ' on (p.id = en.id) ';

end;

procedure TSeaProvider.SetParameters;
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

procedure TSeaProvider.SetRegister;
begin
  openCadProvider(0,nil);
end;

procedure TSeaProvider.WhereSql;
begin
  inherited;
  WhereTxt := WhereTxt + ' and (p.tb_institution_id =:tb_institution_id)'+
                         ' and (p.active=:active) ';

  WhereTxt_1 := WhereTxt_1 + ' and (p.tb_institution_id =:tb_institution_id)'+
                                   ' and (p.active=:active) ';
end;

end.
