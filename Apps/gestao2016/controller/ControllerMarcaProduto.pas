unit ControllerMarcaProduto;

interface

uses System.Classes, System.SysUtils,BaseController,
      tblMarcaProduto ,GenericDao, System.Generics.Collections,
  FireDAC.Comp.Client;

Type
  TListaMarcaProduto  = TObjectList<TMarcaProduto>;
  TControllerMarcaProduto = Class(TBaseController)
    Lista : TListaMarcaProduto;
  private
  protected

  public
    Registro : TMarcaProduto;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    function migra:boolean;
    procedure getbyDescricao;
    procedure getIdAutoByDesc;
    procedure getbyId;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    Function getList:boolean;
  End;

implementation


constructor TControllerMarcaProduto.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMarcaProduto.Create;
  Lista := TListaMarcaProduto.create;
end;

function TControllerMarcaProduto.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerMarcaProduto.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista );
  inherited;
end;

function TControllerMarcaProduto.insert: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_MARCAPRODUTO');
  Try
    InsertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerMarcaProduto.migra: boolean;
begin
  SaveObj(Registro);
end;


function TControllerMarcaProduto.salva: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_MARCAPRODUTO');
  SaveObj(Registro);
end;


function TControllerMarcaProduto.update: boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerMarcaProduto.getbyDescricao;
var
  Qry : TFDQuery;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      exist := False;
      active := False;
      sql.Clear;
      SQL.Add('SELECT * '+
              'FROM TB_MARCA_PRODUTO '+
              'WHERE ( MRC_DESCRICAO =:MRC_DESCRICAO ) ');
      ParamByName('MRC_DESCRICAO').AsString := Registro.Descricao;
      Active := True;
      FetchAll;
      First;
      exist := RecordCount > 0 ;
      if exist then
        get(Qry,Registro);
    end;
  Finally
    Qry.close;
    FreeAndNil(Qry);
  End;
end;

procedure TControllerMarcaProduto.getById;
begin
  _getByKey(Registro);
end;


procedure TControllerMarcaProduto.getIdAutoByDesc;
begin
  getbyDescricao;
  if  not exist then
  Begin
    Registro.Codigo := 0;
    //'ESSE CAMPO É PRENCHIDO NA ENTRADA E ELE QUE VAI SER PREENCHIDO AUTOMATICAMENTE
    //Registro.Descricao := ''
    Registro.Fabrica := 0;
    insert;
  End;
end;

function TControllerMarcaProduto.getList: boolean;
var
  Qry : TFDQuery;
  LcLista : TMarcaProduto;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      active := False;
      sql.Clear;
      sql.add('SELECT * FROM TB_MARCA_PRODUTO ');
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LcLista := TMarcaProduto.Create;
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
