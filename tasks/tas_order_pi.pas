unit tas_order_pi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniRadioGroup, uniMemo,
  uniBasicGrid, uniDBGrid, uniPanel, uniMultiItem, uniComboBox, uniGUIClasses,
  uniEdit, uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniDateTimePicker, fm_agency, fm_broadcaster, fm_advertiser,
  ControllerOrder, ControllerOrderPi, MainModule, msg_form, unmessages,
  uniPageControl, Data.DB, Datasnap.DBClient, Datasnap.Provider, tas_order_pi_jr,
  ControllerMedPartsJr, tblMedPartsJr, tas_order_pi_rt, UnFunctions, ControllerMedparts,
  prm_rep_order, uReportCM, REST.Json, openReports,ControllerInvoice,
  ControllerInstitution, ControllerEletronicInvoice;

type
  TTasOrderPi = class(TBaseRegistry)
    pnl_top: TUniPanel;
    E_nr_original: TUniEdit;
    E_nr_internal: TUniEdit;
    Cb_kind_media: TUniComboBox;
    Sb_Invoice: TUniSpeedButton;
    Sb_Print: TUniSpeedButton;
    Rg_kind_calculation: TUniRadioGroup;
    Dt_dt_original: TUniDateTimePicker;
    Dt_dt_internal: TUniDateTimePicker;
    Dt_dt_vencimento: TUniDateTimePicker;
    cds_parts_jr: TClientDataSet;
    ds_parts_jr: TDataSource;
    cds_Insertion: TClientDataSet;
    ds_Insertion: TDataSource;
    cds_parts_jrid: TIntegerField;
    cds_parts_jrtb_institution_id: TIntegerField;
    cds_parts_jrtb_order_id: TIntegerField;
    cds_parts_jrnr_column: TStringField;
    cds_parts_jrnr_height: TStringField;
    cds_parts_jrcolor: TStringField;
    cds_parts_jrday: TStringField;
    cds_parts_jrcreated_at: TDateTimeField;
    cds_parts_jrupdated_at: TDateTimeField;
    cds_parts_jrtittle: TStringField;
    cds_parts_jrtb_med_material_id: TIntegerField;
    cds_parts_jrtb_med_price_list_id: TIntegerField;
    cds_parts_jrinsertion: TIntegerField;
    cds_parts_jrnr_repetition: TIntegerField;
    cds_parts_jrtable_value: TBCDField;
    cds_parts_jrunit_value: TBCDField;
    cds_parts_jrtotal_value: TBCDField;
    cds_parts_jraliq_desc: TBCDField;
    cds_parts_jrmppId: TIntegerField;
    cds_parts_jrmppDescription: TStringField;
    cds_parts_jrmmId: TIntegerField;
    cds_parts_jrmmDescription: TStringField;
    cds_Insertionid: TIntegerField;
    cds_Insertiontb_med_parts_id: TIntegerField;
    cds_Insertiondt_insertion: TDateField;
    cds_Insertionweek_day: TStringField;
    cds_Insertionqt_insertion: TIntegerField;
    cds_Insertiontb_order_id: TIntegerField;
    cds_parts_rt: TClientDataSet;
    ds_part_rt: TDataSource;
    cds_parts_rtid: TIntegerField;
    cds_parts_rttb_institution_id: TIntegerField;
    cds_parts_rttb_order_id: TIntegerField;
    cds_parts_rttm_duration: TStringField;
    cds_parts_rttestimonial: TStringField;
    cds_parts_rtincrease_testemonial: TBCDField;
    cds_parts_rttittle: TStringField;
    cds_parts_rttb_med_material_id: TIntegerField;
    cds_parts_rttb_med_price_list_id: TIntegerField;
    cds_parts_rtinsertion: TIntegerField;
    cds_parts_rtnr_repetition: TIntegerField;
    cds_parts_rttable_value: TBCDField;
    cds_parts_rtunit_value: TBCDField;
    cds_parts_rttotal_value: TBCDField;
    cds_parts_rtaliq_desc: TBCDField;
    cds_parts_rtmppId: TIntegerField;
    cds_parts_rtmppDescription: TStringField;
    cds_parts_rtmmId: TIntegerField;
    cds_parts_rtmmDescription: TStringField;
    Pg_Principal: TUniPageControl;
    tab_jr: TUniTabSheet;
    dbg_Jr: TUniDBGrid;
    Sb_Insert_Parts_jr: TUniSpeedButton;
    Sb_Change_Parts_jr: TUniSpeedButton;
    Sb_Delet_Parts_jr: TUniSpeedButton;
    tab_rt: TUniTabSheet;
    dbg_rt: TUniDBGrid;
    Sb_Insert_Parts_rt: TUniSpeedButton;
    Sb_Change_Parts_rt: TUniSpeedButton;
    Sb_Delet_Parts_rt: TUniSpeedButton;
    UniTabSheet2: TUniTabSheet;
    UniPanel3: TUniPanel;
    UniLabel15: TUniLabel;
    UniDBGrid2: TUniDBGrid;
    UniLabel17: TUniLabel;
    M_extra_note: TUniMemo;
    pnl_totalizador: TUniPanel;
    tbs_operadores: TUniTabSheet;
    UniPanel5: TUniPanel;
    Ctn_Agency: TUniContainerPanel;
    Ctn_Advertiser: TUniContainerPanel;
    Ctn_Broadcaster: TUniContainerPanel;
    E_kickback_agency: TUniFormattedNumberEdit;
    E_kickback_owner: TUniFormattedNumberEdit;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    cds_Insertiontb_institution_id: TIntegerField;
    E_net_value: TUniFormattedNumberEdit;
    E_gross_value: TUniFormattedNumberEdit;
    E_owner_value: TUniFormattedNumberEdit;
    E_agency_value: TUniFormattedNumberEdit;
    M_Note: TUniMemo;
    E_Campanha: TUniEdit;
    E_Produto: TUniEdit;


    procedure Sb_Insert_Parts_jrClick(Sender: TObject);
    procedure Sb_Change_Parts_jrClick(Sender: TObject);
    procedure Sb_Delet_Parts_jrClick(Sender: TObject);
    procedure Sb_Insert_Parts_rtClick(Sender: TObject);
    procedure Sb_Change_Parts_rtClick(Sender: TObject);
    procedure Cb_kind_mediaChange(Sender: TObject);
    procedure Sb_Delet_Parts_rtClick(Sender: TObject);
    procedure Sb_PrintClick(Sender: TObject);
    procedure SB_InsertClick(Sender: TObject);
    procedure dbg_JrCellClick(Column: TUniDBGridColumn);
    procedure dbg_rtCellClick(Column: TUniDBGridColumn);
    procedure Rg_kind_calculationClick(Sender: TObject);
    procedure FillAgencyDataChange(Sender: TObject);
    procedure FillBroadCastDataChange(Sender: TObject);
    procedure GetHistoricAdvertiser(Sender: TObject);
  private
    { Private declarations }
    procedure ShowAgency;
    procedure ShowBroadcaster;
    procedure ShowAdvertiser;
    procedure OpenDeleteParts;

    procedure totalizer;
    function getGrossValue:Real;

  Protected
    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure setImages;Override;
    procedure FormatScreen;Override;
    procedure ClearAllFields;Override;

    procedure ShowData;Override;
    procedure ShowNoData;Override;

    procedure EditionControl;Override;

    function ValidaInsert():boolean;Override;
    procedure Insert;Override;

    function ValidateSave: boolean;Override;
    procedure Save;Override;

    procedure Delete;Override;

    procedure insertItemsjr(Id:Integer);
    procedure changeItemsjr(Id:Integer);
    procedure DeletedItemsJr(Id:Integer);
    procedure OpenDeletePartsJr;


    procedure insertItemsRt(Id:Integer);
    procedure DeletedItemsRt(Id:Integer);
    procedure changeItemsRt(Id:Integer);
    procedure OpenDeletePartsRt;

    procedure DeletedDate(Id:Integer);
    Procedure DeleteDate(PartsId:Integer);

    function hasOrderItems(cds_Items : TClientDataSet): Boolean;
    function validatePrintOrder:Boolean;
    procedure printOrder;
  public
    FrAgency : TFmAgency;
    FrBroadcaster : TFmBroadcaster;
    FrAdvertiser : TFmAdvertiser;
    Order : TControllerOrder;
    OrderPi : TControllerOrderPi;
    MedParts : TControllerMedParts;
    Institution : TControllerInstitution;
    Nota : TControllerInvoice;
    procedure ShowDataOrder;
    Procedure ShowDataListJr;
    Procedure ShowDataListRt;
    Procedure ShowDataInsertDate;
    Procedure FilterInsertDate(part_id:String);
    Procedure SaveOrder;
    Procedure SaveOrdeJr;
    procedure SaveOrderRt;
    Procedure SaveDate;
    Procedure SaveInvoice;
    Procedure Financial;

    procedure OpenInsertParts;
    procedure OpenChangeParts;
    procedure ChoicePart(Choice : integer);

    function  ValidateInsertParts: boolean;
    function  ValidateChangeParts: boolean;
    function  ValidateDeleteParts: boolean;

  end;

var
  TasOrderPi: TTasOrderPi;

implementation

{$R *.dfm}

uses
  openForms,
  ControllerMedInsertDate,
  tblMedInsertDate,
  ControllerMedPartsRt,
  tblMedPartsRt,
  Main,
  UnitConstantes,
  ClasseUtil
  , tblMedParts;


{ TTasOrderPi }

procedure TTasOrderPi.Cb_kind_mediaChange(Sender: TObject);
begin
  ChoicePart(Cb_kind_media.ItemIndex);
end;

procedure TTasOrderPi.changeItemsjr(Id:Integer);
var
  Form : TTasOrderPiJr;
begin
  if Form = nil then
    Form := TTasOrderPiJr.Create(UniApplication);
  Form.CodigoRegistro := self.cds_parts_jrid.AsInteger;
  Form.cds_Parts := self.cds_parts_jr;
  Form.cds_insertion  := self.cds_Insertion;
  Form.CodigoVeiculo := FrBroadcaster.DBLCB_Lista.KeyValue;
  if not Form.cds_insertion.Active then Form.cds_insertion.createDataset;
  Form.EditionState := 'E';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
      Self.totalizer;
    end
  );
  //Result := True;
End;

procedure TTasOrderPi.changeItemsRt(Id: Integer);
var
  Form : TTasOrderPiRt;
begin
  if Form = nil then
    Form := TTasOrderPiRt.Create(UniApplication);
  Form.CodigoRegistro := self.cds_parts_rtid.AsInteger;
  Form.cds_Parts := self.cds_parts_rt;
  Form.cds_insertion  := self.cds_Insertion;
  Form.CodigoVeiculo := FrBroadcaster.DBLCB_Lista.KeyValue;
  if not Form.cds_insertion.Active then Form.cds_insertion.createDataset;
  Form.EditionState := 'E';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
      Self.totalizer;
    end
  );
End;

procedure TTasOrderPi.ChoicePart(Choice : integer);
begin
  tab_jr.TabVisible := Choice = 0;
  tab_rt.TabVisible := Choice = 1;
  if tab_jr.TabVisible then
    Pg_Principal.ActivePage := tab_jr
  else
    Pg_Principal.ActivePage := tab_rt
end;

procedure TTasOrderPi.ClearAllFields;
begin
  inherited;
  Order.clear;
  OrderPi.clear;
  ClearFields(FrAgency);
  ClearFields(FrAdvertiser);
  ClearFields(FrBroadcaster);
  IF cds_parts_jr.Active then cds_parts_jr.EmptyDataSet;
  if cds_Insertion.Active then cds_Insertion.EmptyDataSet;
  if cds_parts_rt.Active then cds_parts_rt.EmptyDataSet;
end;

procedure TTasOrderPi.dbg_JrCellClick(Column: TUniDBGridColumn);
begin
  FilterInsertDate(cds_parts_jr.FieldByName('id').AsString);
end;

procedure TTasOrderPi.dbg_rtCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  FilterInsertDate(cds_parts_rt.FieldByName('id').AsString);
end;

procedure TTasOrderPi.DeleteDate(PartsId:Integer);
begin
  with cds_insertion do
  begin
    first;
    while not cds_insertion.eof do
    begin
      if FieldByName('tb_med_parts_id').AsInteger = PartsId then
        delete
      else
        next;
    end;
  end;
end;

procedure TTasOrderPi.Delete;
 begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          OrderPi.Delete;
          Order.Delete;
          ClearAllFields;
        End;
      end
    );
 end;

procedure TTasOrderPi.DeletedDate(Id: Integer);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
  LcOrderDate : TControllerMedInsertDate;
begin
  if cds_Insertion.ChangeCount > 0 then
  Begin
    LcOrderDate := TControllerMedInsertDate.create(nil);
    cds_temp := TClientDataSet.Create(nil);
    cds_temp.Data := cds_Insertion.Delta;
    cds_temp.First;
    cds_Insertion.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      with LcOrderDate do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Items
          Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
          Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
          Registro.Ordem               := order.Registro.Codigo;
          registro.PosicaoPecas        := cds_Temp.FieldByName('tb_med_parts_id').AsInteger;
          LcOrderDate.delete;
        End;

      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;

procedure TTasOrderPi.DeletedItemsJr(Id: Integer);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_parts_jr.ChangeCount > 0 then
  Begin
    Try
      cds_temp := TClientDataSet.Create(nil);
      cds_temp.Data := cds_parts_jr.Delta;
      cds_temp.First;
      cds_parts_jr.First;
      //Trata somente os dados deletados
      while not cds_temp.eof do
      Begin
        with OrderPi.Parts do
        Begin
          if cds_temp.UpdateStatus = usDeleted then
          Begin
            //Detalhe
            PartJR.Registro.Codigo               := cds_Temp.FieldByName('id').AsInteger;
            PartJR.Registro.Estabelecimento      := UMM.GInstitution.registro.Codigo;
            PartJR.Registro.Ordem                := Registro.Ordem;
            PartJR.delete;
            //Items
            Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
            Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
            Registro.Ordem               := order.Registro.Codigo;
            delete;
          End;
        End;
        cds_temp.Next;
      end;
    Finally
      cds_temp.Close;
      FreeAndNil(cds_temp);
    End;
  End;
end;

procedure TTasOrderPi.DeletedItemsRt(Id: Integer);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_parts_rt.ChangeCount > 0 then
  Begin
    Try
      cds_temp := TClientDataSet.Create(nil);
      cds_temp.Data := cds_parts_rt.Delta;
      cds_temp.First;
      cds_parts_rt.First;
      //Trata somente os dados deletados
      while not cds_temp.eof do
      Begin
        with OrderPi.Parts do
        Begin
          if cds_temp.UpdateStatus = usDeleted then
          Begin
            //Detalhe
            PartRT.Registro.Codigo               := cds_Temp.FieldByName('id').AsInteger;
            PartRT.Registro.Estabelecimento      := UMM.GInstitution.registro.Codigo;
            PartRT.Registro.Ordem                := Registro.Ordem;
            PartRT.delete;
            //Items
            Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
            Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
            Registro.Ordem               := order.Registro.Codigo;
            delete;
          End;
        End;
        cds_temp.Next;
      end;
    Finally
      cds_temp.Close;
      FreeAndNil(cds_temp);
    End;
  End;
end;

procedure TTasOrderPi.EditionControl;
begin
  inherited;
  EditionControler(FrAgency);
  EditionControler(FrAdvertiser);
  EditionControler(FrBroadcaster);
//  E_nr_internal.ReadOnly := True;
  Cb_kind_media.readOnly := not ( EditionState = 'I' );
  Sb_Invoice.Enabled := ( EditionState = 'B' );
  Sb_print.Enabled := ( EditionState = 'B' );
end;

procedure TTasOrderPi.FillAgencyDataChange(Sender: TObject);
begin
  E_kickback_agency.Text := FloatToStrF( FrAgency.cds_search.FieldByName('aliq_com').AsFloat,ffFixed,10,2);
end;

procedure TTasOrderPi.FillBroadCastDataChange(Sender: TObject);
begin
  E_kickback_owner.Text := FloatToStrF( FrBroadcaster.cds_search.FieldByName('aliq_com').AsFloat,ffFixed,10,2);
end;

procedure TTasOrderPi.FilterInsertDate(part_id: String);
begin
  cds_Insertion.Filtered := False;

  cds_Insertion.Filter := concat(
              ' ( ( tb_med_parts_id = ', part_id, ') or (tb_med_parts_id = 0 ) )'
           );
  cds_Insertion.Filtered := True;
end;


procedure TTasOrderPi.Financial;
begin
  with Nota.Financeiro.Financial.Registro do
  Begin
    Ordem           := Order.Registro.Codigo;
    Estabelecimento := Order.Registro.Estabelecimento;
    Parcela         := 1;
    DataExpiracao   := OrderPi.Registro.DataVencimento;
    TipoPagamento   := 1;
    Valor           := OrderPi.Registro.ValorProprio;
  End;
  Nota.Financeiro.Financial.save;

  with Nota.Financeiro.Registro do
  Begin
    Ordem           := Order.Registro.Codigo;
    Estabelecimento := Order.Registro.Estabelecimento;
    Parcela         := 1;
  end;
  Nota.Financeiro.getbykey;
  if not Nota.Financeiro.exist then
  Begin
    with Nota.Financeiro.Registro do
    Begin
      Ordem           := Order.Registro.Codigo;
      Estabelecimento := Order.Registro.Estabelecimento;
      Parcela         := 1;
      PlanoContas     := 0;
      Numero          := '';
      Tipo            := 'RA';
      Situacao        := 'D';
      Situacao        := 'N';
      Operacao          := 'C';
      Fase              :=  'N';
    End;
    Nota.Financeiro.save;
  End;
end;

procedure TTasOrderPi.FormatScreen;
begin
  inherited;
  ShowAgency;
  ShowBroadcaster;
  ShowAdvertiser;
Pg_Principal.ActivePage := tbs_operadores;
end;

function TTasOrderPi.getGrossValue: REal;
begin
  Result := 0;
  if Cb_kind_media.ItemIndex = 0  then
  Begin
    cds_parts_jr.first;
    while not cds_parts_jr.Eof do
    begin
      Result := Result  + cds_parts_jrtotal_value.AsFloat;
      cds_parts_jr.Next;
    end;
  End
  else
  Begin
    cds_parts_rt.first;
    while not cds_parts_rt.Eof do
    begin
      Result := Result  + cds_parts_jrtotal_value.AsFloat;
      cds_parts_rt.Next;
    end;
  End;
end;

procedure TTasOrderPi.GetHistoricAdvertiser(Sender: TObject);
begin
  if ( EditionState = 'I' ) then
  Begin
    if FrAdvertiser.DBLCB_Lista.Text <> '' then
    Begin
      OrderPi.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      OrderPi.Registro.Anunciante := FrAdvertiser.DBLCB_Lista.KeyValue;
      M_Note.Text := OrderPi.getLasNoteByAdvertiser;
    End;
  End;
end;

procedure TTasOrderPi.InitVariable;
begin
  inherited;
  Order := TControllerOrder.Create(Self);
  OrderPi := TControllerOrderPi.Create(Self);
  Nota    := TControllerInvoice.Create(Self);
end;

procedure TTasOrderPi.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasOrderPi.insertItemsjr(Id:Integer);
var
  Form : TTasOrderPiJr;
begin
  if Form = nil then
  Form := TTasOrderPiJr.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.EditionState := 'I';
  Form.cds_Parts := self.cds_parts_jr;
  Form.cds_insertion  := self.cds_Insertion;
  Form.CodigoVeiculo := FrBroadcaster.DBLCB_Lista.KeyValue;
  if not Form.cds_insertion.Active then Form.cds_insertion.createDataset;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
      Self.totalizer;
    end
  );
End;

procedure TTasOrderPi.insertItemsrt(Id: Integer);
var
  Form : TTasOrderPiRt;
begin
  if Form = nil then
  Form := TTasOrderPiRt.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.EditionState := 'I';
  Form.cds_Parts := self.cds_parts_rt;
  Form.cds_insertion  := self.cds_Insertion;
  Form.CodigoVeiculo := FrBroadcaster.DBLCB_Lista.KeyValue;
  if not Form.cds_insertion.Active then Form.cds_insertion.createDataset;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
      Self.totalizer;
    end
  );
End;

procedure TTasOrderPi.OpenChangeParts;
begin
  //
end;

procedure TTasOrderPi.OpenDeleteParts;
begin
//
end;


procedure TTasOrderPi.OpenDeletePartsJr;
begin
  begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      self.cds_parts_jr.Delete;
    End;
  end
  );

  end;
end;

procedure TTasOrderPi.OpenDeletePartsRt;
begin
   begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      self.cds_parts_rt.Delete;
    End;
  end
  );

  end;
end;
procedure TTasOrderPi.OpenInsertParts;
begin
  if Cb_kind_media.ItemIndex = 0  then
     insertItemsjr(0)
  else
     openTasOrderPiRt(0);
end;

procedure TTasOrderPi.printOrder;
Var
  LcPar: TPrmRepOrder;
  LcCM : TReportCM;
  LcJSon : string;
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    LcPar := TPrmRepOrder.Create;
    LcPar.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcPar.Usuario := UMM.GInstitution.User.Registro.codigo;
    LcPar.Resultado := false;
    LcPar.Codigo := OrderPi.Registro.Codigo;
    LcPar.URL := '';//'http://www.gestaowebsetes.com.br/institution/07742094000113/2/pedidocompra.pdf';
    LcJSon := TJson.ObjectToJsonString(LcPar);
    LcCM := TReportCM.Create(nil);
    LcJSon := LcCM.SMMediaClient.GetOrderPI(LcJSon);
    UniSession.Synchronize;
    LcPar := TJson.JsonToObject<TPrmRepOrder>(LcJson);
    if LcPar.Resultado then
    begin
      openReportViewer('Pedido de Inserção',LcPar.url);
      UniSession.Synchronize;
    end
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                   '',
                      'Erro ao Gerar Relatorio.',
                      LcPar.url]);
    End;
  finally
    self.HideMask;
    lcPar.disposeOf;
    LcCM.disposeOf;
  end;
end;

procedure TTasOrderPi.Rg_kind_calculationClick(Sender: TObject);
begin
  totalizer;
end;

procedure TTasOrderPi.Save;
Begin
  DeletedDate(order.Registro.Codigo);
  DeletedItemsJr(order.Registro.Codigo);
  DeletedItemsRt(order.Registro.Codigo);

  SaveOrder;
  SaveOrdeJr;
  SaveOrderRt;
  SaveDate;
  SaveInvoice;
  Financial;

  CodigoRegistro := OrderPi.Registro.Codigo;

End;


procedure TTasOrderPi.SaveDate;
Var
  LcOperacao : String;
  LcInsertDate : TControllerMedInsertDate;
begin
  if cds_Insertion.ChangeCount > 0 then
  Begin
    LcInsertDate := TControllerMedInsertDate.create(nil);
     cds_Insertion.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_Insertion.eof do
    Begin
      with LcInsertDate.Registro do
      Begin
        Codigo              := cds_Insertion.FieldByName('id').AsInteger;
        Estabelecimento     := UMM.GInstitution.registro.Codigo;
        ordem               := Order.Registro.Codigo;
        PosicaoPecas        := cds_Insertion.FieldByName('tb_med_parts_id').AsInteger ;
        DataInsercao        := cds_Insertion.FieldByName('dt_insertion').AsDateTime;
        DiaSemana           := cds_Insertion.FieldByName('week_day').AsString;
        QuantidadeInsercao  := cds_Insertion.FieldByName('qt_insertion').AsInteger;

        case cds_Insertion.UpdateStatus of
          usModified: LcInsertDate.save;
          usInserted: LcInsertDate.save;
        end;
      End;
      cds_Insertion.next;
    End;
    cds_Insertion.MergeChangeLog;
  End;
end;


procedure TTasOrderPi.SaveInvoice;
begin
  with Nota.Registro do
  Begin
    Codigo              := Order.Registro.Codigo;
    Estabelecimento     := Order.Registro.Estabelecimento;
    Emitente            := Order.Registro.Estabelecimento;
    TipoEmissao         := 'SI';
    Finalidade          := '1';
    Numero              := '';
    Serie               := '1';
    Cfop                := '5300';
    Destinatario        := 0;
    Data_emissao        := OrderPi.Registro.DataOriginal;
    Valor               := OrderPi.Registro.ValorProprio;
    Modelo              := '00';
    Observacao          := '';
    Status              := 'F';
  End;
  Nota.save;
end;

procedure TTasOrderPi.SaveOrdeJr;
Var
  LcOperacao : String;
begin
  if not cds_parts_jr.Active then  cds_parts_jr.CreateDataSet;
  if cds_parts_jr.ChangeCount > 0 then
  Begin
    cds_parts_jr.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_parts_jr.eof do
    Begin
      with OrderPi.Parts.Registro do
      Begin
        Codigo           := cds_parts_jr.FieldByName('id').AsInteger;
        ordem            := Order.Registro.Codigo;
        Estabelecimento  := UMM.GInstitution.registro.Codigo;
        Titulo           := cds_parts_jr.FieldByName('tittle').AsString;
        Material         := cds_parts_jr.FieldByName('tb_med_material_id').AsInteger;
        TabelaPosicao    := cds_parts_jr.FieldByName('tb_med_price_list_id').AsInteger ;
        Insercao         := cds_parts_jr.FieldByName('insertion').asInteger;
        NumeroRepeticao  := cds_parts_jr.FieldByName('nr_repetition').asInteger;
        PrecoTabela      := cds_parts_jr.FieldByName('table_value').asFloat;
        ValorUnidade     := cds_parts_jr.FieldByName('unit_value').AsFloat;
        ValorTotal       := cds_parts_jr.FieldByName('total_value').asFloat;
        DescontoAliquota := cds_parts_jr.FieldByName('aliq_desc').asFloat;
        case cds_parts_jr.UpdateStatus of
          usModified: OrderPi.Parts.save;
          usInserted: OrderPi.Parts.save;
        end;
      End;
      with OrderPi.Parts.PartJR.Registro do
      Begin
        Codigo           := OrderPi.Parts.registro.Codigo;
        Estabelecimento  := UMM.GInstitution.registro.Codigo;
        Ordem            := Order.Registro.Codigo;
        NumeroColuna     := cds_parts_jr.FieldByName('nr_column').AsString;
        NumeroAltura     := cds_parts_jr.FieldByName('nr_height').AsString ;
        Dia              := cds_parts_jr.FieldByName('day').AsString;
        Cor              := cds_parts_jr.FieldByName('color').AsString;
        case cds_parts_jr.UpdateStatus of
          usModified: OrderPi.Parts.PartJR.save;
          usInserted: OrderPi.Parts.PartJR.save;
        end;
      End;
      cds_parts_jr.next;
    End;
    cds_parts_jr.MergeChangeLog;
  End;
end;

procedure TTasOrderPi.SaveOrder;
Begin
  //Order
  with order.registro do
  begin
    Estabelecimento   := UMM.GInstitution.registro.Codigo;
    Usuario           := UMM.GInstitution.User.Registro.codigo;
	  Data              := Dt_dt_internal.DateTime ;
    Observacao        := M_Note.Text ;
    Origem            := '0';
    Status            := 'N';
    RegistroCriado    := Now();
    RegistroAlterado  := Now();
    SendoUsado        := '.';
  End;
  Order.save;
  //Order Pi
  with OrderPi.registro do
  Begin
    Codigo            := Order.Registro.Codigo;
    Estabelecimento   := UMM.GInstitution.registro.Codigo;
    NumeroOriginal    := E_nr_original.Text ;
    DataOriginal      := Dt_dt_original.DateTime;
    DataVencimento    := Dt_dt_vencimento.DateTime;
    DataInterna       := Dt_dt_internal.DateTime;
    NumeroInterno     := StrtoIntDef(E_nr_internal.Text,0);
    TipoMidia         := Cb_kind_media.ItemIndex;
    Agencia           := FrAgency.DBLCB_Lista.KeyValue;
    Anunciante        := FrAdvertiser.DBLCB_Lista.KeyValue;
    Veiculo           := FrBroadcaster.DBLCB_Lista.KeyValue;
    ComissaoAgencia   := StrToFloatDef( E_kickback_agency.Text,0);
    ComissaoEmpresa   := StrToFloatDef( E_kickback_owner.Text,0);
    TipoCalculo       := Rg_kind_calculation.ItemIndex;
    ValorBruto        := StrToFloatDef( E_gross_value.Text,0);
    ValorComissao     := StrToFloatDef( E_agency_value.Text,0);
    ValorLiquido      := StrToFloatDef( E_net_value.Text,0);
    ValorProprio      := StrToFloatDef( E_owner_value.Text,0);
    NotaExtra         := M_extra_note.Text;
    produto           := E_Produto.Text;
    Campanha          := E_Campanha.Text;
    RegistroCriado    := Now();
    RegistroAlterado  := Now();
  End;
  OrderPi.save;
End;

procedure TTasOrderPi.SaveOrderRt;
Var
LcOperacao : String;
begin
  if not cds_parts_rt.Active then cds_parts_rt.CreateDataSet;
  if cds_parts_rt.ChangeCount > 0 then
  Begin
    cds_parts_rt.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_parts_rt.eof do
    with OrderPi.Parts.Registro do
    Begin
      Codigo           := cds_parts_rt.FieldByName('id').AsInteger;
      Estabelecimento  := UMM.GInstitution.registro.Codigo;
      ordem            := Order.Registro.Codigo;
      Titulo           := cds_parts_rt.FieldByName('tittle').AsString;
      Material         := cds_parts_rt.FieldByName('tb_med_material_id').AsInteger;
      TabelaPosicao    := cds_parts_rt.FieldByName('tb_med_price_list_id').AsInteger ;
      Insercao         := cds_parts_rt.FieldByName('insertion').asInteger;
      NumeroRepeticao  := cds_parts_rt.FieldByName('nr_repetition').asInteger;
      PrecoTabela      := cds_parts_rt.FieldByName('table_value').asFloat;
      ValorUnidade     := cds_parts_rt.FieldByName('unit_value').AsFloat;
      ValorTotal       := cds_parts_rt.FieldByName('total_value').asFloat;
      DescontoAliquota := cds_parts_rt.FieldByName('aliq_desc').asFloat;
        case cds_parts_rt.UpdateStatus of
          usModified: OrderPi.Parts.save;
          usInserted: OrderPi.Parts.save;
        end;
      cds_parts_rt.next;
    End;
    with OrderPi.Parts.PartRT.Registro do
      Begin
        Codigo                := OrderPi.Parts.registro.Codigo;
        Estabelecimento       := UMM.GInstitution.registro.Codigo;
        Ordem                 := Order.Registro.Codigo;
        TempoDuracao          := cds_parts_rt.FieldByName('tm_duration').AsString;
        Testemunhal           := cds_parts_rt.FieldByName('testimonial').AsString ;
        AumentoTestemunhal    := cds_parts_rt.FieldByName('increase_testemonial').AsFloat;
        case cds_parts_rt.UpdateStatus of
          usModified: OrderPi.Parts.PartRT.save;
          usInserted: OrderPi.Parts.PartRT.save;
        end;
      End;
      cds_parts_rt.next;
    End;
    cds_parts_rt.MergeChangeLog;
 End;

 procedure TTasOrderPi.Sb_Change_Parts_jrClick(Sender: TObject);
begin
  changeItemsjr(cds_parts_jr.FieldByName('id').AsInteger);
end;

procedure TTasOrderPi.Sb_Delet_Parts_jrClick(Sender: TObject);
begin
  DeleteDate(cds_parts_jr.FieldByName('id').AsInteger);
  OpenDeletePartsJr;
end;

procedure TTasOrderPi.Sb_Insert_Parts_jrClick(Sender: TObject);
begin
  insertItemsjr(0);
end;

procedure TTasOrderPi.setImages;
begin
  inherited;
  buttonIcon(SB_Print,'print.bmp');
  buttonIcon(Sb_Invoice,'confirm.bmp');
  buttonIcon(Sb_Insert_Parts_jr,'mini_insert.bmp');
  buttonIcon(Sb_Change_Parts_jr,'mini_change.bmp');
  buttonIcon(Sb_Delet_Parts_jr,'mini_delete.bmp');
  buttonIcon(Sb_Insert_Parts_rt,'mini_insert.bmp');
  buttonIcon(Sb_Change_Parts_rt,'mini_change.bmp');
  buttonIcon(Sb_Delet_Parts_rt,'mini_delete.bmp');
end;

procedure TTasOrderPi.setVariable;
begin
  //Order Pi
  with OrderPi do
  Begin
    Order.Registro.Codigo := CodigoRegistro;
    Order.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Order.getByKey;

    Registro.Codigo := Order.Registro.Codigo;
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    getByKey;

  End;
  inherited;
end;


procedure TTasOrderPi.ShowData;
begin
  ShowDataOrder;
  if OrderPi.Registro.TipoMidia = 0 then
    ShowDataListJr
  else
    ShowDataListRt;
  ShowDataInsertDate;
  Totalizer;
End;

procedure TTasOrderPi.ShowDataInsertDate;
Var
  I : Integer;
  Registro : TMedInsertDate;
  LcDate : TControllerMedInsertDate;
begin
  Try
    LcDate := TControllerMedInsertDate.create(nil);
    LcDate.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    LcDate.Registro.ordem := Order.Registro.Codigo;
    LcDate.getList;

    with cds_Insertion  do
    Begin
      if not Active then CreateDataSet;
      LogChanges := False;
      EmptyDataSet;
      for I := 0 to LcDate.Lista.Count - 1 do
      Begin
        Registro := LcDate.Lista[I];
        Append;
        FieldByName('id').AsInteger                 := Registro.Codigo;
        FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
        FieldByName('tb_order_id').AsInteger        := Registro.Ordem;
        FieldByName('tb_med_parts_id').AsInteger    :=  Registro.PosicaoPecas;
        FieldByName('dt_insertion').AsDateTime      :=  Registro.DataInsercao;
        FieldByName('week_day').AsString            :=  registro.DiaSemana;
        FieldByName('qt_insertion').AsInteger       :=  Registro.QuantidadeInsercao;
        Post;
      End;
      LogChanges := True;
    End;
  Finally
    LcDate.DisposeOf;
  End;
end;

procedure TTasOrderPi.ShowDataListJr;
Var
  I : Integer;
  LcPart : TMedParts;
begin

  OrderPi.Parts.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  OrderPi.Parts.Registro.ordem := Order.Registro.codigo;
  OrderPi.Parts.getList;

  with cds_parts_jr  do
  Begin
    if not Active then CreateDataSet;
    cds_parts_jr.LogChanges := False;
    cds_parts_jr.EmptyDataSet;
    for I := 0 to OrderPi.Parts.Lista.Count - 1 do
    Begin
      LcPart := TMedParts.create;
      LcPart := OrderPi.Parts.Lista[I];
      Append;
      //Peça Geral
      FieldByName('tittle').AsString                := LcPart.Titulo;
      FieldByName('tb_med_material_id').AsInteger   := LcPart.Material;
      FieldByName('tb_med_price_list_id').AsInteger := LcPart.TabelaPosicao;
      FieldByName('nr_repetition').asInteger        := LcPart.NumeroRepeticao;
      FieldByName('insertion').asInteger            := LcPart.Insercao;
      FieldByName('table_value').asFloat            := LcPart.PrecoTabela;
      FieldByName('aliq_desc').asFloat              := LcPart.DescontoAliquota;
      FieldByName('unit_value').AsFloat             := LcPart.ValorUnidade;
      FieldByName('total_value').asFloat            := LcPart.ValorTotal;

      //Peça Jornal e revista
      OrderPi.Parts.PartJR.Registro.Codigo  := LcPart.Codigo;
      OrderPi.Parts.PartJR.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      OrderPi.Parts.PartJR.Registro.Ordem   := LcPart.Ordem;
      OrderPi.Parts.PartJR.getByKey;

      with OrderPi.Parts.PartJR do
      begin
        FieldByName('id').AsInteger                 := registro.Codigo;
        FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
        FieldByName ('tb_order_id').AsInteger       := Registro.Ordem;
        FieldByName('nr_column').AsString           := Registro.NumeroColuna;
        FieldByName('nr_height').AsString           := Registro.NumeroAltura;
        FieldByName('color').AsString               := Registro.Cor;
        FieldByName('day').AsString                 := Registro.Dia;
        FieldByName('created_at').AsDateTime        := Registro.RegistroCriado;
        FieldByName('updated_at').AsDateTime        := Registro.RegistroAlterado;
      end;
      //get no material no MPP
      with OrderPi.Parts do
      BEgin
        PartJR.Tabela.Registro.Codigo          := LcPart.TabelaPosicao;
        PartJR.Tabela.Registro.Estabelecimento := LcPart.Estabelecimento;
        PartJR.Tabela.Registro.Veiculo         := OrderPi.Registro.Veiculo;
        PartJR.Tabela.getByKey;

        PartJR.Tabela.Posicao.Registro.Codigo :=        LcPart.TabelaPosicao;
        PartJR.Tabela.Posicao.Registro.Estabelecimento := LcPart.Estabelecimento;
        PartJR.Tabela.Posicao.getByKey;
        FieldByName('mppID').AsInteger                := PartJR.Tabela.Posicao.Registro.Codigo;
        FieldByName('mppDescription').AsString        := PartJR.Tabela.Posicao.Registro.Descricao;

        //get no material no Mm
        Material.Registro.Codigo := LcPart.Material;
        Material.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
        material.getByKey;
        FieldByName('mmID').AsInteger                 := Material.Registro.Codigo;
        FieldByName('mmDescription').AsString         := Material.Registro.Descricao;
      End;
      Post;
    End;
  End;
  cds_parts_jr.LogChanges := True;
end;

procedure TTasOrderPi.ShowDataListRt;
Var
  I : Integer;
  LcPart : TMedParts;
begin
  OrderPi.Parts.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  OrderPi.Parts.Registro.ordem := Order.Registro.codigo;
  OrderPi.Parts.getList;

  with cds_parts_rt  do
  Begin
    if not Active then CreateDataSet;
    cds_parts_rt.LogChanges := False;
    cds_parts_rt.EmptyDataSet;
    for I := 0 to OrderPi.Parts.Lista.Count - 1 do
    Begin
      LcPart := OrderPi.Parts.Lista[I];
      Append;
      FieldByName('tittle').AsString                := LcPart.Titulo;
      FieldByName('tb_med_material_id').AsInteger   := LcPart.Material;
      FieldByName('tb_med_price_list_id').AsInteger := LcPart.TabelaPosicao;
      FieldByName('nr_repetition').asInteger        := LcPart.NumeroRepeticao;
      FieldByName('insertion').asInteger            := LcPart.Insercao;
      FieldByName('table_value').asFloat            := LcPart.PrecoTabela;
      FieldByName('aliq_desc').asFloat              := LcPart.DescontoAliquota;
      FieldByName('unit_value').AsFloat             := LcPart.ValorUnidade;
      FieldByName('total_value').asFloat            := LcPart.ValorTotal;

      // get no medParts
      OrderPi.Parts.PartRT.Registro.Codigo  := LcPart.Codigo;
      OrderPi.Parts.PartRT.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
      OrderPi.Parts.PartRT.Registro.Ordem   := LcPart.Ordem;
      OrderPi.Parts.PartRT.getByKey;
      with OrderPi.Parts.PartRT do
      begin
        FieldByName('id').AsInteger                   := registro.Codigo;
        FieldByName('tb_institution_id').AsInteger    := Registro.Estabelecimento;
        FieldByName ('tb_order_id').AsInteger         := Registro.Ordem;
        FieldByName('tm_duration').AsString           := Registro.TempoDuracao;
        FieldByName('testimonial').AsString           := Registro.Testemunhal;
        FieldByName('increase_testemonial').AsFloat   := Registro.AumentoTestemunhal;
      end;
      //get no material no MPP
      with OrderPi.Parts do
      BEgin
        //get no material no MPP
        PartRT.Tabela.Registro.Codigo          := LcPart.TabelaPosicao;
        PartRT.Tabela.Registro.Estabelecimento := LcPart.Estabelecimento;
        PartRT.Tabela.getByKey;

        PartRT.Tabela.Posicao.Registro.Codigo :=  PartRT.Tabela.Registro.PosicaoProgramacao;
        PartRT.Tabela.Posicao.Registro.Estabelecimento := PartRT.Tabela.Registro.Estabelecimento;
        PartRT.Tabela.Posicao.getByKey;
        FieldByName('mppID').AsInteger                := PartRT.Tabela.Posicao.Registro.Codigo;
        FieldByName('mppDescription').AsString        := PartRT.Tabela.Posicao.Registro.Descricao;

        //get no material no Mm
        material.Registro.Codigo := LcPart.Material;
        material.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
        material.getByKey;
        FieldByName('mmID').AsInteger                 := material.Registro.Codigo;
        FieldByName('mmDescription').AsString         := material.Registro.Descricao;
      End;
      Post;
    End;
  End;
  cds_parts_rt.LogChanges := True;
end;

procedure TTasOrderPi.ShowDataOrder;
begin
  with OrderPi do
  Begin
    with registro do
    Begin
      E_nr_original.Text                  := NumeroOriginal ;
      Dt_dt_original.DateTime             := DataOriginal ;
      Dt_dt_vencimento.DateTime           := DataVencimento;
      Dt_dt_internal.DateTime             := DataInterna;
      E_nr_internal.Text                  := IntToStr(NumeroInterno);
      Cb_kind_media.ItemIndex             := TipoMidia ;
      ChoicePart(TipoMidia);
      E_kickback_agency.Text              := FloatToStrF(ComissaoAgencia,ffFixed,10,2) ;
      E_kickback_owner.Text               := FloatToStrF(ComissaoEmpresa,ffFixed,10,2);
      Rg_kind_calculation.ItemIndex       := TipoCalculo ;
      E_gross_value.Text                  := FloatToStrF(ValorBruto,ffFixed,10,2);
      E_net_value.Text                    := FloatToStrF(ValorLiquido,ffFixed,10,2);
      E_owner_value.Text                  := FloatToStrF(ValorProprio,ffFixed,10,2);
      M_extra_note.Text                   := NotaExtra ;
      FrAgency.DBLCB_Lista.KeyValue       := Agencia;
      FrAdvertiser.DBLCB_Lista.KeyValue   := Anunciante;
      FrBroadcaster.DBLCB_Lista.KeyValue  := Veiculo;
      E_Produto.Text                      := produto;
      E_Campanha.Text                     := Campanha;

    End;

    with Order.Registro do
    Begin
      Dt_dt_internal.DateTime:= Data;
      M_Note.Text := Observacao;
    End;
  End;

end;

procedure TTasOrderPi.ShowNoData;
begin
  ChoicePart(Cb_kind_media.ItemIndex);
  ClearAllFields;
  inherited;
end;

procedure TTasOrderPi.totalizer;
Var
  LcGrossValue : Real;
  LcAgencyValue : Real;
  LcNEtValue : Real;
  LcownerValue : Real;
begin
  LcGrossValue := getGrossValue;
  E_gross_value.Value  :=  LcGrossValue;
  if Rg_kind_calculation.ItemIndex=1 then
  Begin
    LcAgencyValue  := LcGrossValue * (E_kickback_agency.Value/100);
    E_agency_value.Value := LcAgencyValue;
    LcNEtValue := LcGrossValue - LcAgencyValue;
    E_net_value.Value := LcNEtValue;
  end
  else
  Begin
    LcAgencyValue := 0;
    E_agency_value.Value := LcAgencyValue;
    LcNEtValue := LcGrossValue - LcAgencyValue;
    E_net_value.Value  :=  LcNEtValue;
  end;
  LcownerValue := LcNEtValue * (E_kickback_owner.Value/100);
  E_owner_value.Value  := LcownerValue;
end;

procedure TTasOrderPi.Sb_Insert_Parts_rtClick(Sender: TObject);
begin
  insertItemsrt(0);
end;

procedure TTasOrderPi.Sb_PrintClick(Sender: TObject);
begin
  if validatePrintOrder then
    printOrder;
end;

procedure TTasOrderPi.Sb_Change_Parts_rtClick(Sender: TObject);
begin
  changeItemsRt(cds_parts_Rt.FieldByName('id').AsInteger);
end;

procedure TTasOrderPi.Sb_Delet_Parts_rtClick(Sender: TObject);
begin
  DeleteDate(cds_parts_rt.FieldByName('id').AsInteger);
  OpenDeletePartsRt;
end;

procedure TTasOrderPi.SB_InsertClick(Sender: TObject);
begin
  inherited;
  Pg_Principal.ActivePage := tbs_operadores;
  E_nr_original.SetFocus;
end;

procedure TTasOrderPi.ShowAdvertiser;
begin
  FrAdvertiser := TfmAdvertiser.Create(Ctn_Advertiser);
  FrAdvertiser.Parent := Ctn_Advertiser;
  FrAdvertiser.Listar;
  FrAdvertiser.Align := alClient;
  FrAdvertiser.DBLCB_Lista.OnExit := GetHistoricAdvertiser;
  FrAdvertiser.Show;
end;

procedure TTasOrderPi.ShowAgency;
begin
  FrAgency := TfmAgency.Create(Ctn_Agency);
  FrAgency.Parent := Ctn_Agency;
  FrAgency.Align := alClient;
  FrAgency.Listar;
  FrAgency.DBLCB_Lista.OnChange := FillAgencyDataChange;
  FrAgency.Show;
end;

procedure TTasOrderPi.ShowBroadcaster;
begin
  FrBroadcaster := TfmBroadcaster.Create(Ctn_Broadcaster);
  FrBroadcaster.Parent := Ctn_Broadcaster;
  FrBroadcaster.Align := alClient;
  FrBroadcaster.Listar;
  FrBroadcaster.DBLCB_Lista.OnChange := FillBroadCastDataChange;
  FrBroadcaster.Show;
end;

function TTasOrderPi.ValidaInsert: boolean;
begin
 Result := True;
end;

function TTasOrderPi.ValidateChangeParts: boolean;
begin
 Result := True;
end;

function TTasOrderPi.ValidateDeleteParts: boolean;
begin
  Result := True;
end;

function TTasOrderPi.ValidateInsertParts: boolean;
begin
  Result := True;
end;

function TTasOrderPi.hasOrderItems(cds_Items : TClientDataSet): Boolean;
begin
  Result := True;
  if (cds_Items.RecordCount = 0 ) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há peças na lista.',
                  'Impossível continuar.']);
    Result := False;
    exit;
  End;
end;

function TTasOrderPi.validatePrintOrder: Boolean;
begin
  REsult := true;
  if ( Cb_kind_media.itemindex = 0 ) then
  Begin
    if not hasOrderItems(cds_parts_jr) then
      exit;
  End
  else
  Begin
    if not hasOrderItems(cds_parts_rt) then
      exit;
  End;

end;

function TTasOrderPi.ValidateSave: boolean;
Begin
  Result := True;
  OrderPi.Registro.NumeroInterno := StrtoIntDef(E_nr_internal.Text,0);
  OrderPi.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  if OrderPi.getDuplicity then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Número de P.I. já existe.',
                  'Verifique antes de continuar']);
    Result := False;
    exit;
  end;

  if trim( E_nr_original.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo P.I. Original não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim( E_nr_internal.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo P.I. Interno não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrAgency.DBLCB_Lista.Text ) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Agência não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(FrAdvertiser.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Anunciante não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(FrBroadcaster.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Veículo não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(E_kickback_agency.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Comissão Agência não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(E_kickback_owner.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Comissão Empresa não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

      if trim(Dt_dt_original.Text) = '30/12/1899' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Data Original não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

      if trim(Dt_dt_internal.Text) = '30/12/1899' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Data Pedido não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(Dt_dt_vencimento.Text) = '30/12/1899' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Data Vencimento não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
  //Atualiza o totalizador
  Totalizer;
end;

end.
