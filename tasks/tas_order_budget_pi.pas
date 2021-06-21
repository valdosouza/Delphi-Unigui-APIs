unit tas_order_budget_pi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel, uniDateTimePicker, uniRadioGroup, uniCheckBox,
  uniGroupBox, uniMemo, uniBasicGrid, fm_agency, uniDBGrid, fm_advertiser, 
  fm_Payment_type, uniPageControl, ControllerOrderBudgedMedia, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, tas_order_budget_item_pi_jr, ControllerEntity,
  tas_order_budget_item_pi_rt, ControllerOrder, ControllerOrderBudgedItemPiJr,
  ControllerOrderBudgetItemPiRt;

type
  TTasOrderBudgetPi = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    E_number: TUniEdit;
    UniLabel2: TUniLabel;
    Rg_type: TUniRadioGroup;
    UniGroupBox1: TUniGroupBox;
    chbx_filed: TUniCheckBox;
    Ctn_Agency: TUniContainerPanel;
    Ctn_Advertiser: TUniContainerPanel;
    UniLabel4: TUniLabel;
    E_contact: TUniEdit;
    UniLabel5: TUniLabel;
    E_phone: TUniEdit;
    UniLabel6: TUniLabel;
    E_email: TUniEdit;
    UniLabel3: TUniLabel;
    Dtp_dt_inicial: TUniDateTimePicker;
    UniPanel3: TUniPanel;
    UniPageControl1: TUniPageControl;
    tab_jr: TUniTabSheet;
    dbg_Jr: TUniDBGrid;
    Sb_Insert_jr: TUniSpeedButton;
    Sb_Chance_jr: TUniSpeedButton;
    Sb_Delet_jr: TUniSpeedButton;
    tab_rt: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    UniPanel4: TUniPanel;
    dbg_rt: TUniDBGrid;
    E_validade: TUniEdit;
    dtp_vencimento: TUniDateTimePicker;
    M_note: TUniMemo;
    UniLabel10: TUniLabel;
    Ctn_Payment_Type: TUniContainerPanel;
    UniLabel11: TUniLabel;
    E_assignature: TUniEdit;
    UniLabel12: TUniLabel;
    E_email_resp: TUniEdit;
    UniLabel13: TUniLabel;
    UniEdit3: TUniEdit;
    UniCheckBox1: TUniCheckBox;
    Sb_insert_rt: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    UniSpeedButton3: TUniSpeedButton;
    cds_items_jr: TClientDataSet;
    ds_items_jr: TDataSource;
    cds_items_jrid: TIntegerField;
    cds_items_jrtb_institution_id: TIntegerField;
    cds_items_jrtb_order_id: TIntegerField;
    cds_items_jrtb_broadcaster_id: TIntegerField;
    cds_items_jrtb_med_pos_prog: TIntegerField;
    cds_items_jrday: TStringField;
    cds_items_jrcolor: TStringField;
    cds_items_jrtable_value: TBCDField;
    cds_items_jraliq_desc: TBCDField;
    cds_items_jrunit_value: TBCDField;
    cds_items_jrnr_column: TStringField;
    cds_items_jrnr_height: TStringField;
    cds_items_jrinsertion: TIntegerField;
    cds_items_jrcreated_at: TDateTimeField;
    cds_items_jrupdated_at: TDateTimeField;
    cds_items_jrname_company: TStringField;
    cds_items_jrname: TStringField;
    ds_items_rt: TDataSource;
    cds_items_rt: TClientDataSet;
    cds_items_rtid: TIntegerField;
    cds_items_rttb_order_id: TIntegerField;
    cds_items_rtcreated_at: TDateTimeField;
    cds_items_rttb_broadcaster_id: TIntegerField;
    cds_items_rttb_med_pos_prog_id: TIntegerField;
    cds_items_rttm_duration: TStringField;
    cds_items_rtupdated_at: TDateTimeField;
    cds_items_rttb_institution_id: TIntegerField;
    cds_items_rttestimonial: TStringField;
    cds_items_rtincrease_testemonial: TFloatField;
    cds_items_rtname_company: TStringField;

    procedure InitVariable;Override;
    procedure FormatScreen;Override;
    procedure setVariable; override;

    procedure ShowData;Override;
    Procedure ShowDataListJr( cds_Items : TClientDataSet; order_id:Integer);
    Procedure ShowDataListRt( cds_Items : TClientDataSet; order_id:Integer);
    procedure ShowDataOrder;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;
    procedure Sb_Insert_jrClick(Sender: TObject);
    procedure Sb_insert_rtClick(Sender: TObject);
    procedure Sb_Chance_jrClick(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure UniSpeedButton3Click(Sender: TObject);
    procedure Sb_Delet_jrClick(Sender: TObject);
  private
    { Private declarations }

  Protected
    procedure insertItemsjr(Id:Integer);
    procedure changeItemsjr(Id:Integer);
    procedure DeletedItemsJr(Id:Integer);
    procedure OpenDeletePartsJr;
    Procedure DeletDateJr;

    procedure insertItemsRt(Id:Integer);
    procedure DeletedItemsRt(Id:Integer);
    procedure changeItemsRt(Id:Integer);
    procedure OpenDeletePartsRt;
    Procedure DeletDateRt;

  public
    { Public declarations }
    OrderBudget_pi : TControllerOrderBudgedMedia;
    BudgedJr : TControllerOrderBudgedItemPiJr;
    BudgedRt : TControllerOrderBudgetItemPiRt;
    Order : TControllerOrder;
    FrAgency       : TFmAgency;
    FrAdvertiser   : TFmAdvertiser;
    FrPaymentType  : TfmPaymentType;
    
    procedure ShowAgency;
    Procedure ShowAdvertiser;
    Procedure ShowPaymentType;

    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveOrder;
    Procedure SaveJr;
    procedure SaveRt;
    function  ValidateDelete: boolean;
    procedure Delete;Override;
  end;

var
  TasOrderBudgetPi: TTasOrderBudgetPi;

implementation

{$R *.dfm}

uses MainModule, tblOrderBudgedItemPi,tblOrderBudgedItemPiRt, UnFunctions,
  unMessages, msg_form;

{ TTasOrderBudgetPi }

procedure TTasOrderBudgetPi.changeItemsjr(Id: Integer);
var
  Form : TTasOrderBudgetItemPiJr;
begin
  if Form = nil then
    Form := TTasOrderBudgetItemPiJr.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.cds_Items := self.cds_items_jr;
  Form.EditionState := 'I';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  //Result := True;
End;

procedure TTasOrderBudgetPi.changeItemsRt(Id: Integer);
var
  Form : TTasOrderBudgetItemPiRt;
begin
  if Form = nil then
    Form := TTasOrderBudgetItemPiRt.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.cds_Items := self.cds_items_rt;
  Form.EditionState := 'I';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  //Result := True;
End;

procedure TTasOrderBudgetPi.ClearAllFields;
begin
  inherited;
  ClearFields(FrAdvertiser);
  ClearFields(FrAgency);
  ClearFields(FrPaymentType);
  OrderBudget_pi.clear;
end;

procedure TTasOrderBudgetPi.DeletDateJr;
begin
  with cds_items_jr do
  begin
    first;
    while not cds_items_jr.eof do
    begin
      if FieldByName('tb_broadcaster_id').AsInteger = cds_items_jr.FieldByName('id').AsInteger then
        delete
      else
        next;
    end;
  end;
end;

procedure TTasOrderBudgetPi.DeletDateRt;
begin
  with cds_items_rt do
  begin
    first;
    while not cds_items_rt.eof do
    begin
      if FieldByName('tb_order_id').AsInteger = cds_items_rt.FieldByName('id').AsInteger then
        delete
      else
        next;
    end;
  end;
end;

procedure TTasOrderBudgetPi.Delete;
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
          OrderBudget_pi.delete;
          ClearAllFields;
        End;
      end
    );
 end;

procedure TTasOrderBudgetPi.DeletedItemsJr(Id: Integer);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
  LcOrderItemsJr : TControllerOrderBudgedItemPiJr;
begin
  if cds_items_jr.ChangeCount > 0 then
  Begin
    LcOrderItemsJr := TControllerOrderBudgedItemPiJr.create(Self);
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_items_jr.Delta;
    cds_temp.First;
    cds_items_jr.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      with LcOrderItemsJr do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Items
          Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
          Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
          Registro.Ordem               := Registro.Codigo;
          LcOrderItemsJr.delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;


procedure TTasOrderBudgetPi.DeletedItemsRt(Id: Integer);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
  LcOrderItemsRt : TControllerOrderBudgetItemPiRt;
begin
  if cds_items_rt.ChangeCount > 0 then
  Begin
    LcOrderItemsRt := TControllerOrderBudgetItemPiRt.create(Self);
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_items_rt.Delta;
    cds_temp.First;
    cds_items_rt.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      with LcOrderItemsRt do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Items
          Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
          Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
          Registro.Ordem               := Registro.Codigo;
          LcOrderItemsRt.delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;

procedure TTasOrderBudgetPi.EditionControl;
begin
  inherited;
  EditionControler(FrAgency);
  EditionControler(FrAdvertiser);
  EditionControler(FrPaymentType);
end;

procedure TTasOrderBudgetPi.FormatScreen;
begin
  inherited;
  ShowAgency;
  ShowAdvertiser;
  ShowPaymentType;
end;

procedure TTasOrderBudgetPi.InitVariable;
begin
  inherited;
  OrderBudget_pi := TControllerOrderBudgedMedia.create(self);
  Order := TControllerOrder.Create(self);
  if not cds_items_jr.Active then cds_items_jr.CreateDataSet;
  if not cds_items_rt.Active then cds_items_rt.CreateDataSet;
end;

procedure TTasOrderBudgetPi.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasOrderBudgetPi.insertItemsJr(Id: Integer);
var
Form : TTasOrderBudgetItemPiJr;
begin
  if Form = nil then
  Form := TTasOrderBudgetItemPiJr.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.EditionState := 'I';
  Form.cds_Items := self.cds_items_jr;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  //Result := True;
End;


procedure TTasOrderBudgetPi.insertItemsRt(Id: Integer);
var
Form : TTasOrderBudgetItemPiRt;
begin
  if Form = nil then
  Form := TTasOrderBudgetItemPiRt.Create(UniApplication);
  Form.CodigoRegistro := Id;
  Form.EditionState := 'I';
  Form.cds_Items := self.cds_items_rt;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  //Result := True;
End;

procedure TTasOrderBudgetPi.OpenDeletePartsJr;
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
      self.cds_items_jr.Delete;
    End;
  end
  );

  end;
end;

procedure TTasOrderBudgetPi.OpenDeletePartsRt;
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
      self.cds_items_rt.Delete;
    End;
  end
  );

  end;
end;

procedure TTasOrderBudgetPi.Save;
begin
  DeletedItemsJr(Order.Registro.Codigo);
  DeletedItemsRt(Order.Registro.Codigo);

  SaveOrder;
  SaveJr;
  SaveRt;
end;

procedure TTasOrderBudgetPi.SaveJr;
Var
LcOperacao : String;
LcBudgetJr : TControllerOrderBudgedItemPiJr;
begin
  if cds_items_jr.ChangeCount > 0 then
  Begin
    LcBudgetJr := TControllerOrderBudgedItemPiJr.create(Self);

     cds_items_jr.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_items_jr.eof do
    Begin
      with LcBudgetJr.Registro do
      Begin
        Codigo             := cds_items_jr.FieldByName('id').AsInteger;
        Estabelecimento    := cds_items_jr.FieldByName('tb_institution_id').AsInteger;
        Ordem              := OrderBudget_pi.Order.Registro.Codigo;
        Veiculo            := cds_items_jr.FieldByName('tb_broadcaster_id').AsInteger;
        Posicao            := cds_items_jr.FieldByName('tb_med_pos_prog_id').AsInteger;
        Dia                := cds_items_jr.FieldByName('day').AsString;
        Cor                := cds_items_jr.FieldByName('Color').AsString;
        ValorTabela        := cds_items_jr.FieldByName('table_value').AsFloat;
        Desconto           := cds_items_jr.FieldByName('aliq_desc').AsFloat;
        ValorUnitario      := cds_items_jr.FieldByName('unit_value').AsFloat;
        Coluna             := cds_items_jr.FieldByName('nr_column').AsString;
        Altura             := cds_items_jr.FieldByName('nr_height').AsString;
        insercao           := cds_items_jr.FieldByName('insertion').AsInteger;

        RegistroCriado     := cds_items_jr.FieldByName('created_at').AsDateTime;
        RegistroAlterado   := cds_items_jr.FieldByName('updated_at').AsDateTime;

        case cds_items_jr.UpdateStatus of
          usModified: LcBudgetJr.update;
          usInserted: LcBudgetJr.insert;
        end;
      End;
      cds_items_jr.next;
    End;
    cds_items_jr.MergeChangeLog;
  End;
end;

procedure TTasOrderBudgetPi.SaveOrder;
begin
  //Order
  with OrderBudget_pi.order.registro do
  begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Usuario := UMM.GInstitution.User.Registro.codigo;
	  Data := Dtp_dt_inicial.DateTime ;
    Observacao := M_note.Text ;
  End;
  OrderBudget_pi.Order.save;

  with OrderBudget_pi.registro do
    Begin
      Codigo            := OrderBudget_pi.order.Registro.Codigo;
      Estabelecimento   := UMM.GInstitution.registro.Codigo;
      Numero            := StrTOIntDef(E_Number.Text,0) ;
      Validade          := E_validade.Text;
      Agencia           := FrAgency.DBLCB_Lista.KeyValue;
      Anunciante        := FrAdvertiser.DBLCB_Lista.KeyValue;
      Contato           := E_contact.Text;
      email             := E_email.Text;
      Telefone          := E_phone.Text;
      TipoPagamento     := FrPaymentType.DBLCB_Lista.KeyValue;
      Assinatura        := E_assignature.Text;
      EmailResponsavel  := E_email_resp.Text;
      vencimento        := dtp_vencimento.DateTime;

      if chbx_filed.Checked then
        Arquivado := 'S'
      else
        Arquivado := 'N';

      TipoMidia := Rg_type.ItemIndex;

    End;
    OrderBudget_pi.save;
    CodigoRegistro := OrderBudget_pi.order.Registro.Codigo;
end;

procedure TTasOrderBudgetPi.SaveRt;
Var
LcOperacao : String;
LcBudgetRt : TControllerOrderBudgetItemPiRt;
begin
  if cds_items_rt.ChangeCount > 0 then
  Begin
    LcBudgetRt := TControllerOrderBudgetItemPiRt.create(Self);

     cds_items_rt.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_items_rt.eof do
    Begin
      with LcBudgetRt.Registro do
      Begin
        Codigo             := cds_items_rt.FieldByName('id').AsInteger;
        Estabelecimento    := cds_items_rt.FieldByName('tb_institution_id').AsInteger;
        Ordem              := OrderBudget_pi.Order.Registro.Codigo;
        Veiculo            := cds_items_rt.FieldByName('tb_broadcaster_id').AsInteger;
        Posicao            := cds_items_rt.FieldByName('tb_med_pos_prog_id').AsInteger;
        TempoDuracao       := cds_items_rt.FieldByName('tm_duration').AsString;
        Testemunhal        := cds_items_rt.FieldByName('testimonial').AsString;
        AumentoTestemunhal := cds_items_rt.FieldByName('increase_testemonial').AsFloat;

        RegistroCriado     := cds_items_rt.FieldByName('created_at').AsDateTime;
        RegistroAlterado   := cds_items_rt.FieldByName('updated_at').AsDateTime;

        case cds_items_rt.UpdateStatus of
          usModified: LcBudgetRt.update;
          usInserted: LcBudgetRt.insert;
        end;
      End;
      cds_items_rt.next;
    End;
    cds_items_rt.MergeChangeLog;
  End;
end;

procedure TTasOrderBudgetPi.Sb_Chance_jrClick(Sender: TObject);
begin
 changeItemsjr(cds_items_jr.FieldByName('id').AsInteger);
end;

procedure TTasOrderBudgetPi.Sb_Delet_jrClick(Sender: TObject);
begin
  DeletDateJr;
  OpenDeletePartsJr;
end;

procedure TTasOrderBudgetPi.Sb_Insert_jrClick(Sender: TObject);
begin
  insertItemsJr(0);
end;

procedure TTasOrderBudgetPi.Sb_insert_rtClick(Sender: TObject);
begin
  insertItemsRt(0);
end;

procedure TTasOrderBudgetPi.setVariable;
begin
with OrderBudget_pi do
  Begin
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Registro.Codigo := CodigoRegistro;
    getByKey;

    Order.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Order.Registro.Codigo := CodigoRegistro;
    Order.getByKey;

  End;
  inherited;
end;

procedure TTasOrderBudgetPi.ShowAdvertiser;
begin
  FrAdvertiser := TFmAdvertiser.Create(Self);
  FrAdvertiser.Parent := Ctn_Advertiser;
  FrAdvertiser.Align := alClient;
  FrAdvertiser.Listar;
  FrAdvertiser.Show;
end;

procedure TTasOrderBudgetPi.ShowAgency;
begin
  FrAgency := TfmAgency.Create(Self);
  FrAgency.Parent := Ctn_Agency;
  FrAgency.Align := alClient;
  FrAgency.Listar;
  FrAgency.Show;
end;

procedure TTasOrderBudgetPi.ShowData;
begin
  inherited;
  ShowDataOrder;
  ShowDataListJr(cds_items_jr,OrderBudget_pi.Registro.Codigo);
  ShowDataListRt(cds_items_rt,OrderBudget_pi.Registro.Codigo);
end;

procedure TTasOrderBudgetPi.ShowDataListJr(cds_Items: TClientDataSet;order_id: Integer);
Var
  I : Integer;
  Registro : TOrderBudItMedJr;
  LcOrderPijr : TControllerOrderBudgedItemPiJr;
  LcEntity : TControllerEntity;
begin
  LcOrderPijr := TControllerOrderBudgedItemPiJr.create(Self);
  LcEntity := TControllerEntity.create(Self);
  LcOrderPijr.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  LcOrderPijr.Registro.ordem := order_id;
  LcOrderPijr.getList;

  with cds_items  do
  Begin
    if not Active then CreateDataSet;
    cds_items.LogChanges := False;
    cds_items.EmptyDataSet;
    for I := 0 to LcOrderPijr.Lista.Count - 1 do
    Begin
      Registro := LcOrderPijr.Lista[I];
      Append;
      FieldByName('id').AsInteger                 := registro.Codigo;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName ('tb_order_id').AsInteger       := Registro.Ordem;
      FieldByName('tb_broadcaster_id').AsInteger  := Registro.Veiculo;
      LcEntity.Registro.Codigo := Registro.Veiculo;
      LcEntity.getByKey;
      FieldByName('name_company').AsString := LcEntity.Registro.NomeRazao;
      FieldByName('nr_column').AsString           := Registro.Coluna;
      FieldByName('nr_height').AsString           := Registro.Altura;
      FieldByName('color').AsString               := Registro.Cor;
      FieldByName('day').AsString                 := Registro.Dia;
      FieldByName('aliq_desc').AsFloat            := Registro.Desconto ;
      FieldByName('unit_value').AsFloat           := Registro.ValorUnitario;
      FieldByName('insertion').AsInteger          := Registro.insercao;
      FieldByName('created_at').AsDateTime        := Registro.RegistroCriado;
      FieldByName('updated_at').AsDateTime        := Registro.RegistroAlterado;

      Post;
    End;
  End;
  cds_items.LogChanges := True;
end;

procedure TTasOrderBudgetPi.ShowDataListRt(cds_Items: TClientDataSet;order_id: Integer);
Var
  I : Integer;
  Registro : TOrderBudItMedRt;
  LcOrderPiRt : TControllerOrderBudgetItemPiRt;
  LcEntity : TControllerEntity;
begin
  LcOrderPiRt := TControllerOrderBudgetItemPiRt.create(Self);
  LcEntity := TControllerEntity.create(Self);
  LcOrderPiRt.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  LcOrderPiRt.Registro.ordem := order_id;
  LcOrderPiRt.getList;

  with cds_items  do
  Begin
    if not Active then CreateDataSet;
    cds_items.LogChanges := False;
    cds_items.EmptyDataSet;
    for I := 0 to LcOrderPirt.Lista.Count - 1 do
    Begin
      Registro := LcOrderPirt.Lista[I];
      Append;
      FieldByName('id').AsInteger                 := registro.Codigo;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName ('tb_order_id').AsInteger       := Registro.Ordem;
      FieldByName('tb_broadcaster_id').AsInteger  := Registro.Veiculo;
      LcEntity.Registro.Codigo := Registro.Veiculo;
      LcEntity.getByKey;
      FieldByName('name_company').AsString        := LcEntity.Registro.NomeRazao;
      FieldByName('tm_duration').AsString         := Registro.TempoDuracao;
      FieldByName('testimonial').AsString         := Registro.Testemunhal;
      FieldByName('increase_testemonial').AsFloat := Registro.AumentoTestemunhal;
      FieldByName('created_at').AsDateTime        := Registro.RegistroCriado;
      FieldByName('updated_at').AsDateTime        := Registro.RegistroAlterado;

      Post;
    End;
  End;
  cds_items.LogChanges := True;
end;

procedure TTasOrderBudgetPi.ShowDataOrder;
begin
  With OrderBudget_pi do
  begin
    Dtp_dt_inicial.DateTime   := Order.Registro.Data;

    E_number.Text             := IntToStr(Registro.Numero);
    E_validade.Text           := Registro.Validade;
    dtp_vencimento.DateTime   := Registro.vencimento;
    E_contact.Text            := Registro.Contato;
    E_phone.Text              := Registro.Telefone;
    E_email.Text              := Registro.email;
    E_assignature.Text        := Registro.Assinatura;
    E_email_resp.Text         := Registro.EmailResponsavel;
    //E_total_value.Text  :=
    if Registro.Arquivado = 'S'  then
      chbx_filed.Checked := True
     else
      chbx_filed.Checked := False;

    if  Registro.TipoMidia = 0  then
        Rg_type.ItemIndex := 0
      else
        Rg_type.ItemIndex := 1;

    FrAgency.DBLCB_Lista.KeyValue       := Registro.Agencia;
    FrAdvertiser.DBLCB_Lista.KeyValue   := Registro.Anunciante;
    FrPaymentType.DBLCB_Lista.KeyValue  := Registro.TipoPagamento;
  end;
end;

procedure TTasOrderBudgetPi.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasOrderBudgetPi.ShowPaymentType;
begin
  FrPaymentType := TfmPaymentType.Create(Self);
  FrPaymentType.Parent := Ctn_Payment_Type;
  FrPaymentType.Align := alClient;
  FrPaymentType.Listar;
  FrPaymentType.Show;
end;

procedure TTasOrderBudgetPi.UniSpeedButton2Click(Sender: TObject);
begin
 changeItemsRt(cds_items_Rt.FieldByName('id').AsInteger);
end;

procedure TTasOrderBudgetPi.UniSpeedButton3Click(Sender: TObject);
begin
  DeletDateRt;
  OpenDeletePartsRt;
end;

function TTasOrderBudgetPi.ValidaInsert: boolean;
begin
 Result := True;
end;

function TTasOrderBudgetPi.ValidateDelete: boolean;
begin
  Result := True;
end;

function TTasOrderBudgetPi.ValidateSave: boolean;
begin
  Result := True;
end;

end.
