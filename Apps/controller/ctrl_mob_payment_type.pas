unit ctrl_mob_payment_type;

interface

uses System.Classes,FireDAC.Comp.Client, tblPaymentTypes,
    System.SysUtils, ctrl_mob_base,TypesCollection;

Type
  TCtrlMobPaymentType = class(TCtrlMobBase)
    private

    public
      Registro : TPaymentTypes;
      Lista : TListPaymentTypes;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      function insert:Boolean;
      procedure createTable;
      procedure getlist;
      procedure clear;
      function getByDescripton:Boolean;
      function getByid:Boolean;
      function save:Boolean;
      procedure assign(ObjOri : TPaymentTypes);
  end;

implementation



uses MainModule;


procedure TCtrlMobPaymentType.assign(ObjOri: TPaymentTypes);
begin
  _assign(ObjOri,Registro);
end;

procedure TCtrlMobPaymentType.clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobPaymentType.Create(AOwner: TComponent);
begin
  Registro := TPaymentTypes.create;
  Lista := TListPaymentTypes.create;
  createTable;
end;

procedure TCtrlMobPaymentType.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_payment_types ( ',
                '  id int(11) , ',
                '  description varchar(45) , ',
                '  created_at datetime , ',
                '  updated_at datetime ) ;  '
      ));
  execcmd(concat(
            'CREATE TABLE if not exists tb_institution_has_payment_types ( ',
            '  tb_institution_id int(11) NOT NULL, ',
            '  tb_payment_types_id int(11) NOT NULL, ',
            '  active char(1) DEFAULT NULL, ',
            '  created_at datetime DEFAULT NULL, ',
            '  updated_at datetime DEFAULT NULL ) '
      ));
end;

destructor TCtrlMobPaymentType.Destroy;
begin
  {$IFDEF WIN32}
  Registro.dispoSeof;
  {$ENDIF }

end;

function TCtrlMobPaymentType.getByDescripton: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add(' SELECT p.* '+
              ' from tb_payment_types p ' +
              ' where (p.description =:description) ' );
      ParamByName('description').AsString := Registro.Descricao;
      Active := true;
      FetchAll;
      exist := ( RecordCount > 0 );
      if exist then
      Begin
        get(Lc_Qry, Registro);
      End
      else
      Begin
        Self.insert;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

function TCtrlMobPaymentType.getByid: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      sql.Add(' SELECT p.* '+
              ' from tb_payment_types p ' +
              ' where (p.id =:ID) ' );
      ParamByName('ID').AsInteger := Registro.Codigo;
      Active := true;
      FetchAll;
      exist := ( RecordCount > 0 );
      if exist then
        get(Lc_Qry, Registro);
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

procedure TCtrlMobPaymentType.getlist;
Var
  Lc_Qry :TFDQuery;
  LcLista : TPaymentTypes;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
               'Select pt.* ',
               'from tb_payment_types pt ',
               'where (pt.id > 0) '
          ));
      sql.add(concat(' ORDER BY ', orderby, ' asc '));

      Active := True;
      FetchAll;
      First;
      while not eof do
      Begin
        LcLista := TPaymentTypes.Create;
        get(Lc_Qry,LcLista);
        //add lista
        Lista.Add(LcLista);
        Next;
      End;
    End;
  Finally
    FinalizaQuery(Lc_Qry);
  End;


end;

function TCtrlMobPaymentType.insert: Boolean;
begin
  try
    insertObj(Registro);
    REsult := True;
  except
    REsult := False;
  end;
end;

function TCtrlMobPaymentType.save: Boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

end.
