unit ControllerMedPriceListRT;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedPriceListRT, Md5, FireDAC.Stan.Param,
      ControllerEntity, ControllerBank, System.Generics.Collections,
      Datasnap.DBClient, Data.DB, FireDAC.Comp.Client, ControllerBroadcaster,
      ControllerMedPosProg;

Type
  TListaMedPriceListRT = TObjectList<TMedPriceListRT>;

  TControllerMedPriceListRT = Class(TBaseController)
  Lista: TListaMedPriceListRT;
    procedure clear;
  private


  public
    Registro : TMedPriceListRt;
    Posicao : TControllerMedPosProg;
    Broadcaster : TControllerBroadcaster;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;

    function save:boolean;
    function insert:boolean;
    function update:boolean;
    function delete: boolean;
    function getByPosition: Boolean;

    function getByKey:Boolean;
    function getAllByKey:Boolean;
  End;

implementation

{ ControllerMedPriceListJR }


procedure TControllerMedPriceListRT.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerMedPriceListRT.Create(AOwner: TComponent);
begin
  inherited;
  Registro    := TMedPriceListRt.Create;
  Lista       := TListaMedPriceListRT.Create;
  Posicao     := TControllerMedPosProg.Create(Self);
  Broadcaster := TControllerBroadcaster.Create(Self);
end;

function TControllerMedPriceListRT.delete: boolean;
begin
  deleteObj(Registro);
end;

destructor TControllerMedPriceListRT.Destroy;
begin
  Registro.disposeof;
  Posicao.DisposeOf;
  Lista.disposeof;
  Broadcaster.disposeof;
  inherited;
end;


function TControllerMedPriceListRT.insert: boolean;
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

function TControllerMedPriceListRT.save: boolean;
begin

  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerMedPriceListRT.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerMedPriceListRT.getAllByKey: boolean;
begin
   getByKey;
End;

function TControllerMedPriceListRT.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerMedPriceListRT.getByPosition: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.add(concat( ' SELECT * ',
                      ' FROM tb_med_price_list_rt rt ',
                      ' where rt.tb_institution_id =:institution_id ',
                      ' AND rt.tb_broadcaster_id =:broadcaster_id ',
                      ' and rt.tb_med_pos_prog_id =:med_pos_prog_id '
                      ));
      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('broadcaster_id').AsInteger := Registro.Veiculo;
      ParamByName('med_pos_prog_id').AsInteger := Registro.PosicaoProgramacao;
      Active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if (exist) then get(Lc_Qry,Registro);
    End;
   Finally
    Lc_Qry.close;
    FReeandNil(Lc_Qry)
  End;
end;

procedure TControllerMedPriceListRT.getList;
var
  Qry : TFDQuery;
  LITem : TMedPriceListRt;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat( ' SELECT rt.* ',
                    ' FROM tb_med_price_list_rt rt ',
                    ' where rt.tb_institution_id = :institution_id ',
                    ' AND rt.tb_broadcaster_id =:broadcaster_id'
                    ));
     ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
     ParamByName('broadcaster_id').AsInteger := Registro.Veiculo;
    Active := True;
    FetchAll;
    First;
   // Lista.Clear;
    while not eof do
   Begin
      LITem := TMedPriceListRt.Create;
      with LITem do
      Begin
        Codigo              := FieldByName('id').AsInteger;
        Estabelecimento     := FieldByName('tb_institution_id').asInteger;
        Veiculo             := FieldByName('tb_broadcaster_id').AsInteger;
        PosicaoProgramacao  := FieldByName('tb_med_pos_prog_id').AsInteger;
        Spot15              := FieldByName('spot15_value').AsFloat;
        Spot30              := FieldByName('spot30_value').AsFloat;
        Spot45              := FieldByName('spot45_value').AsFloat;
        Spot60              := FieldByName('spot60_value').AsFloat;
        Horario             := FieldByName('schedule').AsString;
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

end.
