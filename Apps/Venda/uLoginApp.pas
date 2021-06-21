unit uLoginApp;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.Threading,synacode,zLib, FMX.ListBox,TypesCollection,TypesObjectsCollection,
  base_form,  REST.Json, System.Generics.Collections,
  FMX.StdCtrls, System.SyncObjs, CtrlSync, FMX.Types, System.UIConsts,
   FMX.Edit, System.ImageList, FMX.ImgList, FMX.Objects,
  FMX.Controls, FMX.Controls.Presentation, FMX.Ani, FMX.Layouts,
  prm_auth_login, prm_entity,tbladdress, tblphone, ctrl_mob_institution, uDataCM,
  ObjEntityFiscal, uAuthCM, FMX.DialogService, uLogin,ObjOrderSale,
  prm_stock_list, ctrl_mob_salesman_has_stock,tblSalesmanHasStock,
  ctrl_mob_salesman, ObjSalesMan, ctrl_mob_order_sale, tblsalesman;


type
  TLoginApp = class(TLogin)
  private
    { Private declarations }
    function setLasOrderSale(InstitutionID:Integer):Boolean;
   function getVendedor(institutionID,userID:integer):Boolean;
    procedure getSalesmanHasStock;
  protected
    function posAuthentication:boolean;Override;
  public
    { Public declarations }
  end;

var
  LoginApp: TLoginApp;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses MainModule,  UnFunctions;

{ TLoginApp }

procedure TLoginApp.getSalesmanHasStock;
Var
  LcParam : TPrmStockList;
  LcObj : TCtrlMobSalesmanHasStock;
  LcLista : TSalesmanHasStock;
  LcStrJSon : String;
  indice : Integer;
  LcMsg : String;
begin
  Try
    LcObj := TCtrlMobSalesmanHasStock.Create(nil);
    //PArametros da Consulta
    LcParam := TPrmStockList.Create;
    LcParam.Usuario := GbUser;
    LcParam.Vendedor := GbSalesMan;
    LcParam.Tabela.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcParam.UltimaAtualizacao := '0';
    LcStrJSon := TJson.ObjectToJsonString(LcParam);
    LcStrJSon := DataCM.SMStockListClient.getSalesmanStock(LcStrJSon);
    LcLista := TSalesmanHasStock.Create;
    LcLista := TJson.JsonToObject<TSalesmanHasStock>( ZDecompressString( LcStrJSon ) );
    if LcLista.Vendedor > 0 then
    Begin
      Try
        LcObj.ClonarObj(LcLista,LcObj.Registro);
        LcObj.save;
      Except
        on E: Exception do
        Begin
          GeralogCrashlytics('TUpdateTables.UpdateStockSalesman - ',e.Message);
        End;
      end;
    End;
  Finally
    {$IFDEF WIN32}
    LcParam.Destroy;
    LcObj.Destroy;
    LcLista.Free;
    {$ENDIF }

  End;
end;

function TLoginApp.getVendedor(institutionID, userID: integer): Boolean;
Var
  LcObj : TCtrlMobSalesman;
  LcStrJson : String;
  LcParEntity : TPrmEntity;
  LcObjSalesMan: TObjSalesMan;
  Lc_obj_Fiscal : TObjEntityFiscal;
begin
  Try
    //UMM.ConnectDatabase;
    LcObjSalesMan := TObjSalesMan.create;
    LcParEntity := TPrmEntity.Create;

    LcObj := TCtrlMobSalesman.Create(nil);
    LcObj.Parametro.Vendedor.Estabelecimento := institutionID;
    LcObj.Parametro.Vendedor.Codigo := userID;
    LcStrJson := TJson.ObjectToJsonString( LcObj.Parametro );

    LcStrJSon := DataCM.SMSalesManClient.getSalesman(LcStrJson);
    LcStrJSon := ZDecompressString(LcStrJSon);
    LcObj.ClonarObj( TJson.JsonToObject<TSalesman>( LcStrJSon ) , LcObjSalesMan.Vendedor );
    if LcObjSalesMan.Vendedor.Codigo > 0 then
    Begin
      Result := True;
      GbSalesMan := LcObjSalesMan.Vendedor.Codigo;

      LcParEntity.Entidade.Codigo := LcObjSalesMan.Vendedor.Codigo;
      LcStrJSon := TJson.ObjectToJsonString(LcParEntity);

      LcStrJson := DataCM.SMEntityFiscalClient.getByKey(  LcStrJSon );

      Lc_obj_Fiscal := TObjEntityFiscal.Create;
      Lc_obj_Fiscal := TJson.JsonToObject<TObjEntityFiscal>( ZDecompressString(LcStrJson ) );
      LcObj.clonarObjEntityFiscal( Lc_obj_Fiscal ,LcObjSalesMan.Colaborador.Fiscal);

      LcObj.saveDataObjeto(LcObjSalesMan);
      SetConfigINI('MOBILE','VENDEDOR',GbSalesMan.ToString);
    End
    else
    Begin
      Result := False;
      SetConfigINI('MOBILE','VENDEDOR','0');
      TDialogService.ShowMessage(
            concat('A T E N Ç Ã O!',
                   Char(10),Char(13),Char(10),Char(13),
                   'Este usuário não foi registrado como vendedor.',
                   Char(10),Char(13),
                   'Verifique e tente novamente.',
                   char(10),Char(13)
                  )
            );
    End;
  Finally
    {$IFDEF WIN32}
    LcParEntity.Destroy;
    LcObj.Destroy;
    LcObjSalesMan.Destroy;
    {$ENDIF }
  End;
end;

function TLoginApp.posAuthentication:Boolean;
var
  I:Integer;
begin
  Try
    Result := true;
    updateProcess('Verificando Vendedor');
    if getVendedor(Par.Estabelecimento,Par.Usuario) then
    Begin
      updateProcess('Identificando Estoque');
      getSalesmanHasStock;
    End;
   //Regsitra o Ultimo pedido enviado para a internet;
    updateProcess('Consultando Última Venda');
    Result := True;
    UMM.GInstitution.getList;
    For I :=0  to  UMM.GInstitution.Lista.Count-1 do
    Begin
      setLasOrderSale( UMM.GInstitution.Lista[I].Codigo );
    End;
  Except
    on E: Exception do
    Begin
      GeralogCrashlytics('TLoginApp.posAuthentication',E.Message );
      REsult := False;
    End;
  End;
end;

function TLoginApp.setLasOrderSale(InstitutionID:Integer): Boolean;
Var
  LcObj : TCtrlMobOrderSale;
  LcStrJSon : String;
  Lc_obj_order : TObjOrderSale;
begin
  Try

    Try
     //Regsitra o Ultimo pedido enviado para a internet;
      LcObj := TCtrlMobOrderSale.Create(nil);
      LcObj.Registro.Codigo := InstitutionID;
      if LcObj.evazio then
      Begin
        LcObj.Parametro.OrdemVenda.Estabelecimento := InstitutionID;
        LcObj.Parametro.OrdemVenda.Vendedor        := GbSalesMan;
        LcObj.Parametro.OrdemVenda.Terminal        := GbTerminal;
        LcObj.Parametro.UltimaAtualizacao          := '';
        LcStrJSon := TJson.ObjectToJsonString( LcObj.Parametro );
        LcStrJSon := DataCM.SMOrderSaleClient.getLastOrder(LcStrJSon);

        Lc_obj_order := TObjOrderSale.Create;
        Lc_obj_order := TJson.JsonToObject<TObjOrderSale>( ZDecompressString( LcStrJSon ) );


        Lc_obj_order.OrderSale.Vendedor := GbSalesMan;
        updateProcess(concat('Atualizando pedido  - Estb.',IntToStr(InstitutionID)));
        LcObj.saveDataObjeto( Lc_obj_order );
        setLastUpdate('tb_order_sale','S', LcObj.Obj.Estabelecimento,now);
      End;
    Except
      on E: Exception do
        GeralogCrashlytics('TLoginApp.setLasOrderSale',E.Message );
    End;
  Finally
    SetConfigINI('MOBILE','LASTORDERID',IntToStr(InstitutionID));
    {$IFDEF WIN32}
      LcObj.Destroy;
    {$ENDIF }
  End;
end;

end.
