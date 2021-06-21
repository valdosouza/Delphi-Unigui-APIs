unit ControllerPriceList;

interface
uses System.Classes, System.SysUtils,BaseController,rest.json, prm_price_list,
      tblPriceList, FireDAC.Comp.Client,FireDAC.Stan.Param,
      System.Generics.Collections, ControllerPrice, TypesCollection;

Type

  TControllerPriceList = Class(TBaseController)

    procedure clear;
  private

  public
    Registro : TPriceList;
    Preco : TControllerPrice;
    Lista : TListPriceList;
    Parametro : TPrmPriceList;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure setParametro(par:String);
    procedure getList;
    function save:boolean;
    function insert:boolean;
    function getByKey:Boolean;
    function delete: boolean;
    procedure assign(ObjOri : TPriceList);
  End;

implementation

{ ControllerPriceList }

procedure TControllerPriceList.assign(ObjOri: TPriceList);
begin
  _assign(ObjOri,Registro);
end;

procedure TControllerPriceList.clear;
begin
  clearObj(Registro);
end;

constructor TControllerPriceList.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TPriceList.Create;
  Lista := TListPriceList.Create;
  Preco := TControllerPrice.create(nil);
  Parametro := TPrmPriceList.Create;
end;


function TControllerPriceList.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerPriceList.Destroy;
begin
  Parametro.Destroy;
  Lista.DisposeOf;
  Preco.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


function TControllerPriceList.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerPriceList.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

procedure TControllerPriceList.setParametro(par: String);
begin
  try
    Parametro := TPrmPriceList.Create;
    Parametro:= TJson.JsonToObject<TPrmPriceList>(par);
  //Tratar Data
    Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
  Except
    Parametro.UltimaAtualizacao := '1900-01-01 01:00:00'
  end;

end;

function TControllerPriceList.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerPriceList.getList;
var
  Lc_Qry : TFDQuery;
  LITem : TPriceList;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT *                                  ',
                     'FROM tb_price_list pl                     ',
                     'WHERE tb_institution_id =:institution_id  '
      ));


      //Incrementa SQL
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        sql.add(' ORDER BY description  asc  ');
      End;


      //Passagem de parametros
      parambyname('institution_id').AsInteger := Parametro.Tabela.Estabelecimento;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TPriceList.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;

end;


end.
