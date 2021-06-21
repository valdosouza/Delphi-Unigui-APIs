unit un_print;

interface
uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Bluetooth,
  System.Bluetooth.Components, FMX.ListBox, ctrl_mob_order_sale, UnFunctions,
  FMX.Dialogs,
  FMX.DialogService,
  list_spl_order_sale_items, ctrl_mob_order_consignment, TypesListCollection,
  list_spl_order_consignment_items, ctrl_mob_config;

Type
  TPrint = Class(TComponent)
  private
    Config : TCtrlMobConfig;
    FDevicePrint: TBluetooth;
    function AlinhaD(Texto : String; Tamanho : Integer) : String;
    function AlinhaC(Texto : String; Tamanho : integer) : String;
    function AlinhaE(Texto : String; Tamanho : Integer) : String;
    procedure Enter;
    Procedure TextOut(Text:String);
     function validaprinter:Boolean;
    procedure setFDevicePrint(const Value: TBluetooth);
  Public
      FSocket : TBluetoothSocket;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy;override;
      function ObterDevicePeloNome(pNomeDevice: String): TBluetoothDevice;
      procedure ConectarImpressora(pNomeDevice: String);
      procedure ListarDispositivos(combo:TComboBox);
      procedure imprimir(order:TCtrlMobOrderSale);
      procedure Summaryconsignment( OrderConsignment : TCtrlMobORderConsignment );
      property DevicePrint : TBluetooth read FDevicePrint write setFDevicePrint;
  End;

const
  UUID = '{00001101-0000-1000-8000-00805F9B34FB}';
  TRACO      = '================================';
  TRACOASSIG = '________________________________';
implementation

{ TPrint }

uses MainModule;

function TPrint.AlinhaD(Texto: String; Tamanho: Integer): String;
begin
 begin
   Texto := Trim(Texto);
   while length(Texto) < Tamanho do
   begin
     Texto := ' ' + Texto;
   end;
   Result := Texto;
 end;
end;

function TPrint.AlinhaE(Texto: String; Tamanho: Integer): String;
begin
   Texto := Trim(Texto);
   while length(Texto) < Tamanho do
   begin
     Texto := Texto + ' ';
   end;
   Result := Texto;
end;

procedure TPrint.ConectarImpressora(pNomeDevice: String);
var
  LcSyncThread : TThread;
  lDevice: TBluetoothDevice;
begin
  Try
    if (FSocket = nil) or not FSocket.Connected then
    Begin
      lDevice := ObterDevicePeloNome(pNomeDevice);
      if lDevice <> nil then
      begin
        FSocket := nil;
        FDevicePrint.SocketTimeout := 300;
        FSocket := lDevice.CreateClientSocket(StringToGUID(UUID), False);
        if FSocket <> nil then
        begin
          Try
            if not FSocket.Connected then
              FSocket.Connect;
          Except
            on E : Exception do
            Begin
              Try
                FSocket := nil;
                FSocket := lDevice.CreateClientSocket(TGUID.Empty.NewGuid, False);
                FSocket.Connect;
              except
                FSocket.DisposeOf;
              End;
            End;
          End;
        end;
      end;
    End;
  Except
    on E: Exception do
      ShowMessage(e.Message);
  End;

end;



constructor TPrint.Create(AOwner: TComponent);
begin
  try
    Config := TCtrlMobConfig.Create(self);
  Except
    on E: Exception do
      ShowMessage(e.Message);
  End;
end;

destructor TPrint.Destroy;
begin
  Config.DisposeOf;
  inherited;
end;

procedure TPrint.Enter;
begin
  FSocket.SendData(TEncoding.UTF8.GetBytes(chr(10)+chr(13)));
end;

function TPrint.AlinhaC(Texto : String; Tamanho : integer) : String;
 var
   metade: integer;
 begin
   Texto := Trim(Texto);
   metade := ((Tamanho-Length(Texto)) div 2);
   while Length(Texto)+metade < Tamanho do
     Texto := ' ' + Texto;
   result := Texto;
 end;

procedure TPrint.imprimir(order: TCtrlMobOrderSale);
VAR
  i : iNTEGER;
  LcItem : TListSplOrderSaleItems;
  LcNrItens : Integer;
  LcQtItens : Real;
begin
  if validaprinter then
  Begin
    //            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(10)));
    Enter;
    TextOut(TRACO);
    TextOut(AlinhaC( GbNameEmpresa,32));
    TextOut(TRACO);
    TextOut(concat('N. PEDIDO : ', StrZero(order.Registro.Numero,4,0)));
    TextOut(concat('DATA      : ', DateToStr(order.Registro.RegistroCriado)));
    TextOut(TRACO);

    TextOut(concat('CLIENTE   : ',order.MCustomer.MFiscal.Registro.ApelidoFantasia));
    TextOut(TRACO);
    TextOut(concat('VENDEDOR  : ',GbNameUser));
    TextOut(TRACO);

    TextOut('Descricao dos Produtos  ');
    //       --------------------------------
    //       QQQQ   VVVVVVVVV   TTTTTTTTTTTTT
    TextOut('Qte  X   VL.Unit =     Sub-Total');
    TextOut(TRACO);

    // Imprime itens do pedido...
    LcNrItens := order.Mitems.CollListaSpl.Count;
    LcQtItens := 0;
    for I := 0 to LcNrItens -1 do
    begin
      LcItem := TListSplOrderSaleItems.Create;
      LcItem := order.Mitems.CollListaSpl[I];
      TextOut(concat(LcItem.Descricao));
      TextOut(concat(
                AlinhaE(FloatToStrF(LcItem.Qtde,ffFixed,10,2),4),
                AlinhaC('X',3),
                AlinhaD(FloatToStrF(LcItem.ValorUnitario,ffFixed,10,2),9),
                AlinhaC('=',3),
                AlinhaD(FloatToStrF(LcItem.ValorSubTotal,ffFixed,10,2),13)
      ));
      LcQtItens := LcQtItens + LcItem.Qtde;
      TextOut(TRACO);
    end;

    TextOut(concat('TOTAL ITENS : ',LcNrItens.toString, ' | TOTAL QTDE : ',FloatToStr( LcQtItens ) ));
    // Total...
    TextOut(TRACO);
    // Desconto Global
    if order.MTotalizer.Registro.ValorDesconto > 0 then
    begin
      TextOut(Concat(
                'Subtotal    : ',FloatToStrF(order.MTotalizer.Registro.ValorProduto,ffFixed,10,2)));

      TextOut(Concat(
                'Desconto    : ',FloatToStrF(order.MTotalizer.Registro.ValorDesconto,ffFixed,10,2)));
    end;
    TextOut(Concat(
                'Valor total : ',FloatToStrF(order.MTotalizer.Registro.ValorTotal,ffFixed,10,2)));
    Enter;
  End;
end;

procedure TPrint.ListarDispositivos(combo:TComboBox);
Var
  lDevice : TBluetoothDevice;
begin
  Try
    combo.Clear;
    lDevice := TBluetoothDevice.Create;
    for lDevice in FDevicePrint.PairedDevices do
    begin
      combo.Items.Add(lDevice.DeviceName);
    end;
  Except
    on E: Exception do
      ShowMessage(e.Message);
  End;
end;

function TPrint.ObterDevicePeloNome(pNomeDevice: String): TBluetoothDevice;
Var
  lDevice : TBluetoothDevice;
begin
  Result := nil;
  Try
    lDevice   := TBluetoothDevice.Create;
    FDevicePrint.DiscoverDevices(300);
    for lDevice in FDevicePrint.PairedDevices do
    begin
      if lDevice.DeviceName = pNomeDevice then
      begin
        Result := lDevice;
      end;
    end;
  Except
    on E: Exception do
      ShowMessage(e.Message);
  End;
end;


procedure TPrint.setFDevicePrint(const Value: TBluetooth);
begin
  FDevicePrint := Value;
end;

procedure TPrint.Summaryconsignment(OrderConsignment: TCtrlMobORderConsignment);
VAR
  i : iNTEGER;
  LcItem : TListSplOrderConsignmentItems ;
  LcNrItens : Integer;
  LcQtItens : Real;
  lcParameter : TStringList;
begin
  if validaprinter then
  Begin
    lcParameter := TStringList.create;
    //PEga a ultma transação
    OrderConsignment.MOperacoes.Registro.Estabelecimento  := OrderConsignment.Registro.Estabelecimento;
    OrderConsignment.MOperacoes.Registro.Terminal         := OrderConsignment.Registro.Terminal;
    OrderConsignment.MOperacoes.Registro.Ordem            := OrderConsignment.Registro.Codigo;
    OrderConsignment.MOperacoes.getlast;


    Enter;
    TextOut(TRACO);
    TextOut(AlinhaC( GbNameEmpresa,32));
    TextOut(TRACO);
    TextOut(concat('DATA      : ', DateToStr( OrderConsignment.MOperacoes.Registro.Data )));
    TextOut(concat('CLIENTE   : ', OrderConsignment.MCustomer.MFiscal.Registro.ApelidoFantasia));
    TextOut(concat('VENDEDOR  : ',GbNameUser));
    TextOut(TRACO);
    TextOut('ULTIMO MOVIMENTO CONSIGNACAO');
    TextOut(TRACO);

    OrderConsignment.MFinancialStatement.Registro.Estabelecimento := OrderConsignment.Registro.Estabelecimento;
    OrderConsignment.MFinancialStatement.Registro.Terminal        := OrderConsignment.Registro.Terminal;
    OrderConsignment.MFinancialStatement.Registro.Estabelecimento := OrderConsignment.Registro.Estabelecimento;
    OrderConsignment.MFinancialStatement.Registro.Data            := OrderConsignment.MOperacoes.Registro.Data;
    OrderConsignment.MFinancialStatement.getLastPayment( OrderConsignment.Registro.Cliente );

    TextOut(concat(
              AlinhaE('VALOR PAGO : R$ ',16),
              AlinhaD(FloatToStrF(OrderConsignment.MFinancialStatement.Registro.ValorCredito,ffFixed,10,2),13)
    ));

    TextOut(TRACO);
    TextOut('SALDO PRODUTOS NO CLIENTE');
    TextOut('Descricao dos Produtos  ');
    //       --------------------------------
    //       QQQQ   VVVVVVVVV   TTTTTTTTTTTTT
    TextOut('Qte  X   VL.Unit =     Sub-Total');
    TextOut(TRACO);

    // Imprime itens do pedido...
    OrderConsignment.MOperacoes.Registro.Ordem := OrderConsignment.Registro.Codigo;
    OrderConsignment.MOperacoes.getListSplItemsBalance(lcParameter);
    LcQtItens := 0;
    LcNrItens := OrderConsignment.MOperacoes.ListSplItemsBalance.Count;
    for I := 0 to LcNrItens -1 do
    begin
      LcItem := TListSplOrderConsignmentItems.Create;
      LcItem := OrderConsignment.MOperacoes.ListSplItemsBalance[I];
      TextOut(concat(LcItem.Descricao));
      TextOut(concat(
                AlinhaE(FloatToStrF(LcItem.Qtde,ffFixed,10,2),4),
                AlinhaC('X',3),
                AlinhaD(FloatToStrF(LcItem.ValorUnitario,ffFixed,10,2),9),
                AlinhaC('=',3),
                AlinhaD(FloatToStrF(LcItem.ValorSubTotal,ffFixed,10,2),13)
      ));
      LcQtItens := LcQtItens + LcItem.Qtde;
      TextOut(TRACO);
    end;

    TextOut(concat('TOTAL ITENS : ',LcNrItens.toString, ' | TOTAL QTDE : ',FloatToStr( LcQtItens ) ));
    Enter;
    TextOut(TRACOASSIG);
    TextOut('ASSINATURA');
    Enter;
  End;
end;

procedure TPrint.TextOut(Text: String);
begin
//123456789x123456789x12345679x123
//FSocket.SendData(TEncoding.UTF8.GetBytes('Imprimindo direto para Bluetooth'));
//FSocket.SendData(TEncoding.UTF8.GetBytes(chr(10)));
  FSocket.SendData(TEncoding.UTF8.GetBytes(Copy(Text,1,32)));
  Enter;
end;

function TPrint.validaprinter: Boolean;
begin
  REsult := True;

  if not FDevicePrint.Enabled then
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Não há dispositivo bluetooh neste dispositivo.',
                   Char(10),Char(13),
                   'Verifique!!'));
    Result := False;
    exit;
  End;

  Config.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  Config.Registro.Campo := 'IMPRESSORA';
  Config.getByKey;
  if not Config.exist then
  Begin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Não foi configurada a impresora.',
                   Char(10),Char(13),
                   'Verifique e tente novamente.'));
    Result := False;
    exit;
  End;


  UMM.Print.ConectarImpressora(Config.Registro.Conteudo);
  if not UMM.Print.FSocket.Connected then
  BEgin
    TDialogService.ShowMessage(
            Concat('A T E N Ç Ã O!',
                   Char(10),Char(13),
                   Char(10),Char(13),
                   'Não foi possível imprimir.',
                   Char(10),Char(13),
                   'Envie a versão do Android para o desenvolvedor.'));
    Result := False;
    exit;

  End;

end;

end.

