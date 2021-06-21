unit sea_institution;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity_fiscal, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel,MainModule,FireDAC.Stan.Param,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaInstitution = class(TSeaEntityFiscal)
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure SetParameters;Override;

    procedure GetView;Override;
    procedure SetRegister;Override;
  public
    { Public declarations }
  end;

var
  SeaInstitution: TSeaInstitution;

implementation

{$R *.dfm}

uses openForms;

{ TSeaInstitution }

procedure TSeaInstitution.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadSuInstitution(lcodigo,cds_searchid.AsInteger);
end;

procedure TSeaInstitution.InitVariable;
begin
  inherited;

end;

procedure TSeaInstitution.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_institution it '+
                  ' on (it.id = en.id)  ';
  InnerJoinTxt_1 := InnerJoinTxt_1 +
                  ' inner join tb_institution it '+
                  ' on (it.id = en.id) ';

end;


procedure TSeaInstitution.SetParameters;
begin
  inherited;
  with UMM.Qr_Crud do
  Begin
    if chbx_Active.checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N'
  end;
end;

procedure TSeaInstitution.SetRegister;
Begin
  openCadSuInstitution(nil,0);
end;

procedure TSeaInstitution.WhereSql;
begin
  inherited;
  WhereTxt := concat(
                  WhereTxt,
                  ' and (it.active=:active) ');
  WhereTxt_1 := concat(
                      WhereTxt_1,
                      ' and (it.active=:active) ');
end;

end.
