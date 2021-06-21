unit un_print;

interface
uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Bluetooth,
  System.Bluetooth.Components, FMX.ListBox, ControllerCommand, UnFunctions,
  FMX.Dialogs,
  FMX.DialogService;

Type
  TPrint = Class


  private
    DevicePrint: TBluetooth;
    function AlinhaD(Texto : String; Tamanho : Integer) : String;
    function AlinhaC(Texto : String; Tamanho : integer) : String;
    function AlinhaE(Texto : String; Tamanho : Integer) : String;
    procedure Enter;
    Procedure TextOut(Text:String);
  private

  Public
      FSocket : TBluetoothSocket;
      constructor Create(pDevPrint: TBluetooth);
      destructor Destroy;
      function ObterDevicePeloNome(pNomeDevice: String): TBluetoothDevice;
      procedure ConectarImpressora(pNomeDevice: String);
      procedure ListarDispositivos(combo:TComboBox);
      procedure imprimir(comanda:TControllerCommand);
  End;

const
  UUID = '{00001101-0000-1000-8000-00805F9B34FB}';
  TRACO = '================================';

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
  if (FSocket = nil) or not FSocket.Connected then
  Begin
    lDevice := ObterDevicePeloNome(pNomeDevice);
    if lDevice <> nil then
    begin
      FSocket := nil;
      DevicePrint.SocketTimeout := 300;
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
end;



constructor TPrint.Create(pDevPrint: TBluetooth);
begin
  DevicePrint := pDevPrint;
end;

destructor TPrint.Destroy;
begin
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

procedure TPrint.imprimir(comanda: TControllerCommand);
VAR
  i : iNTEGER;
  LcNrItens : Integer;
  LcQtItens : Real;
begin
//            FSocket.SendData(TEncoding.UTF8.GetBytes(chr(10)));
  Enter;
  TextOut(TRACO);
  TextOut(AlinhaC( GbNameEmpresa,32));
  TextOut(TRACO);
  TextOut(concat('N. PEDIDO : ', comanda.Registro.Numero));
  TextOut(concat('DATA      : ', DateToStr(comanda.Registro.DataRegistro)));
  TextOut(TRACO);

  TextOut(concat('CLIENTE   : ',comanda.Registro.NomeCliente));
  TextOut(TRACO);
  TextOut(concat('TELEFONE  : ',comanda.Registro.Telefone));
  TextOut(TRACO);

  TextOut('Descricao dos Produtos  ');
  //       --------------------------------
  //       QQQQ   VVVVVVVVV   TTTTTTTTTTTTT
  TextOut('Qte  X   VL.Unit =     Sub-Total');
  TextOut(TRACO);
  {
  // Imprime itens do pedido...
  comanda.items.getList;

  LcQtItens := 0;
  for I := 0 to LcNrItens -1 do
  begin
    LcItem := TListSplOrderSaleItems.Create;
    LcItem := order.items.CollListaSpl[I];
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
  }
  Enter;
end;

procedure TPrint.ListarDispositivos(combo:TComboBox);
Var
  lDevice : TBluetoothDevice;
begin
  combo.Clear;

  lDevice := TBluetoothDevice.Create;
  for lDevice in DevicePrint.PairedDevices do
  begin
    combo.Items.Add(lDevice.DeviceName);
  end;
end;

function TPrint.ObterDevicePeloNome(pNomeDevice: String): TBluetoothDevice;
Var
  lDevice : TBluetoothDevice;
begin
  Result := nil;
  lDevice   := TBluetoothDevice.Create;
  DevicePrint.DiscoverDevices(300);
  for lDevice in DevicePrint.PairedDevices do
  begin
    if lDevice.DeviceName = pNomeDevice then
    begin
      Result := lDevice;
    end;
  end;
end;


procedure TPrint.TextOut(Text: String);
begin
//123456789x123456789x12345679x123
//FSocket.SendData(TEncoding.UTF8.GetBytes('Imprimindo direto para Bluetooth'));
//FSocket.SendData(TEncoding.UTF8.GetBytes(chr(10)));
  FSocket.SendData(TEncoding.UTF8.GetBytes(Copy(Text,1,32)));
  Enter;
end;

end.
