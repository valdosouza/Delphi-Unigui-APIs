unit ControllerMedPriceList;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedPriceList, Md5, FireDAC.Stan.Param,
      ControllerEntity, ControllerBank, System.Generics.Collections,
      Datasnap.DBClient, Data.DB, FireDAC.Comp.Client, ControllerBroadcaster;

Type
  TListaMedPriceList = TObjectList<TMedPriceList>;

  TControllerMedPriceList = Class(TBaseController)
  Lista: TListaMedPriceList;
    procedure clear;
  private


  public
    Registro : TMedPriceList;
    Broadcaster : TControllerBroadcaster;
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

{ ControllerMedPriceList }

procedure TControllerMedPriceList.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerMedPriceList.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMedPriceList.Create;
  Lista       := TListaMedPriceList.Create;
  Broadcaster := TControllerBroadcaster.Create(Self);

end;

function TControllerMedPriceList.delete: boolean;
begin
  FreeAndNil(broadcaster);
  FreeAndNil(Registro);
  inherited;
end;

destructor TControllerMedPriceList.Destroy;
begin
  FreeAndNil(broadcaster);
  FreeAndNil(Registro);
  inherited;
end;


function TControllerMedPriceList.insert: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMedPriceList.save: boolean;
begin

  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerMedPriceList.getAllByKey: boolean;
begin
   getByKey;
End;

function TControllerMedPriceList.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerMedPriceList.getList;
var
  Qry : TFDQuery;
  LITem : TMedPriceList;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat( ' SELECT mpl.* ',
                    ' FROM tb_med_price_list mpl ',
                    ' where mpl.tb_institution_id = :tb_institution_id ',
                    ' AND tb_broadcaster_id =:tb_broadcaster_id'
                    ));
     ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
     ParamByName('tb_broadcaster_id').AsInteger := Registro.Veiculo;
    Active := True;
    FetchAll;
    First;
   // Lista.Clear;
    while not eof do
   Begin
      LITem := TMedPriceList.Create;
      with LITem do
      Begin
        Codigo          := FieldByName('id').AsInteger;
        Estabelecimento := FieldByName('tb_institution_id').asInteger;
        Veiculo         := FieldByName('tb_broadcaster_id').AsInteger;
        PosicaoProgramacao  := FieldByName('tb_med_pos_prog_id').AsInteger;
        Valor           := FieldByName('tag_value').AsFloat;
        Tipo            := FieldByName('kind').AsInteger;
        RegistroCriado  := FieldByName('created_at').AsDateTime;
        RegistroAlterado:= FieldByName('updated_at').AsDateTime;
      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);

end;

end.
