unit cad_interface;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniLabel, uniEdit, ControllerInterface, unmessages, msg_form,
   MainModule, uniMultiItem, uniListBox, Data.DB, Datasnap.DBClient,
  uniBasicGrid, uniDBGrid, tblPrivilege, Datasnap.Provider, UnFunctions,
  uniComboBox, uniImage;

type
  TCadInterface = class(TBaseRegistry)
    E_Description: TUniEdit;
    L_Kind: TUniLabel;
    L_NameCompany: TUniLabel;
    E_ID: TUniEdit;
    L_Codigo: TUniLabel;
    cds_available: TClientDataSet;
    cds_availableid: TIntegerField;
    cds_availabledescription: TStringField;
    ds_search_available: TDataSource;
    cds_used: TClientDataSet;
    cds_usedid: TIntegerField;
    cds_useddescription: TStringField;
    ds_search_use: TDataSource;
    UniPanel1: TUniPanel;
    dbg_UseList: TUniDBGrid;
    sb_int_to_mod: TUniSpeedButton;
    sb_mod_to_int: TUniSpeedButton;
    dbg_AvalibleList: TUniDBGrid;
    Cb_Posicao: TUniComboBox;
    Cb_img_index: TUniComboBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    Cb_acao_botao: TUniComboBox;
    UniLabel3: TUniLabel;
    btn_Img_Left: TUniButton;
    btn_Img_Right: TUniButton;
    btn_amostra: TUniButton;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure SaveInterface;
    procedure Saveprivilege;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
    procedure sb_int_to_modClick(Sender: TObject);
    procedure sb_mod_to_intClick(Sender: TObject);
    procedure btn_Img_LeftClick(Sender: TObject);
    procedure btn_Img_RightClick(Sender: TObject);
    procedure btn_amostraClick(Sender: TObject);
  private
    { Private declarations }
    procedure FillComboImgIndex;
    procedure FillComboAcaoBotao;
    procedure privilegeIn;
    procedure privilegeOut;
  protected
    procedure EditionControl;Override;
  public
    { Public declarations }
    Interfaces : TControllerInterface;

    Procedure availableList;
    Procedure UsedList;
  end;

var
  CadInterface: TCadInterface;

implementation

{$R *.dfm}

uses Main;

{ TCadInterface }

procedure TCadInterface.availableList;
Var
  I : Integer;
  RegInterface : TPrivilege;
begin
  Interfaces.privilege.getAvailableList(Interfaces.Registro.Codigo);
  with self.cds_available, Interfaces  do
  Begin
    if not cds_available.Active then CreateDataSet;
    LogChanges := False;
    cds_available.EmptyDataSet;
    for I := 0 to privilege.Lista.Count - 1 do
    Begin
      RegInterface := Privilege.Lista[I];
      Append;
      FieldByName('id').AsInteger           := RegInterface.Codigo;
      FieldByName('description').AsString  := RegInterface.Descricao;
      Post;
    End;
    LogChanges := True;
  End;
end;

procedure TCadInterface.btn_amostraClick(Sender: TObject);
begin
  btn_amostra.ImageIndex := -1;
  if Cb_img_index.ItemIndex >= 0 then
      btn_amostra.ImageIndex := Cb_img_index.ItemIndex
end;

procedure TCadInterface.btn_Img_LeftClick(Sender: TObject);
Var
  LcInd : Integer;
begin
  LcInd := Cb_img_index.ItemIndex;
  LcInd := LcInd - 1;
  if LcInd < 0 then LcInd := 0;
    btn_amostra.ImageIndex := LcInd;
  Cb_img_index.ItemIndex := LcInd;
end;

procedure TCadInterface.btn_Img_RightClick(Sender: TObject);
Var
  LcInd : Integer;
begin
  LcInd := Cb_img_index.ItemIndex;
  LcInd := LcInd + 1;
  if LcInd < 0 then LcInd := 0;
    btn_amostra.ImageIndex := LcInd;
  Cb_img_index.ItemIndex := LcInd;
end;

procedure TCadInterface.Delete;
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
      Self.Interfaces.delete;
      Self.Close;
    End;
  end
  );

end;


procedure TCadInterface.EditionControl;
begin
  inherited;
  btn_Img_Left.Enabled  := ( EditionState = 'I' ) or ( EditionState = 'E' );
  btn_amostra.Enabled   := ( EditionState = 'I' ) or ( EditionState = 'E' );
  btn_Img_Right.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );

end;

procedure TCadInterface.FillComboAcaoBotao;
Var
  I:Integer;
begin
  Cb_acao_botao.Items.Clear;
  for I := 0 to umm.actlstMenu.ActionCount -1 do
  Begin
    Cb_acao_botao.Items.Add(umm.actlstMenu.Actions[I].Name);
  End;
end;

procedure TCadInterface.FillComboImgIndex;
Var
  I:Integer;
begin
  Cb_img_index.Items.Clear;
  for I := 0 to umm.uImg32.Count -1 do
    Cb_img_index.Items.Add(concat('Nº ',StrZero( I,3,0) ) );
end;

procedure TCadInterface.InitVariable;
begin
  inherited;
  Interfaces := TControllerInterface.create(Self);
end;

procedure TCadInterface.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadInterface.privilegeIn;
begin
  //insere a interface no modulo
  if cds_available.RecordCount > 0 then
  begin
    cds_used.Append;
    cds_usedid.AsInteger := cds_availableid.AsInteger;
    cds_useddescription.AsString := cds_availabledescription.AsString;
    cds_used.Post;
    //retira da lista disponivel
    cds_available.Delete;
  end;
end;

procedure TCadInterface.privilegeOut;
begin
  if cds_used.RecordCount > 0 then
  begin
    //insere a interface no modulo
    cds_available.Append;
    cds_availableid.AsInteger := cds_usedid.AsInteger;
    cds_availabledescription.AsString := cds_useddescription.AsString;
    cds_available.Post;
    //retira da lista disponivel
    cds_used.Delete
  end;
end;

procedure TCadInterface.Save;
begin
  SaveInterface;
  Saveprivilege;
end;

procedure TCadInterface.SaveInterface;
begin
  inherited;
  with Interfaces.Registro do
  Begin
    Codigo := StrToIntDef(E_ID.Text,0);
    Descricao := E_Description.Text;
    Tipo := 'N';
    Posicao := Cb_Posicao.Text;
    ImagemIndex := Cb_img_index.ItemIndex;
    AcaoBotao := Cb_acao_botao.Text;
  End;
  Interfaces.save;
  E_ID.Text := IntToStr(Interfaces.Registro.codigo);
end;

procedure TCadInterface.Saveprivilege;
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
    if cds_used.ChangeCount > 0 then
    Begin
      cds_temp := TClientDataSet.Create(Self);
      cds_temp.Data := cds_used.Delta;
      cds_temp.First;
      while not cds_temp.eof do
      Begin
        with Interfaces.InterfaceHasPrivilege do
        Begin

          Registro.CodigoInterface        := Interfaces.Registro.Codigo;
          Registro.CodigoPrivilegio       := cds_temp.FieldByName('id').AsInteger;

           case cds_temp.UpdateStatus of
            usModified: Interfaces.InterfaceHasPrivilege.update;
            usInserted: Interfaces.InterfaceHasPrivilege.insert;
            usDeleted:  Interfaces.InterfaceHasPrivilege.delete
           end;
        End;
        cds_temp.next;
      End;
      cds_temp.Close;
      FreeAndNil(cds_temp);
    End;
end;

procedure TCadInterface.sb_int_to_modClick(Sender: TObject);
begin
   privilegeIn;
end;

procedure TCadInterface.sb_mod_to_intClick(Sender: TObject);
begin
  privilegeOut
 end;

procedure TCadInterface.SetVariable;
begin
  FillComboImgIndex;
  FillComboAcaoBotao;
  Interfaces.Registro.Codigo := CodigoRegistro;
  Interfaces.getByKey;
  inherited;
end;

procedure TCadInterface.ShowData;
Var
  LcPosicao : Integer;
begin
  if Interfaces.exist then
  Begin
    E_ID.Text               := IntToStr(Interfaces.Registro.Codigo);
    E_Description.Text      := Interfaces.Registro.Descricao;
    LcPosicao               := Cb_Posicao.Items.IndexOf(Interfaces.Registro.Posicao);
    Cb_Posicao.ItemIndex    := LcPosicao;
    Cb_img_index.ItemIndex  := Interfaces.Registro.ImagemIndex ;
    LcPosicao               := Cb_acao_botao.Items.IndexOf(Interfaces.Registro.AcaoBotao);
    Cb_acao_botao.ItemIndex := LcPosicao;
    btn_amostraClick(Self);
    availableList;
    UsedList;
  End;
  inherited;
end;

procedure TCadInterface.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadInterface.UsedList;
Var
  I : Integer;
  RegInterface : TPrivilege;
begin
  Interfaces.Privilege.getUsedList(Interfaces.Registro.Codigo);
  with self.cds_used, Interfaces  do
  Begin
    if not cds_used.Active then CreateDataSet;
    LogChanges := False;
    cds_used.EmptyDataSet;
    for I := 0 to Privilege.Lista.Count - 1 do
    Begin
      RegInterface := privilege.Lista[I];
      Append;
      FieldByName('id').AsInteger           := RegInterface.Codigo;
      FieldByName('description').AsString  := RegInterface.Descricao;
      Post;
    End;
    LogChanges := True;
  End;
end;

function TCadInterface.ValidaInsert: boolean;
begin
  Result := true;
end;

function TCadInterface.ValidateDelete: boolean;
begin
//
end;

function TCadInterface.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
