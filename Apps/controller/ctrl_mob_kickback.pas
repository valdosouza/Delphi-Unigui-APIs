unit ctrl_mob_kickback;


interface

uses System.Classes,System.SysUtils, ctrl_mob_base, tblkickback, FireDAC.Comp.Client,
      TypesListCollection,list_spl_kickback, objKickback,typesCollection, prm_kickback;

Type
  TCtrlMobKickBack = class(TCtrlMobBase)
    private
    public
      Registro : TKickback;
      Lista : TListKickback;
      CollListaSpl : TCollSplKickback;
      Obj           : TObjKickback;
      Parametro : TPrmKickback;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:Boolean;
      function getByKey:boolean;
      procedure getListSpl(palavra:TStringList;pdata:Tdate);
      procedure FillDataObjeto(PcRegistro: TKickback);
      function getlist:Boolean;
      procedure clear;
  end;

implementation

{ TCtrlMobKickBack }

uses MainModule;

procedure TCtrlMobKickBack.clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobKickBack.Create(AOwner: TComponent);
begin
  inherited;
  Registro      := TKickback.Create;
  Lista         := TListKickback.Create;
  CollListaSpl  := TCollSplKickback.Create;
  Obj           := TObjKickback.Create;
  Parametro     := TPrmKickback.Create;
  createTable;
end;

procedure TCtrlMobKickBack.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_kickback ( ',
                '    tb_institution_id int(11) not null, ',
                '    terminal int(11) not null, ',
                '    tb_order_id int(11) not null, ',
                '    tb_order_item_id int(11) not null, ',
                '    parcel int(11) not null, ',
                '    dt_record Date, ',
                '    tb_customer_id int(11) not null, ',
                '    tb_collaborator_id int(11) not null, ',
                '    historic varchar(100), ',
                '    base_value numeric(10,2), ',
                '    aliq numeric(10,2), ',
                '    vl_payment numeric(10,2), ',
                '    dt_payment date, ',
                '    created_at datetime DEFAULT NULL, ',
                '  updated_at datetime DEFAULT NULL); '
      ));
end;

destructor TCtrlMobKickBack.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;
  Lista.DisposeOf;
  CollListaSpl.DisposeOf;
  Obj.Destroy;
  Parametro.Destroy;
  inherited;

  {$ENDIF }
end;

procedure TCtrlMobKickBack.FillDataObjeto(PcRegistro: TKickback);
begin
  ClonarObj(PcRegistro,Obj.Comissao);
end;

function TCtrlMobKickBack.getByKey: boolean;
begin
  _getByKey(Registro);
end;



function TCtrlMobKickBack.getlist: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TKickback;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT k.* ',
                      'FROM tb_kickback k ',
                      'WHERE k.tb_institution_id =:tb_institution_id '
                      ));
      //incremeta SQL
      if Registro.Ordem > 0 then
        sql.add('AND tb_order_id =:tb_order_id');

      if Trim( Parametro.UltimaAtualizacao ) <> '' then
      Begin
        sql.add(' AND ( updated_at >:updated_at ) ');
        sql.add(' order by updated_at asc ');
      End
      else
      Begin
        sql.add(concat(' ORDER BY ',orderby,'  asc '));
      End;

      //Passagem de parametros
      ParamByName('tb_institution_id').AsInteger := Parametro.Comissao.Estabelecimento;
      if Parametro.Comissao.Ordem > 0 then
        ParamByName('tb_order_id').AsInteger := Parametro.Comissao.Ordem;

      if Trim( Parametro.UltimaAtualizacao ) <> '' then
        parambyname('updated_at').AsString := Parametro.UltimaAtualizacao;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TKickback.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TCtrlMobKickBack.getListSpl(palavra: TStringList; pdata: Tdate);
Var
  Lc_Qry :TFDQuery;
  item : TListSplKickback;
  I:Integer;
  LcSqlStr : String;
Begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
              ' select tb_institution_id, terminal, tb_order_id, tb_order_item_id, parcel, ',
              'dt_record, base_value, vl_payment, historic ',
              ' from tb_kickback ',
              'where ( tb_institution_id =:tb_institution_id ) '
          ));
      //Incrmenta o sql
      if ( pdata > 0) then
        sql.Add(' and ( dt_record=:dt_record ) ');

      LcSqlStr := ' and ( ';
      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
        Begin
          if I = 0 then
            LcSqlStr := concat(LcSqlStr,' ( historic like  :palavra',i.ToString,' ) ')
          else
            LcSqlStr := concat(LcSqlStr,' and ( historic like  :palavra',i.ToString,' ) ');
        End;
        LcSqlStr := concat(LcSqlStr,')');
        sql.Add(LcSqlStr);
      End;

      if palavra.Count = 0 then   sql.Add('limit 0,50 ');

      //sql.Add(concat('Limit ', InttoStr( (Page * 20 ) - 20 ),',', InttoStr( (Page * 20 ) ) ));
      //Passagem parametros
      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;

      if pdata > 0 then
        ParamByName('dt_record').AsDate  := pdata;

      if palavra.count > 0 then
      Begin
        for I := 0 to palavra.count -1 do
          ParamByName(concat('palavra',i.ToString)).AsString := concat('%',palavra[I],'%');
      End;

      Active := True;
      FetchAll;
      First;
      Self.CollListaSpl.Clear;
      while not eof do
      Begin
        item := TListSplKickback.Create;
        item.Estabelecimento  := FieldByName('tb_institution_id').AsInteger;
        item.Terminal         := FieldByName('terminal').AsInteger;
        item.Ordem            := FieldByName('tb_order_id').AsInteger;
        item.Item             := FieldByName('tb_order_item_id').AsInteger;
        item.Parcela          := FieldByName('parcel').AsInteger;
        item.Data             := FieldByName('dt_record').AsDateTime;
        item.Venda            := FieldByName('base_value').AsFloat;
        item.Comissao         := FieldByName('vl_payment').AsFloat;
        item.Historico        := FieldByName('historic').AsString;
        //add lista
        Self.CollListaSpl.Add( item );
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TCtrlMobKickBack.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := False;
  end;
end;


end.
