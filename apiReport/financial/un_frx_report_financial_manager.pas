unit un_frx_report_financial_manager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_frx_base_report_list,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, frxClass,  frxExportCSV, frxExportPDF,
  frxDBSet, prm_print_financial, Datasnap.DBClient;

type
  TFrxReportFinancialManager = class(TFrxBaseReportList)
    cds_qry: TClientDataSet;
    cds_qryposit_level: TStringField;
    cds_qrydescription: TStringField;
    cds_qrysource_: TStringField;
    cds_qrycluster: TStringField;
    cds_qryvl_credit: TFloatField;
    cds_qryvl_debit: TFloatField;
    cds_qrytotal_value: TFloatField;
    Qr_Real: TFDQuery;
  private
    { Private declarations }
    function ValorContaRealizada(Fc_Tipo,Fc_Plano,Fc_Campo:String):Real;
  protected
    procedure InitVariable; Override;
    procedure SetVariable; Override;
    procedure setImages; Override;
    procedure ClearFields; Override;
    // Operações com Sql
    procedure SelectSql; Override;
    procedure FromSql; Override;
    procedure InnerJoinSql; Override;
    procedure WhereSql; Override;
    procedure OrderBySql; Override;
    procedure GroupBySql; Override;
    procedure SetParameters; Override;
    procedure feedCsdClient;
  public
    { Public declarations }
    Par : TPrmPrintFinancial;
    Path:String;
    procedure execute;Override;
  end;

var
  FrxReportFinancialManager: TFrxReportFinancialManager;

implementation

{$R *.dfm}

uses UnitConstantes;
{ TFrxReportFinancialManager }

procedure TFrxReportFinancialManager.ClearFields;
begin
  inherited;

end;

procedure TFrxReportFinancialManager.execute;
Var
  LcExport : TfrxCustomExportFilter;
begin
  inherited;
  feedCsdClient;
  LcExport := TfrxCustomExportFilter(frxPDF);
  LcExport.ShowDialog := False;
  LcExport.FileName := Path;
  frxBase.PrepareReport(True);
  frxBase.Export( LcExport );
end;

procedure TFrxReportFinancialManager.feedCsdClient;
Var
  Lc_Form : TForm;
  Lc_Linha : Integer;
  Lc_Qry_Det : TFDQuery;
  Lc_Vl_Credito,Lc_Vl_Debito : REAL;
  excel: variant;
  lin,col : integer;
  Lc_Aux : String;
//  Lc_Fechamento : TControllerFechaFinanceiro;
  Lc_SaldoAnterior : Real;
begin
  //Pc_DefineDataAnteriror;
  //Lc_Fechamento := TControllerFechaFinanceiro.Create(self);
  cds_qry.CreateDataSet;
  with Qry do
  Begin
    First;
    Lc_Linha := 0;
    while not eof do
    Begin
      inc(Lc_Linha);
      if (FieldByName('kind').AsString = 'R') then
      Begin
        //Esse comando já existia antes do fechamento
        Lc_Vl_Credito := 0;
        //Cololoca o saldo anterior às contas de resultado
        {
        if not ChBx_MovimentoMensal.Checked then
          Lc_SaldoAnterior := 0
        else
          Lc_SaldoAnterior := Lc_Fechamento.getSaldoAnterior(FieldByName('PLC_CODIGO').AsInteger,E_Data_Ini.Date);
        Cells[8,Lc_Linha] := FloatToStrF(Lc_SaldoAnterior,ffNumber,10,2);
        }
        Lc_SaldoAnterior := 0
      End;

      //Credito
      Lc_Vl_Credito := ValorContaRealizada(FieldByName('kind').AsAnsiString,
                                           FieldByName('posit_level').AsAnsiString,
                                           'credit_value');
      //Debito
      Lc_Vl_Debito := ValorContaRealizada(FieldByName('kind').AsAnsiString,
                                          FieldByName('posit_level').AsAnsiString,
                                          'debit_value');
      cds_qry.Append;
      cds_qryposit_level.AsString := FieldByName('posit_level').AsString;
      cds_qrydescription.AsString := FieldByName('description').AsString;
      cds_qrysource_.AsString     := FieldByName('source_').AsString;
      cds_qrycluster.AsString     := FieldByName('cluster').AsString;
      cds_qryvl_credit.AsFloat    := Lc_Vl_Credito;
      cds_qryvl_debit.AsFloat     := Lc_Vl_Debito;
      cds_qrytotal_value.AsFloat  := Lc_Vl_Credito -  Lc_Vl_Debito;
      cds_qry.Post;
      {
      if (Qr_Contas.FieldByName('PLC_NIVEL').AsAnsiString = 'A') AND (Rg_Tipo.ItemIndex = 2) then
      Begin
        Lc_Qry_Det := Fc_DetalhePLC_CaixaBanco(FieldByName('PLC_CODPLANO').AsAnsiString,
                                               FieldByName('PLC_TIPO').AsAnsiString,
                                               E_Data_Ini.Date,
                                               E_Data_Fim.Date);
        Lc_Qry_Det.FetchAll;
        while not Lc_Qry_Det.Eof do
        Begin
          inc(Lc_Linha);
          Lc_Grid.RowCount := Lc_Linha;
          Cells[1,Lc_Linha] := '';
          if (Lc_Qry_Det.Fieldbyname('MVF_CODCTB').AsInteger = 0) then
            Lc_Aux := '( C ) '
          else
            Lc_Aux := '( B ) ';

          Cells[2,Lc_Linha] := Lc_Aux + Lc_Qry_Det.Fieldbyname('MVF_HISTORISCO').AsAnsiString;
          Lc_Vl_Credito := Lc_Qry_Det.Fieldbyname('MVF_VL_CREDITO').AsFloat;
          Lc_Vl_Debito  := Lc_Qry_Det.Fieldbyname('MVF_VL_DEBITO').AsFloat;
          Cells[3,Lc_Linha] := FloatToStrF(Lc_Vl_Credito,ffFixed,10,2);
          Cells[4,Lc_Linha] := FloatToStrF(Lc_Vl_Debito,ffFixed,10,2);
          Cells[5,Lc_Linha] := FloatToStrF(Lc_Vl_Credito -  Lc_Vl_Debito,ffFixed,10,2);
          Lc_Qry_Det.Next;
        end;
      end;
      }
      next;
    end;
  end;
  //FreeAndNil(Lc_Fechamento);
  cds_qry.First;
end;

procedure TFrxReportFinancialManager.FromSql;
begin
  FromTxt := 'from tb_financial_plans pl ';
end;

procedure TFrxReportFinancialManager.GroupBySql;
begin
  GroupByTxt        := '';
  UnionGroupByTxt   := '';
  Union2GroupByTxt  := '';
end;

procedure TFrxReportFinancialManager.InitVariable;
begin
  inherited;
  Par := TPrmPrintFinancial.Create;
end;

procedure TFrxReportFinancialManager.InnerJoinSql;
begin
  InnerJoinTxt := '';
  UnionInnerJoinTxt := '';
  Union2InnerJoinTxt := '';
end;

procedure TFrxReportFinancialManager.OrderBySql;
begin
  OrderByTxt := ' order by posit_level ';
end;

procedure TFrxReportFinancialManager.SelectSql;
begin
  SelectTxt :=
    ' select pl.id,pl.posit_level, pl.description, pl.source_, cluster, kind ';
end;

procedure TFrxReportFinancialManager.setImages;
begin
  inherited;

end;

procedure TFrxReportFinancialManager.SetParameters;
begin
  with Qry do
  Begin
    ParamByName('institution_id').AsInteger := Par.Estabelecimento;
  End;
end;

procedure TFrxReportFinancialManager.SetVariable;
begin
  inherited;
  Qry.Active := True;
end;



function TFrxReportFinancialManager.ValorContaRealizada(Fc_Tipo, Fc_Plano,Fc_Campo: String): Real;
begin
  with Qr_Real do
  Begin
    Active := False;
    SQL.Clear;
    if ( Fc_Tipo = 'R' ) then
    Begin
      SQL.Add('SELECT SUM(' + Fc_Campo + ') PLC_VALOR '+
              'FROM tb_financial_statement fs '+
              '   INNER JOIN tb_financial_plans pl '+
              '   ON  (pl.id = fs.tb_financial_plans_id_cre)   and (pl.tb_institution_id = fs.tb_institution_id)  ');
    End
    else
    Begin
      SQL.Add('SELECT SUM(' + Fc_Campo + ') PLC_VALOR '+
              'FROM tb_financial_statement fs '+
              '   INNER JOIN tb_financial_plans pl '+
              '   ON  (pl.id = fs.tb_financial_plans_id_deb)  and (pl.tb_institution_id = fs.tb_institution_id)  ');
    End;

    SQL.Add('Where ( pl.posit_level like  :posit_level )');
    SQL.Add('  AND ( fs.tb_institution_id =:tb_institution_id ) ');
    if par.Periodo then
    Begin
      SQL.Add('  AND ( fs.dt_record BETWEEN :DATAINI AND :DATAFIM )');
    End;
    if par.Terminal > 0 then
    Begin
      SQL.Add('  AND ( fs.terminal = :terminal )');
    End;

    ParamByName('posit_level').AsAnsiString := Fc_Plano +'%';
    ParamByName('tb_institution_id').AsInteger := par.Estabelecimento;
    if par.Periodo then
    Begin
      ParamByName('DATAINI').AsDate := par.DataInicial;
      ParamByName('DATAFIM').AsDate := par.DataFinal;
    End;
    if par.Terminal > 0 then
    Begin
      ParamByName('terminal').AsInteger := par.Terminal;
    End;

    Active := True;
    Result := FieldByName('PLC_VALOR').AsFloat;
  end;
end;

procedure TFrxReportFinancialManager.WhereSql;
begin
  WhereTxt := concat(
                  'where ( pl.tb_institution_id = :institution_id ) '
  );
  UnionWhereTxt   := '';
  Union2WhereTxt  := ''
end;

end.
