unit uSMPromotionItems;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, tblPaymentTypes,
     TypesCollection,  uSM,ControllerPromotion,ControllerPromotionItems,
     tblpromotion,tblpromotionItems;

type
  {$METHODINFO ON}
  TSMPromotionItems = class(TSM)
  private

  public
    function getList(par:String ):String;
    function save( par:String ):String;
    function delete(par:String ):String;
    function getSyncronize( par:String ) : String;
  end;
   {$METHODINFO OFF}

implementation


{ TSMPromotionItems }

function TSMPromotionItems.save(par: String): String;
begin

end;

function TSMPromotionItems.delete( par:String ): String;
begin

end;

function TSMPromotionItems.getList(par:String): String;
begin
end;



function TSMPromotionItems.getSyncronize(par:String): String;
begin
end;

end.
