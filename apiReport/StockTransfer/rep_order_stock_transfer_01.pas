unit rep_order_stock_transfer_01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls,ControllerOrderStockTransfer,
  UnFunctions, tblOrderItem, Vcl.StdCtrls, ControllerInstitution;

type
  TRepOrderStockTransfer_01 = class(TBaseReportList)
    QRMemo2: TQRMemo;
    M_Pedido: TQRMemo;
    QRMemo4: TQRMemo;
    M_Dt_Pedido: TQRMemo;
    QRMemo24: TQRMemo;
    QRMemo25: TQRMemo;
    M_Ori_Estoque: TQRMemo;
    QRMemo1: TQRMemo;
    QRMemo3: TQRMemo;
    M_Des_Nome: TQRMemo;
    QRMemo6: TQRMemo;
    M_Des_Endereço: TQRMemo;
    QRMemo8: TQRMemo;
    M_Des_CnPjCpf: TQRMemo;
    QRMemo10: TQRMemo;
    M_Des_IE: TQRMemo;
    M_Des_Fax: TQRMemo;
    M_Des_Email: TQRMemo;
    QRMemo14: TQRMemo;
    M_Des_Telefone: TQRMemo;
    QRMemo16: TQRMemo;
    QRMemo17: TQRMemo;
    sbd_Detalhe: TQRStringsBand;
    QRBand1: TQRBand;
    QRMemo36: TQRMemo;
    M_kind_frete: TQRMemo;
    QRMemo56: TQRMemo;
    M_val_Subtotal: TQRMemo;
    M_Obs: TQRMemo;
    QRMemo37: TQRMemo;
    M_val_Discount: TQRMemo;
    QRMemo38: TQRMemo;
    M_val_Freight: TQRMemo;
    M_val_Expenses: TQRMemo;
    QRMemo40: TQRMemo;
    QRMemo41: TQRMemo;
    M_val_Total: TQRMemo;
    QRMemo44: TQRMemo;
    QRMemo46: TQRMemo;
    QRMemo5: TQRMemo;
    M_Des_Estoque: TQRMemo;
    QRMemo54: TQRMemo;
    QRMemo55: TQRMemo;
    QRMemo57: TQRMemo;
    QRMemo58: TQRMemo;
    QRMemo59: TQRMemo;
    QRMemo60: TQRMemo;
    QRMemo62: TQRMemo;
    QRMemo63: TQRMemo;
    QRMemo64: TQRMemo;
    QRMemo65: TQRMemo;
    QRMemo9: TQRMemo;
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
    QRMemo47: TQRMemo;
    QRMemo48: TQRMemo;
    M_Ent_Local: TQRMemo;
    M_Ent_Endereço: TQRMemo;
    QRMemo49: TQRMemo;
    QRMemo50: TQRMemo;
    M_Ent_Referencia: TQRMemo;
    QRMemo66: TQRMemo;
    M_Ent_Transportadora: TQRMemo;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure sbd_DetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QrptNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
    FNrItem : Integer;
    procedure NumeroItensDetalhe;
    procedure Transferencia;
    procedure Destinatario;
    procedure Entrega;
    procedure OrderItems;
    procedure LimparDetalheItens;
    Procedure PreencherDetalheItens;
    procedure sumario;
  public
    { Public declarations }
    FInstitution: TControllerInstitution;
    OrderStosckStransfer : TControllerOrderStockTransfer;
  end;

var
  RepOrderStockTransfer_01: TRepOrderStockTransfer_01;

implementation

{$R *.dfm}

uses uSM, MainModule;

{ TRepOrderStockTransfer_01 }


procedure TRepOrderStockTransfer_01.Entrega;
Begin
  with OrderStosckStransfer.OrderShipping do
  Begin
    LocalEntrega.Registro.Codigo := OrderStosckStransfer.OrderShipping.Registro.Endereco;
    LocalEntrega.getByKey;
    M_Ent_Local.Lines.Add(concat(' ', LocalEntrega.Registro.NomeRazao));
    LocalEntrega.Endereco.Registro.Codigo := LocalEntrega.Registro.Codigo;
    LocalEntrega.Endereco.Registro.Tipo := 'ENTREGA';
    LocalEntrega.Endereco.getAllByKey;
    if not LocalEntrega.Endereco.exist then
    Begin
      LocalEntrega.Endereco.Registro.Tipo := 'COMERCIAL';
      LocalEntrega.Endereco.getAllByKey;
    End;
    M_Ent_Endereço.Lines.Add(concat(' ',
                            LocalEntrega.Endereco.Registro.Logradouro, ', ',
                            LocalEntrega.Endereco.Registro.NumeroPredial,' ',
                            LocalEntrega.Endereco.Registro.Bairro, ' ',
                            LocalEntrega.Endereco.Cidade.Registro.Nome,'-',
                            LocalEntrega.Endereco.Estado.Registro.Abreviatura,'-',
                            MaskCep(LocalEntrega.Endereco.Registro.Cep)
                           ));
    M_Ent_Referencia.Lines.Add(concat(' ',OrderStosckStransfer.OrderShipping.Registro.PontoReferencia));

    TRansportadora.Registro.Codigo := OrderStosckStransfer.OrderShipping.Registro.Transportadora;
    TRansportadora.getByKey;
    M_Ent_Transportadora.Lines.Add(concat(' ',TRansportadora.Fiscal.Registro.NomeRazao));

    M_kind_frete.Lines.Add(ModalFrete.Registro.Descricao);
  End;
end;

procedure TRepOrderStockTransfer_01.Destinatario;
begin
  with FInstitution do
  Begin
    with Fiscal do
    Begin
      M_Des_Nome.Lines.Add( Registro.NomeRazao);
      M_Des_Endereço.Lines.Add( concat( Endereco.Registro.Logradouro, Endereco.Registro.NumeroPredial));
      M_Des_Endereço.Lines.Add( Endereco.Registro.Bairro);
      M_Des_Endereço.Lines.Add( concat( Endereco.Cidade.Registro.Nome, ' - ' , Endereco.Estado.Registro.Abreviatura));
      M_Des_Endereço.Lines.Add( MaskCep( Endereco.Registro.Cep) );
      Telefone.Registro.Codigo := Registro.Codigo;
      Telefone.Registro.Tipo := 'fone';
      Telefone.getByKey;
      M_Des_Telefone.Lines.add( MaskFone( Telefone.Registro.Numero ) );
      Telefone.Registro.Codigo := Registro.Codigo;
      Telefone.Registro.Tipo := 'fax';
      Telefone.getByKey;
      M_Des_Fax.Lines.add( MaskFone( Telefone.Registro.Numero ) );
      M_Des_Email.Lines.Add( email.Registro.Email);
      M_Des_CnPjCpf.Lines.Add( MaskDocFiscal( Juridica.Registro.CNPJ ));
      M_Des_IE.Lines.Add( Juridica.Registro.InscricaoEstadual );
    End;
  End;
end;


procedure TRepOrderStockTransfer_01.InitVariable;
begin
  inherited;
  OrderStosckStransfer := TControllerOrderStockTransfer.create(self);
end;

procedure TRepOrderStockTransfer_01.LimparDetalheItens;
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

procedure TRepOrderStockTransfer_01.NumeroItensDetalhe;
Var
  I : Integer;
begin
  with OrderStosckStransfer do
  Begin
    sbd_Detalhe.Items.Clear;
    for I := 1 to items.Lista.Count do
    Begin
      sbd_Detalhe.Items.Add(IntTostr(I));
    End;
  End;
end;

procedure TRepOrderStockTransfer_01.OrderItems;
Var
  I : Integer;
begin
  with OrderStosckStransfer do
  Begin
    I := items.Lista.Count;
    if (I > FNrItem) then
    Begin
      LimparDetalheItens;
      PreencherDetalheItens;
      inc(FNrItem);
    End;
  End;
end;

procedure TRepOrderStockTransfer_01.PreencherDetalheItens;
Var
  lcItem : TOrderItem;
Begin
  lcItem  := TOrderItem.Create;
  lcItem  := OrderStosckStransfer.items.Lista[FNrItem];
  with OrderStosckStransfer.items.Mercadoria.Produto do
  Begin
    Registro.Estabelecimento := OrderStosckStransfer.Registro.Estabelecimento;
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

  with OrderStosckStransfer.items.Detalhes do
  Begin
    Registro.Codigo := lcItem.Codigo;
    Registro.Estabelecimento := lcItem.Estabelecimento;
    Registro.Ordem := lcItem.Ordem;
    getByKey;
    M_mer_Detalhamento.Lines.Add( concat(' ', Registro.Detalhes));
    {
    M_mer_Frente.Lines.Add( concat(' ', Registro.FrenteTrabalho));
    if Registro.DataPrevista <> 0.0 then
      M_mer_Dt_Forecast.Lines.Add(concat(' ', DateToStr(Registro.DataPrevista) ));
    }
  End;

end;

procedure TRepOrderStockTransfer_01.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  sumario;
end;

procedure TRepOrderStockTransfer_01.QrptNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  inc(Page);
  MoreData := Page = 1;
  if MoreData then
  Begin
    Cabecalho;
    with OrderStosckStransfer do
    Begin
      M_Pedido.Lines.Add ( IntToStr( Registro.Numero ) );
      M_Dt_Pedido.Lines.Add ( DateToStr( Order.Registro.Data ) );
      Transferencia;
      Destinatario;
      Entrega;
      ;
    End;
  End;
end;

procedure TRepOrderStockTransfer_01.sbd_DetalheBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  OrderItems;
end;

procedure TRepOrderStockTransfer_01.SetVariable;
begin
  inherited;
  FNrItem := 0;
  OrderStosckStransfer.Registro.Codigo := CodigoRegistro;
  OrderStosckStransfer.Registro.Estabelecimento := FInstitution.Registro.Codigo;
  OrderStosckStransfer.getAllByKey;
  NumeroItensDetalhe;
end;

procedure TRepOrderStockTransfer_01.sumario;
begin
  with OrderStosckStransfer do
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
    with OrderShipping do
    Begin
      M_val_Freight.Lines.Add( concat( FormatFloat('#,##0.00#',Registro.Valor), ' ') );
    End;
  End;
end;

procedure TRepOrderStockTransfer_01.Transferencia;
begin
  with OrderStosckStransfer do
  Begin
    Estoque.Registro.Codigo := Registro.EstoqueOrigem;
    Estoque.Registro.Estabelecimento := Registro.Estabelecimento;
    Estoque.getByKey;
    M_Ori_Estoque.Lines.Add(concat(' ',Estoque.Registro.Descricao ));

    Estoque.Registro.Codigo := Registro.EstoqueDestino;
    Estoque.Registro.Estabelecimento := Registro.Estabelecimento;
    Estoque.getByKey;
    M_Des_Estoque.Lines.Add(concat(' ',Estoque.Registro.Descricao ));

  End;
end;


end.
