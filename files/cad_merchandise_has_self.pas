unit cad_merchandise_has_self;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_list_Registry, uniEdit, uniLabel,
  uniPanel, Data.DB, Datasnap.DBClient, Vcl.Menus, uniMainMenu, uniGUIClasses,
  uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniSpeedButton,base_form,
  uniGUIBaseClasses, ControllerMerchandiseHasSelf, fm_merchandise,
  Datasnap.Provider, tblMerchandiseHasSelf;

type
  TCadMerchandiseHasSelf = class(TBaseForm)
    pnl_fundo: TUniPanel;
    pnl_botao: TUniPanel;
    SB_Save: TUniSpeedButton;
    Sb_Close: TUniSpeedButton;
    UniPanel1: TUniPanel;
    ctn_merchandise: TUniContainerPanel;
    UniLabel11: TUniLabel;
    E_Quantity: TUniFormattedNumberEdit;
    dbg_List_items: TUniDBGrid;
    sb_Delete_Items: TUniSpeedButton;
    cds_items: TClientDataSet;
    ds_items: TDataSource;
    cds_itemstb_institution_id: TIntegerField;
    cds_itemstb_master_id: TIntegerField;
    cds_itemstb_detail_id: TIntegerField;
    cds_itemsquantity: TIntegerField;
    cds_itemsdescription: TStringField;
    sb_Insert_Items: TUniSpeedButton;
    procedure InitVariable;Override;
    procedure setImages;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;
    function ValidateInsert():boolean;
    procedure Insert;
    procedure Deleted(cds_Items : TClientDataSet);
    procedure Save;
    function ValidateDelete:boolean;
    procedure Delete;

    procedure Sb_CloseClick(Sender: TObject);
    procedure SB_SaveClick(Sender: TObject);
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);
  private
    { Private declarations }
    FrMerchandise : TfmMerchandise;
    procedure ShowMerchandise;
  public
    { Public declarations }
    MerchandiseHasSelf : TControllerMerchandiseHasSelf;
  end;

var
  CadMerchandiseHasSelf: TCadMerchandiseHasSelf;

implementation

{$R *.dfm}

uses MainModule, msg_form, unMessages;

{ TBaseListRegistry1 }

procedure TCadMerchandiseHasSelf.Delete;
begin
  cds_items.Delete;
//  cds_items.Active := False;
//  cds_items.Active := True;
end;
procedure TCadMerchandiseHasSelf.FormatScreen;
begin
  inherited;
  ShowMerchandise;
end;

procedure TCadMerchandiseHasSelf.InitVariable;
begin
  inherited;
  MerchandiseHasSelf := TControllerMerchandiseHasSelf.create(Self);
end;

procedure TCadMerchandiseHasSelf.Insert;
begin
  if not cds_items.Active then cds_items.CreateDataSet;
 
  with cds_items do
  Begin
    Append;
    cds_itemstb_institution_id.AsInteger := UMM.GInstitution.registro.Codigo;
    cds_itemstb_master_id.AsInteger := CodigoRegistro;
    cds_itemstb_detail_id.AsInteger := FrMerchandise.DBLCB_Lista.KeyValue;
    cds_itemsquantity.AsFloat := E_Quantity.Value;
    cds_itemsdescription.AsString := FrMerchandise.DBLCB_Lista.Text;
    post;
  End;
end;

procedure TCadMerchandiseHasSelf.Deleted(cds_Items : TClientDataSet);
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
      with MerchandiseHasSelf do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          Registro.Estabelecimento     := UMM.GInstitution.registro.Codigo;
          Registro.Mestre              := CodigoRegistro;
          Registro.Detalhe             := cds_temp.FieldByName('tb_detail_id').AsInteger;
          Registro.Quantidade          := cds_temp.FieldByName('quantity').AsFloat;
          MerchandiseHasSelf.delete
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;

procedure TCadMerchandiseHasSelf.Save;
begin
  Deleted(cds_items);
  if cds_items.ChangeCount > 0 then
  Begin
     cds_items.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_items.eof do
    Begin
      with MerchandiseHasSelf do
      Begin
        Registro.Estabelecimento     := cds_items.FieldByName('tb_institution_id').AsInteger;
        Registro.Mestre              := cds_items.FieldByName('tb_master_id').asInteger;
        Registro.Detalhe             := cds_items.FieldByName('tb_detail_id').AsInteger;
        Registro.Quantidade          := cds_items.FieldByName('quantity').AsFloat;
        case cds_items.UpdateStatus of
          usInserted: MerchandiseHasSelf.insert;
        end;
      End;
      cds_items.next;
    End;
    cds_items.MergeChangeLog;
  End;
end;

procedure TCadMerchandiseHasSelf.Sb_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TCadMerchandiseHasSelf.sb_Delete_ItemsClick(Sender: TObject);
begin
  if ValidateDelete then
    delete;
end;

procedure TCadMerchandiseHasSelf.sb_Insert_ItemsClick(Sender: TObject);
begin
  if validateInsert then
    Insert
end;

procedure TCadMerchandiseHasSelf.SB_SaveClick(Sender: TObject);
begin
  Save;
  Close;
end;

procedure TCadMerchandiseHasSelf.setImages;
begin
  inherited;
  buttonIcon(SB_Insert_Items,'mini_insert.bmp');
  buttonIcon(Sb_Delete_Items,'mini_delete.bmp');
  buttonIcon(Sb_Save,'save.bmp');
  buttonIcon(Sb_Close,'close.bmp');
end;

procedure TCadMerchandiseHasSelf.SetVariable;
begin
  MerchandiseHasSelf.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  MerchandiseHasSelf.Registro.Mestre   := CodigoRegistro;
  MerchandiseHasSelf.getList;
  ShowData;
end;

procedure TCadMerchandiseHasSelf.ShowData;
Var
  I : Integer;
  Registro : TMerchandiseHasSelf;
begin
  if not cds_items.Active then cds_items.CreateDataSet;
  cds_Items.LogChanges := False;
  cds_items.EmptyDataSet;
  with cds_items  do
  Begin
    for I := 0 to MerchandiseHasSelf.Lista.Count - 1 do
    Begin
      Registro := MerchandiseHasSelf.Lista[I];
      append;
      FieldByName('tb_detail_id').AsInteger       := Registro.Detalhe;
      //dados dos Produtos
      MerchandiseHasSelf.Merchandise.Produto.Registro.Codigo := Registro.Detalhe;
      MerchandiseHasSelf.Merchandise.Produto.Registro.Estabelecimento := Registro.Estabelecimento;
      MerchandiseHasSelf.Merchandise.Produto.getByKey;
      FieldByName('description').AsString := concat( Format('%3.3d',[Registro.Detalhe]),
                                                    ' - ' ,
                                                    MerchandiseHasSelf.Merchandise.Produto.Registro.Descricao);
      FieldByName('quantity').AsFloat             := Registro.Quantidade;
      Post;
    End;
  End;
  cds_items.LogChanges := True;
end;


procedure TCadMerchandiseHasSelf.ShowMerchandise;
begin
  FrMerchandise := TFmMerchandise.Create(Self);
  FrMerchandise.Parent := Ctn_Merchandise;
  FrMerchandise.listar;
  FrMerchandise.Align := alClient;
  FrMerchandise.Show;
end;

function TCadMerchandiseHasSelf.ValidateInsert: boolean;
begin
  Result := True;
  if trim(FrMerchandise.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Mercadoria não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
  if StrToIntDef(E_Quantity.Text,0) = 0 then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo quantidade deve ser maior do que zero.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

function TCadMerchandiseHasSelf.ValidateDelete: boolean;
begin
  if ( cds_items.RecordCount = 0 ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registro para excluir.',
                  '         Verifique!!']);
    Result := False;
    exit;
  end;
end;

end.
