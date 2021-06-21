unit fm_financial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, Data.DB,
  Datasnap.DBClient, uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniDateTimePicker, uniPanel, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniEdit, uniLabel, uniButton, uniCheckBox,
  Datasnap.Provider,tblFinancial, ControllerFinancial;

type
  TFmFinancial = class(TFmBaseFrame)
    dbg_Instalment: TUniDBGrid;
    cds_financial: TClientDataSet;
    ds_financial: TDataSource;
    cds_financialdt_expiration: TDateField;
    cds_financialtb_payment_types_id: TIntegerField;
    cds_financialtag_value: TFloatField;
    UniHiddenPanel1: TUniHiddenPanel;
    Dtp_Expiration: TUniDateTimePicker;
    Dblcb_Hdd_Payment_Type: TUniDBLookupComboBox;
    E_Vl_Parcela: TUniNumberEdit;
    pnl_Operacao: TUniPanel;
    UniLabel11: TUniLabel;
    E_VL_Total: TUniFormattedNumberEdit;
    E_VL_Doc: TUniLabel;
    E_Nr_Parcelas: TUniNumberEdit;
    Sb_Parcel: TUniButton;
    Sb_Pay_Now: TUniButton;
    chbx_Entrada: TUniCheckBox;
    DSP_payment: TDataSetProvider;
    cds_Payment: TClientDataSet;
    cds_Paymentid: TIntegerField;
    cds_Paymentdescription: TStringField;
    ds_Payment: TDataSource;
    cds_financialdescPayment: TStringField;
    cds_financialparcel: TIntegerField;
    cds_financialterminal: TIntegerField;
    procedure Sb_ParcelClick(Sender: TObject);
    procedure Sb_Pay_NowClick(Sender: TObject);
    procedure dbg_InstalmentSetCellValue(Sender: TObject; ACol, ARow: Integer;
      AField: TField; var Value: Variant);
    procedure cds_financialAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    function getParcelFromStr(PrzStr:String):Integer;



  public
    { Public declarations }
    Order : Integer;
    TErminal : Integer;
    DtEmissao:TDate;
    ValorNota:Real;
    Parcela: Integer;
    PrazoStr:String;
    procedure showDataInstalment;
    procedure listarPayment;
    procedure execInstalment;
    procedure Totalizer;
    procedure execNow;
    procedure DeletedFinacial;
  end;

var
  FmFinancial: TFmFinancial;

implementation

uses
  System.AnsiStrings, MainModule;

{$R *.dfm}


function TFmFinancial.getParcelFromStr(PrzStr: String): Integer;
Var
  I : Integer;
  LcNrParcel : Integer;
  nPosicao : Integer;
  nContador : Integer;
begin
  Result := 0;
  if (Trim(PrzStr) <> '') then
  Begin
    nPosicao := 0;
    nContador := 1;
    LcNrParcel := 0;
    While nContador < Length(PrzStr) do
    begin
      nPosicao := PosEx('/',PrzStr,nContador);
      if nPosicao > 0  then
      begin
        inc(LcNrParcel);
        nContador := nPosicao;
      end;
      Inc(nContador);
    end;
    Result := LcNrParcel + 1;
  End
end;

procedure TFmFinancial.listarPayment;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              ' Select distinct pt.id, pt.description ',
              ' from tb_payment_types pt ',
              ' inner join tb_institution_has_payment_types i ',
              ' on (pt.id = i.tb_payment_types_id) ',
              ' where i.tb_institution_id =:tb_institution_id ',
              ' order by pt.description '
            ));
    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    Active := True;
    FetchAll;
  End;
  cds_Payment.Active := True;
  TIntegerField(cds_Payment.FieldByName('id')).DisplayFormat := '000';
end;

procedure TFmFinancial.Sb_ParcelClick(Sender: TObject);
begin
  Parcela := StrToIntDef( E_Nr_Parcelas.Text,0);
  PrazoStr := '';
  execInstalment;
  Totalizer;
end;

procedure TFmFinancial.Sb_Pay_NowClick(Sender: TObject);
begin
  execNow;
  Totalizer;
end;

procedure TFmFinancial.showDataInstalment;
Var
  I : Integer;
  Registro : TFinancial;
  LcFin : TControllerFinancial;
begin
  LcFin := TControllerFinancial.create(Self);
  LcFin.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  LcFin.Registro.Ordem := Self.Order;
  LcFin.Registro.Terminal := Self.TErminal;
  LcFin.getList;

  with cds_financial  do
  Begin
    if not Active then CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to LcFin.Lista.Count - 1 do
    Begin
      Registro := LcFin.Lista[I];
      Append;
      FieldByName('parcel').AsInteger               := Registro.Parcela;
      FieldByName('dt_expiration').AsDateTime       := Registro.DataExpiracao;
      FieldByName('tb_payment_types_id').AsInteger  := Registro.TipoPagamento;
      FieldByName('tag_value').AsFloat              := Registro.Valor;

      //dados dos Produtos
      LcFin.PaymentType.Registro.Codigo := Registro.TipoPagamento;
      LcFin.PaymentType.getbyKey;
      FieldByName('descPayment').AsString           := LcFin.PaymentType.Registro.Descricao;
      Post;
    End;
    LogChanges := True;
  End;
end;

procedure TFmFinancial.cds_financialAfterPost(DataSet: TDataSet);
begin
  totalizer;
end;

procedure TFmFinancial.dbg_InstalmentSetCellValue(Sender: TObject; ACol,
  ARow: Integer; AField: TField; var Value: Variant);
Var
  LcIn_aux:Integer;
  LcVl_aux : Real;
begin
  if Acol = 2 then
  BEgin
    //Codigo do Estoque ela DBlooxUp
    if (Length(value) > 0) then
    Begin
      LcIn_aux := pos(' ',Value) - 1;
      cds_financial.Edit;
      cds_financialtb_payment_types_id .AsString := Copy(Value,1,LcIn_aux);
      //LcIn_aux := LcIn_aux + 2;
      //cds_cfopintCfop.AsString := Copy(Value,LcIn_aux,(Length(Value) -LcIn_aux));
      cds_financialdescPayment.AsString := Copy(Value,1,100);
      cds_financial.Post;
    End;
  End;
end;

procedure TFmFinancial.DeletedFinacial;
begin

end;

procedure TFmFinancial.execInstalment;
Var
  I : Integer;
  LcData : TDate;
  Lc_St_Parcela : string;
  Lc_Vl_Parcela : Real;
  nContador : Integer;
  LcPrazo : Array of TDate;
  LcNrParcel : integer;
  Lc_Dias : Integer;
  IniCopy : Integer;
  fimCopy : Integer;
begin
  if (Trim(PrazoStr) <> '') then
  Begin
    LcNrParcel := getParcelFromStr(PrazoStr);
    SetLength(LcPrazo, LcNrParcel);
    nContador := 1;
    IniCopy := 1;
    FimCopy := 0;
    I := 0;
    While nContador < Length(PrazoStr) do
    begin
      FimCopy := (PosEx('/',PrazoStr,nContador) -1 );
      if FimCopy > 0  then
      begin
        Lc_Dias :=  StrtoIntDef( Copy(PrazoStr, IniCopy,fimCopy),0);
        LcPrazo[I] := DtEmissao + Lc_Dias;
        IniCopy := IniCopy + FimCopy +1;
        nContador := nContador + FimCopy;
        INC(I);
      end;
    end;
  End
  else
  Begin
    SetLength(LcPrazo, Parcela);
    LcNrParcel := Parcela;
    LcData := DtEmissao;
    for I := 0 to LcNrParcel - 1 do
    Begin
      if I = 0 then
      Begin
        if not chbx_Entrada.Checked then
          LcData := LcData + (30 * I);
      End
      else
      Begin
        LcData := LcData + 30;
      End;
      LcPrazo[I] := LcData;
    End;
  End;

  if not cds_financial.Active then cds_financial.CreateDataSet;
  cds_financial.EmptyDataSet;
  //Resolvemos o problema da Divisão e dizima periodica
  Lc_St_Parcela := FloatToStrF((ValorNota / LcNrParcel),ffFixed,10,2);
  Lc_Vl_Parcela := StrToFloatDef(Lc_St_Parcela,0);

  for I := 1 to LcNrParcel do
  Begin
    cds_financial.Append;
    cds_financialdt_expiration.AsDateTime  := LcPrazo[I - 1];
    cds_financialtb_payment_types_id.AsInteger  := 0;
    if not (I = LcNrParcel) then
      cds_financialtag_value.AsFloat := StrToFloatDef(Lc_St_Parcela,0)
    else
      cds_financialtag_value.AsFloat := ValorNota -(Lc_Vl_Parcela * (LcNrParcel-1));
    cds_financial.Post;
  End;
end;

procedure TFmFinancial.execNow;
begin
  if not cds_financial.Active then cds_financial.CreateDataSet;
  cds_financial.EmptyDataSet;
  cds_financial.Append;
  cds_financialdt_expiration.AsDateTime  := DtEmissao;
  cds_financialtb_payment_types_id.AsInteger  := 0;
  cds_financialtag_value.AsFloat := ValorNota;
  cds_financial.Post;
end;

procedure TFmFinancial.Totalizer;
Var
  Valor : Real;
begin
  if not cds_financial.Active then cds_financial.CreateDataSet;
  cds_financial.First;
  Valor := 0;
  while not cds_financial.Eof do
  Begin
    Valor := Valor + cds_financialtag_value.AsFloat;
    cds_financial.Next;
  End;
  E_VL_Total.Value := Valor;
end;

end.
