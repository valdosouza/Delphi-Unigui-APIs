unit sea_tax_ruler;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniPanel, uniGroupBox,FireDAC.Stan.Param,
  uniRadioGroup, uniCheckBox, Fm_state, Fm_cfop, MainModule, uniEdit,
  uniPageControl, Vcl.Menus, uniMainMenu;

type
  TSeaTaxRuler = class(TBaseSearch)
    cds_searchid: TIntegerField;
    cds_searchabbreviation: TStringField;
    cds_searchfor_consumer: TStringField;
    cds_searchcrt: TStringField;
    cds_searchfor_icms_st: TStringField;
    cds_searchicms_aliq: TBCDField;
    cds_searchicms_base_reduced: TBCDField;
    cds_searchtb_cfop_id: TStringField;
    cds_searchdirection: TStringField;
    RG_Direction: TUniRadioGroup;
    chbx_Apl: TUniCheckBox;
    Ctn_State: TUniContainerPanel;
    Ctn_CFOP: TUniContainerPanel;

    procedure InitVariable;Override;
    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure FormatScreen;Override;
    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;

  private
    { Private declarations }

    procedure ShowState;
    procedure ShowCfop;
  public
    { Public declarations }
    FrState : TFmState;
    FrCfop  : TFmCfop;

  end;

var
  SeaTaxRuler: TSeaTaxRuler;

implementation

{$R *.dfm}

uses openForms;

{ TSeaTaxRuler }


procedure TSeaTaxRuler.FormatScreen;
begin
  inherited;
  ShowState;
  ShowCfop;
end;

procedure TSeaTaxRuler.GetView;
  Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := cds_searchid.AsInteger;
  openCadTaxRuler(lcodigo);
end;

procedure TSeaTaxRuler.InitVariable;
begin
//
end;

procedure TSeaTaxRuler.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                  InnerJoinTxt,
                  ' left outer join tb_state st ',
                  ' on (st.id = rul.tb_state_id) '
                  );
end;

procedure TSeaTaxRuler.OrderBySql;
begin
  inherited;
  OrderByTxt := 'order by rul.tb_cfop_id '
end;

procedure TSeaTaxRuler.SelectSql;
begin
  SelectTxt := concat(
              'Select  rul.id, rul.tb_cfop_id, st.abbreviation, rul.for_consumer, ',
              'rul.direction, rul.crt, for_icms_st,rul.icms_aliq,  rul.icms_base_reduced ',
              'from tb_tax_ruler rul'
              );
end;

procedure TSeaTaxRuler.SetParameters;
begin
with UMM.Qr_Crud do
  Begin
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;

    if FrState.DBLCB_Lista.KeyValue <> null then
      ParamByName('tb_state_id ').AsInteger := FrState.DBLCB_Lista.KeyValue;

    if FrCfop.DBLCB_Lista.KeyValue <> null then
      ParamByName('cfop').AsInteger := FrCfop.DBLCB_Lista.KeyValue ;

    if RG_Direction.ItemIndex  = 0  then
      ParamByName('direction').AsString := 'S'
    else
      ParamByName('direction').AsString := 'E';

  End;

end;

procedure TSeaTaxRuler.SetRegister;
begin
  openCadTaxRuler(nil);
end;

procedure TSeaTaxRuler.ShowCfop;
begin
  FrCfop := TFmCfop.Create(Self);
  FrCfop.Parent := Ctn_CFOP;
  FrCfop.Align := alClient;
  FrCfop.Listar;
  FrCfop.Show;
end;


procedure TSeaTaxRuler.ShowState;
begin
  FrState := TFmState.Create(Self);
  FrState.Parent := ctn_state;
  FrState.Align := alClient;
  FrState.Listar(1058);
  FrState.Show;
end;

procedure TSeaTaxRuler.WhereSql;
    begin

  inherited;
  WhereTxt := ' where rul.tb_institution_id =:tb_institution_id ';

  if  FrCfop.DBLCB_Lista.KeyValue <> null then
    WhereTxt := WhereTxt + ' and (rul.tb_cfop_id =:cfop)';

    if chbx_Apl.Checked then
  Begin
    WhereTxt := WhereTxt + ' and ( rul.for_consumer =: ParaConsumidor )';
  End;

  if FrState.DBLCB_Lista.Text <> '' then
     WhereTxt := WhereTxt + ' and (rul.tb_state_id =:tb_state_id)';

  WhereTxt := WhereTxt + ' and (rul.direction =:direction )';

  end;

  end.
