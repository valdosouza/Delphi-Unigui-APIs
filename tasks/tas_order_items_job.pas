unit tas_order_items_job;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_order_items, uniButton, uniBitBtn,
  uniSpeedButton, uniEdit, uniGUIClasses, uniLabel, uniPanel, uniGUIBaseClasses,
   Datasnap.DBClient, uniDateTimePicker, fm_work_front, Vcl.Menus, uniMainMenu,
  Data.DB;

type
  TTasOrderItemsJob = class(TTasOrderItems)
    Ctn_WorkFront: TUniContainerPanel;
    procedure ShowData;Override;
    procedure FormatScreen;Override;
  private
    frWorkFront : TFmWorkFront;
  protected
     procedure ShowWorkFront;
  public
    { Public declarations }
    procedure save;Override;
  end;

var
  TasOrderItemsJob: TTasOrderItemsJob;

implementation

{$R *.dfm}

uses MainModule;

{ TTasOrderItemsJob }

procedure TTasOrderItemsJob.ShowWorkFront;
begin
  frWorkFront := TFmWorkFront.Create(Self);
  frWorkFront.Parent := Ctn_WorkFront;
  frWorkFront.Align := alClient;
  frWorkFront.Listar;
  frWorkFront.Show;
end;

procedure TTasOrderItemsJob.FormatScreen;
begin
  inherited;
  ShowWorkFront;
end;

procedure TTasOrderItemsJob.save;
begin
  with self.cds_Item do
  Begin
    Active := True;
    if EditionState = 'I' then
    Begin
      Append;
      FieldByName('codepro').AsString := FrMerchandise.DBLCB_Lista.KeyValue; //E_ID_Product.Text;
      FieldByName('identifier').AsString := FrMerchandise.DBLCB_Lista.KeyValue;
      FieldByName('description').AsString := UpperCase( FrMerchandise.DBLCB_Lista.Text );
      FieldByName('id').AsInteger := 0;
      FieldByName('tb_institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
      FieldByName('tb_order_id').AsInteger := 0;
      FieldByName('tb_product_id').AsString := FrMerchandise.DBLCB_Lista.KeyValue;;
    End
    else
    Begin
      Edit;
    End;
    if  FrStockList.chbx_UpdateStock.Checked then
      FieldByName('tb_stock_list_id').AsInteger := FrStockList.DBLCB_Lista.KeyValue
    else
      FieldByName('tb_stock_list_id').AsInteger := 0;
    FieldByName('quantity').AsFloat := StrToFloatDef(E_Qtty.Text,0);
    FieldByName('unit_value').AsFloat := StrToFloatDef(E_Unit_Value.Text,0);
    FieldByName('discount_aliquot').AsFloat := StrToFloatDef(E_Aliq_Desconto.Text,0);
    FieldByName('discount_value').AsFloat := StrToFloatDef(E_Vl_Desconto.Text,0);
    FieldByName('work_front').AsString := frWorkFront.DBLCB_Lista.Text;
    Post;
    Active := False;
    Active := True;
  End;
end;

procedure TTasOrderItemsJob.ShowData;
begin
  with cds_Item do
  Begin
    FrStockList.DBLCB_Lista.KeyValue    := FieldByName('tb_stock_list_id').AsInteger;
    FrMerchandise.DBLCB_Lista.KeyValue  := fieldByname('tb_product_id').AsInteger;
    E_Qtty.Text                         := FieldByName('quantity').AsString;
    E_Unit_Value.Text                   := FieldByName('unit_value').AsString;
    E_Aliq_Desconto.Text                := FieldByName('discount_aliquot').AsString;
    E_Vl_Desconto.Text                  := FieldByName('discount_value').AsString;
    E_Work_Front.Text                   := FieldByName('work_front').AsString;
    frWorkFront.DBLCB_Lista.Text        := FieldByName('work_front').AsString;
  End;

end;

end.


