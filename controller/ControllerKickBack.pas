unit ControllerKickBack;

interface

uses System.Classes,BaseController, tblkickback, FireDAC.Comp.Client,
    prm_base,objKickback, Generics.Collections,TypesCollection,
  System.SysUtils, rest.json, prm_kickback;

Type
  TObjListKickback = TObjectList<TObjKickback>;


  TControllerKickBack = class(TBaseController)
    private
    public
      Registro : TKickback;
      Lista : TListKickback;
      ListaObj : TObjListKickback;
      Parametro : TPrmKickback;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure setParametro(par:String);
      function save:Boolean;
      function getByKey:boolean;

      procedure getlist;

      function saveDataObjeto(DObj : TobjKickback):Boolean;
  end;

implementation

{ TControllerKickBack }

constructor TControllerKickBack.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TKickback.Create;
  ListaObj := TObjListKickback.create;
  Lista := TListKickback.Create;
  Parametro := TPrmKickback.Create;
end;


destructor TControllerKickBack.Destroy;
begin
  Parametro.Destroy;
  Registro.DisposeOf;
  ListaObj.Destroy;
  Lista.disposeOf;
  inherited;
end;

function TControllerKickBack.getByKey: boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerKickBack.getList;
Var
  Lc_Qry :TFDQuery;
  item : TKickback;
  I:Integer;
  LcSqlStr : String;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              ' select * ',
              ' from tb_kickback ',
              'where ( tb_institution_id =:tb_institution_id ) '
          ));
      //Incrementa SQL

      if Parametro.Comissao.Terminal > 0 then
        sql.add(' and (terminal =:terminal)' );

      if Trim(Parametro.UltimaAtualizacao) <> '' then
      Begin
        sql.add(' AND ( updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        if Trim(orderby)='' then orderby := 'tb_order_id';
          sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //Passagem de parametros
      parambyname('tb_institution_id').AsInteger := Parametro.Comissao.Estabelecimento;

      if Parametro.Comissao.Terminal > 0 then
        parambyname('terminal').AsInteger := Parametro.Comissao.Terminal;

      if Trim(Parametro.UltimaAtualizacao) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Self.Lista.Clear;
      while not eof do
      Begin
        item := TKickback.Create;
        get(Lc_Qry,item);
        Self.Lista.Add( item );
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;

end;

function TControllerKickBack.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;

function TControllerKickBack.saveDataObjeto(DObj: TobjKickback): Boolean;
begin
  ClonarObj(dobj.Comissao, Registro);
  Self.save;
end;

procedure TControllerKickBack.setParametro(par: String);
begin
  Parametro:= TJson.JsonToObject<TPrmKickback>(par);
  //Tratar Data
  Parametro.UltimaAtualizacao := dataMysql(Parametro.UltimaAtualizacao);
end;

end.

