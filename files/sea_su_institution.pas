unit sea_su_institution;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity_fiscal, Datasnap.Provider,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniRadioGroup, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel,MainModule,FireDAC.Stan.Param,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,
  uniPageControl;

type
  TSeaSuInstitution = class(TSeaEntityFiscal)
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
  SeaSuInstitution: TSeaSuInstitution;

implementation

{$R *.dfm}

uses openForms;

{ TSeaInstitution }

procedure TSeaSuInstitution.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadSuInstitution(lcodigo);
end;

procedure TSeaSuInstitution.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := InnerJoinTxt +
                  ' inner join tb_institution it '+
                  ' on (it.id = en.id)  ';
  UnionInnerJoinTxt := UnionInnerJoinTxt +
                  ' inner join tb_institution it '+
                  ' on (it.id = en.id) ';

end;

procedure TSeaSuInstitution.SetParameters;
begin
  inherited;
  with UMM.Qr_Crud do
  Begin
//    ParamByName('tb_institution_id').AsInteger := GbInstitution;
    if chbx_Active.checked then
      ParamByName('active').AsString := 'S'
    else
      ParamByName('active').AsString := 'N'
  end;
end;

procedure TSeaSuInstitution.SetRegister;
Begin
  openCadSuInstitution(nil);
end;

procedure TSeaSuInstitution.WhereSql;
begin
  inherited;
//  WhereTxt := WhereTxt + ' and (it.id =:tb_institution_id)'+
  WhereTxt := concat(
                  WhereTxt,
                  ' and (it.active=:active) ');
//  UnionWhereTxt := UnionWhereTxt + ' and (it.id =:tb_institution_id)'+
  UnionWhereTxt := concat(
                      UnionWhereTxt,
                      ' and (it.active=:active) ');
end;

end.
