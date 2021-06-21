unit ControllerEmbalagem;

interface

uses System.Classes, System.SysUtils,BaseController,
      tblEmbalagem ,GenericDao,System.Generics.Collections,
  FireDAC.Comp.Client;

Type
  TListaEmbalagem  = TObjectList<TEmbalagem>;

  TControllerEmbalagem = Class(TBaseController)
    Lista : TListaEmbalagem;
  private
  public
    Registro : TEmbalagem;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getbyDescricao;
    procedure getIdAutoByDesc;
    function salva:boolean;
    function migra:Boolean;
    procedure getbyId;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    Function getList:boolean;
  End;

implementation


constructor TControllerEmbalagem.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TEmbalagem.Create;
  Lista := TListaEmbalagem.create;
end;

function TControllerEmbalagem.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerEmbalagem.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

function TControllerEmbalagem.insert: boolean;
begin
  Try
    if Registro.Codigo = 0 then
      Registro.Codigo := Generator('GN_EMBALAGEM');
    InsertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerEmbalagem.migra: Boolean;
begin
  SaveObj(Registro);
end;


function TControllerEmbalagem.salva: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_EMBALAGEM');
  SaveObj(Registro);
end;

function TControllerEmbalagem.update: boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerEmbalagem.getbyDescricao;
var
  Qry : TFDQuery;
  LcLista : TEmbalagem;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      exist := False;
      active := False;
      sql.Clear;
      SQL.Add('SELECT * '+
              'FROM TB_EMBALAGEM '+
              'WHERE ( EMB_DESCRICAO =:EMB_DESCRICAO ) ');
      ParamByName('EMB_DESCRICAO').AsString := Registro.Descricao;
      Active := True;
      FetchAll;
      First;
      exist := (RecordCount > 0)
    End;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;

procedure TControllerEmbalagem.getById;
begin
    _getByKey(Registro);
end;


procedure TControllerEmbalagem.getIdAutoByDesc;
begin
  getbyDescricao;
  if not exist then
  Begin
    Registro.Codigo := 0;
    Registro.Abreviatura := Copy(Registro.Descricao,1,3);
    insert;
  End;
end;

function TControllerEmbalagem.getList: boolean;
var
  Qry : TFDQuery;
  LcLista : TEmbalagem;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add('SELECT * FROM TB_EMBALAGEM ');
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TEmbalagem.Create;
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
