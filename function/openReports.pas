unit openReports;

interface

uses Main, uReportCM,rep_viewer, uniGUIApplication, REST.Json,System.Json,prm_rep_order,
      uniGUIFrame, unMessages, System.Classes,msg_form, System.SysUtils,
      print_product, print_financial_bills, print_financial_payment,
  print_invoice, print_entities, print_order_list, print_financial_manager;


  procedure openReportViewer(Tittle:String;Url:String);
  function openRepProduct():Boolean;
  function openRepCompany():Boolean;
  function openRepFinancialBill():Boolean;
  function openRepFinancialPayment():Boolean;
  function openRepFinancialRealManager():Boolean;

  function openRepInvoice():Boolean;

  function openRepOrderList():Boolean;

implementation

uses prm_print_entities;

procedure openReportViewer(Tittle, Url: String);
Var
  LcRep : TRepViewer;
Begin
  LcRep := TRepViewer.Create(UniApplication);
  LcRep.Caption := Tittle;
  LcRep.E_Link.Text := Url;
  LcRep.LinkPDF.URL := Url;
  LcRep.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      LcRep := nil;
    end
  );
end;

function openRepProduct: Boolean;
var
  Form : TPrintProduct;
begin
  if Form = nil then
    Form := TPrintProduct.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openRepCompany():Boolean;
var
  Form : TPrintEntities;
begin
  if Form = nil then
    Form := TPrintentities.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openRepFinancialBill():Boolean;
var
  Form : TPrintFinancialBills;
begin
  if Form = nil then
    Form := TPrintFinancialBills.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openRepFinancialPayment():Boolean;
var
  Form : TPrintFinancialPayment;
begin
  if Form = nil then
    Form := TPrintFinancialPayment.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openRepFinancialRealManager():Boolean;
var
  Form : TPrintFinancialManager;
begin
  if Form = nil then
    Form := TPrintFinancialManager.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openRepInvoice():Boolean;
var
  Form : TPrintInvoice;
begin
  if Form = nil then
    Form := TPrintInvoice.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;

function openRepOrderList():Boolean;
var
  Form : TPrintOrderList;
begin
  if Form = nil then
    Form := TPrintOrderList.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
  Result := True;
End;


end.
