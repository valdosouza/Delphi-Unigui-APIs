unit ObjContact;

interface

uses System.SysUtils, objEntityFiscal, tblAgency, objEntity, tblContact, objBase;

Type

  TObjContact = Class(TObjBase)
  private
    FEntidade: TObjEntity;
    FContato: TContact;
    FEstabelecimento: Integer;
    FPagina: Integer;
    FEntidadePaiCNPJ: String;
    FCargo: String;
    procedure setFContato(const Value: TContact);
    procedure setFEntidade(const Value: TObjEntity);
    procedure setFEstabelecimento(const Value: Integer);
    procedure setFPagina(const Value: Integer);
    procedure setFEntidadePaiCNPJ(const Value: String);
    procedure setFCargo(const Value: String);
  public
    constructor Create;
    destructor Destroy;
    property Contato : TContact read FContato write setFContato;
    property Entidade : TObjEntity read FEntidade write setFEntidade;
    property EntidadePaiCNPJ : String read FEntidadePaiCNPJ write setFEntidadePaiCNPJ;
    property Cargo : String read FCargo write setFCargo;
  End;

implementation

{ TObjContact }

constructor TObjContact.Create;
begin
  inherited;
  FContato := TContact.Create;
  FEntidade := TObjEntity.Create;
end;

destructor TObjContact.Destroy;
begin
  FContato.DisposeOf;
  FEntidade.DisposeOf;
  inherited;
end;

procedure TObjContact.setFCargo(const Value: String);
begin
  FCargo := Value;
end;

procedure TObjContact.setFContato(const Value: TContact);
begin
  FContato := Value;
end;

procedure TObjContact.setFEntidade(const Value: TObjEntity);
begin
  FEntidade := Value;
end;

procedure TObjContact.setFEntidadePaiCNPJ(const Value: String);
begin
  FEntidadePaiCNPJ := Value;
end;

procedure TObjContact.setFEstabelecimento(const Value: Integer);
begin
  FEstabelecimento := Value;
end;

procedure TObjContact.setFPagina(const Value: Integer);
begin
  FPagina := Value;
end;

end.
