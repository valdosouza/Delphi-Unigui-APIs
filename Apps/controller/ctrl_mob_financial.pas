unit ctrl_mob_financial;

interface

uses System.Classes,ctrl_mob_base, System.SysUtils, FireDAC.Comp.Client,
      tblFinancial, TypesCollection,prm_financial, rest.json;

Type
  TCtrlMobFinancial = class(TCtrlMobBase)
    private

    public
      Registro : Tfinancial;
      Lista: TListFinancial;
      Parametro : TPrmFinancial;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure setParametro(par:String);
      procedure createTable;
      function save:Boolean;
      function insert:Boolean;
      function getbyKey:Boolean;
      function getlist:Boolean;
      procedure clear;
  end;

implementation



uses MainModule;


procedure TCtrlMobFinancial.clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobFinancial.Create(AOwner: TComponent);
begin
  Registro := TFinancial.create;
  Lista := TListFinancial.Create;
  Parametro := TPrmFinancial.create;
  createTable;
end;

procedure TCtrlMobFinancial.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_financial ( ',
                '  tb_institution_id int(11) , ',
                '  tb_order_id int(11) , ',
                '  terminal int(11) NOT NULL ,  ',
                '  parcel int(11) , ',
                '  dt_expiration date , ',
                '  tb_payment_types_id int(11) , ',
                '  tag_value decimal(10,2) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ; '
      ));
end;

destructor TCtrlMobFinancial.Destroy;
begin
  {$IFDEF WIN32}
  Registro.Disposeof;
  Lista.Disposeof;
  Parametro.Destroy;
  {$ENDIF }
end;

function TCtrlMobFinancial.getbyKey: Boolean;
begin
  _getByKey(Registro);
end;

function TCtrlMobFinancial.getlist: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TFinancial;
  LcAux : String;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_financial ',
                     'WHERE ( tb_institution_id =:institution_id ) '
      ));

      //Incrementa SQL
      //Verifica de quais dispositivos serão feitos os downloads

      LcAux := '';//getDispositivos;
      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //sql.add(' limit 0,30 '); //somente em teste
      //Passagem de parametros
      parambyname('institution_id').AsInteger := Registro.Estabelecimento;
      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TFinancial.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TCtrlMobFinancial.insert: Boolean;
begin
  try
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TCtrlMobFinancial.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

procedure TCtrlMobFinancial.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmFinancial>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);

end;

end.

