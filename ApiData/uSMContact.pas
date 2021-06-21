unit uSMContact;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,uSM,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, ObjContact, ControllerContact,
  ControllerInstitution;

type
  {$METHODINFO ON}
  TSMContact = class(TSM)
  private
    Contact : TControllerContact;
    Institution : TControllerInstitution;
  public
    function save(par: string): String;
  end;
  {$METHODINFO OFF}

implementation


{ TSMContact }

function TSMContact.save(par: string): String;
Var
  LcObj: TObjContact;
begin
  try
    try
      Institution := TControllerInstitution.Create(nil);
      Contact := TControllerContact.Create(nil);
      LcObj := TObjContact.Create;
      LcObj := TJson.JsonToObject<TObjContact>(par);
      Contact.saveDataObjeto(LcObj);
      //Vincula a entidade ao institution
      Institution.InstitutionHasEntity.Registro.Estabelecimento := LcObj.Estabelecimento;
      Institution.InstitutionHasEntity.Registro.Entidade := Contact.Registro.Codigo;
      Institution.InstitutionHasEntity.save;
      Retorno.Mensagem := 'SAVED';
      Retorno.ID       := 200;
      Retorno.Code     := LcObj.Estabelecimento;
    Except
      on E:Exception do
      Begin
        Retorno.Mensagem := E.Message;
        Retorno.ID       := 500;
        Retorno.Code     := 0;
      End;
    End;
  finally
    Result := TJson.ObjectToJsonString(Retorno);
    LcObj.Destroy;
    Contact.DisposeOf;
    Institution.DisposeOf;
  end;
end;

end.

