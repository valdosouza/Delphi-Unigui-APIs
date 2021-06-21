unit rep_order_packing_01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  QRCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt,
  QuickRpt, Vcl.ExtCtrls, Controllerorderpacking, Vcl.StdCtrls;

type
  TRepOrderPacking_01 = class(TBaseReportList)
    QRMemo2: TQRMemo;
    M_Pedido: TQRMemo;
    QRMemo4: TQRMemo;
    M_Dt_Pedido: TQRMemo;
    QRMemo24: TQRMemo;
    QRMemo25: TQRMemo;
    M_For_Nome: TQRMemo;
    QRMemo27: TQRMemo;
    M_For_Endereço: TQRMemo;
    QRMemo29: TQRMemo;
    M_For_CnpjCpf: TQRMemo;
    QRMemo31: TQRMemo;
    M_For_IE: TQRMemo;
    QRMemo33: TQRMemo;
    M_For_Telefone: TQRMemo;
    QRMemo35: TQRMemo;
    M_For_Fax: TQRMemo;
    QRMemo37: TQRMemo;
    M_For_Vendedor: TQRMemo;
    QRMemo39: TQRMemo;
    M_For_Email: TQRMemo;
    QRMemo41: TQRMemo;
    M_For_Representante: TQRMemo;
    QRMemo43: TQRMemo;
    M_For_Repres_Fone: TQRMemo;
    QRMemo45: TQRMemo;
    M_For_Repres_Fax: TQRMemo;
    QRBand1: TQRBand;
    QRMemo47: TQRMemo;
    QRMemo48: TQRMemo;
    M_Ent_Local: TQRMemo;
    QRMemo49: TQRMemo;
    M_Ent_Endereço: TQRMemo;
    QRMemo50: TQRMemo;
    M_Ent_Referencia: TQRMemo;
    QRMemo66: TQRMemo;
    M_Ent_Transportadora: TQRMemo;
    QRMemo55: TQRMemo;
    QRMemo58: TQRMemo;
    QRMemo57: TQRMemo;
    QRMemo59: TQRMemo;
    QRMemo54: TQRMemo;
    QRMemo60: TQRMemo;
    QRMemo62: TQRMemo;
    QRMemo64: TQRMemo;
    QRMemo7: TQRMemo;
    QRMemo63: TQRMemo;
    QRMemo65: TQRMemo;
    sbd_Detalhe: TQRStringsBand;
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
    L_Cond_Pagto: TQRMemo;
    M_val_Condicao: TQRMemo;
    QRMemo15: TQRMemo;
    M_kind_frete: TQRMemo;
    QRMemo56: TQRMemo;
    M_val_Subtotal: TQRMemo;
    M_Obs: TQRMemo;
    QRMemo26: TQRMemo;
    M_val_Discount: TQRMemo;
    QRMemo30: TQRMemo;
    M_val_Freight: TQRMemo;
    M_val_Expenses: TQRMemo;
    QRMemo34: TQRMemo;
    QRMemo38: TQRMemo;
    M_val_Total: TQRMemo;
    QRMemo44: TQRMemo;
    QRMemo46: TQRMemo;

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure QrptNeedData(Sender: TObject; var MoreData: Boolean);
    procedure sbd_DetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);

  private
    { Private declarations }
    FNrItem : Integer;
    procedure NumeroItensDetalhe;
    procedure Faturamento;
    procedure Entrega;
    procedure OrderItems;
    Procedure LimparDetalheItens;
    Procedure PreencherDetalheItens;
    procedure sumario;

  public
    { Public declarations }
    OrderPacking : TControllerOrderpacking;
  end;

var
  RepOrderPacking_01: TRepOrderPacking_01;

implementation


{$R *.dfm}

uses UnFunctions, tblOrderItem, uSM, MainModule;

procedure TRepOrderPacking_01.Entrega;
begin
  with OrderPacking.OrderShipping do
  Begin
    LocalEntrega.Registro.Codigo := OrderPacking.OrderShipping.Registro.Endereco;
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
    M_Ent_Referencia.Lines.Add(concat(' ',OrderPacking.OrderShipping.Registro.PontoReferencia));

    TRansportadora.Fiscal.Registro.Codigo := OrderPacking.OrderShipping.Registro.Transportadora;
    TRansportadora.Fiscal.getByKey;
    M_Ent_Transportadora.Lines.Add(concat(' ',TRansportadora.Fiscal.Registro.NomeRazao));
    M_kind_frete.Lines.Add(ModalFrete.Registro.Descricao);

  End;
end;

procedure TRepOrderPacking_01.Faturamento;
begin
  with FEstabelecimento do
  Begin
    with Fiscal do
    Begin
      M_For_Nome.Lines.Add( Registro.NomeRazao);
      M_For_Endereço.Lines.Add( concat( Endereco.Registro.Logradouro, Endereco.Registro.NumeroPredial));
      M_For_Endereço.Lines.Add( Endereco.Registro.Bairro);
      M_For_Endereço.Lines.Add( concat( Endereco.Cidade.Registro.Nome, ' - ' , Endereco.Estado.Registro.Abreviatura));
      M_For_Endereço.Lines.Add( MaskCep( Endereco.Registro.Cep) );
      Telefone.Registro.Codigo := Registro.Codigo;
      Telefone.Registro.Tipo := 'fone';
      Telefone.getByKey;
      M_For_Telefone.Lines.add( MaskFone( Telefone.Registro.Numero ) );
      Telefone.Registro.Codigo := Registro.Codigo;
      Telefone.Registro.Tipo := 'fax';
      Telefone.getByKey;
      M_For_Fax.Lines.add( MaskFone( Telefone.Registro.Numero ) );
      M_For_Email.Lines.Add( Email.Registro.Email);
      M_For_CnpjCpf.Lines.Add( MaskDocFiscal( Juridica.Registro.CNPJ ));
      M_For_IE.Lines.Add( Juridica.Registro.InscricaoEstadual );
    End;
  End;
end;

procedure TRepOrderPacking_01.InitVariable;
begin
  inherited;
  OrderPacking := TControllerOrderpacking.create(self);
end;

procedure TRepOrderPacking_01.LimparDetalheItens;
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

procedure TRepOrderPacking_01.NumeroItensDetalhe;
Var
  I : Integer;
begin
  exit ;
  with OrderPacking do
  Begin
    sbd_Detalhe.Items.Clear;
    FNrItem := 0;
    for I := 1 to items.Lista.Count do
    Begin
      sbd_Detalhe.Items.Add(IntTostr(I));
    End;
  End;
end;

procedure TRepOrderPacking_01.OrderItems;
Var
  I : Integer;
begin
  with OrderPacking do
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

procedure TRepOrderPacking_01.PreencherDetalheItens;
Var
  lcItem : TOrderItem;
Begin
  lcItem  := TOrderItem.Create;
  lcItem  := OrderPacking.items.Lista[FNrItem];
  with OrderPacking.items.Mercadoria.Produto do
  Begin
    Registro.Estabelecimento := OrderPacking.Registro.Estabelecimento;
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

  with OrderPacking.items.Detalhes do
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

End;

procedure TRepOrderPacking_01.QrptNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  inc(Page);
  MoreData := Page = 1;
  if MoreData then
  Begin
    Cabecalho;
    with OrderPacking do
    Begin
      M_Pedido.Lines.Add ( IntToStr( Registro.Numero ) );
      M_Dt_Pedido.Lines.Add ( DateToStr( Order.Registro.Data ) );
      Faturamento;
      Entrega;
      sumario;
    End;
  End;
end;

procedure TRepOrderPacking_01.sbd_DetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  OrderItems;
end;

procedure TRepOrderPacking_01.SetVariable;
begin
  inherited;
  OrderPacking.Registro.Codigo := CodigoRegistro;
  OrderPacking.Registro.Estabelecimento := FEstabelecimento.Registro.Codigo;
  OrderPacking.getAllByKey;
  NumeroItensDetalhe;
end;

procedure TRepOrderPacking_01.sumario;
begin
  with OrderPacking do
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

end.
