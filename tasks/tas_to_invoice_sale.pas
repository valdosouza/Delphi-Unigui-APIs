unit tas_to_invoice_sale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_to_invoice, uniRadioButton,
  uniButton, uniBitBtn, uniSpeedButton, uniEdit, uniRadioGroup,
  uniDateTimePicker, uniPanel, uniMemo, uniLabel, uniGUIClasses, uniCheckBox,
  uniGroupBox, uniGUIBaseClasses,ControllerInvoiceSale, uniPageControl,
   System.JSON, Data.DBXJSON,
   IPPeerClient, Data.DBXCommon,  DBXDataSnap, uniMemo, Data.DB,
  Data.SqlExpr;

type
  TDSCallbackMethod = reference to function(const Args: TJSONValue): TJSONValue;

  TTasToInvoiceSale = class(TTasToInvoice)
    UniButton1: TUniButton;
    procedure initVariable;Virtual;
    procedure setVariable;Virtual;
    procedure InvoiceTo;Override;
    procedure UniFormCreate(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
    invoice : TControllerInvoiceSale;

    type
      TMessageCallback = class(TDBXCallback)
      private
        FCallBackMethod: TDSCallbackMethod;
      public
        constructor Create(CallBackMethod: TDSCallbackMethod);
        function Execute(const Arg: TJSONValue): TJSONValue; override;
      end;
  protected
    function getparameter: Boolean;

  public
    { Public declarations }
    callback: TMessageCallback;
  end;

var
  TasToInvoiceSale: TTasToInvoiceSale;

implementation

{$R *.dfm}

uses MainModule;

{ TTasToInvoiceSale }

function TTasToInvoiceSale.getparameter: Boolean;
begin
//  inherited;
  {
  with Invoice do
  Begin
    with InvoiceMerchandise.Invoice.Registro do
    Begin
      Codigo := 0;
      Estabelecimento := GbInstitution;
      Usuario := GbUser;
      Cfop := '5102';
      Data_emissao := dtp_emission.DateTime;
      Valor_nota := 0;
      Observacao := M_Observation.Text;
    End;
    with InvoiceMerchandise.Registro do
    Begin

    End;
  End;
  if RG_Direction_Types.ItemIndex = 0 then
    Invoice.InvoiceMerchandise.Direcao := 'S'
  else
    Invoice.InvoiceMerchandise.Direcao := 'E';
 }
end;

procedure TTasToInvoiceSale.initVariable;
begin
  invoice := TControllerInvoiceSale.Create(Self);
end;

procedure TTasToInvoiceSale.InvoiceTo;
begin
  Invoice.start;
  Invoice.calculate;
  Invoice.save;
end;

procedure TTasToInvoiceSale.setVariable;
begin
  invoice.OrderSale.Registro.Codigo := 0;
  invoice.OrderSale.Registro.Estabelecimento := GbInstitution;
  invoice.OrderSale.getByKey;
end;

procedure TTasToInvoiceSale.UniButton1Click(Sender: TObject);
begin
  MainForm.SQLConnection1.Open;
  m := TCProxy.Create(MainForm.SQLConnection1.DBXConnection);

  m.Echo('Delphi 2010', MainForm.callback);
end;

procedure TTasToInvoiceSale.UniFormCreate(Sender: TObject);
begin
  callback := TMessageCallback.Create( function(const Args: TJSONValue) : TJSONValue
    var
     LJSONObject: TJSONObject; I: Integer;
     LMessage: string;
    begin
      // Extract information about the transformation from Json
      LJSONObject := TJSONObject(Args);

      for I := 0 to LJSONObject.Size - 1 do begin
         with LJSONObject.Get(I) do
           LMessage := LMessage + Format('%s: "%s"', [JSonString.Value, JsonValue.Value]);

      // Display information in a listbox
        Memo1.Lines.Add(LMessage);
        Memo1.Update;
        Result := TJSONTrue.Create;

      end;
    end);

end;

end.
