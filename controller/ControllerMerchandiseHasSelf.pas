unit ControllerMerchandiseHasSelf;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMerchandise,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      tblMerchandiseHasself, ControllerMerchandise, System.Generics.Collections,
      Datasnap.DBClient, Data.DB;

Type
  TListaMerchandiseItem = TObjectList<TMerchandiseHasSelf>;

  TControllerMerchandiseHasSelf = Class(TBaseController)
    Lista: TListaMerchandiseItem;
    procedure clear;
  private

  public
  Registro    : TMerchandiseHasSelf;
  Merchandise : TControllerMerchandise;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;

    function save:boolean;
    function insert:boolean;
    function delete: boolean;


    function getByKey:Boolean;
    function getAllByKey:Boolean;


  End;


implementation

{ TControllerMerchandiseHasMerchandise }

procedure TControllerMerchandiseHasSelf.clear;
begin
//
end;

constructor TControllerMerchandiseHasSelf.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TMerchandiseHasSelf.Create;
  Lista       := TListaMerchandiseItem.Create;
  Merchandise := TControllerMerchandise.Create(self);
end;

function TControllerMerchandiseHasSelf.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerMerchandiseHasSelf.Destroy;
begin
  inherited;
  FreeAndNil( Registro );
end;


function TControllerMerchandiseHasSelf.getAllByKey: Boolean;
begin
//
end;

function TControllerMerchandiseHasSelf.getByKey: Boolean;
begin
  _getByKey(Registro);

end;

procedure TControllerMerchandiseHasSelf.getList;
var
  Qry : TFDQuery;
  LITem : TMerchandiseHasSelf;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat( ' SELECT mhs.* ',
                    ' FROM tb_merchandise_has_self mhs ',
                    ' where mhs.tb_institution_id = :tb_institution_id ',
                    ' AND tb_master_id =:tb_master_id'
                    ));
    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    ParamByName('tb_master_id').AsInteger := Registro.Mestre;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TMerchandiseHasSelf.Create;
      with LITem do
      Begin
        Estabelecimento     := FieldByName('tb_institution_id').AsInteger;
        Mestre              := FieldByName('tb_master_id').AsInteger;
        Detalhe             := FieldByName('tb_detail_id').AsInteger;
        Quantidade          := FieldByName('quantity').AsInteger;
        RegistroCriado      := FieldByName('created_at').AsDateTime;
        RegistroAlterado    := FieldByName('updated_at').AsDateTime;
      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);

end;

function TControllerMerchandiseHasSelf.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMerchandiseHasSelf.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


end.
