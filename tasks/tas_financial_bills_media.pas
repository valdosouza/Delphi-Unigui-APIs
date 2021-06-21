unit tas_financial_bills_media;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_financial_bills, Data.DB,
  Datasnap.Provider, Vcl.Menus, uniMainMenu, Datasnap.DBClient, uniButton,
  uniBasicGrid, uniDBGrid, uniPageControl, uniBitBtn, uniSpeedButton, uniPanel,
  uniMultiItem, uniComboBox, uniGUIClasses, uniEdit, uniLabel,unFunctions,
  uniDateTimePicker, uniCheckBox, uniGUIBaseClasses, uniGroupBox, uniRadioGroup,
  fm_broadcaster, fm_advertiser, fm_agency, openForms, cad_financial_edit,unmessages,
  ControllerInvoice, prm_print_financial_media,REST.Json,ControllerMedPriceListJr;

type
  TTasFinancialBillsMedia = class(TTasFinancialBills)
    Ctn_advertiser: TUniContainerPanel;
    Ctn_broadcaster: TUniContainerPanel;
    Rg_situacao_documento: TUniRadioGroup;
    cds_searchid: TIntegerField;
    cds_searchnr_original: TStringField;
    cds_searchdt_original: TDateField;
    cds_searchdt_expiration: TDateField;
    cds_searchnr_internal: TIntegerField;
    cds_searchowner_value: TBCDField;
    cds_searchdt_internal: TDateField;
    cds_searchveiculo: TStringField;
    cds_searchanunciante: TStringField;
    cds_searchduplicata: TStringField;
    cds_searchpaid_value: TBCDField;
    cds_searchdt_payment: TDateField;
    cds_searchtag_value: TBCDField;
    cds_searchnumber: TStringField;
    cds_searchparcel: TIntegerField;
    Sb_reverse: TUniSpeedButton;
    Sb_Print: TUniSpeedButton;
    Sb_settled: TUniSpeedButton;
    UniPanel1: TUniPanel;
    Ctn_agency: TUniContainerPanel;
    procedure SB_ChangeClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
    procedure Sb_settledClick(Sender: TObject);
    procedure Sb_reverseClick(Sender: TObject);
    procedure dbg_SearchCellClick(Column: TUniDBGridColumn);
    procedure dbg_SearchSelectionChange(Sender: TObject);
    procedure Sb_PrintClick(Sender: TObject);
    procedure DTP_Date_InitialExit(Sender: TObject);
    procedure DTP_Date_EndExit(Sender: TObject);
    procedure Rg_tipo_dataClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowAgency;
    procedure setParameterAgency;
    procedure ShowBroadcaster;
    procedure setParameterBroadcaster;
    procedure ShowAdvertiser;
    procedure setParameterAdvertiser;
    function ValidateSelected:Boolean;
    Function ValidateBaixa:Boolean;
    procedure Baixar;
    Function ValidateEstorno:Boolean;
    procedure Estornar;
    function getParameter:TPrmPrintFinancialMedia;
    procedure printFinancialMediaToReceiveOpen;
    procedure printFinancialMediaToReceiveClosed;
    procedure printFinancialMediaToReceiveAll;
  protected
    procedure setImages;override;
    procedure InitialVariable;
    procedure search;Override;
    procedure ShowList;
    procedure FormatScreen;override;
    procedure somatotal;
    procedure somaSelecionado;
    procedure SetVariable;override;
  public
    FrBroadcaster : TFmBroadcaster;
    FrAdvertiser : TFmAdvertiser;
    FrAgency : TfmAgency;

    { Public declarations }
  end;

var
  TasFinancialBillsMedia: TTasFinancialBillsMedia;

implementation

{$R *.dfm}

uses MainModule, cad_financial_baixa, msg_form, uReportCM, openReports;

{ TTasFinancialBills1 }

procedure TTasFinancialBillsMedia.Baixar;
Var
  Form :TCadFinancialBaixa;
  i,J : Integer;
  DataSet : TDataSet;
begin
  if Form = nil then
    Form := TCadFinancialBaixa.Create(UniApplication);
  try
    Form.cds_Baixa.Close;
    if not Form.cds_Baixa.Active then Form.cds_Baixa.CreateDataSet;
    Form.cds_Baixa.EmptyDataSet;
    DataSet := dbg_valores.DataSource.DataSet;
    DataSet.DisableControls;
    with DataSet do
    for i:=0 to dbg_valores.SelectedRows.Count-1 do
    begin
      GotoBookmark(dbg_valores.SelectedRows.Items[i]);
      Form.cds_Baixa.Append;
      Form.cds_Baixa.FieldByName('id').AsInteger      := DataSet.FieldByName('id').AsInteger;
      Form.cds_Baixa.FieldByName('parcel').AsInteger  := DataSet.FieldByName('parcel').AsInteger;
      Form.cds_Baixa.FieldByName('tag_value').AsFloat := DataSet.FieldByName('tag_value').AsFloat;
      Form.cds_Baixa.Post;
    end;
  finally
    DataSet.EnableControls;
    Form.Show(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        Form := nil;
        self.ShowList;
      end
     );
  end;
end;

procedure TTasFinancialBillsMedia.dbg_SearchCellClick(Column: TUniDBGridColumn);
begin
//  somaSelecionado;
end;

procedure TTasFinancialBillsMedia.dbg_SearchSelectionChange(Sender: TObject);
begin
  inherited;
  somaSelecionado
end;

procedure TTasFinancialBillsMedia.DTP_Date_EndExit(Sender: TObject);
begin
  inherited;
  setParameterAdvertiser;
  setParameterBroadcaster;
  setParameterAgency;
end;

procedure TTasFinancialBillsMedia.DTP_Date_InitialExit(Sender: TObject);
begin
  inherited;
  setParameterAdvertiser;
  setParameterBroadcaster;
  setParameterAgency;
end;

procedure TTasFinancialBillsMedia.Estornar;
Var
  i,J : Integer;
  DataSet : TDataSet;
  NotaFiscal : TControllerInvoice;
begin
  try
    NotaFiscal := TControllerinvoice.Create(self);
    DataSet := dbg_valores.DataSource.DataSet;
    DataSet.DisableControls;
    with DataSet do
    for i:=0 to dbg_valores.SelectedRows.Count-1 do
    begin
      GotoBookmark(dbg_valores.SelectedRows.Items[i]);
      //Atualiza dados da nota
      NotaFiscal.Registro.Codigo            := DataSet.FieldByName('id').AsInteger;
      NotaFiscal.Registro.Estabelecimento   := UMM.GInstitution.registro.Codigo;
      NotaFiscal.Registro.Terminal          := 0;
      NotaFiscal.getByKey;
      NotaFiscal.Registro.Numero            := '';
      NotaFiscal.update;
      //Exclui o pagamento
      NotaFiscal.Financeiro.Payment.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      NotaFiscal.Financeiro.Payment.Registro.Ordem           := DataSet.FieldByName('id').AsInteger;
      NotaFiscal.Financeiro.Payment.Registro.Terminal        := 0;
      NotaFiscal.Financeiro.Payment.Registro.Parcela         := DataSet.FieldByName('parcel').AsInteger;
      NotaFiscal.Financeiro.Payment.delete;
    end;
  finally
    DataSet.EnableControls;
    FreeandNil(NotaFiscal);
  end;
end;

procedure TTasFinancialBillsMedia.FormatScreen;
begin
  inherited;
  ShowBroadcaster;
  ShowAdvertiser;
  ShowAgency;
  dbg_valores.Columns[4].Width := 114;
end;

function TTasFinancialBillsMedia.getParameter: TPrmPrintFinancialMedia;
begin
  Result := TPrmPrintFinancialMedia.Create;
  with Result do
  BEgin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Usuario := UMM.GInstitution.User.Registro.codigo;
    Resultado := false;
    Periodo := ChBx_Periodo.Checked;
    DataInicial := DTP_Date_Initial.DateTime;
    DataFinal   := DTP_Date_End.DateTime;
    if FrAdvertiser.DBLCB_Lista.Text <> '' then
      Anunciante  := FrAdvertiser.DBLCB_Lista.KeyValue;
    if FrBroadcaster.DBLCB_Lista.Text <> '' then
      Veiculo  := FrBroadcaster.DBLCB_Lista.KeyValue;
    if FrAgency.DBLCB_Lista.Text <> '' then
      AGencia  := FrAgency.DBLCB_Lista.KeyValue;

    case Rg_situacao_documento.ItemIndex of

      0:Situacao := 'A';
      1:Situacao := 'F';
      2:Situacao := 'T';
    end;
    Nota := StrToIntDef(E_Nr_Invoice.Text,0);
    case  Rg_tipo_data.ItemIndex of
      0:TipoData := 'DT_INTERNAL';
      1:TipoData := 'DT_EXPIRATION';
      2:TipoData := 'DT_PAYMENT';
    end;
    URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
  end;


end;

procedure TTasFinancialBillsMedia.InitialVariable;
begin

end;

procedure TTasFinancialBillsMedia.printFinancialMediaToReceiveOpen;
Var
  LcPar: TPrmPrintFinancialMedia;
  LcCM : TReportCM;
  LcJSon : string;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    UniSession.Synchronize;
    LcPar :=  getParameter;
    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMFinancialClient.GetFinancialMediaToReceiveOpen(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmPrintFinancialMedia>(LcJson);
    UniSession.Synchronize;
    if LcPar.Resultado then
    begin
      openReportViewer('Contas a Receber - Valores em Aberto',LcPar.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(LcCM);
  end;


end;

procedure TTasFinancialBillsMedia.Rg_tipo_dataClick(Sender: TObject);
begin
  inherited;
  setParameterAdvertiser;
  setParameterBroadcaster;
  setParameterAgency;
end;

procedure TTasFinancialBillsMedia.printFinancialMediaToReceiveClosed;
Var
  LcPar: TPrmPrintFinancialMedia;
  LcCM : TReportCM;
  LcJSon : string;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    UniSession.Synchronize;
    LcPar :=  getParameter;

    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMFinancialClient.GetFinancialMediaToReceiveClosed(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmPrintFinancialMedia>(LcJson);
    UniSession.Synchronize;
    if LcPar.Resultado then
    begin
      openReportViewer('Contas a Receber - Valores Baixados',LcPar.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(LcCM);
  end;
end;

procedure TTasFinancialBillsMedia.printFinancialMediaToReceiveAll;
Var
  LcPar: TPrmPrintFinancialMedia;
  LcCM : TReportCM;
  LcJSon : string;
begin
  try
    ShowMask('Aguarde Processamento do relatório...');
    UniSession.Synchronize;
    LcPar :=  getParameter;

    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(Self);
    LcJSon := LcCM.SMFinancialClient.GetFinancialMediaToReceiveall(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmPrintFinancialMedia>(LcJson);
    UniSession.Synchronize;
    if LcPar.Resultado then
    begin
      openReportViewer('Contas a Receber - Todos os Valores',LcPar.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Campo não informado.',
                      'Preencha o campo para continuar']);
    End;
  finally
    HideMask;
    FreeAndNil(LcCM);
  end;


end;

procedure TTasFinancialBillsMedia.SB_ChangeClick(Sender: TObject);
Var
  Form :TCadFinancialEdit;
begin
  if Form = nil then
    Form := TCadFinancialEdit.Create(UniApplication);
  Form.CodigoRegistro := cds_search.fieldByName('id').AsInteger;
  Form.NotaFiscal.Financeiro.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Form.NotaFiscal.Financeiro.Registro.Ordem    := cds_search.fieldByName('id').AsInteger;
  Form.NotaFiscal.Financeiro.Registro.Terminal := 0;
  Form.NotaFiscal.Financeiro.Registro.Parcela  := cds_search.fieldByName('parcel').AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TTasFinancialBillsMedia.Sb_PrintClick(Sender: TObject);
begin
  if validateGetView(cds_search) then
  BEgin
    case Rg_situacao_documento.ItemIndex of
      0:BEgin
          printFinancialMediaToReceiveOpen;
      End;
      1:BEgin
          printFinancialMediaToReceiveClosed;
      End;
      2:BEgin
         printFinancialMediaToReceiveAll;
      End;
    end;
  End;
end;

procedure TTasFinancialBillsMedia.Sb_reverseClick(Sender: TObject);
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Estornar a baixa das P.I.(s) relacionadas acima.',
                'Confirma o Estorno.'],mpConfirmacao);
  FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        if ValidateEstorno then
        Begin
          Estornar;
          MensageAlert(['A T E N Ç Ã O!.',
                        '',
                        'Estorno efetuadas com sucesso.',
                        'Clique em OK para continuar']);
          ShowList;
        End;
      end
    end
  );
end;

procedure TTasFinancialBillsMedia.Sb_SearchClick(Sender: TObject);
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    ShowList;
  finally
    self.HideMask;
  end;
end;

procedure TTasFinancialBillsMedia.Sb_settledClick(Sender: TObject);
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Baixar as P.I.(s) relacionadas acima.',
                'Confirma a Baixa.'],mpConfirmacao);
  FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        if ValidateBaixa then
          Baixar;
      end
    end
  );
end;

procedure TTasFinancialBillsMedia.search;
begin
  with UMM.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'SELECT orp.id, nr_original, dt_original, orp.dt_expiration, nr_internal, owner_value, ',
              'dt_internal, brd.nick_trade veiculo, adv.nick_trade anunciante,fnb.number duplicata, ',
              'fnp.paid_value,fnp.dt_payment, fn.tag_value,inv.number, fn.parcel ',
              'FROM tb_order_pi orp ',

              '  inner join tb_invoice inv ',
              '  on (inv.id = orp.id) ',
              '     and (inv.tb_institution_id = orp.tb_institution_id) ',

              '  INNER JOIN tb_entity brd ',
              '  ON (brd.id = orp.tb_broadcaster_id) ',

              '  INNER JOIN tb_entity adv ',
              '  ON (adv.id = orp.tb_advertiser_id) ',

              '  INNER JOIN  tb_financial  fn ',
              '  ON (orp.id = fn.tb_order_id) ',
              '      and (orp.tb_institution_id = fn.tb_institution_id) ',

              '  INNER JOIN  tb_financial_bills  fnb ',
              '  ON (fn.tb_order_id = fnb.tb_order_id) ',
              '      and (fn.tb_institution_id = fnb.tb_institution_id) ',
              '      and (fn.terminal = fnb.terminal) ',

              '  left outer join tb_financial_payment fnp ',
              '  ON (fnb.tb_order_id = fnp.tb_order_id) ',
              '      and (fnb.tb_institution_id = fnp.tb_institution_id) ',
              '      and (fnb.terminal = fnp.terminal) ',

              'WHERE (orp.tb_institution_id =:institution_id) '
    ));

    sql.Add(' and (fnb.kind =:fnb_kind) ');

    if ChBx_Periodo.Checked then
    Begin
      case Rg_tipo_data.ItemIndex of
        0:sql.Add(' AND ( orp.dt_internal between :dataini and :datafim ) ');
        1:sql.Add(' AND ( orp.dt_expiration between :dataini and :datafim ) ');
        2:sql.Add(' AND ( fnp.dt_payment between :dataini and :datafim ) ');

      end;
    End;

    if ( Trim(E_Nr_Ordem.Text) <> '' ) then
      sql.Add(' AND ( ( nr_original =:nr_pi ) or ( nr_internal =:nr_pi ) ) ');


    if ( Trim(E_Nr_Invoice.Text) <> '' ) then
      sql.Add(' AND ( inv.number = :inv_number ) ');

    case Rg_situacao_documento.ItemIndex of
      0:Begin
          sql.Add(' and (fnp.dt_payment is null) ');
        End;
      1:Begin
          sql.Add(' and (fnp.dt_payment is not null) ');
        End;
    end;

    if ( Trim(FrAdvertiser.DBLCB_Lista.Text) <> '' ) then
      sql.Add(' AND ( tb_advertiser_id =:advertiser_id ) ');

    if ( Trim(FrBroadcaster.DBLCB_Lista.Text) <> '' ) then
      sql.Add(' AND ( tb_broadcaster_id =:broadcaster_id ) ');

    if ( Trim(FrAgency.DBLCB_Lista.Text) <> '' ) then
      sql.Add(' AND ( tb_agency_id =:agency_id ) ');

    //Passagem de PArametros
    ParamByName('fnb_kind').AsString := 'RA';

    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    if ChBx_Periodo.Checked then
    Begin
      ParamByName('dataini').AsString := ConverteData( DTP_Date_Initial.DateTime );
      ParamByName('datafim').AsString := ConverteData( DTP_Date_End.DateTime );
    End;

    if ( Trim(E_Nr_Ordem.Text) <> '' ) then
      ParamByName('nr_pi').AsString := E_Nr_Ordem.Text;

    if ( Trim(E_Nr_Invoice.Text) <> '' ) then
      ParamByName('inv_number').AsString := E_Nr_Invoice.Text;

    if ( Trim(FrAdvertiser.DBLCB_Lista.Text) <> '' ) then
      ParamByName('advertiser_id').AsInteger := FrAdvertiser.DBLCB_Lista.KeyVAlue;

    if ( Trim(FrBroadcaster.DBLCB_Lista.Text) <> '' ) then
      ParamByName('broadcaster_id').AsInteger := FrBroadcaster.DBLCB_Lista.KeyValue;

    if ( Trim(FrAgency.DBLCB_Lista.Text) <> '' ) then
      ParamByName('agency_id').AsInteger := FrAgency.DBLCB_Lista.KeyValue;

    Active := True;
  End;
end;

procedure TTasFinancialBillsMedia.setImages;
begin
  inherited;
  buttonIcon(Sb_Print,'print.bmp');
  buttonIcon(Sb_reverse,'abort.bmp');
  buttonIcon(Sb_settled,'confirm.bmp');
end;

procedure TTasFinancialBillsMedia.setParameterAdvertiser;
begin
  FrAdvertiser.Periodo := ChBx_Periodo.Checked;
  FrAdvertiser.DataInicio := DTP_Date_Initial.DateTime;
  FrAdvertiser.DataFim := DTP_Date_End.DateTime;
  FrAdvertiser.TipoData := Rg_tipo_data.ItemIndex;
  FrAdvertiser.listarSobMovimento;
end;

procedure TTasFinancialBillsMedia.setParameterAgency;
begin
  FrAgency.Periodo := ChBx_Periodo.Checked;
  FrAgency.DataInicio := DTP_Date_Initial.DateTime;
  FrAgency.DataFim := DTP_Date_End.DateTime;
  FrAgency.TipoData := Rg_tipo_data.ItemIndex;
  FrAgency.listarSobMovimento;
end;

procedure TTasFinancialBillsMedia.setParameterBroadcaster;
begin
  FrBroadcaster.Periodo := ChBx_Periodo.Checked;
  FrBroadcaster.DataInicio := DTP_Date_Initial.DateTime;
  FrBroadcaster.DataFim := DTP_Date_End.DateTime;
  FrBroadcaster.TipoData := Rg_tipo_data.ItemIndex;
  FrBroadcaster.listarSobMovimento;

end;

procedure TTasFinancialBillsMedia.SetVariable;
begin
  inherited;
  setParameterAdvertiser;
  setParameterBroadcaster;
  setParameterAgency;
end;

procedure TTasFinancialBillsMedia.ShowAdvertiser;
begin
  FrAdvertiser := TfmAdvertiser.Create(Self);
  FrAdvertiser.Parent := Ctn_Advertiser;
  FrAdvertiser.Align := alClient;
  FrAdvertiser.Show;

end;

procedure TTasFinancialBillsMedia.ShowAgency;
begin
  FrAgency := TfmAgency.Create(Ctn_Agency);
  FrAgency.Parent := Ctn_Agency;
  FrAgency.Align := alClient;
  FrAgency.Show;
end;

procedure TTasFinancialBillsMedia.ShowBroadcaster;
begin
  FrBroadcaster := TfmBroadcaster.Create(Self);
  FrBroadcaster.Parent := Ctn_Broadcaster;
  FrBroadcaster.Align := alClient;
  FrBroadcaster.Show;
end;

procedure TTasFinancialBillsMedia.ShowList;
Var
  I : Integer;
begin
  cds_search.Active := False;
  search;
  somatotal;
  cds_search.Active := True;
end;

procedure TTasFinancialBillsMedia.somaSelecionado;
var
  i : Integer;
  DataSet : TDataSet;
  LcValor : Real;
begin
  Try
    LcValor := 0;
    if dbg_valores.SelectedRows.Count>0 then
    begin
      DataSet := dbg_valores.DataSource.DataSet;
      try
        DataSet.DisableControls;
        with DataSet do
        for i:=0 to dbg_valores.SelectedRows.Count-1 do
        begin
          GotoBookmark(dbg_valores.SelectedRows.Items[i]);
          LcValor := LcValor + DataSet.FieldByName('tag_value').AsFloat;
        end;
      finally
        DataSet.EnableControls;
      end;
    end;
  Finally
    E_VL_Selecionado.Caption := FloatToStrF(LcValor,ffNumber,10,2);
  End;
end;

procedure TTasFinancialBillsMedia.somatotal;
var
  i : Integer;
  LcValor : Real;
begin
  LcValor := 0;
  try
    UMM.Qr_Crud.DisableControls;
    UMM.Qr_Crud.First;
    while not UMM.Qr_Crud.Eof do
    begin
      LcValor := LcValor + UMM.Qr_Crud.FieldByName('tag_value').AsFloat;
      UMM.Qr_Crud.Next;
    end;
  finally
    UMM.Qr_Crud.EnableControls;
    E_VL_Total.Caption := FloatToStrF(LcValor,ffNumber,10,2);
  end;
end;

function TTasFinancialBillsMedia.ValidateSelected: Boolean;
begin
  if dbg_valores.SelectedRows.Count=0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registro selecionado.',
                  'Escolha algun item para continuar']);
    Result := False;
    exit;
  End;

end;

function TTasFinancialBillsMedia.ValidateBaixa: Boolean;
var
  i : Integer;
  DataSet : TDataSet;
begin
  REsult := True;
  if not validaExisteRegistro then
  Begin
    Result := False;
    exit;
  End;

  if not ValidateSelected then
  Begin
    Result := False;
    exit;
  End;

  DataSet := dbg_valores.DataSource.DataSet;
  try
    DataSet.DisableControls;
    with DataSet do
    for i:=0 to dbg_valores.SelectedRows.Count-1 do
    begin
      GotoBookmark(dbg_valores.SelectedRows.Items[i]);
      if DataSet.FieldByName('dt_payment').AsString <> '' then
      Begin
        MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Existem regitros já baixados.',
                    'Retire-os da lista para continuar']);
        Result := False;
        Break;
      End;        
    end;
  finally
    DataSet.EnableControls;
  end;
end;

function TTasFinancialBillsMedia.ValidateEstorno: Boolean;
Var
  DataSet : TDataSet;
  I : Integer;
begin
  REsult := True;
  if not validaExisteRegistro then
  Begin
    Result := False;
    exit;
  End;

  if not ValidateSelected then
  Begin
    Result := False;
    exit;
  End;

  DataSet := dbg_valores.DataSource.DataSet;
  try
    DataSet.DisableControls;
    with DataSet do
    for i:=0 to dbg_valores.SelectedRows.Count-1 do
    begin
      GotoBookmark(dbg_valores.SelectedRows.Items[i]);
      if DataSet.FieldByName('dt_payment').AsString = '' then
      Begin
        MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Existem regitros que não foram baixados.',
                    'Retire-os da lista para continuar']);
        Result := False;
        Break;
      End;        
    end;
  finally
    DataSet.EnableControls;
  end;  
end;

end.
