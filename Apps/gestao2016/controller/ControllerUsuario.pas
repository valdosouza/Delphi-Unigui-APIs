unit ControllerUsuario;

interface

uses IBX.IBDatabase,System.Classes, System.SysUtils,BaseController,
      tblUsuario ,GenericDao, System.Generics.Collections;

Type
  TListaUsuario = TObjectList<TUsuario>;

  TControllerUsuario = Class(TBaseController)
    Lista : TListaUsuario;
  private
  public
    Registro : TUsuario;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function salva:boolean;
    function Migra:boolean;
    procedure getbyId;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    Function getList:Boolean;
  End;

implementation

uses Un_sistema, Un_funcoes,Un_Regra_Negocio;

constructor TControllerUsuario.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TUsuario.Create;
  Lista := TListaUsuario.Create;
end;

function TControllerUsuario.delete: boolean;
begin
  Try
    DeleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerUsuario.Destroy;
begin
  FreeAndNil(Registro);
  FreeAndNil(Lista);
  inherited;
end;

function TControllerUsuario.insert: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_USUARIO');
  Try
    InsertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerUsuario.Migra: boolean;
begin
  SaveObj(Registro);
end;

function TControllerUsuario.salva: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := Generator('GN_USUARIO');
  SaveObj(Registro);
end;

function TControllerUsuario.update: boolean;
begin
  Try
    UpdateObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerUsuario.getById;
begin
    _getByKey(Registro);
end;


function TControllerUsuario.getList: Boolean;
var
  Qry : TIBQuery;
  LITem : TUsuario;
begin
  Try
    Qry := GeraQuery;
    with Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM TB_USUARIO ',
                      'WHERE USU_ATIVO = ''S'' ',
                      'ORDER BY USU_CODIGO ASC '
      ));
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TUsuario.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    Qry.Close;
    FreeAndNil(Qry);
  End;
end;

end.
