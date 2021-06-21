unit SyncDataBase;

interface
uses System.Classes, MainModule, uDataCM,ctrl_mob_sync_data,
  System.SysUtils,FMX.ListBox,FMX.StdCtrls,FMX.Ani, FMX.Objects;, UnFunctions

Type
  TSyncDataBase = class(TThread)
  private
    Sync : TCtrlMobSyncData;
    DCM : TDataCM;
    Update : TUpdateTables;
  public
      Proc_Log : TListBox;
      Proc_Msg :TLabel;
      Rc_proc_out: TRectangle;
      procedure Execute;Override;
      procedure FinalizarThread(Sender: TObject);

      constructor Create;
  end;

implementation

{ TSyncDataBase }

constructor TSyncDataBase.Create;
begin
  Proc_log.Items.Clear;
  Rc_proc_out.Visible := True;
{
  Rc_proc_out.Align := TAlignLayout.Center;
  AniIndicator.Enabled := True;
  UpTable  := TUpdateTables.Create(Self);
  UpTable.Proc_Log := Lst_Proc_log;
  UpTable.Proc_Msg := Lb_proc_msg;
}
  OnTerminate :=FinalizarThread;

end;

procedure TSyncDataBase.Execute;
begin
  {
  //UMM.ConnectDatabase;
  Sync  := TCtrlMobSyncData.Create(nil);
  Update := TUpdateTables.Create(nil);
  with Update do
  Begin
    //Pais
    UpdateCountry;
    //Estado
    UpdateState;
    //Cidades
    UpdateCity;
    //Category
    UpdateCategory;
    //Produtos
    UpdateProduct;
    //Marcas
    UpdateBrand;
    UpdateMerchandise;
    //Embalagens
    UpdatePackage;
    //Medidas
    UpdateMeasure;
    //Cores
    UpdateColor;
    //Estoques
    UpdateStock;
    //TAbela de Preços
    UpdatePriceList;
    UpdatePrice;
    //Saldo de Estoque
    UpdateStockList;
    UpdateStockBalance;
    //Forma de Pagamento
    UpdatePaymentTypes;
    //Clientes
    UpdateObjCustomer;
    //Dados do Vendedor
    UpdateSalesman;
    //Pedidos
    SendObjOrderSale;
  end;
  }
end;

procedure TSyncDataBase.FinalizarThread(Sender: TObject);
begin
  UMM.DisconnectDatabase;
  Sync.DisposeOf;
  DCM.DisposeOf;
end;

end.

