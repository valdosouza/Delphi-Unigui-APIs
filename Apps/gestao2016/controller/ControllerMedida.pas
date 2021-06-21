unit ControllerMedida;

interface

uses System.Classes, System.SysUtils,BaseController,
       tblMedida ,GenericDao, System.Generics.Collections, FireDAC.Comp.Client;

Type
  TListaMedida  = TObjectList<TMedida>;
  TControllerMedida = Class(TBaseController)
    Lista : TListaMedida;
  private

  public
    Registro : TMedida;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    function migra:boolean;
    procedure getIdAutoByDesc;
    procedure getbyId;
    procedure getbyDescricao;
    procedure getbyDescricaoMedidaCardapio;
    procedure getbyMedidaEspecial;
    procedure AlteraMedidaEspecial(NEW_MED,OLD_MED:String);
    function insere:boolean;
    function update:Boolean;
    Function delete:boolean;
    Function getList:boolean;
  End;

implementation


procedure TControllerMedida.AlteraMedidaEspecial(NEW_MED,OLD_MED:String);
Var
  Qry :TFDQuery;
begin
  try
    Qry := geraQuery;
    with Qry do
    Begin
      sql.Clear;
      SQL.Add(concat(
            'UPDATE TB_MEDIDA SET ',
            'MED_ESPECIAL =:MED_ESPECIAL ' ,
            'where MED_ESPECIAL=:OLD_MED_ESPECIAL '
      ));
      ParamByName('MED_ESPECIAL').AsString := NEW_MED;
      ParamByName('OLD_MED_ESPECIAL').AsString := OLD_MED;
      ExecSQL;
    End;
  finally
    Qry.Close;
    FreeAndNil(Qry);
  end;
end;

constructor TControllerMedida.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMedida.Create;
  Lista := TListaMedida.create;
end;

function TControllerMedida.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerMedida.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista );
  inherited;
end;

function TControllerMedida.insere: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_MEDIDA');
  Try
    InsertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerMedida.migra: boolean;
begin
  SaveObj(Registro);
end;


function TControllerMedida.salva: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_MEDIDA');
  SaveObj(Registro);
end;

function TControllerMedida.update: Boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerMedida.getById;
begin
  _getByKey(Registro);
end;

procedure TControllerMedida.getbyDescricao;
Var
  Qry :TFDQuery;
begin
  {Cuidado ao mexer nesta funçao, se colocar o get aqui dentro vai ter problema
    na alteração dos sabores - se precisar deste dos para validar coloque o get fora }
  try
    Qry := geraQuery;
    with Qry do
    Begin
      exist := False;
      active := False;
      sql.Clear;
      SQL.Add('SELECT * '+
              'FROM TB_MEDIDA '+
              'WHERE ( MED_DESCRICAO =:MED_DESCRICAO ) ');
      ParamByName('MED_DESCRICAO').AsString := Registro.Descricao;
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0;
      if Exists then get(Qry,Registro);
    End;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;

procedure TControllerMedida.getbyDescricaoMedidaCardapio;
Var
  Qry :TFDQuery;
begin
  try
    Qry := geraQuery;
    with Qry do
    Begin
      {Cuidado ao mexer nesta funçao, se colocar o get aqui dentro vai ter problema
      na alteração dos sabores - se precisar deste dos para validar coloque o get fora }
      exist := False;
      active := False;
      sql.Clear;
      SQL.Add('SELECT * '+
              'FROM TB_MEDIDA '+
              'WHERE ( MED_DESCRICAO =:MED_DESCRICAO ) '+
              ' AND ( MED_ESPECIAL =:MED_ESPECIAL ) '+
              'ORDER BY MED_SEQUENCIA ');
      ParamByName('MED_DESCRICAO').AsString := Registro.Descricao;
      ParamByName('MED_ESPECIAL').AsString := Registro.MedidaCardapio;
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0;
      if exist then get(Qry,Registro);
    End;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;

procedure TControllerMedida.getbyMedidaEspecial;
Var
  Qry :TFDQuery;
begin
  try
    Qry := geraQuery;
    with Qry do
    Begin
      exist := False;
      active := False;
      sql.Clear;
      SQL.Add('SELECT * '+
              'FROM TB_MEDIDA '+
              'WHERE MED_ESPECIAL =:MED_ESPECIAL '+
              'ORDER BY MED_SEQUENCIA ');
      ParamByName('MED_ESPECIAL').AsString := Registro.MedidaCardapio;
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0;
      if exist then
        get(Qry,Registro);
  End;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;

procedure TControllerMedida.getIdAutoByDesc;
begin
  getbyDescricao;
  if not exist then
  Begin
    Registro.Codigo := 0;
    Registro.Escala := '0';
    Registro.Abreviatura := Copy(Registro.Descricao,1,3);
    Registro.MedidaCardapio := '';
    Registro.Proporcao := 0;
    Registro.Sequencia :=0;
    insere;
  End;

end;

function TControllerMedida.getList: boolean;
var
  Qry : TFDQuery;
  LcLista : TMedida;
begin
  Try
    Qry := geraQuery;
    with Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add('SELECT * FROM TB_MEDIDA ');
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TMedida.Create;
        get(qry,LcLista);
        Lista.add(LcLista);
        next;
      end;
    end;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;


end.
