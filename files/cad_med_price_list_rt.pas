unit cad_med_price_list_rt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry,uniEdit, uniLabel,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, MainModule, Datasnap.Provider, Data.DB,
  Datasnap.DBClient, ControllerMedPriceListRT, TblMedPriceListRT, unMessages,
  fm_med_pos_prog, ControllerMedPosProg, Vcl.Menus, uniMainMenu, base_form;

type
  TCadMedPriceListRt = class(TBaseRegistry)
    pnl_row_1: TUniPanel;
    dbg_List_items: TUniDBGrid;
    pnl_row_2: TUniPanel;
    E_spot15: TUniFormattedNumberEdit;
    E_spot30: TUniFormattedNumberEdit;
    e_schedule: TUniEdit;
    E_spot45: TUniFormattedNumberEdit;
    E_spot60: TUniFormattedNumberEdit;
    cds_med_price_list: TClientDataSet;
    ds_med_price_list: TDataSource;
    cds_med_price_listtb_institution_id: TIntegerField;
    cds_med_price_listid: TIntegerField;
    cds_med_price_listtb_broadcaster_id: TIntegerField;
    cds_med_price_listdescription: TStringField;
    cds_med_price_listspot15_value: TBCDField;
    cds_med_price_listspot30_value: TBCDField;
    cds_med_price_listspot45_value: TBCDField;
    cds_med_price_listspot60_value: TBCDField;
    cds_med_price_listschedule: TStringField;
    cds_med_price_listcreated_at: TDateTimeField;
    cds_med_price_listupdated_at: TDateTimeField;
    Ctn_Med_Pos_Prog: TUniContainerPanel;
    cds_med_price_listtb_med_pos_prog_id: TIntegerField;
    pnl_row_4: TUniPanel;
    sb_Insert_Items: TUniSpeedButton;
    sb_Delete_Items: TUniSpeedButton;
    sb_change_Items: TUniSpeedButton;
    sb_cancel_Items: TUniSpeedButton;
    sb_save_Items: TUniSpeedButton;
    Sb_example_item: TUniSpeedButton;
    procedure SB_SaveClick(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_change_ItemsClick(Sender: TObject);
    procedure sb_save_ItemsClick(Sender: TObject);
    procedure sb_cancel_ItemsClick(Sender: TObject);
 private
    { Private declarations }
    TabelaID : Integer;
    BroadCasterID : Integer;
    procedure ClearAllFields;override;
    procedure editData;
    procedure ShowData;
    procedure ShowList;
    function validateSaveItems:boolean;
    procedure saveITems;
    procedure calcOnlineValue;
  protected
    FrMedPosProg : TFmMedPosProg;

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;

    procedure ShowMedPosProg;
    procedure EditionControl;Override;

    function ValidaInsert():boolean;
    procedure Insert;

    function ValidateDelete():boolean;
    procedure Delete;

    procedure DeletedItems(cds_Items : TClientDataSet);
    procedure Save;

  public
    PriceList : TControllerMedPriceListRT;
  end;

var
  CadMedPriceListRt: TCadMedPriceListRt;

implementation

{$R *.dfm}

{ TCadMedPriceListRt }

procedure TCadMedPriceListRt.ShowMedPosProg;
begin
  FrMedPosProg := TfmMedPosProg.Create(Self);
  FrMedPosProg.Parent := Ctn_Med_Pos_Prog;
  FrMedPosProg.listar;
  FrMedPosProg.Align := alClient;
  FrMedPosProg.Show;
end;

procedure TCadMedPriceListRt.sb_Delete_ItemsClick(Sender: TObject);
begin
  if ValidateDelete then
    Delete;
end;

procedure TCadMedPriceListRt.sb_Insert_ItemsClick(Sender: TObject);
begin
  if ValidaInsert then
  Begin
    EditionState := 'I';
    EditionControl;
    Insert;
  End;

end;

procedure TCadMedPriceListRt.calcOnlineValue;
begin

end;

procedure TCadMedPriceListRt.ClearAllFields;
begin
  inherited;
  ClearFields(FrMedPosProg);
  ClearFields(Self);
  TabelaID := 0;
end;

procedure TCadMedPriceListRt.Delete;
Begin
  cds_med_price_list.Delete;
end;

procedure TCadMedPriceListRt.DeletedItems(cds_Items: TClientDataSet);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_items.ChangeCount > 0 then
  Begin
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_items.Delta;
    cds_temp.First;
    cds_items.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      with PriceList do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Detalhe
          Registro.Codigo               := cds_Temp.FieldByName('id').AsInteger;
          Registro.Estabelecimento      := UMM.GInstitution.registro.Codigo;
          Registro.Veiculo              := CodigoRegistro;
          delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;


end;

procedure TCadMedPriceListRt.editData;
begin
  with cds_med_price_list do
  Begin
    TabelaID                := FieldByName('id').AsInteger;
    BroadCasterID           := FieldByName('tb_broadcaster_id').AsInteger;
    FrMedPosProg.DBLCB_Lista.KeyValue := FieldByName('tb_med_pos_prog_id').AsInteger;
    E_spot15.value  := FieldByName('spot15_value').AsFloat;
    E_spot30.value  := FieldByName('spot30_value').AsFloat;
    E_spot45.value  := FieldByName('spot45_value').AsFloat;
    E_spot60.value  := FieldByName('spot60_value').AsFloat;
    E_schedule.text := FieldByName('schedule').AsString;
  End;
end;

procedure TCadMedPriceListRt.EditionControl;
begin
  EditionControler(Self);
  sb_Insert_Items.Enabled := ( EditionState = 'B' ) and PInsert;
  sb_change_Items.Enabled := ( EditionState = 'B' ) and ( cds_med_price_list.RecordCount > 0 ) and pUpdate;
  sb_Delete_Items.Enabled := ( EditionState = 'B' ) and ( cds_med_price_list.RecordCount  > 0 ) and PDelete;
  sb_save_Items.Enabled   := ( EditionState = 'I' ) or ( EditionState = 'E' );
  sb_cancel_Items.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );

  SB_Save.Enabled         := ( EditionState = 'B' );
  Sb_Close.Enabled       := ( EditionState = 'B' );
end;

procedure TCadMedPriceListRt.FormatScreen;
begin
  inherited;
  ShowMedPosProg;
end;

procedure TCadMedPriceListRt.InitVariable;
begin
  inherited;
  PriceList := TControllerMedPriceListRT.Create(self);
end;

procedure TCadMedPriceListRt.Insert;
begin
  ClearAllFields;
  setFocus(FrMedPosProg.DBLCB_Lista.JSName);
end;

procedure TCadMedPriceListRt.Save;
Var
  LcOperacao : String;
begin
  DeletedItems(cds_med_price_list);
  with cds_med_price_list do
  Begin
    if ChangeCount > 0 then
    Begin
      First;
      //Trata somente os dados Inseridos ou Alterados
      while not eof do
      Begin
        with PriceList do
        Begin
          Registro.Codigo             := FieldByName('id').AsInteger;
          Registro.Estabelecimento    := FieldByName('tb_institution_id').asInteger;
          Registro.Veiculo            := FieldByName('tb_broadcaster_id').AsInteger;
          Registro.PosicaoProgramacao := FieldByName('tb_med_pos_prog_id').AsInteger;
          Registro.Spot15             := FieldByName('spot15_value').AsFloat;
          Registro.Spot30             := FieldByName('spot30_value').AsFloat;
          Registro.Spot45             := FieldByName('spot45_value').AsFloat;
          Registro.Spot60             := FieldByName('spot60_value').AsFloat;
          Registro.Horario            := FieldByName('schedule').AsString;
          case cds_med_price_list.UpdateStatus of
            usModified: PriceList.update;
            usInserted: PriceList.insert;
          end;
        End;
        next;
      End;
      MergeChangeLog;
    End;
  End;
end;

procedure TCadMedPriceListRt.saveITems;
begin
  with cds_med_price_list do
  Begin
    if EditionState = 'I' then
      Append
    else
      edit;
    FieldByName('tb_institution_id').AsInteger  := UMM.GInstitution.registro.Codigo;
    FieldByName('id').AsInteger                 := TabelaID;
    FieldByName('tb_broadcaster_id').AsInteger  := BroadCasterID;
    FieldByName('tb_med_pos_prog_id').AsInteger := FrMedPosProg.DBLCB_Lista.keyvalue;
    FieldByName('description').AsString         := FrMedPosProg.DBLCB_Lista.Text;
    FieldByName('spot15_value').AsFloat         := E_Spot15.Value;
    FieldByName('spot30_value').AsFloat         := E_Spot30.Value;
    FieldByName('spot45_value').AsFloat         := E_Spot45.Value;
    FieldByName('spot60_value').AsFloat         := E_Spot60.Value;
    FieldByName('schedule').AsString            := E_schedule.Text;
    Post;
  End;

end;

procedure TCadMedPriceListRt.sb_cancel_ItemsClick(Sender: TObject);
begin
  ClearAllFields;
  EditionState := 'B';
  EditionControl;

end;

procedure TCadMedPriceListRt.sb_change_ItemsClick(Sender: TObject);
begin
  EditionState := 'E';
  EditionControl;
  editData;

end;

procedure TCadMedPriceListRt.Sb_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TCadMedPriceListRt.SB_SaveClick(Sender: TObject);
begin
  try
    Self.showMask('Salvando dados...');
    Save;
  finally
    self.HideMask;
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Tabela Atualizada.']);
  end;

end;

procedure TCadMedPriceListRt.sb_save_ItemsClick(Sender: TObject);
begin
  if validateSaveItems then
  Begin
    saveITems;
    ClearAllFields;
    EditionState := 'B';
    EditionControl;
  End;


end;

procedure TCadMedPriceListRt.setImages;
begin
  inherited;
  buttonIcon(sb_Insert_Items,'mini_insert.bmp');
  buttonIcon(sb_change_Items,'mini_change.bmp');
  buttonIcon(sb_Delete_Items,'mini_delete.bmp');
  buttonIcon(sb_save_Items,'mini_save.bmp');
  buttonIcon(sb_cancel_Items,'mini_cancel.bmp');

  buttonIcon(Sb_Save,'save.bmp');
  buttonIcon(Sb_Close,'close.bmp');

end;

procedure TCadMedPriceListRt.SetVariable;
begin
  ShowData;
end;

procedure TCadMedPriceListRt.ShowData;
begin
  TabelaID := 0;
  BroadCasterID := CodigoRegistro;
  ShowList;
  EditionState := 'B';
  EditionControl;
end;

procedure TCadMedPriceListRt.ShowList;
Var
  I : Integer;
  Registro : TMedPriceListRt;
  LcPosicao : TControllerMedPosProg;
begin
  LcPosicao := TControllerMedPosProg.Create(Self);

  PriceList.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  PriceList.Registro.Veiculo := CodigoRegistro;
  PriceList.getList;
  with cds_med_price_list  do
  Begin
    if not Active then CreateDataSet;
    cds_med_price_list.LogChanges := False;
    cds_med_price_list.EmptyDataSet;
    for I := 0 to PriceList.Lista.Count - 1 do
    Begin
      Registro := PriceList.Lista[I];
      Append;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName('id').AsInteger                 := Registro.Codigo;
      FieldByName('tb_broadcaster_id').AsInteger  := Registro.Veiculo;
      FieldByName('tb_med_pos_prog_id').AsInteger := Registro.PosicaoProgramacao;
      //Descrição da posicação
      LcPosicao.Registro.Estabelecimento          := Registro.Estabelecimento;
      LcPosicao.Registro.Codigo                   := Registro.PosicaoProgramacao;
      LcPosicao.getByKey;
      FieldByName('description').AsString         := LcPosicao.Registro.Descricao;

      FieldByName('spot15_value').AsFloat         := Registro.Spot15;
      FieldByName('spot30_value').AsFloat         := Registro.Spot30;
      FieldByName('spot45_value').AsFloat         := Registro.Spot45;
      FieldByName('spot60_value').AsFloat         := Registro.Spot60;
      FieldByName('schedule').AsString            := Registro.Horario;
      Post;
    End;
  End;
  cds_med_price_list.LogChanges := True;

end;

function TCadMedPriceListRt.ValidaInsert: boolean;
begin
  REsult := True;
end;

function TCadMedPriceListRt.ValidateDelete: boolean;
begin
  Result := True;
  if cds_med_price_list.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para Excluir.',
                  'Verifiqe e tente novamente.']);
    Result := False;
    exit;
  End;

end;

function TCadMedPriceListRt.validateSaveItems: boolean;
begin
  REsult := True;
  if ( FrMedPosProg.DBLCB_Lista.KeyValue = null) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_spot15.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Spot 15'' não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_spot30.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Spot 30'' não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_spot45.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Spot 45'' não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_spot60.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Spot 60'' não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
