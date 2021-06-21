unit objEntity;

interface

uses tblEntity, tblAddress, TypesCollection, tblPerson, tblCompany,
   tblSocialMedia, tblMailing, tblPhone,GenericDao;

Type

  TObjEntity = Class
  private
    FEntity: TEntity;
    FListaEndereco: TListAddress;
    FEmail: TMailing;
    FMidiaSocial: TSocialMedia;
    FListaFone: TListPhone;
    FTipoEntidade: String;
    procedure setFEmail(const Value: TMailing);
    procedure setFEntity(const Value: TEntity);
    procedure setFListaEndereco(const Value: TListAddress);
    procedure setFListaFone(const Value: TListPhone);
    procedure setFMidiaSocial(const Value: TSocialMedia);
    procedure setFTipoEntidade(const Value: String);


  public
      constructor Create;
      destructor Destroy;
      procedure clear;virtual;
      property TipoEntidade : String read FTipoEntidade write setFTipoEntidade;
      property Entidade : TEntity read FEntity write setFEntity;
      property ListaEndereco : TListAddress read FListaEndereco write setFListaEndereco;
      property Email : TMailing read FEmail write setFEmail;
      property ListaFones : TListPhone read FListaFone write setFListaFone;
      property MidiaSocial : TSocialMedia read FMidiaSocial write setFMidiaSocial;
  End;

implementation


{ TObjEntity }


procedure TObjEntity.clear;
begin
  TGenericDAO._Clear(FEntity);
  TGenericDAO._Clear(FEmail);
  FListaEndereco.Clear;
  FListaFone.Clear;
  TGenericDAO._Clear(FMidiaSocial);
end;

constructor TObjEntity.Create;
begin
  FEntity         := TEntity.Create;
  FEmail          := TMailing.Create;
  FListaEndereco  := TListAddress.Create;
  FListaFone      := TListPhone.Create;
  FMidiaSocial    := TSocialMedia.Create;
end;

destructor TObjEntity.Destroy;
begin
  {$IFDEF WIN32}
  FEntity.DisposeOf;
  FEmail.DisposeOf;
  FListaEndereco.Destroy;
  FListaFone.Destroy;
  FMidiaSocial.DisposeOf;
  {$ENDIF }
end;


procedure TObjEntity.setFEmail(const Value: TMailing);
begin
  FEmail := Value;
end;

procedure TObjEntity.setFEntity(const Value: TEntity);
begin
  FEntity := Value;
end;

procedure TObjEntity.setFListaEndereco(const Value: TListAddress);
begin
  FListaEndereco := Value;
end;

procedure TObjEntity.setFListaFone(const Value: TListPhone);
begin
  FListaFone := Value;
end;

procedure TObjEntity.setFMidiaSocial(const Value: TSocialMedia);
begin
  FMidiaSocial := Value;
end;

procedure TObjEntity.setFTipoEntidade(const Value: String);
begin
  FTipoEntidade := Value;
end;

end.

