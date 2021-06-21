unit cad_delivery_range;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniPanel, Vcl.Menus, uniMainMenu, Data.DB, Datasnap.DBClient, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniBasicGrid, uniDBGrid,
  ControllerDeliveryRange, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TCadDeliveryRange = class(TBaseRegistry)
    pnl_row_1: TUniPanel;
    E_km_from: TUniFormattedNumberEdit;
    E_km_to: TUniFormattedNumberEdit;
    e_km_value: TUniFormattedNumberEdit;
    pnl_botao_item: TUniPanel;
    sb_Delete_Items: TUniSpeedButton;
    sb_change_Items: TUniSpeedButton;
    sb_cancel_Items: TUniSpeedButton;
    sb_save_Items: TUniSpeedButton;
    sb_Insert_Items: TUniSpeedButton;
    dbg_List_items: TUniDBGrid;
    ds_delivery_range: TDataSource;
    cds_delivery_range: TClientDataSet;
    cds_delivery_rangeid: TIntegerField;
    cds_delivery_rangetb_institution_id: TIntegerField;
    cds_delivery_rangekm_from: TIntegerField;
    cds_delivery_rangekm_to: TIntegerField;
    cds_delivery_rangekm_value: TFloatField;
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_change_ItemsClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);
    procedure sb_save_ItemsClick(Sender: TObject);
    procedure sb_cancel_ItemsClick(Sender: TObject);
    procedure SB_SaveClick(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);
  private
    { Private declarations }
    CodigoTabela : Integer;
    procedure ClearAllFields;override;
    procedure editData;
    procedure ShowData;
    procedure ShowList;
    function validateSaveItems:boolean;
    procedure saveITems;


  protected

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure FormatScreen;Override;


    procedure EditionControl;Override;

    function ValidaInsert():boolean;
    procedure Insert;

    function ValidateDelete():boolean;
    procedure Delete;

    procedure DeletedItems(cds_Items : TClientDataSet);
    procedure Save;





  public
    { Public declarations }
    DeliveryRange :TControllerDeliveryRange;
  end;

var
  CadDeliveryRange: TCadDeliveryRange;

implementation

{$R *.dfm}

uses unMessages, msg_form,UnFunctions, MainModule;


procedure TCadDeliveryRange.ClearAllFields;
begin
  inherited;

end;

procedure TCadDeliveryRange.Delete;
begin
  cds_delivery_range.Delete;
end;


procedure TCadDeliveryRange.DeletedItems(cds_Items: TClientDataSet);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_delivery_range.ChangeCount > 0 then
  Begin
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_delivery_range.Delta;
    cds_temp.First;
    cds_delivery_range.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      with DeliveryRange do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Detalhe
          Registro.Codigo               := cds_Temp.FieldByName('id').AsInteger;
          Registro.Estabelecimento      := UMM.GInstitution.registro.Codigo;
          delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    cds_temp.DisposeOf;
  End;

end;

procedure TCadDeliveryRange.editData;
begin
  with cds_delivery_range do
  Begin
    CodigoTabela      := FieldByName('id').AsInteger;
    E_km_from.Value   := FieldByName('km_from').AsInteger;
    E_km_to.Value     := FieldByName('km_to').AsInteger;
    e_km_value.Value  := FieldByName('km_value').AsInteger;
  End;
end;

procedure TCadDeliveryRange.EditionControl;
begin
  EditionControler(Self);
  sb_Insert_Items.Enabled := ( EditionState = 'B' ) and PInsert;
  sb_change_Items.Enabled := ( EditionState = 'B' ) and ( cds_delivery_range.RecordCount > 0 ) and pUpdate;
  sb_Delete_Items.Enabled := ( EditionState = 'B' ) and ( cds_delivery_range.RecordCount  > 0 ) and PDelete;
  sb_save_Items.Enabled   := ( EditionState = 'I' ) or ( EditionState = 'E' );
  sb_cancel_Items.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );

  SB_Save.Enabled         := ( EditionState = 'B' );
  Sb_Close.Enabled       := ( EditionState = 'B' );

end;

procedure TCadDeliveryRange.FormatScreen;
begin
  inherited;

end;

procedure TCadDeliveryRange.InitVariable;
begin
  inherited;
  DeliveryRange := TControllerDeliveryRange.Create(Self);
end;

procedure TCadDeliveryRange.Insert;
begin
  ClearAllFields;
  CodigoTabela := 0;
  setFocus(E_km_from.JSName);
end;

procedure TCadDeliveryRange.Save;
Var
  LcOperacao : String;
begin
  DeletedItems(cds_delivery_range);
  with cds_delivery_range do
  Begin
    if ChangeCount > 0 then
    Begin
      First;
      //Trata somente os dados Inseridos ou Alterados
      while not eof do
      Begin
        with DeliveryRange do
        Begin
          Registro.Codigo           := FieldByName('id').AsInteger;
          Registro.Estabelecimento  := FieldByName('tb_institution_id').asInteger;
          Registro.DoKM             := FieldByName('km_from').AsInteger;
          Registro.AteKM            := FieldByName('km_to').AsInteger;
          Registro.ValorKM          := FieldByName('km_value').AsFloat;

          case cds_delivery_range.UpdateStatus of
            usModified: DeliveryRange.update;
            usInserted: DeliveryRange.insert;
          end;
        End;
        next;
      End;
      MergeChangeLog;
    End;
  End;

end;


procedure TCadDeliveryRange.saveITems;
begin
  with cds_delivery_range do
  Begin
    if EditionState = 'I' then
      Append
    else
      edit;
    FieldByName('tb_institution_id').AsInteger  := umm.GInstitution.Registro.Codigo;
    FieldByName('id').AsInteger       := CodigoTabela;
    FieldByName('km_from').AsInteger  := StrToIntDef(E_km_from.Text,0);
    FieldByName('km_to').AsInteger    := StrToIntDef(E_km_to.Text,0);
    FieldByName('km_value').AsFloat   := e_km_value.Value;
    Post;
  End;

end;

procedure TCadDeliveryRange.sb_cancel_ItemsClick(Sender: TObject);
begin
  ClearAllFields;
  EditionState := 'B';
  EditionControl;
end;

procedure TCadDeliveryRange.sb_change_ItemsClick(Sender: TObject);
begin
  EditionState := 'E';
  EditionControl;
  editData;
end;

procedure TCadDeliveryRange.Sb_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TCadDeliveryRange.sb_Delete_ItemsClick(Sender: TObject);
begin
  if ValidateDelete then
    Delete;

end;

procedure TCadDeliveryRange.sb_Insert_ItemsClick(Sender: TObject);
begin
  if ValidaInsert then
  Begin
    EditionState := 'I';
    EditionControl;
    Insert;
  End;
end;

procedure TCadDeliveryRange.SB_SaveClick(Sender: TObject);
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

procedure TCadDeliveryRange.sb_save_ItemsClick(Sender: TObject);
begin
  if validateSaveItems then
  Begin
    saveITems;
    ClearAllFields;
    EditionState := 'B';
    EditionControl;
  End;

end;

procedure TCadDeliveryRange.setImages;
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

procedure TCadDeliveryRange.SetVariable;
begin
  ShowData;
end;

procedure TCadDeliveryRange.ShowData;
begin
  CodigoTabela := 0;
  ShowList;
  EditionState := 'B';
  EditionControl;
end;

procedure TCadDeliveryRange.ShowList;
Var
  I : Integer;
begin
  DeliveryRange.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  DeliveryRange.getList;
  with cds_delivery_range,DeliveryRange  do
  Begin
    if not Active then CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to Lista.Count - 1 do
    Begin
      Append;
      FieldByName('tb_institution_id').AsInteger  := Lista[I].Estabelecimento;
      FieldByName('id').AsInteger                 := Lista[I].Codigo;
      FieldByName('km_from').AsInteger            := Lista[I].DoKM;
      FieldByName('km_to').AsInteger              := Lista[I].AteKM;
      FieldByName('km_value').AsFloat             := Lista[I].ValorKM;
      Post;
    End;
  End;
  cds_delivery_range.LogChanges := True;

end;

function TCadDeliveryRange.ValidaInsert: boolean;
begin
  REsult := True;
end;

function TCadDeliveryRange.ValidateDelete: boolean;
begin
  Result := True;
  if cds_delivery_range.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para Excluir.',
                  'Verifiqe e tente novamente.']);
    Result := False;
    exit;
  End;

end;



function TCadDeliveryRange.validateSaveItems: boolean;
begin
  REsult := True;
  if ( StrToIntDef(E_km_from.Text,0) < 0) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Do Km Inicial  não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if ( StrToIntDef(E_km_to.Text,0) <= 0 ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Até o Km Final menor ou igual a zero.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if ( StrToIntDef(E_km_to.Text,0) <= StrToIntDef(E_km_from.Text,0) ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Até o Km Final deve ser maior que o campo Do Km Inicial.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;


  if ( StrToFloatDef(e_km_value.Text,0) < 0 ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Valor do Km não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
