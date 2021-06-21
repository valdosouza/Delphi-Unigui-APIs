unit cad_med_price_list_ol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniEdit, uniLabel,base_registry,
  uniGUIClasses, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, MainModule, Datasnap.Provider, Data.DB,ControllerMedPriceListOL,
  Datasnap.DBClient,  TblMedPriceListOL, unMessages,
  fm_med_pos_prog, ControllerMedPosProg, Vcl.Menus, uniMainMenu, uniFileUpload,
  uniGUITypes;

type
  TCadMedPriceListOl = class(TBaseRegistry)
    dbg_List_items: TUniDBGrid;
    pnl_row_3: TUniPanel;
    E_Daily: TUniFormattedNumberEdit;
    E_position: TUniEdit;
    e_formats: TUniEdit;
    E_DEscription: TUniEdit;
    cds_med_price_list: TClientDataSet;
    ds_med_price_list: TDataSource;
    DSP: TDataSetProvider;
    pnl_row_1: TUniPanel;
    cds_med_price_listtb_institution_id: TIntegerField;
    cds_med_price_listid: TIntegerField;
    cds_med_price_listtb_broadcaster_id: TIntegerField;
    cds_med_price_listdescription: TStringField;
    cds_med_price_listformats: TStringField;
    cds_med_price_listprice_value: TBCDField;
    cds_med_price_listdetermination: TIntegerField;
    cds_med_price_listexpansible: TIntegerField;
    cds_med_price_listdaily: TBCDField;
    cds_med_price_listdimensions: TStringField;
    cds_med_price_listposition: TIntegerField;
    cds_med_price_listnote: TBlobField;
    cds_med_price_listcreated_at: TDateTimeField;
    cds_med_price_listupdated_at: TDateTimeField;
    pnl_row_2: TUniPanel;
    E_price_value: TUniFormattedNumberEdit;
    E_Expansible: TUniEdit;
    E_Determination: TUniEdit;
    E_Dimension: TUniEdit;
    E_note: TUniEdit;
    pnl_row_4: TUniPanel;
    sb_Insert_Items: TUniSpeedButton;
    sb_delete_Items: TUniSpeedButton;
    sb_change_Items: TUniSpeedButton;
    sb_cancel_Items: TUniSpeedButton;
    sb_save_Items: TUniSpeedButton;
    cds_med_price_listonline_price: TBCDField;
    cds_med_price_listpageview_min: TIntegerField;
    cds_med_price_listpageview_max: TIntegerField;
    E_PageView_Max: TUniFormattedNumberEdit;
    E_PageView_Min: TUniFormattedNumberEdit;
    E_OnlineVAlue: TUniFormattedNumberEdit;
    cds_med_price_listimg: TStringField;
    UniFileUpload: TUniFileUpload;
    Mnu_Imagem: TUniPopupMenu;
    InserirImagem1: TUniMenuItem;
    ExcluirImagem1: TUniMenuItem;
    VisualizarImage1: TUniMenuItem;
    cds_med_price_listpath_file: TStringField;
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_delete_ItemsClick(Sender: TObject);
    procedure sb_change_ItemsClick(Sender: TObject);
    procedure sb_cancel_ItemsClick(Sender: TObject);
    procedure sb_save_ItemsClick(Sender: TObject);
    procedure SB_SaveClick(Sender: TObject);
    procedure UniFileUploadCompleted(Sender: TObject; AStream: TFileStream);
    procedure InserirImagem1Click(Sender: TObject);
    procedure ExcluirImagem1Click(Sender: TObject);
    procedure VisualizarImage1Click(Sender: TObject);
    procedure dbg_List_itemsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbg_List_itemsDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
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
    procedure createAttachment(Sender: TField; var Text: string;   DisplayText: Boolean);
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

    function ValidateSaveAttachament:Boolean;
    procedure SaveAttachment;
    procedure DeleteAttachment;
    function validateimage:Boolean;


    Public
      PriceList : TControllerMedPriceListOL;
  end;

var
  CadMedPriceListOl: TCadMedPriceListOl;

implementation

{$R *.dfm}

uses UnFunctions, msg_form, img_view;

{ TCadMedPriceListOl }

procedure TCadMedPriceListOl.calcOnlineValue;
begin

end;

procedure TCadMedPriceListOl.ClearAllFields;
begin
  inherited;
  ClearFields(Self);
  TabelaID := 0;
end;

procedure TCadMedPriceListOl.createAttachment(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
    Text := concat('<img src="', cds_med_price_list.FieldByName('path_file').AsString,'"  width="15" height="15">');
end;

procedure TCadMedPriceListOl.dbg_List_itemsDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (Column.FieldName = 'img') then
    Column.Field.OnGetText := createAttachment;

end;

procedure TCadMedPriceListOl.dbg_List_itemsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    Mnu_Imagem.Popup(X, Y, dbg_List_items);
  end;
end;

procedure TCadMedPriceListOl.Delete;
begin
  cds_med_price_list.Delete;
end;

procedure TCadMedPriceListOl.DeleteAttachment;
Var
  Lc_file : String;
  Lc_path : String;
begin
  //carregar o anexo propriamente dito
  UMM.GInstitution.getRepository(True,'');
  Lc_file := concat(cds_med_price_listtb_institution_id.asString,'_',
                    cds_med_price_listid.asString,'_',
                    cds_med_price_listtb_broadcaster_id.AsString,'.jpg');
  Lc_path := concat(UMM.GInstitution.PathPublico,'tb_med_price_list_jr','/');
  DeleteFile(concat(Lc_path,Lc_file));

  cds_med_price_list.Edit;
  cds_med_price_listpath_file.AsString := '';
  cds_med_price_list.post;
end;

procedure TCadMedPriceListOl.DeletedItems(cds_Items: TClientDataSet);
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

procedure TCadMedPriceListOl.editData;
begin
  with cds_med_price_list do
  Begin
    TabelaID                := FieldByName('id').AsInteger;
    BroadCasterID           := FieldByName('tb_broadcaster_id').AsInteger;
    E_DEscription.Text      := FieldByName('description').AsString;
    E_position.Text         := FieldByName('position').AsString;
    e_formats.Text          := FieldByName('formats').AsString;
    E_price_value.Value     := FieldByName('price_value').AsFloat;
    E_Determination.Text    := FieldByName('determination').AsString;
    E_Expansible.Text       := FieldByName('expansible').AsString;
    E_Daily.Value           := FieldByName('daily').AsFloat;
    E_Dimension.Text        := FieldByName('dimensions').AsString;
    E_OnlineVAlue.Value     := FieldByName('online_price').AsFloat;
    E_PageView_Min.Value    := FieldByName('pageview_min').AsInteger;
    E_PageView_Max.Value    := FieldByName('pageview_max').AsInteger;
    E_note.Text             := FieldByName('note').AsString;
  End;

end;

procedure TCadMedPriceListOl.EditionControl;
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

procedure TCadMedPriceListOl.ExcluirImagem1Click(Sender: TObject);
Begin
  if validateimage then
  Begin
    MensageYesNo(['C O N F I R M A Ç Ã O!',
                  '',
                  'Deseja realmente excluir está imagem?',
                  'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        self.DeleteAttachment;
        Self.Save;
      End;
    end
    );
  End;

end;

procedure TCadMedPriceListOl.FormatScreen;
begin
  inherited;
end;

procedure TCadMedPriceListOl.InitVariable;
begin
  inherited;
  PriceList := TControllerMedPriceListOL.Create(self);
end;

procedure TCadMedPriceListOl.InserirImagem1Click(Sender: TObject);
Begin
  if ValidateSaveAttachament then
  begin
    try
      Self.showMask('Salvando Image...');
      SaveAttachment;
      uniFileUpload.TargetFolder := 'c:\Temp\';
      uniFileUpload.Execute;
      Save;
    finally
      self.HideMask;
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Imagem Carregada com Sucesso.']);
    end;
  end;
end;

procedure TCadMedPriceListOl.Insert;
begin
  ClearAllFields;
  setFocus(E_Description.JSName);
end;

procedure TCadMedPriceListOl.Save;
Var
  LcOperacao : String;
begin
  DeletedItems(cds_med_price_list);

  if cds_med_price_list.ChangeCount > 0 then
  Begin
     cds_med_price_list.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_med_price_list.eof do
    Begin
      with PriceList,cds_med_price_list do
      Begin
        Registro.Codigo           := FieldByName('id').AsInteger;
        Registro.Estabelecimento  := FieldByName('tb_institution_id').asInteger;
        Registro.Veiculo          := FieldByName('tb_broadcaster_id').AsInteger;
        Registro.DEscricao        := FieldByName('description').AsString;
        Registro.Posicao          := FieldByName('position').AsInteger;
        Registro.Formato          := FieldByName('formats').AsString;
        Registro.Valor            := FieldByName('price_value').AsFloat;
        Registro.Determinacao     := FieldByName('determination').AsInteger;
        Registro.Expansivel       := FieldByName('expansible').AsInteger;
        Registro.Diaria           := FieldByName('daily').AsFloat;
        Registro.Dimensoes        := FieldByName('dimensions').AsString;
        Registro.OnlinePreco      := FieldByName('online_price').AsFloat;
        Registro.PAgeViewMinimo   := FieldByName('pageview_min').AsInteger;
        Registro.PAgeViewMaximo   := FieldByName('pageview_max').AsInteger;
        Registro.Observacao       := FieldByName('note').AsString;
        Registro.ImageLink        := FieldByName('path_file').AsString;
        case cds_med_price_list.UpdateStatus of
          usModified: PriceList.update;
          usInserted: PriceList.insert;
        end;
      End;
      cds_med_price_list.next;
    End;
    cds_med_price_list.MergeChangeLog;
  End;
end;

procedure TCadMedPriceListOl.SaveAttachment;
Var
  Lc_file : String;
  Lc_path : String;
begin
  //carregar o anexo propriamente dito
  UMM.GInstitution.getRepository(True,'');
  Lc_file := concat(cds_med_price_listtb_institution_id.asString,'_',
                    cds_med_price_listid.asString,'_',
                    cds_med_price_listtb_broadcaster_id.AsString,'.jpg');
  Lc_path := concat(UMM.GInstitution.URL,'tb_med_price_list_ol','/');
  cds_med_price_list.Edit;
  cds_med_price_listpath_file.AsString := concat(Lc_path,Lc_file);
  cds_med_price_list.Post;


end;

procedure TCadMedPriceListOl.saveITems;
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
    FieldByName('description').AsString         := E_DEscription.Text;
    FieldByName('position').AsInteger           := StrToIntDef(E_position.Text,0);
    FieldByName('formats').AsString             := e_formats.Text;
    FieldByName('price_value').AsFloat          := E_price_value.Value;
    FieldByName('determination').AsString       := E_Determination.Text;
    FieldByName('expansible').AsString          := E_Expansible.Text;
    FieldByName('daily').AsFloat                := E_Daily.Value;
    FieldByName('dimensions').AsString          := E_Dimension.Text;
    FieldByName('online_price').AsFloat         := E_OnlineVAlue.Value;
    FieldByName('pageview_min').AsInteger       := StrToIntDef(E_PageView_Min.Text,0);
    FieldByName('pageview_max').AsInteger       := StrToIntDef(E_PageView_Max.Text,0);
    FieldByName('note').AsString                := E_note.Text;
    Post;
  End;

end;

procedure TCadMedPriceListOl.sb_cancel_ItemsClick(Sender: TObject);
begin
  ClearAllFields;
  EditionState := 'B';
  EditionControl;
end;

procedure TCadMedPriceListOl.sb_change_ItemsClick(Sender: TObject);
begin
  EditionState := 'E';
  EditionControl;
  editData;

end;

procedure TCadMedPriceListOl.sb_save_ItemsClick(Sender: TObject);
begin
  if validateSaveItems then
  Begin
    saveITems;
    ClearAllFields;
    EditionState := 'B';
    EditionControl;
  End;

end;

procedure TCadMedPriceListOl.setImages;
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

procedure TCadMedPriceListOl.SetVariable;
begin
  ShowData;
end;

procedure TCadMedPriceListOl.ShowData;
begin
  TabelaID := 0;
  BroadCasterID := CodigoRegistro;
  ShowList;
  EditionState := 'B';
  EditionControl;
end;


procedure TCadMedPriceListOl.ShowList;
Var
  I : Integer;
  Registro : TMedPriceListOL;
begin
  PriceList.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  PriceList.Registro.Veiculo := CodigoRegistro;
  PriceList.getList;
  with cds_med_price_list  do
  Begin
    if not Active then CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to PriceList.Lista.Count - 1 do
    Begin
      Registro := PriceList.Lista[I];
      Append;
      FieldByName('id').AsInteger                 := Registro.Codigo;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName('tb_broadcaster_id').AsInteger  := Registro.Veiculo;
      FieldByName('description').AsString         := Registro.DEscricao;
      FieldByName('position').AsInteger           := Registro.Posicao;
      FieldByName('formats').AsString             := Registro.Formato;
      FieldByName('price_value').AsFloat          := Registro.Valor;
      FieldByName('determination').AsInteger      := Registro.Determinacao;
      FieldByName('expansible').AsInteger         := Registro.Expansivel;
      FieldByName('daily').AsFloat                := Registro.Diaria;
      FieldByName('dimensions').AsString          := Registro.Dimensoes;
      FieldByName('online_price').AsFloat         := Registro.OnlinePreco;
      FieldByName('pageview_min').AsInteger       := Registro.PAgeViewMinimo;
      FieldByName('pageview_max').AsInteger       := Registro.PAgeViewMaximo;
      FieldByName('note').AsString                := Registro.Observacao;
      FieldByName('path_file').AsString           := Registro.ImageLink;
      Post;
    End;
  End;
  cds_med_price_list.LogChanges := True;


end;


procedure TCadMedPriceListOl.UniFileUploadCompleted(Sender: TObject;
  AStream: TFileStream);
var
  DestFolder : string;
  LcNewFile : String;
  LcPath : String;
  LcUrl : String;
begin
  //carregar o anexo propriamente dito
  UMM.GInstitution.getRepository(True,'');
  LcNewFile := concat(cds_med_price_listtb_institution_id.asString,'_',
                    cds_med_price_listid.asString,'_',
                    cds_med_price_listtb_broadcaster_id.AsString,'.jpg');

  CopyFile(PChar(AStream.FileName), PChar(LcNewFile), False);

  LcPath := concat(UMM.GInstitution.PathPublico,'tb_med_price_list_ol','\');
  ForceDirectories(LcPath);
  RenameFile(LcNewFile,concat(LcPath,LcNewFile));

end;

procedure TCadMedPriceListOl.sb_Insert_ItemsClick(Sender: TObject);
begin
  if ValidaInsert then
  Begin
    EditionState := 'I';
    EditionControl;
    Insert;
  End;
end;

procedure TCadMedPriceListOl.SB_SaveClick(Sender: TObject);
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

procedure TCadMedPriceListOl.sb_delete_ItemsClick(Sender: TObject);
begin
  if ValidateDelete then
    Delete;
end;

function TCadMedPriceListOl.ValidaInsert: boolean;
begin
  REsult := True;
end;

function TCadMedPriceListOl.ValidateDelete: boolean;
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

function TCadMedPriceListOl.validateimage: Boolean;
begin
  REsult := True;
  if cds_med_price_list.FieldByName('path_file').AsString ='' then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há imagem para exibir.',
                  'Verifique!!']);
    Result := False;
  End;
end;

function TCadMedPriceListOl.ValidateSaveAttachament: Boolean;
begin
  Result := True;
  if cds_med_price_list.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'É necessário reigstrar um  item antes ',
                  'de registrar uma imagem.']);
    Result := False;
    exit;
  End;

end;

function TCadMedPriceListOl.validateSaveItems: boolean;
begin
  REsult := True;
  if ( trim(E_DEscription.Text) ='') then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if ( trim(E_position.Text) ='') then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Posição informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if ( trim(e_formats.Text) ='') then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Formato informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if ( StrToFloatDef(E_price_value.Text,0) =0) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Valor Padrão não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

procedure TCadMedPriceListOl.VisualizarImage1Click(Sender: TObject);
Var
  Form : TImgView;
Begin
  if validateimage then
  Begin
    Form := TImgView.create(UniApplication);
    Form.Lb_Imagem.Caption :=  concat('<img src="', cds_med_price_list.FieldByName('path_file').AsString,'"  width="360" height="360">');
    Form.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        Form := nil;
      end
    );
  End
end;

end.
