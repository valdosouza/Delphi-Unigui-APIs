unit tas_financial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel, uniDateTimePicker, uniCheckBox, uniGroupBox,
  uniBasicGrid, uniDBGrid, uniRadioGroup, uniPageControl, base_form, fm_entity,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, MainModule, uniMultiItem,
  uniComboBox, unMessages, unFunctions, fm_Installment_open, fm_payment_type;

type
  TTasFinancial = class(TBaseForm)
    Grp_search_parameter: TUniGroupBox;
    pnl_botao_Valores: TUniPanel;
    SB_Insert: TUniSpeedButton;
    SB_Change: TUniSpeedButton;
    SB_Delete: TUniSpeedButton;
    Sb_Close_Valores: TUniSpeedButton;
    pg_Principal: TUniPageControl;
    tbs_valores: TUniTabSheet;
    pnl_valores: TUniPanel;
    dbg_valores: TUniDBGrid;
    UniGroupBox3: TUniGroupBox;
    UniLabel6: TUniLabel;
    E_VL_Total: TUniLabel;
    UniLabel14: TUniLabel;
    E_VL_Selecionado: TUniLabel;
    Sb_Search: TUniSpeedButton;
    cds_search: TClientDataSet;
    ds_search: TDataSource;
    DSP: TDataSetProvider;
    pnl_search_row_1: TUniPanel;
    pnl_search_row_1_1: TUniPanel;
    Rg_tipo_data: TUniRadioGroup;
    pnl_date_periodo: TUniPanel;
    pnl_date_periodo_1: TUniPanel;
    ChBx_Periodo: TUniCheckBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    pnl_date_periodo_2: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    E_Nr_Ordem: TUniEdit;
    E_Nr_Invoice: TUniEdit;
    procedure Sb_SearchClick(Sender: TObject);
    procedure Sb_Close_ValoresClick(Sender: TObject);
    procedure SB_ChangeClick(Sender: TObject);
  private
    { Private declarations }

  protected
    FrInstallmentOpen : TFmInstallmentOpen;
    FrPaymentType     : TfmPaymentType;
    Tipo : String;
    procedure formatGrid;Virtual;
    procedure ShowInstallmentOpen(Parente:TWinControl);
    procedure ShowPaymentType(Parente:TWinControl);
    procedure setImages;override;
    procedure FormatScreen;override;
    procedure search;Virtual;
    function validaExisteRegistro:Boolean;
    function ValidateChange:Boolean;Virtual;
    procedure Change;Virtual;
    procedure ShowList;
    procedure somatotal;

  public


  end;

var
  TasFinancial: TTasFinancial;

implementation

{$R *.dfm}

uses openForms;


procedure TTasFinancial.Change;
begin

end;

procedure TTasFinancial.setImages;
begin
  buttonIcon(SB_Insert,'insert.bmp');
  buttonIcon(SB_Change,'change.bmp');
  buttonIcon(Sb_Delete,'delete.bmp');
  buttonIcon(Sb_Search,'search.bmp');
  buttonIcon(Sb_Close_Valores,'close.bmp');
end;

procedure TTasFinancial.ShowInstallmentOpen(Parente: TWinControl);
begin
  FrInstallmentOpen := TFmInstallmentOpen.Create(Parente);
  FrInstallmentOpen.Parent := Parente;
  FrInstallmentOpen.Align := alClient;
  FrInstallmentOpen.Show;

end;

procedure TTasFinancial.ShowList;
Var
  I : Integer;
begin
  cds_search.Active := False;
  search;
  somatotal;
  cds_search.Active := True;
end;

procedure TTasFinancial.ShowPaymentType(Parente: TWinControl);
begin
  FrPaymentType := TfmPaymentType.Create(Parente);
  FrPaymentType.Parent := Parente;
  FrPaymentType.listar;
  FrPaymentType.Align := alClient;
  FrPaymentType.Show;
end;

procedure TTasFinancial.somatotal;
var
  i: Integer;
  Lctotal : Real;
  LcSelectionado : Real;
begin
  if dbg_valores.SelectedRows.Count > 0 then
  begin
    LcSelectionado := 0;
    with dbg_valores.DataSource.DataSet do
    begin
      Lctotal        := 0;

      for i := 0 to dbg_valores.SelectedRows.Count-1 do
      begin
//        GotoBookmark(Pointer(dbg_valores.SelectedRows.Items[i]));
        LcSelectionado := LcSelectionado + cds_search.FieldByName('tag_value').AsFloat;
      end;
    end;
    E_VL_Selecionado.Caption := FloatToStrF(LcSelectionado,ffNumber,10,2);
  end
end;

function TTasFinancial.validaExisteRegistro: Boolean;
begin
  REsult := True;
  if not cds_search.Active then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registro para alterar.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  end;
  if ( cds_search.RecordCount = 0 ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registro para alterar.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  end;
end;

function TTasFinancial.ValidateChange: Boolean;
begin
  REsult := True;
  if not validaExisteRegistro then
  begin
    Result := False;
    exit;
  end;
end;


procedure TTasFinancial.Sb_SearchClick(Sender: TObject);
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    ShowList;
    somatotal;
  finally
    self.HideMask;
  end;
end;

procedure TTasFinancial.search;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'SELECT inv.id, inv.number NotaFiscal, fib.number Duplicata, fin.dt_expiration, ',
              'en.name_company, fin.tag_value, fin.parcel ',
              '  from tb_invoice inv ',
              '    inner join tb_financial fin ',
              '    on (fin.tb_order_id = inv.id) ',
              '        and (fin.tb_isntitution_id = inv.tb_isntitution_id) ',
              '        and (fin.terminal = inv.terminal) ',

              '    inner join tb_financial_bills fib ',
              '    on (fib.tb_order_id = fin.tb_order_id) ',
              '  	     and (fib.tb_institution_id = fin.tb_institution_id) ',
              '        and (fib.parcel = fin.parcel) ',
              '        and (fin.terminal = fin.terminal) ',

              '    inner join tb_entity en ',
              '    on (en.id = inv.tb_entity_id) ',
              'where ( inv.tb_institution_id =:institution_id ) '
    ));

    sql.Add(' and (fib.kind like :fib_kind) ');

    if ChBx_Periodo.Checked then
    Begin
      case Rg_tipo_data.ItemIndex of
        0:sql.Add(' AND ( inv.dt_emission between :dataini and :datafim ) ');
        1:sql.Add(' AND ( fin.dt_expiration between :dataini and :datafim ) ');
      end;
    End;

    if ( Trim(E_Nr_Invoice.Text) <> '' ) then
      sql.Add(' AND ( inv.number = :inv_number ) ');

    //Passagem de PArametros
    ParamByName('fib_kind').AsString := concat( Self.Tipo, '%');

    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    if ChBx_Periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if ( Trim(E_Nr_Invoice.Text) <> '' ) then
      ParamByName('inv_number').AsString := E_Nr_Invoice.Text;


    Active := True;
    cds_search.Active := False;
    cds_search.Active := True;
  End;
end;

procedure TTasFinancial.formatGrid;
begin
  with dbg_valores do
  Begin
    Columns[0].Width := 87;
    Columns[1].Width := 87;
    Columns[2].Width := 97;
    Columns[3].Width := 115;
    Columns[4].Width := 444;
    Columns[5].Width := 111;
  End;
end;

procedure TTasFinancial.FormatScreen;
begin
  formatGrid;
end;


procedure TTasFinancial.SB_ChangeClick(Sender: TObject);
begin
  if ValidateChange then
    Change;
end;

procedure TTasFinancial.Sb_Close_ValoresClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
