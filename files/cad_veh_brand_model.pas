unit cad_veh_brand_model;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniBasicGrid, uniDBGrid, uniEdit, uniLabel, Data.DB,
  Datasnap.DBClient, ControllervehBrand, ControllerVehModel,
  tblVehModel;

type
  TCadVehBrandModel = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    sb_Insert_Items: TUniSpeedButton;
    sb_Change_Items: TUniSpeedButton;
    sb_Delete_Items: TUniSpeedButton;
    cds_items: TClientDataSet;
    ds_search: TDataSource;
    cds_itemsid: TIntegerField;
    cds_itemstb_vehicle_brand_id: TIntegerField;
    cds_itemsdescription: TStringField;
    UniHiddenPanel1: TUniHiddenPanel;
    E_model: TUniEdit;

    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure ClearAllFields;Override;
    procedure Insert;Override;
    procedure Save;Override;
    procedure DeletedItems(cds_Items : TClientDataSet; brand_id:Integer);
    procedure SaveModel;
    procedure Savebrand;
    procedure ShowNoData;Override;
    procedure Delete;Override;
    procedure ShowData;Override;
    procedure ShowDataBrand;
    procedure ShowListModel;
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_Change_ItemsClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);

    procedure InsertModel;

    procedure EditModel;
    function ValidateEdit:boolean;

    procedure DeletModel;

  private
    { Private declarations }
  public
    { Public declarations }
    VehicleBrand : TControllervehBrand;
  end;

var
  CadVehBrandModel: TCadVehBrandModel;

implementation

{$R *.dfm}

uses unMessages;

{ TCadVehicleBrandModel }

procedure TCadVehBrandModel.ClearAllFields;
begin
  inherited;
  VehicleBrand.clear;
  VehicleBrand.Modelo.clear;
end;

procedure TCadVehBrandModel.Delete;
begin
  inherited;
//
end;

procedure TCadVehBrandModel.DeletedItems(cds_Items: TClientDataSet; brand_id: Integer);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
  LcOrderItems : TControllerVehModel;
begin
  if cds_items.ChangeCount > 0 then
  Begin
    LcOrderItems := TControllerVehModel.create(Self);
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_items.Delta;
    cds_temp.First;
    cds_items.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      with LcOrderItems do
      Begin
        if cds_temp.UpdateStatus = usDeleted then
        Begin
          //Items
          Registro.Codigo              := cds_Temp.FieldByName('id').AsInteger;
          Registro.Marca               := brand_id;
          LcOrderItems.delete;
        End;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    FreeAndNil(cds_temp);
  End;
end;

procedure TCadVehBrandModel.DeletModel;
begin
  if not cds_items.Active then cds_items.CreateDataSet;
  with cds_items do
  begin
    delete;
  end;
end;

procedure TCadVehBrandModel.EditModel;
begin
  if ValidateEdit then
  begin
    if not cds_items.Active then cds_items.CreateDataSet;
    with cds_items do
    begin
      Edit;
      FieldByName('description').AsString := 'Para cancelar alteração clique cancelar';


    end;
  end;
end;

procedure TCadVehBrandModel.InitVariable;
begin
  inherited;
  VehicleBrand := TControllervehBrand.Create(self);
end;

procedure TCadVehBrandModel.Insert;
begin
  inherited;
  ClearAllFields;
  EditionState := 'I';
end;

procedure TCadVehBrandModel.InsertModel;
begin
  if not cds_items.Active then cds_items.CreateDataSet;
  with cds_items do
  begin
    Append;
    FieldByName('id').AsInteger := 0;
    FieldByName('description').AsString := ' Insira Modelo ';
    Post;
  end;
end;

procedure TCadVehBrandModel.Save;
begin
  inherited;
  Savebrand;
  SaveModel;
  E_ID.Text := IntToStr(VehicleBrand.Registro.codigo);
  CodigoRegistro := VehicleBrand.Registro.Codigo;
end;

procedure TCadVehBrandModel.Savebrand;
begin
  with VehicleBrand.Registro do
  begin
    Descricao := E_Description.Text;
  end;
  VehicleBrand.Save;
end;

procedure TCadVehBrandModel.SaveModel;
Var
  LcOperacao : String;
  LcOrderItems : TControllerVehModel;
begin
  DeletedItems(cds_items, VehicleBrand.Registro.Codigo);

  if cds_items.ChangeCount > 0 then
  Begin
    LcOrderItems := TControllerVehModel.create(Self);

     cds_items.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_items.eof do
    Begin
      with LcOrderItems do
      Begin
        Registro.Codigo               := cds_items.FieldByName('id').AsInteger;
        Registro.Marca                := VehicleBrand.Registro.Codigo;
        Registro.Descricao            := cds_items.FieldByName('description').AsString;
        case cds_items.UpdateStatus of
          usModified: LcOrderItems.update;
          usInserted: LcOrderItems.insert;
        end;
      End;
      cds_items.next;
    End;
    cds_items.MergeChangeLog;
  End;
end;

procedure TCadVehBrandModel.sb_Change_ItemsClick(Sender: TObject);
begin
  inherited;
  EditModel;
end;

procedure TCadVehBrandModel.sb_Delete_ItemsClick(Sender: TObject);
begin
  inherited;
  DeletModel;
end;

procedure TCadVehBrandModel.sb_Insert_ItemsClick(Sender: TObject);
begin
  inherited;
  InsertModel;
end;

procedure TCadVehBrandModel.setVariable;
begin
  VehicleBrand.Registro.Codigo := CodigoRegistro;
  VehicleBrand.getbyKey;
  inherited;
end;

procedure TCadVehBrandModel.ShowData;
begin
  ShowListModel;
  ShowDataBrand;
  inherited;
end;

procedure TCadVehBrandModel.ShowDataBrand;
begin
  with VehicleBrand.Registro do
  begin
    E_id.Text           := IntToStr(codigo);
    E_Description.Text  := Descricao;
  end;
end;

procedure TCadVehBrandModel.ShowListModel;
Var
  I : Integer;
  Registro : TVehModel;
  LcOrderItem : TControllerVehModel;
  LcEdit : TUniEdit;
begin
  LcOrderItem := TControllerVehModel.create(Self);
  LcOrderItem.Registro.Marca := VehicleBrand.Registro.Codigo;
  LcOrderItem.getList;

  with cds_items  do
  Begin
    if not Active then CreateDataSet;
    cds_items.LogChanges := False;
    cds_items.EmptyDataSet;
    for I := 0 to LcOrderItem.Lista.Count - 1 do
    Begin
      Registro := LcOrderItem.Lista[I];
      Append;
      FieldByName('id').AsInteger                   := Registro.Codigo;
      FieldByName('tb_vehicle_brand_id').AsInteger  := Registro.Marca;
      FieldByName('description').asString           := Registro.Descricao;

    End;
  End;
  cds_items.LogChanges := True;
end;

procedure TCadVehBrandModel.ShowNoData;
begin
  inherited;
//
end;


function TCadVehBrandModel.ValidateEdit: boolean;
begin
  Result := True;
  if cds_items.RecordCount = 0 then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não ha Registro para Alterar.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;

end.
