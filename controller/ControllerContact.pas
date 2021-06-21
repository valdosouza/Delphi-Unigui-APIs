unit ControllerContact;

interface

uses
  System.Classes, System.SysUtils,BaseController,
  tblContact, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
  ControllerEntity, ObjContact, ControllerInstitution;

Type
  TControllerContact = Class(TBaseController)
    procedure clear;
  private
    TipoPessoa:String;

  public
    Registro : TContact;
    Entidade : TControllerEntity;
    Estabelecimento : TControllerInstitution;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function saveDataObjeto(DObj : TObjContact):Boolean;
  End;

implementation

{ ControllerProvider }

procedure TControllerContact.clear;
begin
  clearObj(Registro);
end;

constructor TControllerContact.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TContact.Create;
  Entidade := TControllerEntity.Create(Self);
  Estabelecimento := TControllerInstitution.Create(Self);
end;

function TControllerContact.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerContact.Destroy;
begin
  FreeAndNil( Registro );
  FreeAndNil( Entidade );
  FreeAndNil( Estabelecimento );
  inherited;
end;


function TControllerContact.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerContact.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;

end;

function TControllerContact.saveDataObjeto(DObj: TObjContact): Boolean;
var
  LcIdEntity : Integer;
begin
  Entidade.saveDataObjeto(DObj.Entidade);
  //Salvar Contato
  Registro := DObj.Contato;
  Registro.codigo := Entidade.Registro.Codigo;

  //Agencia
  LcIdEntity := 0;
  LcIdEntity := Estabelecimento.Fiscal.Juridica.getIDbyCNPJ(DObj.EntidadePaiCNPJ);
  if LcIdEntity = 0 then
    LcIdEntity := Estabelecimento.Fiscal.Fisica.getIDbyCPF(DObj.EntidadePaiCNPJ);
  Registro.EntidadePai := LcIdEntity;
  save;
end;


function TControllerContact.getAllByKey: boolean;
begin
  _getByKey(Registro);
  Entidade.Registro.Codigo := Registro.Codigo;
  Entidade.getAllByKey;

end;

function TControllerContact.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

end.
