unit ControllerOrderItemCofins;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblItemCofins, tblEntity, FireDAC.Comp.Client,GenericDao,Md5, FireDAC.Stan.Param;

Type
  TControllerItemCofins= Class(TBaseController)
    procedure clear;
  private
    procedure get;
  public
    Registro : TItemCofins;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    procedure getbyKey;
  End;

implementation

{ ControllerOrderItem}

uses MainModule;


procedure TControllerOrderItem.clear;
begin
  TGenericDAO.Clear(Registro);
end;

constructor TControllerOrderItem.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderItem.Create
  end;

destructor TControllerOrderItem.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerOrderItem.save: boolean;
begin
  try
    TGenericDAO.SaveRecord(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerOrderItem.getbyKey;
begin
  exist := existId(Registro);
  if (exist) then get;
end;

procedure TControllerOrderItem.get;
begin
  with UMM.Qr_Crud,Registro do
  Begin
    Codigo              := FieldByName('id').AsInteger;
    Estabelecimento     := FieldByName('tb_institution_id').AsInteger;
    Ordem               := FieldByName('tb_order_id').AsInteger;
    IdExterno           := FieldByName('external_id').AsInteger;
    Item                := FieldByName('item').AsInteger;
    Produto             := FieldByName('tb_product_id').AsInteger;
    Quantidade          := FieldByName('qtty').AsFloat;
    ValorUnitario       := FieldByName('unit_value').AsFloat;
    Aliquota            := FieldByName('discount_aliquot').AsFloat;
    Desconto            := FieldByName('discount_value').AsFloat;
    RegistroCriado      := FieldByName('created_at').AsDateTime;
    RegistroAlterado    := FieldByName('updated_at').AsDateTime;

    Close;
  End;
end;

end.
