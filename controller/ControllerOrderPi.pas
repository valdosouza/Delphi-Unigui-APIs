unit ControllerOrderPi;

interface

uses
  System.Classes, System.SysUtils, BaseController, tblOrderPi,
  FireDAC.Comp.Client, FireDAC.Stan.Param, ControllerAgency, tblMedPartsJr,
  ControllerAdvertiser,ControllerBroadcaster, ControllerMedParts, ControllerOrder,
  ControllerMedInsertDate,  ControllerInstitution, objOrderPI, tblMedParts,
  tblMedPartsRt;

Type
  TControllerOrderPi = Class(TBaseController)
    procedure clear;
  private

  public
    ordem         : TControllerOrder;
    Registro      : TOrderPi;
    Institution   : TControllerInstitution;
    Agency        : TControllerAgency;
    Advertiser    : TControllerAdvertiser;
    Broadcaster   : TControllerBroadcaster;
    Parts      : TControllerMedParts;
    InsertDate : TControllerMedInsertDate;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function saveDataObjeto(DObj : TObjOrderPI):Boolean;
    function getLasNoteByAdvertiser:String;
    function getDuplicity:Boolean;
  End;


implementation

{ TControllerOrderPi}

procedure TControllerOrderPi.clear;
begin
  clearObj(Registro);
end;

constructor TControllerOrderPi.Create(AOwner: TComponent);
begin
  inherited;
  Registro      := TOrderPi.Create;
  ordem         := TControllerOrder.Create(self);
  Institution   := TControllerInstitution.Create(Self);
  Agency        := TControllerAgency.Create(Self);
  Advertiser    := TControllerAdvertiser.Create(Self);
  Broadcaster   := TControllerBroadcaster.Create(Self);
  Parts         := TControllerMedParts.Create(Self);
  InsertDate := TControllerMedInsertDate.Create(Self);

end;

function TControllerOrderPi.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderPi.Destroy;
begin
  Registro.DisposeOf;
  Agency.DisposeOf;
  Advertiser.DisposeOf;
  Broadcaster.DisposeOf;
  inherited;
end;

function TControllerOrderPi.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderPi.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
//    if Registro.NumeroInterno = 0 then
//      Registro.NumeroInterno := getNextByField(Registro,'nr_internal',Registro.Estabelecimento);

    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerOrderPi.saveDataObjeto(DObj: TObjOrderPI): Boolean;
VAr
  I : Integer;
  lcpecas : TMedParts;
  LcIdEntity : Integer;
begin
  ordem.Registro := DObj.Ordem;
  ordem.save;

  Registro := DObj.OrdemPI;
  //Agencia
  LcIdEntity := 0;
  LcIdEntity := Agency.Fiscal.Juridica.getIDbyCNPJ(DObj.AgenciaCNPJ);
  if LcIdEntity = 0 then
    LcIdEntity := Agency.Fiscal.Fisica.getIDbyCPF(DObj.AgenciaCNPJ);
  Registro.Agencia := LcIdEntity;
  //Anunciante
  LcIdEntity := 0;
  LcIdEntity := Advertiser.Fiscal.Juridica.getIDbyCNPJ(DObj.AnuncianteCNPJ);
  if LcIdEntity = 0 then
    LcIdEntity := Advertiser.Fiscal.Fisica.getIDbyCPF(DObj.AnuncianteCNPJ);
  Registro.Anunciante := LcIdEntity;
  //Veiculo
  LcIdEntity := 0;
  LcIdEntity := Broadcaster.Fiscal.Juridica.getIDbyCNPJ(DObj.VeiculoCNPJ);
  if LcIdEntity = 0 then
    LcIdEntity := Broadcaster.Fiscal.Fisica.getIDbyCPF(DObj.VeiculoCNPJ);
  Registro.Veiculo := LcIdEntity;
  Self.save;

  for I := 0 to DObj.Pecas.Count -1 do
  Begin
    Parts.Registro := DObj.Pecas[I];
    Parts.save;
  End;

  for I := 0 to DObj.PecasJR.Count -1 do
  Begin
    Parts.PartJR.Registro := DObj.PecasJR[I];
    Parts.PartJR.save;
  End;

//  for I := 0 to DObj.PecasRT.Count -1 do
//  Begin
//    Parts.PartRT.Registro := DObj.PecasRt[I];
//    Parts.PartRT.Registro.Ordem := Registro.Codigo;
//    Parts.PartRT.save;
//  End;

  for I := 0 to DObj.DataInsercao.Count -1 do
  Begin
    InsertDate.Registro := DObj.DataInsercao[I];
    InsertDate.save;
  End;


end;



function TControllerOrderPi.getAllByKey: boolean;
begin
  _getByKey(Registro);

  Self.Institution.Registro.Codigo := Self.Registro.Estabelecimento;
  Self.Institution.getAllByKey;

  Self.Agency.Registro.Codigo := Self.Registro.Agencia;
  Self.Agency.Registro.Estabelecimento := Self.Registro.Estabelecimento;
  Self.Agency.getAllByKey;

  Self.Advertiser.Registro.Codigo := Self.Registro.Anunciante;
  Self.Advertiser.Registro.Estabelecimento := Self.Registro.Estabelecimento;
  Self.Advertiser.getAllByKey;

  Self.Broadcaster.Registro.Codigo := Self.Registro.Veiculo;
  Self.Broadcaster.Registro.Estabelecimento := Self.Registro.Estabelecimento;
  Self.Broadcaster.getAllByKey;

end;

function TControllerOrderPi.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerOrderPi.getDuplicity: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
              'select nr_internal ',
              'from tb_order_pi ',
              'where ( tb_institution_id=:tb_institution_id ) ',
              ' and ( nr_internal =:nr_internal ) ',
              ' and ( id <>:id) '
      ));
      ParamByName('nr_internal').AsInteger := Registro.NumeroInterno;
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('id').AsInteger := Registro.Codigo;
      Active := True;
      FetchAll;
      result :=  (RecordCount >0);
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;

end;

function TControllerOrderPi.getLasNoteByAdvertiser: String;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Result := '';
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'SELECT od.note ',
                'FROM tb_order od ',
                'WHERE od.id = ( ',
                'SELECT MAX(odp.id) ',
                'FROM tb_order_pi odp ',
                'WHERE (odp.tb_advertiser_id =:advertiser_id)) '
      ));
      ParamByName('advertiser_id').AsInteger := Registro.Anunciante;
      Active := True;
      FetchAll;
      if RecordCount >0 then
        Result := FieldByName('note').AsString;
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

end.
