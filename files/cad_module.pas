unit cad_module;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel, ControllerModule, uniMultiItem, uniListBox,
  Data.DB, Datasnap.DBClient, uniBasicGrid, uniDBGrid, tblInterface, ControllerModuleHasInterface,
  UnFunctions, uniComboBox;

type
  TCadModule = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    sb_mod_to_int: TUniSpeedButton;
    cds_available: TClientDataSet;
    ds_search_available: TDataSource;
    cds_used: TClientDataSet;
    ds_search_use: TDataSource;
    cds_usedid: TIntegerField;
    cds_useddescription: TStringField;
    cds_availableid: TIntegerField;
    cds_availabledescription: TStringField;
    UniPanel1: TUniPanel;
    dbg_AvalibleList: TUniDBGrid;
    sb_int_to_mod: TUniSpeedButton;
    dbg_UseList: TUniDBGrid;
    UniLabel3: TUniLabel;
    Cb_img_index: TUniComboBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    Cb_acao_botao: TUniComboBox;
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
    procedure SaveModule;
    procedure SaveInterface;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
    procedure sb_int_to_modClick(Sender: TObject);
    procedure sb_mod_to_intClick(Sender: TObject);
    procedure btn_Img_LeftClick(Sender: TObject);
    procedure btn_amostraClick(Sender: TObject);
    procedure btn_Img_RightClick(Sender: TObject);
  private
    { Private declarations }
    procedure FillComboImgIndex;
    procedure FillComboAcaoBotao;
    procedure InterfaceIn;
    procedure InterfaceOut;


  public
    { Public declarations }
    Module : TControllerModule;

    Procedure availableList;
    Procedure UsedList;
  end;

var
  CadModule: TCadModule;

implementation

{$R *.dfm}

{ TCadModule }
uses MainModule, unMessages, msg_form, Main;

{ TCadModule }

procedure TCadModule.btn_amostraClick(Sender: TObject);
begin
  btn_amostra.ImageIndex := -1;
  if Cb_img_index.ItemIndex >= 0 then
      btn_amostra.ImageIndex := Cb_img_index.ItemIndex

end;

procedure TCadModule.btn_Img_LeftClick(Sender: TObject);
Var
  LcInd : Integer;
begin
  LcInd := Cb_img_index.ItemIndex;
  LcInd := LcInd - 1;
  if LcInd < 0 then LcInd := 0;
    btn_amostra.ImageIndex := LcInd;
  Cb_img_index.ItemIndex := LcInd;
end;

procedure TCadModule.btn_Img_RightClick(Sender: TObject);
Var
  LcInd : Integer;
begin
  LcInd := Cb_img_index.ItemIndex;
  LcInd := LcInd + 1;
  if LcInd < 0 then LcInd := 0;
    btn_amostra.ImageIndex := LcInd;
  Cb_img_index.ItemIndex := LcInd;

end;

procedure TCadModule.Delete;
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
      Self.Module.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadModule.FillComboAcaoBotao;
Var
  I:Integer;
begin
  Cb_acao_botao.Items.Clear;
  for I := 0 to MainForm.actlstModule.ActionCount -1 do
  Begin
    Cb_acao_botao.Items.Add(MainForm.actlstModule.Actions[I].Name);
  End;

end;

procedure TCadModule.FillComboImgIndex;
Var
  I:Integer;
begin
  Cb_img_index.Items.Clear;
  for I := 0 to MainForm.uImg32.Count -1 do
    Cb_img_index.Items.Add(concat('Nº ',StrZero( I,3,0) ) );
end;

procedure TCadModule.InitVariable;
begin
  inherited;
  Module := TControllerModule.create(Self);
end;

procedure TCadModule.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadModule.InterfaceIn;
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

procedure TCadModule.InterfaceOut;
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

procedure TCadModule.availableList;
Var
  I : Integer;
  RegInterface : Tinterface;
begin
  Module.Interfaces.getAvailableList(Module.Registro.Codigo);
  with cds_available do
  Begin
    if not Active then  CreateDataSet;
    LogChanges := False;
    EmptyDataSet;
    for I := 0 to Module.Interfaces.Lista.Count - 1 do
    Begin
      RegInterface  := Tinterface.create;
      RegInterface := Module.Interfaces.Lista[I];
      Append;
      FieldByName('id').AsInteger         := RegInterface.Codigo;
      FieldByName('description').AsString := RegInterface.Descricao;
      Post;
    End;
    LogChanges := True;
  End;
end;

procedure TCadModule.UsedList;
Var
  I : Integer;
  RegInterface : Tinterface;
begin
  Module.Interfaces.getUsedList(Module.Registro.Codigo,'');
  with self.cds_used, Module  do
  Begin
    if not cds_used.Active then CreateDataSet;
    LogChanges := False;
    cds_used.EmptyDataSet;
    for I := 0 to Interfaces.Lista.Count - 1 do
    Begin
      RegInterface := Interfaces.Lista[I];
      Append;
      FieldByName('id').AsInteger           := RegInterface.Codigo;
      FieldByName('description').AsString  := RegInterface.Descricao;
      Post;
    End;
    LogChanges := True;
  End;
end;


procedure TCadModule.Save;
begin
  SaveModule;
  SaveInterface;
end;

procedure TCadModule.SaveInterface;
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
        with Module.ModuleHasInterface do
        Begin

          Registro.CodigoModulo       := Module.Registro.Codigo;
          registro.CodigoInterface    := cds_temp.FieldByName('id').AsInteger;

           case cds_temp.UpdateStatus of
            usModified: Module.ModuleHasInterface.update;
            usInserted: Module.ModuleHasInterface.insert;
            usDeleted: Module.ModuleHasInterface.delete
           end;
        End;
        cds_temp.next;
      End;
      cds_temp.Close;
      FreeAndNil(cds_temp);
    End;
end;

procedure TCadModule.SaveModule;
begin
  inherited;
  with Module.Registro do
  Begin
    Descricao := E_Description.Text;
    ImagemIndex := Cb_img_index.ItemIndex;
    AcaoBotao := Cb_acao_botao.Text;
  End;
  Module.save;
  E_ID.Text := IntToStr(Module.Registro.codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Module.Registro.Codigo;
end;

procedure TCadModule.sb_int_to_modClick(Sender: TObject);
begin
   InterfaceIn;
end;

procedure TCadModule.sb_mod_to_intClick(Sender: TObject);
begin
  inherited;
   InterfaceOut;
end;

procedure TCadModule.SetVariable;
begin
  FillComboImgIndex;
  FillComboAcaoBotao;
  Module.Registro.Codigo := CodigoRegistro;
  Module.getByKey;
  inherited;
end;

procedure TCadModule.ShowData;
Var
  LcPosicao : Integer;
begin
  if Module.exist then
  Begin
    E_ID.Text := IntToStr(Module.Registro.Codigo);
    E_Description.Text := Module.Registro.Descricao;
    Cb_img_index.ItemIndex  := Module.Registro.ImagemIndex ;
    LcPosicao               := Cb_acao_botao.Items.IndexOf(Module.Registro.AcaoBotao);
    Cb_acao_botao.ItemIndex := LcPosicao;
    btn_amostraClick(Self);
    availableList;
    UsedList;
  End;
  inherited;
end;

procedure TCadModule.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadModule.ValidaInsert: boolean;
begin
  Result := true;
end;

function TCadModule.ValidateDelete: boolean;
begin
//
end;

function TCadModule.ValidateSave: boolean;
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
