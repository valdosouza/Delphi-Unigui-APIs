unit sea_entity_fiscal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sea_entity, uniRadioGroup,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniDateTimePicker, uniCheckBox, uniEdit, uniLabel, FireDAC.Stan.Param,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel,MainModule,
  uniPageControl, uniImageList, Vcl.Menus, uniMainMenu;

type
  TSeaEntityFiscal = class(TSeaEntity)
    cds_searchdoc: TStringField;
    E_CNPJ_CPF: TUniEdit;
    RG_Person: TUniRadioGroup;
    pnl_param_row_4_1: TUniPanel;
  private
  protected
    procedure InitVariable;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure SetParameters;Override;

    procedure GetView;Override;
    procedure SetRegister;Override;
  public
  end;

var
  SeaEntityFiscal: TSeaEntityFiscal;

implementation

{$R *.dfm}

uses
  openForms;

{ TSeaEntityFiscal }

procedure TSeaEntityFiscal.GetView;
begin
  openCadEntityFiscal(cds_searchid.AsInteger);
end;

procedure TSeaEntityFiscal.InitVariable;
begin
  inherited;
  RG_Person.ItemIndex := 2;
end;

procedure TSeaEntityFiscal.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := InnerJoinTxt +
                  '  inner join tb_institution_has_entity i on (en.id = i.tb_entity_id) '+
                  '  inner join tb_person pe on ( en.id = pe.id ) ';

  //union======================================================================
  InnerJoinTxt_1 :=
    InnerJoinTxt_1 +
    '  INNER JOIN tb_company co ON ( en.id = co.id  ) '+
    '  inner join tb_institution_has_entity i on (en.id = i.tb_entity_id) ';

end;

procedure TSeaEntityFiscal.SelectSql;
begin
  SelectTxt :=      'SELECT en.id, en.name_company, en.nick_trade, ma.email,pe.cpf doc '+
                    'FROM tb_entity en ';

  SelectTxt_1 := 'SELECT en.id, en.name_company, en.nick_trade, ma.email,co.cnpj doc  '+
                    'FROM tb_entity en ';

end;

procedure TSeaEntityFiscal.SetParameters;
begin
  inherited;
  with UMM.Qr_Crud do
  Begin
    if (E_CNPJ_CPF.Text  <> '') then
      ParamByName('doc').AsString := E_CNPJ_CPF.Text;
  end;
end;

procedure TSeaEntityFiscal.SetRegister;
begin
  openCadEntityFiscal(0)
end;

procedure TSeaEntityFiscal.WhereSql;
begin
  inherited;
  if (E_CNPJ_CPF.Text  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( pe.cpf = :doc) ';
    WhereTxt_1 := WhereTxt_1 + ' and ( co.cnpj = :doc) ';
  End;

  case RG_Person.ItemIndex of
    0:WhereTxt_1 := WhereTxt_1 + ' and ( co.id = 0) ';
    1:WhereTxt := WhereTxt + ' and ( pe.id = 0) ';
  end;

end;

end.
