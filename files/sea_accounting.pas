unit sea_accounting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity_fiscal, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, MainModule,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaAccounting = class(TSeaEntityFiscal)

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
  SeaAccounting: TSeaAccounting;

implementation

{$R *.dfm}

uses openForms;

{ TSeaAccounting }

procedure TSeaAccounting.GetView;
begin
  openCadAccounting(cds_searchid.AsInteger,nil);
end;

procedure TSeaAccounting.InnerJoinSql;
begin
  inherited;
    InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_accounting a '+
                  ' on (a.id = en.id) ';
    InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_accounting a '+
                  ' on (a.id = en.id) ';

end;

procedure TSeaAccounting.SetParameters;
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

procedure TSeaAccounting.SetRegister;
begin
  openCadAccounting(0,nil);
end;

procedure TSeaAccounting.WhereSql;
begin
  inherited;
  WhereTxt := WhereTxt + ' and (a.tb_institution_id =:tb_institution_id)'+
                         ' and (a.active=:active) ';

  WhereTxt_1 := WhereTxt_1 + ' and (a.tb_institution_id =:tb_institution_id)'+
                                   ' and (a.active=:active) ';
end;

end.
