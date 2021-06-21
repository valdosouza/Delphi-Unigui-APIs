unit rep_order_job_01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  QuickRpt, QRCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  QRPDFFilt, Vcl.ExtCtrls,ControllerOrderJob, Vcl.StdCtrls;

type
  TRepOrderJob_01 = class(TBaseReportList)
    M_Pedido: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo4: TQRMemo;
    M_Dt_Pedido: TQRMemo;
    QRMemo25: TQRMemo;
    M_Nome_Obra: TQRMemo;
    QRMemo27: TQRMemo;
    M_Nome_Cliente: TQRMemo;
    QRMemo55: TQRMemo;
    QRMemo58: TQRMemo;
    QRMemo57: TQRMemo;
    QRMemo59: TQRMemo;
    QRMemo54: TQRMemo;
    QRMemo60: TQRMemo;
    QRMemo62: TQRMemo;
    QRMemo64: TQRMemo;
    QRMemo65: TQRMemo;
    QRMemo63: TQRMemo;
    QRMemo7: TQRMemo;
    sbd_Detalhe: TQRStringsBand;
    QRBand1: TQRBand;
    QRMemo56: TQRMemo;
    M_val_Subtotal: TQRMemo;
    M_Obs: TQRMemo;
    QRMemo26: TQRMemo;
    M_val_Discount: TQRMemo;
    M_val_Expenses: TQRMemo;
    QRMemo34: TQRMemo;
    QRMemo38: TQRMemo;
    M_val_Total: TQRMemo;
    M_mer_unidade: TQRMemo;
    M_mer_Detalhamento: TQRMemo;
    M_mer_Dt_Forecast: TQRMemo;
    M_mer_Subtotal: TQRMemo;
    M_mer_Frente: TQRMemo;
    M_mer_Tax_Ipi: TQRMemo;
    M_mer_Tax_Value: TQRMemo;
    M_mer_Unit_Value: TQRMemo;
    M_mer_Qtty: TQRMemo;
    M_mer_Descricao: TQRMemo;
    M_mer_Disc_Value: TQRMemo;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure QrptNeedData(Sender: TObject; var MoreData: Boolean);
    procedure sbd_DetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    FNrItem : Integer;
    procedure NumeroItensDetalhe;
    procedure Engenharia;
    procedure OrderItems;
    Procedure LimparDetalheItens;
    Procedure PreencherDetalheItens;
    procedure sumario;

  public
    { Public declarations }
    OrderJob : TControllerOrderJob;
  end;

var
  RepOrderJob_01: TRepOrderJob_01;

implementation

{$R *.dfm}

uses tblOrderItem, uSM, MainModule;

procedure TRepOrderJob_01.Engenharia;
begin
  with OrderJob do
  Begin
    M_Nome_Obra.Lines.Add(concat(' ',Registro.Descricao));

    Customer.Fiscal.Registro.Codigo := Registro.Cliente;
    Customer.Fiscal.getByKey;
    M_Nome_Cliente.Lines.Add(concat(' ',Customer.Fiscal.Registro.ApelidoFantasia));
  End;
end;

procedure TRepOrderJob_01.InitVariable;
begin
  inherited;
  OrderJob := TControllerOrderJob.create(self);
end;

procedure TRepOrderJob_01.LimparDetalheItens;
begin
  M_mer_Descricao.Lines.Clear;
  M_mer_unidade.Lines.Clear;
  M_mer_Qtty.Lines.Clear;
  M_mer_Unit_Value.Lines.Clear;
  M_mer_Disc_Value.Lines.Clear;
  M_mer_Tax_Value.Lines.Clear;
  M_mer_Tax_Ipi.Lines.Clear;
  M_mer_Subtotal.Lines.Clear;
  M_mer_Detalhamento.Lines.Clear;
  M_mer_Frente.Lines.Clear;
  M_mer_Dt_Forecast.Lines.Clear;
end;

procedure TRepOrderJob_01.NumeroItensDetalhe;
Var
  I : Integer;
begin
  with OrderJob do
  Begin
    sbd_Detalhe.Items.Clear;
    FNrItem := 0;
    for I := 1 to items.Lista.Count do
    Begin
      sbd_Detalhe.Items.Add(IntTostr(I));
    End;
  End;
end;

procedure TRepOrderJob_01.OrderItems;
Var
  I : Integer;
begin
  with Orderjob do
  Begin
    I := items.Lista.Count;
    if (I >= FNrItem) then
    Begin
      LimparDetalheItens;
      PreencherDetalheItens;
      inc(FNrItem);
    End;
  End;
end;

procedure TRepOrderJob_01.PreencherDetalheItens;
Var
  lcItem : TOrderItem;
Begin
  lcItem  := TOrderItem.Create;
  lcItem  := OrderJob.items.Lista[FNrItem];
  with OrderJob.items.Mercadoria.Produto do
  Begin
    Registro.Estabelecimento := OrderJob.Registro.Estabelecimento;
    Registro.Codigo := lcItem.Produto;
    getByKey;
    M_mer_Descricao.Lines.Add( concat(' ', Registro.Descricao ));
  End;

  M_mer_unidade.Lines.Text := 'UND';
  M_mer_Qtty.Lines.Add( concat( FormatFloat('#,##0.00#', lcItem.Quantidade), ' '));
  M_mer_Unit_Value.Lines.Add( concat( FormatFloat('#,##0.00#', lcItem.ValorUnitario), ' ') );
  M_mer_Disc_Value.Lines.Add( concat( FormatFloat('#,##0.00#', lcItem.ValorDesconto), ' ') );
  M_mer_Tax_Value.Lines.Add( concat( FormatFloat('#,##0.00#', lcItem.AliquotaDesconto), ' ') );
  M_mer_Tax_Ipi.Lines.Add('0,00 ');
  M_mer_Subtotal.Lines.Add( concat( FormatFloat('#,##0.00#', ( lcItem.Quantidade * lcItem.ValorUnitario ) - lcItem.ValorDesconto ), ' ')  );

  with Orderjob.items.Detalhes do
  Begin
    Registro.Codigo := lcItem.Codigo;
    Registro.Estabelecimento := lcItem.Estabelecimento;
    Registro.Ordem := lcItem.Ordem;
    getByKey;
    M_mer_Detalhamento.Lines.Add( concat(' ', Registro.Detalhes));
//    M_mer_Frente.Lines.Add( concat(' ', Registro.FrenteTrabalho));
//    if Registro.DataPrevista <> 0.0 then
//      M_mer_Dt_Forecast.Lines.Add(concat(' ', DateToStr(Registro.DataPrevista) ));
  End;
end;

procedure TRepOrderJob_01.QrptNeedData(Sender: TObject; var MoreData: Boolean);
begin
  inc(Page);
  MoreData := Page = 1;
  if MoreData then
  Begin
    Cabecalho;
    with OrderJob do
    Begin
      M_Pedido.Lines.Add ( IntToStr( Registro.Numero ) );
      M_Dt_Pedido.Lines.Add ( DateToStr( Order.Registro.Data ) );
      Engenharia;
      sumario;
    End;
  End;

end;

procedure TRepOrderJob_01.sbd_DetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  OrderItems
end;

procedure TRepOrderJob_01.SetVariable;
begin
  inherited;
  OrderJob.Registro.Codigo := CodigoRegistro;
  OrderJob.Registro.Estabelecimento := FEstabelecimento.Registro.codigo;
  OrderJob.getAllByKey;
  NumeroItensDetalhe;
end;

procedure TRepOrderJob_01.sumario;
begin
  with OrderJob do
  Begin
    M_Obs.Lines.Add(' Observações');
    M_Obs.Lines.Add(Order.Registro.Observacao );

    with OrderTotalizer do
    Begin
      M_val_Subtotal.Lines.Add( concat( FormatFloat('#,##0.00#',Registro.ValorProduto), ' ') );
      M_val_Discount.Lines.Add( concat( FormatFloat('#,##0.00#',Registro.ValorDesconto), ' ') );
      M_val_Expenses.Lines.Add( concat( FormatFloat('#,##0.00#',Registro.ValorDespesas), ' ') );
      M_val_Total.Lines.Add( concat( FormatFloat('#,##0.00#',Registro.ValorTotal), ' ') );
    End;
  End;
end;

end.
