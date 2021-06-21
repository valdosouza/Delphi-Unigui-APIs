unit uSMEntityFiscal;

interface

uses System.SysUtils, System.Classes, System.Json,System.Generics.Collections,
  System.Contnrs, DataSnap.DSProviderDataModuleAdapter,
  Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblentity,
  ControllerEntity, ControllerEntityHasMailing,
  ControllerCompany, ControllerPerson, ControllerMailing,
  ControllerMailingGroup, ControllerAddress, ControllerPhone,
  ControllerEntityFiscal,  tblAddress, objEntityFiscal,
  TypesCollection,ControllerInstitution,  tblPhone, uSM,Rtti;

type
  {$METHODINFO ON}

  TSMEntityFiscal = class(TSM)
  private

  public
    function getByKey(par:String) : String;
  end;
   {$METHODINFO OFF}
implementation

function TSMEntityFiscal.getByKey( par:String ): String;
begin
  //Nunca será enviado um fiscal sem uma identiicação junto cliente/fornecedor/
end;


end.

