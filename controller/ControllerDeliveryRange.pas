unit ControllerDeliveryRange;

interface
uses System.Classes, System.SysUtils,BaseController,tblDeliveryRange, Md5,
      FireDAC.Stan.Param, System.Generics.Collections,Datasnap.DBClient,
      Data.DB, FireDAC.Comp.Client,intMedFormats;

Type
  TListaDeliveryRange = TObjectList<TDeliveryRange>;

  TControllerDeliveryRange = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TDeliveryRange;
    Lista: TListaDeliveryRange;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;

    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;
    function getByKey:Boolean;

  End;

implementation

{ ControllerMedPriceListJR }

uses ControllerEntityFiscal;

procedure TControllerDeliveryRange.clear;
begin
  clearObj(Registro);
end;

constructor TControllerDeliveryRange.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TDeliveryRange.Create;
  Lista       := TListaDeliveryRange.Create;
end;

function TControllerDeliveryRange.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerDeliveryRange.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;


function TControllerDeliveryRange.insert: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerDeliveryRange.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerDeliveryRange.update: boolean;
begin
  try
    updateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerDeliveryRange.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerDeliveryRange.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TDeliveryRange;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat( ' SELECT dr.* ',
                      ' FROM tb_delivery_range dr ',
                      ' where dr.tb_institution_id = :institution_id ',
                      ' order by km_from, km_to '
                      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      Active := True;
      FetchAll;
      First;
     // Lista.Clear;
      while not eof do
     Begin
        LITem := TDeliveryRange.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    Lc_Qry.Close;
    Lc_Qry.DisposeOf;
  End;
end;



end.
