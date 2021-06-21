unit cad_med_price_list_jr;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniBasicGrid, uniDBGrid,
  uniEdit, uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniLabel,
  uniGUIBaseClasses, uniPanel, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  TblMedPriceListJR, MainModule, fm_med_pos_prog,ControllerMedPriceListJR,
  ControllerMedPosProg, uniDBEdit, Vcl.Menus, uniMainMenu, base_form,
  uniFileUpload, uniGUITypes;

type
  TCadMedPriceListJR = class(TBaseRegistry)
    pnl_botao_item: TUniPanel;
    E_week_day_value: TUniFormattedNumberEdit;
    dbg_List_items: TUniDBGrid;
    sb_Delete_Items: TUniSpeedButton;
    E_sun_day_value: TUniFormattedNumberEdit;
    E_Nr_Columns: TUniEdit;
    E_Size_Columns: TUniEdit;
    cds_med_price_list: TClientDataSet;
    ds_med_price_list: TDataSource;
    Ctn_Med_Pos_Prog: TUniContainerPanel;
    e_addition_value: TUniFormattedNumberEdit;
    pnl_row_1: TUniPanel;
    pnl_row_2: TUniPanel;
    E_Medidas: TUniEdit;
    E_Formats: TUniEdit;
    E_OnlineValue: TUniFormattedNumberEdit;
    E_OnlineDiscount: TUniFormattedNumberEdit;
    sb_change_Items: TUniSpeedButton;
    cds_med_price_listtb_institution_id: TIntegerField;
    cds_med_price_listid: TIntegerField;
    cds_med_price_listtb_broadcaster_id: TIntegerField;
    cds_med_price_listtb_med_pos_prog_id: TIntegerField;
    cds_med_price_listweek_day_value: TBCDField;
    cds_med_price_listsun_day_value: TBCDField;
    cds_med_price_listnr_columns: TIntegerField;
    cds_med_price_listaddition: TBCDField;
    cds_med_price_listsize_columns: TIntegerField;
    cds_med_price_listformats: TStringField;
    cds_med_price_listmeasure: TStringField;
    cds_med_price_listpath_file: TStringField;
    cds_med_price_listonline_discount: TBCDField;
    cds_med_price_listonline_price: TBCDField;
    cds_med_price_listposition: TStringField;
    sb_cancel_Items: TUniSpeedButton;
    sb_save_Items: TUniSpeedButton;
    sb_Insert_Items: TUniSpeedButton;
    UniFileUpload: TUniFileUpload;
    Mnu_Imagem: TUniPopupMenu;
    InserirImagem1: TUniMenuItem;
    ExcluirImagem1: TUniMenuItem;
    VisualizarImage1: TUniMenuItem;
    cds_med_price_listimg: TStringField;
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);
    procedure SB_SaveClick(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);
    procedure sb_change_ItemsClick(Sender: TObject);
    procedure sb_save_ItemsClick(Sender: TObject);
    procedure sb_cancel_ItemsClick(Sender: TObject);
    procedure E_week_day_valueExit(Sender: TObject);
    procedure e_addition_valueExit(Sender: TObject);
    procedure E_Nr_ColumnsExit(Sender: TObject);
    procedure E_Size_ColumnsExit(Sender: TObject);
    procedure E_OnlineDiscountExit(Sender: TObject);
    procedure UniFileUploadCompleted(Sender: TObject; AStream: TFileStream);
    procedure InserirImagem1Click(Sender: TObject);
    procedure dbg_List_itemsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbg_List_itemsDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure VisualizarImage1Click(Sender: TObject);
    procedure ExcluirImagem1Click(Sender: TObject);
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

    function ValidateSaveAttachament:Boolean;
    procedure SaveAttachment;
    procedure DeleteAttachment;
    function validateimage:Boolean;

  public
    PriceList : TControllerMedPriceListJR;
  end;

var
  CadMedPriceListJR: TCadMedPriceListJR;

implementation

{$R *.dfm}

uses ControllerMedInsertDate, img_view, unMessages, msg_form,UnFunctions;

{ TBaseForm1 }


procedure TCadMedPriceListJR.calcOnlineValue;
Var
  Lc_Vl_util : Real;
  Lc_CmCol : Integer;
  Lc_Vl_CMCol : Real;
  Lc_Aq_Adicional : Real;
  Lc_Aq_OnlineDesconto : Real;
  Lc_VL_OnlinePrice : Real;
begin
  Lc_Vl_util  := E_week_day_value.Value;
  Lc_CmCol    := StrToIntDeF(E_Nr_Columns.Text,0) * StrToIntDeF(E_Size_Columns.Text,0);
  Lc_Vl_CMCol := Lc_Vl_util * Lc_CmCol;
  //CAlcular o acrescimo da cor
  Lc_Aq_Adicional := e_addition_value.Value;
  Lc_Vl_CMCol := Lc_Vl_CMCol + ( (Lc_Vl_CMCol * Lc_Aq_Adicional) / 100  );
  //Aplicar o desconto para o calculo do valor cotação online
  Lc_Aq_OnlineDesconto := E_OnlineDiscount.Value;

  Lc_VL_OnlinePrice := Lc_Vl_CMCol - ( (Lc_Vl_CMCol * Lc_Aq_OnlineDesconto)/100 );
  E_OnlineValue.Value := Lc_VL_OnlinePrice;
end;

procedure TCadMedPriceListJR.ClearAllFields;
begin
  inherited;
  ClearFields(FrMedPosProg);
  ClearFields(Self);
  TabelaID := 0;
end;


procedure TCadMedPriceListJR.createAttachment(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
    Text := concat('<img src="', cds_med_price_list.FieldByName('path_file').AsString,'"  width="15" height="15">');
end;

procedure TCadMedPriceListJR.dbg_List_itemsDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (Column.FieldName = 'img') then
    Column.Field.OnGetText := createAttachment;

end;

procedure TCadMedPriceListJR.dbg_List_itemsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbRight then
  begin
    Mnu_Imagem.Popup(X, Y, dbg_List_items);
  end;
end;

procedure TCadMedPriceListJR.Delete;
begin
  cds_med_price_list.Delete;
end;

procedure TCadMedPriceListJR.DeleteAttachment;
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

procedure TCadMedPriceListJR.DeletedItems(cds_Items: TClientDataSet);
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

procedure TCadMedPriceListJR.editData;
begin
  with cds_med_price_list do
  Begin
    TabelaID                := FieldByName('id').AsInteger;
    BroadCasterID           := FieldByName('tb_broadcaster_id').AsInteger;
    FrMedPosProg.DBLCB_Lista.KeyValue := FieldByName('tb_med_pos_prog_id').AsInteger;
    E_week_day_value.Value  := FieldByName('week_day_value').AsFloat;
    E_sun_day_value.Value   := FieldByName('sun_day_value').AsFloat;
    e_addition_value.Value  := FieldByName('addition').AsFloat;
    E_Nr_Columns.Text       := FieldByName('nr_columns').AsString;
    E_Size_Columns.Text     := FieldByName('size_columns').AsString;
    E_Formats.Text          := FieldByName('formats').AsString;
    E_Medidas.Text          := FieldByName('measure').AsString;
    E_OnlineDiscount.Value  := FieldByName('online_discount').AsFloat;
    E_OnlineValue.Value     := FieldByName('online_price').AsFloat;
  End;
end;

procedure TCadMedPriceListJR.EditionControl;
begin
  EditionControler(Self);
  EditionControler(FrMedPosProg);
  sb_Insert_Items.Enabled := ( EditionState = 'B' ) and PInsert;
  sb_change_Items.Enabled := ( EditionState = 'B' ) and ( cds_med_price_list.RecordCount > 0 ) and pUpdate;
  sb_Delete_Items.Enabled := ( EditionState = 'B' ) and ( cds_med_price_list.RecordCount  > 0 ) and PDelete;
  sb_save_Items.Enabled   := ( EditionState = 'I' ) or ( EditionState = 'E' );
  sb_cancel_Items.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );

  SB_Save.Enabled         := ( EditionState = 'B' );
  Sb_Close.Enabled       := ( EditionState = 'B' );
end;

procedure TCadMedPriceListJR.ExcluirImagem1Click(Sender: TObject);
begin
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

procedure TCadMedPriceListJR.e_addition_valueExit(Sender: TObject);
begin
  calcOnlineValue;
end;

procedure TCadMedPriceListJR.E_Nr_ColumnsExit(Sender: TObject);
begin
  calcOnlineValue;
end;

procedure TCadMedPriceListJR.E_OnlineDiscountExit(Sender: TObject);
begin
  calcOnlineValue;
end;

procedure TCadMedPriceListJR.E_Size_ColumnsExit(Sender: TObject);
begin
  calcOnlineValue;
end;

procedure TCadMedPriceListJR.E_week_day_valueExit(Sender: TObject);
begin
  calcOnlineValue;
end;

procedure TCadMedPriceListJR.FormatScreen;
begin
  inherited;
  ShowMedPosProg;
end;

procedure TCadMedPriceListJR.InitVariable;
Begin
  inherited;
  PriceList := TControllerMedPriceListJR.Create(self);
end;

procedure TCadMedPriceListJR.InserirImagem1Click(Sender: TObject);
begin
  if ValidateSaveAttachament then
  begin
    try
      Self.showMask('Salvando Imagem...');
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

procedure TCadMedPriceListJR.Insert;
begin
  ClearAllFields;
  setFocus(FrMedPosProg.DBLCB_Lista.JSName);
end;

procedure TCadMedPriceListJR.Save;
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
          Registro.ValorDiaUtil       := FieldByName('week_day_value').AsFloat;
          Registro.ValorDomingo       := FieldByName('sun_day_value').AsFloat;
          Registro.AdicionalCor       := FieldByName('addition').AsFloat;
          Registro.NumeroColunas      := FieldByName('nr_columns').Asinteger;
          Registro.TamanhoColuna      := FieldByName('size_columns').Asinteger;
          Registro.Formato            := FieldByName('formats').AsString;
          Registro.Medida             := FieldByName('measure').AsString;
          Registro.ImageLink          := FieldByName('path_file').AsString;
          Registro.OnlineDesconto     := FieldByName('online_discount').AsFloat;
          Registro.OnlinePreco        := FieldByName('online_price').AsFloat;

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

procedure TCadMedPriceListJR.SaveAttachment;
Var
  Lc_file : String;
  Lc_path : String;
begin
  //carregar o anexo propriamente dito
  UMM.GInstitution.getRepository(True,'');
  Lc_file := concat(cds_med_price_listtb_institution_id.asString,'_',
                    cds_med_price_listid.asString,'_',
                    cds_med_price_listtb_broadcaster_id.AsString,'.jpg');
  Lc_path := concat(UMM.GInstitution.URL,'tb_med_price_list_jr','/');
  cds_med_price_list.Edit;
  cds_med_price_listpath_file.AsString := concat(Lc_path,Lc_file);
  cds_med_price_list.Post;
end;

procedure TCadMedPriceListJR.saveITems;
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
    FieldByName('position').AsString         := FrMedPosProg.DBLCB_Lista.Text;
    FieldByName('week_day_value').AsFloat       := E_week_day_value.Value;
    FieldByName('sun_day_value').AsFloat        := E_sun_day_value.Value;
    FieldByName('addition').AsFloat             := e_addition_value.Value;
    FieldByName('nr_columns').AsInteger         := StrToIntDef(E_Nr_Columns.Text,1);
    FieldByName('size_columns').AsInteger       := StrToIntDef(E_Size_Columns.Text,1);
    FieldByName('formats').AsString             := E_Formats.Text;
    FieldByName('measure').AsString             := E_Medidas.Text;
    FieldByName('online_discount').AsFloat      := E_OnlineDiscount.Value;
    FieldByName('online_price').AsFloat         := E_OnlineValue.Value;
    Post;
  End;
end;

procedure TCadMedPriceListJR.sb_cancel_ItemsClick(Sender: TObject);
begin
  ClearAllFields;
  EditionState := 'B';
  EditionControl;
end;

procedure TCadMedPriceListJR.sb_change_ItemsClick(Sender: TObject);
begin
  EditionState := 'E';
  EditionControl;
  editData;
end;

procedure TCadMedPriceListJR.Sb_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TCadMedPriceListJR.sb_Delete_ItemsClick(Sender: TObject);
begin
  if ValidateDelete then
    Delete;
end;

procedure TCadMedPriceListJR.sb_Insert_ItemsClick(Sender: TObject);
begin
  if ValidaInsert then
  Begin
    EditionState := 'I';
    EditionControl;
    Insert;
  End;
end;

procedure TCadMedPriceListJR.SB_SaveClick(Sender: TObject);
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

procedure TCadMedPriceListJR.sb_save_ItemsClick(Sender: TObject);
begin
  if validateSaveItems then
  Begin
    saveITems;
    ClearAllFields;
    EditionState := 'B';
    EditionControl;
  End;

end;

procedure TCadMedPriceListJR.setImages;
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

procedure TCadMedPriceListJR.SetVariable;
begin
  ShowData;
end;

procedure TCadMedPriceListJR.ShowData;
begin
  TabelaID := 0;
  BroadCasterID := CodigoRegistro;
  ShowList;
  EditionState := 'B';
  EditionControl;
end;

procedure TCadMedPriceListJR.ShowList;
Var
  I : Integer;
  Registro : TMedPriceListJr;
  LcPosicao : TControllerMedPosProg;
begin
  LcPosicao := TControllerMedPosProg.Create(Self);
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
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName('id').AsInteger                 := Registro.Codigo;
      FieldByName('tb_broadcaster_id').AsInteger  := Registro.Veiculo;
      FieldByName('tb_med_pos_prog_id').AsInteger := Registro.PosicaoProgramacao;
      //Descrição da posicação
      LcPosicao.Registro.Estabelecimento  := Registro.Estabelecimento;
      LcPosicao.Registro.Codigo           := Registro.PosicaoProgramacao;
      LcPosicao.getByKey;
      FieldByName('position').AsString         := LcPosicao.Registro.Descricao;

      FieldByName('week_day_value').AsFloat       := Registro.ValorDiaUtil;
      FieldByName('sun_day_value').AsFloat        := Registro.ValorDomingo;
      FieldByName('addition').AsFloat             := Registro.AdicionalCor;
      FieldByName('nr_columns').AsInteger         := Registro.NumeroColunas;
      FieldByName('size_columns').AsInteger       := Registro.TamanhoColuna;
      FieldByName('formats').AsString             := Registro.Formato;
      FieldByName('measure').AsString             := Registro.Medida;
      FieldByName('path_file').AsString           := Registro.ImageLink;
      FieldByName('online_discount').AsFloat      := Registro.OnlineDesconto;
      FieldByName('online_price').AsFloat         := Registro.OnlinePreco;
      Post;
    End;
  End;
  cds_med_price_list.LogChanges := True;

end;

procedure TCadMedPriceListJR.ShowMedPosProg;
begin
  FrMedPosProg := TfmMedPosProg.Create(Self);
  FrMedPosProg.Parent := Ctn_Med_Pos_Prog;
  FrMedPosProg.listar;
  FrMedPosProg.Align := alClient;
  FrMedPosProg.Show;
end;

procedure TCadMedPriceListJR.UniFileUploadCompleted(Sender: TObject;
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

  LcPath := concat(UMM.GInstitution.PathPublico,'tb_med_price_list_jr','\');
  ForceDirectories(LcPath);
  RenameFile(LcNewFile,concat(LcPath,LcNewFile));
end;

function TCadMedPriceListJR.ValidaInsert: boolean;
begin
  REsult := True;
end;

function TCadMedPriceListJR.ValidateDelete: boolean;
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

function TCadMedPriceListJR.validateimage: Boolean;
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

function TCadMedPriceListJR.ValidateSaveAttachament: Boolean;
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

function TCadMedPriceListJR.validateSaveItems: boolean;
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

  if trim(E_week_day_value.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Dia útil não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

procedure TCadMedPriceListJR.VisualizarImage1Click(Sender: TObject);
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
End;
end.
