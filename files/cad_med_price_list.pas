unit cad_med_price_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniGUIClasses, uniBasicGrid,
  uniDBGrid, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniSpeedButton,
  Data.DB, Datasnap.DBClient, Datasnap.Provider, base_registry, Vcl.Menus,
  uniMainMenu, uniEdit, uniLabel, tblMedPriceList, ControllerMedPriceList;

type
  TCadMedPriceList = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    DSP: TDataSetProvider;
    cds_med_price_list: TClientDataSet;
    ds_med_price_list: TDataSource;
    cds_med_price_listid: TIntegerField;
    cds_med_price_listdescription: TStringField;
    cds_med_price_listtag_value: TBCDField;
    dbg_List_items: TUniDBGrid;
    sb_Delete_Items: TUniSpeedButton;
    cds_med_price_listtb_institution_id: TIntegerField;
    cds_med_price_listtb_broadcaster_id: TIntegerField;
    cds_med_price_listkind: TIntegerField;
    UniLabel1: TUniLabel;
    E_description: TUniEdit;
    sb_Insert_Items: TUniSpeedButton;
    E_tag_value: TUniFormattedNumberEdit;
    UniLabel11: TUniLabel;
    procedure InitVariable;Override;
    procedure setImages;Override;
    procedure SetVariable;Override;
    procedure ShowData;
    function ValidateInsert():boolean;
    procedure Insert;
    procedure Deleted(cds_med_price_list: TClientDataSet);
    procedure Save;
    function ValidateDelete:boolean;
    procedure Delete;


    procedure SB_InsertClick(Sender: TObject);
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);
    procedure SB_SaveClick(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);

   private
    { Private declarations }
  public
    { Public declarations }
    MedPriceList : TControllerMedPriceList;
 end;

var
  CadMedPriceList: TCadMedPriceList;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;

{ TCadMedPriceList }

procedure TCadMedPriceList.Delete;
begin
   cds_med_price_list.Delete;
//  cds_items.Active := False;
//  cds_items.Active := True;
end;

procedure TCadMedPriceList.Deleted(cds_med_price_list: TClientDataSet);
Var
  LcOperacao : String;
  cds_Med : TClientDataSet;
begin
  if cds_med_price_list.ChangeCount > 0 then
  Begin
    cds_Med := TClientDataSet.Create(Self);
    cds_Med.Data := cds_med_price_list.Delta;
    cds_Med.First;
    cds_med_price_list.First;
    //Trata somente os dados deletados
    while not cds_Med.eof do
    Begin
      with MedPriceList do
      Begin
        if cds_Med.UpdateStatus = usDeleted then
        Begin
          Registro.Estabelecimento     := GbInstitution;
          Registro.Veiculo             := CodigoRegistro;
          Registro.Descricao           := cds_Med.FieldByName('description').AsString;
          Registro.Valor               := cds_Med.FieldByName('tag_value').AsFloat;
          MedPriceList.delete
        End;
      End;
      cds_Med.Next;
    end;
    cds_Med.Close;
    FreeAndNil(cds_Med);
  End;
end;

procedure TCadMedPriceList.InitVariable;
begin
  inherited;
  MedPriceList := TControllerMedPriceList.Create(self);
end;

procedure TCadMedPriceList.Insert;
begin
  if not cds_med_price_list.Active then cds_med_price_list.CreateDataSet;

  with cds_med_price_list do
  Begin
    Append;
    cds_med_price_listid.AsInteger := 0;
    cds_med_price_listtb_broadcaster_id.AsInteger := CodigoRegistro;
    cds_med_price_listtb_institution_id.AsInteger := GbInstitution;
    cds_med_price_listtag_value.AsFloat := E_tag_value.Value;
    cds_med_price_listdescription.AsString := E_description.Text;
    post;
  End;
end;

procedure TCadMedPriceList.Save;
begin
  Deleted(cds_med_price_list);
  if cds_med_price_list.ChangeCount > 0 then
  Begin
     cds_med_price_list.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_med_price_list.eof do
    Begin
      with MedPriceList do
      Begin
        Registro.Codigo              := cds_med_price_list.FieldByName('id').AsInteger;
        Registro.Estabelecimento     := cds_med_price_list.FieldByName('tb_institution_id').AsInteger;
        Registro.Veiculo             := cds_med_price_list.FieldByName('tb_broadcaster_id').asInteger;
        Registro.Descricao           := cds_med_price_list.FieldByName('description').AsString;
        Registro.Valor               := cds_med_price_list.FieldByName('tag_value').AsFloat;
        case cds_med_price_list.UpdateStatus of
          usInserted: MedPriceList.insert;
        end;
      End;
      cds_med_price_list.next;
    End;
    cds_med_price_list.MergeChangeLog;
  End;
end;

procedure TCadMedPriceList.Sb_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TCadMedPriceList.sb_Delete_ItemsClick(Sender: TObject);
begin
  if ValidateDelete then
    delete;
end;

procedure TCadMedPriceList.SB_InsertClick(Sender: TObject);
begin
  inherited;
  cds_med_price_list.append;
end;

procedure TCadMedPriceList.sb_Insert_ItemsClick(Sender: TObject);
begin
  if validateInsert then
    Insert
end;

procedure TCadMedPriceList.SB_SaveClick(Sender: TObject);
begin
  Save;
  Close;
end;

procedure TCadMedPriceList.setImages;
begin
  inherited;
  buttonIcon(SB_Insert_Items,'mini_insert.bmp');
  buttonIcon(Sb_Delete_Items,'mini_delete.bmp');
  buttonIcon(Sb_Save,'save.bmp');
  buttonIcon(Sb_Close,'close.bmp');
end;

procedure TCadMedPriceList.setVariable;
begin
  MedPriceList.Registro.Estabelecimento := GbInstitution;
  MedPriceList.Registro.Veiculo := CodigoRegistro;
  MedPriceList.getList;
  ShowData;
end;

procedure TCadMedPriceList.ShowData;
Var
  I : Integer;
  Registro : TMedPriceList;
begin
  if not cds_med_price_list.Active then cds_med_price_list.CreateDataSet;
  cds_med_price_list.LogChanges := False;
  cds_med_price_list.EmptyDataSet;
  with cds_med_price_list  do
  Begin
    for I := 0 to MedPriceList.Lista.Count - 1 do
    Begin
      Registro := MedPriceList.Lista[I];
      append;
      FieldByName('tb_broadcaster_id').AsInteger       := Registro.Veiculo;
      //dados dos Produtos
      MedPriceList.Broadcaster.Registro.Codigo := Registro.Veiculo;
      MedPriceList.Broadcaster.Registro.Estabelecimento := Registro.Estabelecimento;
      MedPriceList.Broadcaster.getByKey;
      FieldByName('id').AsInteger := 1;
      FieldByName('description').AsString := Registro.Descricao;
      FieldByName('tag_value').AsFloat := Registro.Valor;
      Post;
    End;
  End;
  cds_med_price_list.LogChanges := True;
end;

function TCadMedPriceList.ValidateDelete: boolean;
begin
  if ( cds_med_price_list.RecordCount = 0 ) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registro para excluir.',
                  '         Verifique!!']);
    Result := False;
    exit;
  end;
end;

function TCadMedPriceList.ValidateInsert: boolean;
begin
  Result := True;
  if trim(E_description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
  if StrToIntDef(E_tag_value.Text,0) = 0 then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Valor deve ser maior do que zero.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
