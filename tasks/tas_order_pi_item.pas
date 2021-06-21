unit tas_order_pi_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, Vcl.Menus, uniMainMenu,
  uniButton,  uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, base_registry, uniBasicGrid, uniDBGrid, uniLabel, uniEdit, ControllerMedMaterial,
  ControllerMedPosProg, fm_med_material, fm_med_pos_prog, ControllerMedParts, msg_form, unmessages,
  ControllerMedInsertDate, uniDateTimePicker, MainModule,Datasnap.DBClient,
  Data.DB, uniBitBtn;

type
  TTasOrderPiItem = class(TBaseRegistry)
    pnl_data: TUniPanel;
    pnl_pecas: TUniPanel;
    pnl_totalizador: TUniPanel;
    E_TableGross: TUniFormattedNumberEdit;
    E_Discount_Value: TUniFormattedNumberEdit;
    E_Negotiaded: TUniFormattedNumberEdit;
    E_total_value: TUniFormattedNumberEdit;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    pnl_detalhe: TUniPanel;
    E_Ttittle: TUniEdit;
    UniLabel4: TUniLabel;
    Ctn_Med_Pos_Prog: TUniContainerPanel;
    pnl_Custom: TUniPanel;
    Ctn_Med_Material: TUniContainerPanel;
    dbg_dt_insertion: TUniDBGrid;
    UniPanel8: TUniPanel;
    UniLabel12: TUniLabel;
    Dt_dt_insertion: TUniDateTimePicker;
    UniLabel19: TUniLabel;
    E_qt_insertion: TUniEdit;
    UniLabel20: TUniLabel;
    E_nr_repetition: TUniEdit;
    Sb_exc_data: TUniSpeedButton;
    Sb_ins_data: TUniSpeedButton;
    cds_data_ins_local: TClientDataSet;
    cds_data_ins_localid: TIntegerField;
    cds_data_ins_localtb_institution_id: TIntegerField;
    cds_data_ins_localtb_med_parts_id: TIntegerField;
    cds_data_ins_localdt_insertion: TDateField;
    cds_data_ins_localweek_day: TStringField;
    cds_data_ins_localqt_insertion: TIntegerField;
    cds_data_ins_localtb_order_id: TIntegerField;
    ds_data_ins_local: TDataSource;
    pnl_botao_data: TUniPanel;
    procedure Ub_InsertDateClick(Sender: TObject);
    procedure Ub_DeleteDateClick(Sender: TObject);
    procedure SB_CancelClick(Sender: TObject);
    procedure SB_SaveClick(Sender: TObject);
    procedure PriceListChange(Sender: TObject);
  private

  protected
    FrMedMaterial : TFmMedMaterial;
    FrMedPosProg : TFmMedPosProg;
    procedure setVariable; override;
    procedure setImages;Override;
    procedure FormatScreen;Override;

    procedure getTablePriceValue;Virtual;
    procedure totalizer;Virtual;

    function ValidateSave: boolean;Virtual;
    procedure EditionControl;Override;

    procedure ShowMedPosProg;virtual;

    function getNext(cds: TClientDataSet) :Integer;
    procedure ShowMedMaterial;

    Procedure DeleteInsertDate;
    procedure ShowData;Override;
    Procedure ShowDataInsertDate;
    procedure DeletedDate;
    procedure SaveInsertDate;
    procedure Save;Override;
    function getNumberInsrtion:Integer;
  public
    MedInsertDate : TControllerMedInsertDate;
    cds_Parts: TClientDataSet;
    cds_insertion: TClientDataSet;
    CodigoVeiculo : Integer;
    function ValidateParts: boolean;
    procedure AppendInsertDate;

  end;

var
  TasOrderPiItem: TBaseForm;

implementation

{$R *.dfm}

uses
  UnFunctions,
  unitconstantes,
  ClasseUtil;

{ TTasOrderPiItem }

procedure TTasOrderPiItem.DeletedDate;
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_data_ins_local.ChangeCount > 0 then
  Begin
    Try
      cds_temp := TClientDataSet.Create(Self);
      cds_temp.Data := cds_data_ins_local.Delta;
      cds_temp.First;
      //Trata somente os dados deletados
      while not cds_temp.eof do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          if cds_insertion.Locate('id',cds_Temp.FieldByName('id').AsInteger,[]) then
            cds_insertion.Delete;
        End;
        cds_temp.Next;
      end;
    Finally
      cds_temp.Close;
      FreeAndNil(cds_temp);
    End;
  End;
end;

procedure TTasOrderPiItem.DeleteInsertDate;
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
        self.cds_data_ins_local.Delete;
      End;
    end
    );

  end;
end;



procedure TTasOrderPiItem.EditionControl;
begin

end;

procedure TTasOrderPiItem.FormatScreen;
begin
  inherited;
  ShowMedMaterial;
  ShowMedPosProg;
end;

function TTasOrderPiItem.getNext(cds: TClientDataSet): Integer;
Var
  Marcador : TBookmark;
begin
 with cds do
  Begin
    if not cds.Active then cds.createDataset;
    marcador:= GetBookmark;
    try
      DisableControls;
      Result := 0;
      try
        filtered :=False;
        First;
        while not Eof do
        begin
          if FieldByName('id').AsInteger >Result then
            Result :=  fieldbyname('id').AsInteger;
          Next;
        end;
      finally
        filtered :=True;
        EnableControls;
      end;
    finally
      GotoBookmark(marcador);
      FreeBookmark(marcador);
    end;
  End;
  inc(Result);
end;

function TTasOrderPiItem.getNumberInsrtion: Integer;
begin
  REsult := 0;
  if not cds_data_ins_local.Active then cds_data_ins_local.createDataset;
  while not cds_data_ins_local.eof do
  Begin
    REsult := REsult + cds_data_ins_localqt_insertion.AsInteger;
    cds_data_ins_local.next;
  End;
end;

procedure TTasOrderPiItem.getTablePriceValue;
begin

end;

procedure TTasOrderPiItem.PriceListChange(Sender: TObject);
begin
  getTablePriceValue;
  totalizer;
end;

procedure TTasOrderPiItem.AppendInsertDate;
var
  I : integer;
  DataId : Integer;
begin
  with cds_data_ins_local do
  Begin
    if not cds_data_ins_local.Active then cds_data_ins_local.createDataset;
    if (CodigoRegistro = 0) then  CodigoRegistro := Self.getNext(cds_Parts);
    for I := 0 to StrToIntDef(E_nr_repetition.Text,1)- 1 do
    begin
      DataId := getNext(cds_data_ins_local);
      Append;
      FieldByName('id').AsInteger := DataId;
      FieldByName('tb_institution_id').AsInteger  := UMM.GInstitution.registro.Codigo;
      FieldByName('tb_med_parts_id').AsInteger    := CodigoRegistro;
      FieldByName('tb_order_id').AsInteger      := cds_Parts.FieldByName('tb_order_id').AsInteger;
      FieldByName('dt_insertion').AsDateTime    := Dt_dt_insertion.DateTime + I;
      FieldByName('week_day').AsString          := DiaDaSemana(Dt_dt_insertion.DateTime + I);
      FieldByName('qt_insertion').AsInteger     := StrToIntDef(E_qt_insertion.Text, 1);
      Post;
    end;
    Active := False;
    Active := True;
  End;
end;

procedure TTasOrderPiItem.Save;
begin
  DeletedDate;
  SaveInsertDate;
end;

procedure TTasOrderPiItem.SaveInsertDate;
Var
  LcOperacao : String;
begin
  if cds_data_ins_local.ChangeCount > 0 then
  Begin
     cds_data_ins_local.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_data_ins_local.eof do
    Begin
        case cds_data_ins_local.UpdateStatus of
          usModified:Begin
            cds_insertion.Locate('id',cds_data_ins_local.FieldByName('id').AsInteger,[]);
            cds_insertion.Edit;
            cds_insertion.FieldByName('id').AsInteger                 := cds_data_ins_local.FieldByName('id').AsInteger;
            cds_insertion.FieldByName('tb_institution_id').AsInteger  := cds_data_ins_local.FieldByName('tb_institution_id').AsInteger;
            cds_insertion.FieldByName('tb_order_id').AsInteger        := cds_data_ins_local.FieldByName('tb_order_id').AsInteger;
            cds_insertion.FieldByName('tb_med_parts_id').AsInteger    := cds_data_ins_local.FieldByName('tb_med_parts_id').AsInteger;
            cds_insertion.FieldByName('dt_insertion').AsDateTime      := cds_data_ins_local.FieldByName('dt_insertion').AsDateTime;
            cds_insertion.FieldByName('week_day').AsString            := cds_data_ins_local.FieldByName('week_day').AsString;
            cds_insertion.FieldByName('qt_insertion').AsInteger       := cds_data_ins_local.FieldByName('qt_insertion').AsInteger;
            cds_insertion.Post;
          End;
          usInserted:Begin
            cds_insertion.Append;
            cds_insertion.FieldByName('id').AsInteger                 := cds_data_ins_local.FieldByName('id').AsInteger;
            cds_insertion.FieldByName('tb_institution_id').AsInteger  := cds_data_ins_local.FieldByName('tb_institution_id').AsInteger;
            cds_insertion.FieldByName('tb_order_id').AsInteger        := cds_data_ins_local.FieldByName('tb_order_id').AsInteger;
            cds_insertion.FieldByName('tb_med_parts_id').AsInteger    := cds_data_ins_local.FieldByName('tb_med_parts_id').AsInteger;
            cds_insertion.FieldByName('dt_insertion').AsDateTime      := cds_data_ins_local.FieldByName('dt_insertion').AsDateTime;
            cds_insertion.FieldByName('week_day').AsString            := cds_data_ins_local.FieldByName('week_day').AsString;
            cds_insertion.FieldByName('qt_insertion').AsInteger       := cds_data_ins_local.FieldByName('qt_insertion').AsInteger;
            cds_insertion.Post;
          End;
          usDeleted:Begin
            cds_insertion.Delete;
          End;
        end;
      cds_data_ins_local.next;
    End;
    cds_data_ins_local.MergeChangeLog;
  End;
end;

procedure TTasOrderPiItem.SB_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TTasOrderPiItem.SB_SaveClick(Sender: TObject);
begin
  Save;
  Close;
end;

procedure TTasOrderPiItem.setImages;
begin
  buttonIcon(Sb_Save,'save.bmp');
  buttonIcon(Sb_Cancel,'cancel.bmp');
  buttonIcon(sb_exc_data,'mini_delete.bmp');
  buttonIcon(sb_ins_data,'mini_insert.bmp');
end;

procedure TTasOrderPiItem.setVariable;
begin
  if ( CodigoRegistro > 0 ) then
    ShowData
  else
    ShowNoData;
end;

procedure TTasOrderPiItem.ShowMedMaterial;
begin
  FrMedMaterial := TfmMedMaterial.Create(Self);
  FrMedMaterial.Parent := Ctn_Med_Material;
  FrMedMaterial.Listar;
  FrMedMaterial.Align := alClient;
  FrMedMaterial.Show;
end;

procedure TTasOrderPiItem.ShowMedPosProg;
begin
  FrMedPosProg := TfmMedPosProg.Create(Self);
  FrMedPosProg.Parent := Ctn_Med_Pos_Prog;
  FrMedPosProg.CodigoVeiculo := Self.CodigoVeiculo;
  FrMedPosProg.listar;
  FrMedPosProg.Align := alClient;
  FrMedPosProg.DBLCB_Lista.OnExit := PriceListChange;
  FrMedPosProg.Show;
end;


procedure TTasOrderPiItem.totalizer;
begin

end;

procedure TTasOrderPiItem.Ub_DeleteDateClick(Sender: TObject);
begin
  DeleteInsertDate;
end;

procedure TTasOrderPiItem.ShowData;
begin
  ShowDataInsertDate;
end;

procedure TTasOrderPiItem.ShowDataInsertDate;
Var
  I : Integer;
begin
  if not cds_data_ins_local.Active then cds_data_ins_local.CreateDataSet;
  cds_data_ins_local.LogChanges := False;
  cds_data_ins_local.EmptyDataSet;
  cds_Insertion.First;
  while not cds_Insertion.Eof do
  BEgin
    if (cds_Insertion.FieldByName('tb_med_parts_id').AsInteger = CodigoRegistro ) then
    Begin
      cds_data_ins_local.Append;
      cds_data_ins_local.FieldByName('id').AsInteger                 := cds_Insertion.FieldByName('id').AsInteger;
      cds_data_ins_local.FieldByName('tb_institution_id').AsInteger  := cds_Insertion.FieldByName('tb_institution_id').AsInteger;
      cds_data_ins_local.FieldByName('tb_order_id').AsInteger        := cds_Insertion.FieldByName('tb_order_id').AsInteger;
      cds_data_ins_local.FieldByName('tb_med_parts_id').AsInteger    := cds_Insertion.FieldByName('tb_med_parts_id').AsInteger;
      cds_data_ins_local.FieldByName('dt_insertion').AsDateTime      := cds_Insertion.FieldByName('dt_insertion').AsDateTime;
      cds_data_ins_local.FieldByName('week_day').AsString            := cds_Insertion.FieldByName('week_day').AsString;
      cds_data_ins_local.FieldByName('qt_insertion').AsInteger       := cds_Insertion.FieldByName('qt_insertion').AsInteger;
      cds_data_ins_local.Post;
    End;
    cds_Insertion.Next;
  End;
  cds_data_ins_local.LogChanges := True;
end;

procedure TTasOrderPiItem.Ub_InsertDateClick(Sender: TObject);
begin
  AppendInsertDate;
end;

function TTasOrderPiItem.ValidateSave: boolean;
Begin
  result := True;
end;

function TTasOrderPiItem.ValidateParts: boolean;
Begin
  Result := True;
  if trim( E_Ttittle.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Titulo não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrMedMaterial.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Material não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrMedPosProg.DBLCB_Lista.Text ) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Posição Peças não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(E_TableGross.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Tabela Bruto não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(E_Negotiaded.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Valor Negociado não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(E_total_value.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Valor Total não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(E_qt_insertion.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Inserção não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

    if trim(E_nr_repetition.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Repetição não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
