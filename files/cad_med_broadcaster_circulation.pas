unit cad_med_broadcaster_circulation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniPanel, Vcl.Menus, uniMainMenu, Data.DB, Datasnap.DBClient, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniBasicGrid, uniDBGrid,unMessages,
  fm_StateCity, ControllerBroacasterHasCirculation, TblBroacasterHasCirculaton,
  MainModule, intInteration;

type
  TCadMedBroadcasterCirculation = class(TBaseRegistry)
    pnl_row_1: TUniPanel;
    Ctn_StateCity: TUniContainerPanel;
    e_Number: TUniFormattedNumberEdit;
    dbg_List_items: TUniDBGrid;
    cds_bhc: TClientDataSet;
    ds_bhc: TDataSource;
    cds_bhctb_broadcaster_id: TIntegerField;
    cds_bhctb_city_id: TIntegerField;
    cds_bhcnumber: TIntegerField;
    cds_bhcname: TStringField;
    cds_bhcpopulation: TIntegerField;
    pnl_botao_item: TUniPanel;
    sb_Delete_Items: TUniSpeedButton;
    sb_change_Items: TUniSpeedButton;
    sb_cancel_Items: TUniSpeedButton;
    sb_save_Items: TUniSpeedButton;
    sb_Insert_Items: TUniSpeedButton;
    cds_bhctb_state_id: TIntegerField;
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_change_ItemsClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);
    procedure sb_save_ItemsClick(Sender: TObject);
    procedure sb_cancel_ItemsClick(Sender: TObject);
    procedure SB_SaveClick(Sender: TObject);
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
    FrStataCity : TFmStateCity;

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;

    procedure ShowStateCity;
    procedure EditionControl;Override;

    function ValidaInsert():boolean;
    procedure Insert;

    function ValidateDelete():boolean;
    procedure Delete;

    procedure DeletedItems(cds_Items : TClientDataSet);
    procedure Save;

  public
    Circulation : TControllerBroacasterHasCirculation;

  end;

var
  CadMedBroadcasterCirculation: TCadMedBroadcasterCirculation;

implementation

{$R *.dfm}

{ TCadMedBroadcasterCirculation }

procedure TCadMedBroadcasterCirculation.calcOnlineValue;
begin

end;

procedure TCadMedBroadcasterCirculation.ClearAllFields;
begin
  inherited;
  ClearFields(FrStataCity.FrState);
  ClearFields(FrStataCity.FrCity);
  ClearFields(Self);
end;

procedure TCadMedBroadcasterCirculation.Delete;
begin
  cds_bhc.Delete;
end;

procedure TCadMedBroadcasterCirculation.DeletedItems(cds_Items: TClientDataSet);
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
      with Circulation do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Detalhe
          Registro.Veiculo  := cds_bhc.FieldByName('tb_broadcaster_id').AsInteger;
          Registro.Cidade   := cds_bhc.FieldByName('tb_city_id').AsInteger;
          delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;


end;

procedure TCadMedBroadcasterCirculation.editData;
begin
  with cds_bhc do
  Begin
    FrStataCity.FrState.DBLCB_Lista.KeyValue := FieldByName('tb_state_id').AsInteger;
    FrStataCity.FrCity.Listar(FieldByName('tb_state_id').AsInteger);
//    FrStataCity.FrCity.DBLCB_Lista.KeyValue :=  FieldByName('tb_city_id').AsInteger;
    FrStataCity.FrCity.DBLCB_Lista.Text     :=  FieldByName('name').AsString;
    e_Number.Text :=  FieldByName('number').AsString;
  End;

end;

procedure TCadMedBroadcasterCirculation.EditionControl;
begin
  EditionControler(Self);
  EditionControler(FrStataCity.FrState);
  EditionControler(FrStataCity.FrCity);
  sb_Insert_Items.Enabled := ( EditionState = 'B' ) and PInsert;
  sb_change_Items.Enabled := ( EditionState = 'B' ) and ( cds_bhc.RecordCount > 0 ) and pUpdate;
  sb_Delete_Items.Enabled := ( EditionState = 'B' ) and ( cds_bhc.RecordCount  > 0 ) and PDelete;
  sb_save_Items.Enabled   := ( EditionState = 'I' ) or ( EditionState = 'E' );
  sb_cancel_Items.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );

  SB_Save.Enabled         := ( EditionState = 'B' );
  Sb_Close.Enabled       := ( EditionState = 'B' );

end;

procedure TCadMedBroadcasterCirculation.FormatScreen;
begin
  inherited;
  ShowStateCity;

end;

procedure TCadMedBroadcasterCirculation.InitVariable;
begin
  inherited;
  Circulation := TControllerBroacasterHasCirculation.Create(self);
end;

procedure TCadMedBroadcasterCirculation.Insert;
begin
  ClearAllFields;
  setFocus(FrStataCity.FrCity.DBLCB_Lista.JSName);
end;

procedure TCadMedBroadcasterCirculation.Save;
Var
  LcOperacao : String;
begin
  DeletedItems(cds_bhc);
  with cds_bhc do
  Begin
    if ChangeCount > 0 then
    Begin
      First;
      //Trata somente os dados Inseridos ou Alterados
      while not eof do
      Begin
        with Circulation do
        Begin
          Registro.Cidade   := FieldByName('tb_city_id').AsInteger;
          Registro.Veiculo  := FieldByName('tb_broadcaster_id').asInteger;
          Registro.Numero   := FieldByName('number').AsInteger;
          case cds_bhc.UpdateStatus of
            usModified: Circulation.update;
            usInserted: Circulation.insert;
          end;
        End;
        next;
      End;
      MergeChangeLog;
    End;
  End;
end;

procedure TCadMedBroadcasterCirculation.saveITems;
begin
  with cds_bhc do
  Begin
    if EditionState = 'I' then
      Append
    else
      edit;
    FieldByName('tb_state_id').AsInteger        := FrStataCity.FrState.DBLCB_Lista.KeyValue;
    FieldByName('tb_city_id').AsInteger         := FrStataCity.FrCity.DBLCB_Lista.KeyValue;
    FieldByName('name').AsString                := FrStataCity.FrCity.DBLCB_Lista.Text;
    FieldByName('tb_broadcaster_id').AsInteger  := CodigoRegistro;
    FieldByName('population').AsInteger         := FrStataCity.FrCity.cds_search.FieldByName('population').AsInteger;
    FieldByName('number').AsInteger             := StrToIntDef(E_Number.Text,0);
    Post;
  End;

end;

procedure TCadMedBroadcasterCirculation.sb_cancel_ItemsClick(Sender: TObject);
begin
  ClearAllFields;
  EditionState := 'B';
  EditionControl;
end;

procedure TCadMedBroadcasterCirculation.sb_change_ItemsClick(Sender: TObject);
begin
  EditionState := 'E';
  EditionControl;
  editData;
end;

procedure TCadMedBroadcasterCirculation.sb_Delete_ItemsClick(Sender: TObject);
begin
  if ValidateDelete then
    Delete;

end;

procedure TCadMedBroadcasterCirculation.sb_Insert_ItemsClick(Sender: TObject);
begin
  if ValidaInsert then
  Begin
    EditionState := 'I';
    EditionControl;
    Insert;
  End;
end;

procedure TCadMedBroadcasterCirculation.SB_SaveClick(Sender: TObject);
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

procedure TCadMedBroadcasterCirculation.sb_save_ItemsClick(Sender: TObject);
begin
  if validateSaveItems then
  Begin
    saveITems;
    ClearAllFields;
    EditionState := 'B';
    EditionControl;
  End;
end;

procedure TCadMedBroadcasterCirculation.setImages;
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

procedure TCadMedBroadcasterCirculation.SetVariable;
begin
  ShowData;
end;

procedure TCadMedBroadcasterCirculation.ShowData;
begin
  ShowList;
  EditionState := 'B';
  EditionControl;
end;

procedure TCadMedBroadcasterCirculation.ShowList;
Var
  I : Integer;
begin
  Circulation.Registro.Veiculo := CodigoRegistro;
  Circulation.getListInterface;
  with cds_bhc,Circulation  do
  Begin
    if not Active then CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to ListaIntCoerage.Count - 1 do
    Begin
      //Registro := PriceList.Lista[I];
      Append;
      FieldByName('tb_state_id').AsInteger        := ListaIntCoerage[I].Estado;
      FieldByName('tb_city_id').AsInteger         := ListaIntCoerage[I].Cidade;
      FieldByName('name').AsString                := ListaIntCoerage[I].DescCidade;
      FieldByName('tb_broadcaster_id').AsInteger  := ListaIntCoerage[I].Veiculo;
      FieldByName('population').AsInteger         := ListaIntCoerage[I].Populacao;
      FieldByName('number').AsInteger             := ListaIntCoerage[I].Numero;
      Post;
    End;
  End;
  cds_bhc.LogChanges := True;
end;

procedure TCadMedBroadcasterCirculation.ShowStateCity;
begin
  FrStataCity := TFmStateCity.Create(Self);
  FrStataCity.Parent := Ctn_StateCity;
  FrStataCity.FrState.listar(1058);
  FrStataCity.FrState.DBLCB_Lista.KeyValue := UMM.GInstitution.Fiscal.Endereco.Registro.CodigoEstado;
  FrStataCity.FrCity.Listar(UMM.GInstitution.Fiscal.Endereco.Registro.CodigoEstado);
  FrStataCity.Align := alClient;
  FrStataCity.Show;

end;

function TCadMedBroadcasterCirculation.ValidaInsert: boolean;
begin
  REsult := True;
end;

function TCadMedBroadcasterCirculation.ValidateDelete: boolean;
begin
  Result := True;
  if cds_bhc.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para Excluir.',
                  'Verifiqe e tente novamente.']);
    Result := False;
    exit;
  End;
end;

function TCadMedBroadcasterCirculation.validateSaveItems: boolean;
begin
  REsult := True;
  if ( FrStataCity.FrCity.DBLCB_Lista.KeyValue = null) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Cidade não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(e_Number.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Tiragem não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;

end.
