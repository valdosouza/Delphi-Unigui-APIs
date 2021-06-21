unit objInstitution;

interface

uses System.SysUtils, ObjBase, objEntityFiscal, tblInstitution, System.Classes;

Type

  TObjInstitution = Class(TObjBase)
  private
    FFiscal: TObjEntityFiscal;
    FInstitution: TInstitution;
    procedure setFFiscal(const Value: TObjEntityFiscal);
    procedure setFInstitution(const Value: TInstitution);

  public
      constructor Create;override;
      destructor Destroy;override;
      procedure clear;
      property Institution : TInstitution read FInstitution write setFInstitution;
      property Fiscal : TObjEntityFiscal read FFiscal write setFFiscal;
  End;

implementation


{ TObjInstitution }

uses GenericDao;

procedure TObjInstitution.clear;
begin
  TGenericDAO._Clear(FFiscal.Fisica);
  TGenericDAO._Clear(FFiscal.Juridica);
  TGenericDAO._Clear(FFiscal.Entidade);
  FFiscal.Entidade.ListaEndereco.Clear;
  FFiscal.Entidade.ListaFones.Clear;
  TGenericDAO._Clear(FFiscal.Entidade.Email);
  TGenericDAO._Clear(FFiscal.Entidade.MidiaSocial);
end;

constructor TObjInstitution.Create;
begin
  FInstitution := TInstitution.Create;
  FFiscal := TObjEntityFiscal.Create;
end;

destructor TObjInstitution.Destroy;
begin
  {$IFDEF WIN32}
  FInstitution.DisposeOf;
  FFiscal.Destroy;
  {$ENDIF }
end;

procedure TObjInstitution.setFFiscal(const Value: TObjEntityFiscal);
begin
  FFiscal := Value;
end;

procedure TObjInstitution.setFInstitution(const Value: TInstitution);
begin
  FInstitution := Value;
end;

end.


