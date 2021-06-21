unit rep_order_purchase_01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls,ControllerOrderPurchase, Vcl.StdCtrls,   ControllerInstitution;

type
  TRepOrderPurchase_01 = class(TBaseReportList)
    sbd_Detalhe: TQRStringsBand;
    QRMemo6: TQRMemo;
    M_Fat_Endereço: TQRMemo;
    QRMemo5: TQRMemo;
    M_Fat_Nome: TQRMemo;
    QRMemo8: TQRMemo;
    M_Fat_CNPJ: TQRMemo;
    QRMemo12: TQRMemo;
    QRMemo13: TQRMemo;
    M_Fat_IE: TQRMemo;
    QRMemo15: TQRMemo;
    M_Fat_Telefone: TQRMemo;
    QRMemo17: TQRMemo;
    M_Fat_Fax: TQRMemo;
    QRMemo19: TQRMemo;
    M_Fat_Email: TQRMemo;
    QRMemo1: TQRMemo;
    M_Pedido: TQRMemo;
    QRMemo4: TQRMemo;
    M_Dt_Pedido: TQRMemo;
    QRMemo21: TQRMemo;
    M_Cob_Endereço: TQRMemo;
    QRMemo22: TQRMemo;
    QRMemo24: TQRMemo;
    QRMemo25: TQRMemo;
    M_Ent_Endereço: TQRMemo;
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
    QRMemo47: TQRMemo;
    QRMemo48: TQRMemo;
    QRMemo49: TQRMemo;
    QRMemo50: TQRMemo;
    M_Ent_Referencia: TQRMemo;
    M_Ent_Local: TQRMemo;
    M_For_Nome: TQRMemo;
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
    QRMemo7: TQRMemo;
    QRMemo66: TQRMemo;
    M_Ent_Transportadora: TQRMemo;
    M_mer_Disc_Value: TQRMemo;
    M_mer_Descricao: TQRMemo;
    M_mer_unidade: TQRMemo;
    M_mer_Qtty: TQRMemo;
    M_mer_Unit_Value: TQRMemo;
    M_mer_Tax_Value: TQRMemo;
    M_mer_Tax_Ipi: TQRMemo;
    M_mer_Frente: TQRMemo;
    M_mer_Subtotal: TQRMemo;
    M_mer_Dt_Forecast: TQRMemo;
    M_mer_Detalhamento: TQRMemo;
    QRBand2: TQRBand;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo44: TQRMemo;
    QRMemo46: TQRMemo;
    L_Cond_Pagto: TQRMemo;
    M_val_Condicao: TQRMemo;
    QRMemo11: TQRMemo;
    M_kind_frete: TQRMemo;
    M_Obs: TQRMemo;
    QRMemo26: TQRMemo;
    M_val_Discount: TQRMemo;
    QRMemo30: TQRMemo;
    M_val_Freight: TQRMemo;
    QRMemo34: TQRMemo;
    M_val_Expenses: TQRMemo;
    QRMemo38: TQRMemo;
    M_val_Total: TQRMemo;
    QRMemo56: TQRMemo;
    M_val_Subtotal: TQRMemo;
    procedure QrptNeedData(Sender: TObject; var MoreData: Boolean);
    procedure sbd_DetalheBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  protected
      procedure InitVariable;Override;
      procedure SetVariable;Override;
  private
    FNrItem : Integer;
    procedure NumeroItensDetalhe;
    procedure Faturamento;
    procedure Cobranca;
    procedure Fornecedor;
    procedure Entrega;
    procedure OrderItems;
    Procedure LimparDetalheItens;
    Procedure PreencherDetalheItens;
    procedure sumario;
  public
    FInstitution: TControllerInstitution;
    OrderPurchase : TControllerOrderPurchase;
  end;

var
  RepOrderPurchase_01: TRepOrderPurchase_01;

implementation

{$R *.dfm}

uses UnFunctions, tblOrderItem, uSM, MainModule;

{ TRepOrderPurchase_01 }


procedure TRepOrderPurchase_01.Cobranca;
begin
  with OrderPurchase.OrderBilling do
  Begin
    with Responsavel do
    Begin
      Endereco.Registro.Codigo := OrderPurchase.OrderBilling.Registro.Responsavel;
      Endereco.Registro.Tipo := 'COBRANÇA';
      Endereco.getAllByKey;
      if not Endereco.exist then
      Begin
        Endereco.Registro.Tipo := 'COMERCIAL';
        Endereco.getAllByKey;
      End;
      M_Cob_Endereço.Lines.Add(concat(' ',
                            Endereco.Registro.Logradouro, ', ',
                            Endereco.Registro.NumeroPredial,' ',
                            Endereco.Registro.Bairro, ' ',
                            Endereco.Cidade.Registro.Nome,'-',
                            Endereco.Estado.Registro.Abreviatura,'-',
                            MaskCep(Endereco.Registro.Cep)
                           ));
    End;
  End;
end;

procedure TRepOrderPurchase_01.Entrega;
begin
  with OrderPurchase.OrderShipping do
  Begin
    LocalEntrega.Registro.Codigo := OrderPurchase.OrderShipping.Registro.Endereco;
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
    M_Ent_Referencia.Lines.Add(concat(' ',OrderPurchase.OrderShipping.Registro.PontoReferencia));

    TRansportadora.Fiscal.Registro.Codigo := OrderPurchase.OrderShipping.Registro.Transportadora;
    TRansportadora.Fiscal.getByKey;
    M_Ent_Transportadora.Lines.Add(concat(' ',TRansportadora.Fiscal.Registro.NomeRazao));
    M_kind_frete.Lines.Add(ModalFrete.Registro.Descricao);
  End;
end;


procedure TRepOrderPurchase_01.Faturamento;
begin
  with FInstitution do
  Begin
    with Fiscal do
    Begin
      M_Fat_Nome.Lines.Add( Registro.NomeRazao);
      M_Fat_Endereço.Lines.Add( concat( Endereco.Registro.Logradouro, Endereco.Registro.NumeroPredial));
      M_Fat_Endereço.Lines.Add( Endereco.Registro.Bairro);
      M_Fat_Endereço.Lines.Add( concat( Endereco.Cidade.Registro.Nome, ' - ' , Endereco.Estado.Registro.Abreviatura));
      M_Fat_Endereço.Lines.Add( MaskCep( Endereco.Registro.Cep) );
      Telefone.Registro.Codigo := Registro.Codigo;
      Telefone.Registro.Tipo := 'fone';
      Telefone.getByKey;
      M_Fat_Telefone.Lines.add( MaskFone( Telefone.Registro.Numero ) );
      Telefone.Registro.Codigo := Registro.Codigo;
      Telefone.Registro.Tipo := 'fax';
      Telefone.getByKey;
      M_Fat_Fax.Lines.add( MaskFone( Telefone.Registro.Numero ) );
      M_Fat_Email.Lines.Add( Email.Registro.Email);
      M_Fat_CNPJ.Lines.Add( MaskDocFiscal( Juridica.Registro.CNPJ ));
      M_Fat_IE.Lines.Add( Juridica.Registro.InscricaoEstadual );
    End;
  End;
end;

procedure TRepOrderPurchase_01.Fornecedor;
begin
  with OrderPurchase do
  Begin
    Provider.getAllByKey;
    with Provider.Fiscal do
    Begin
      if kindPerson = 'J' then
      Begin
        M_For_CnpjCpf.Lines.Add(concat(' ',Juridica.Registro.CNPJ) );
        M_For_IE.Lines.Add(concat(' ',Juridica.Registro.InscricaoEstadual) );
      End
      else
      Begin
        M_For_CnpjCpf.Lines.Add(concat(' ', MaskDocFiscal( Fisica.Registro.CPF)) );
        M_For_IE.Lines.Add(concat(' ',Fisica.Registro.RG) );
      End;

      M_For_Nome.Lines.Add( concat( IntToStr( Registro.Codigo), ' - ', Registro.NomeRazao  ));
      with Endereco do
      Begin
        M_For_Endereço.Lines.Add(Concat ( Endereco.Registro.Logradouro, ', ',
                                          Endereco.Registro.NumeroPredial, ' ',
                                          Endereco.Registro.Bairro, ' ',
                                          Endereco.Cidade.Registro.Nome, ' - ',
                                          Endereco.Estado.Registro.Abreviatura,' - ',
                                          MaskCep( Endereco.Registro.Cep )
                                  ));
      End;

      Telefone.Registro.Codigo := Registro.Codigo;
      Telefone.Registro.Tipo := 'fone';
      Telefone.getByKey;
      M_For_Telefone.Lines.add( MaskFone( Telefone.Registro.Numero ) );

      Telefone.Registro.Codigo := Registro.Codigo;
      Telefone.Registro.Tipo := 'fax';
      Telefone.getByKey;
      M_For_Fax.Lines.add( MaskFone( Telefone.Registro.Numero ) );

      M_For_Email.Lines.Add( email.Registro.Email);

      M_For_Representante.Lines.Add('');
      M_For_Repres_Fone.Lines.Add('');
      M_For_Repres_Fax.Lines.Add('');
    End;
  End;
end;

procedure TRepOrderPurchase_01.InitVariable;
begin
  inherited;
  OrderPurchase := TControllerOrderPurchase.create(self);
end;

procedure TRepOrderPurchase_01.LimparDetalheItens;
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

procedure TRepOrderPurchase_01.NumeroItensDetalhe;
Var
  I : Integer;
begin
  with OrderPurchase do
  Begin
    sbd_Detalhe.Items.Clear;
    FNrItem := 0;
    for I := 1 to items.Lista.Count do
    Begin
      sbd_Detalhe.Items.Add(IntTostr(I));
    End;
  End;
end;


procedure TRepOrderPurchase_01.OrderItems;
Var
  I : Integer;
begin
  with OrderPurchase do
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

Procedure TRepOrderPurchase_01.PreencherDetalheItens;
Var
  lcItem : TOrderItem;
Begin
  lcItem  := TOrderItem.Create;
  lcItem  := OrderPurchase.items.Lista[FNrItem];
  with OrderPurchase.items.Mercadoria.Produto do
  Begin
    Registro.Estabelecimento := OrderPurchase.Registro.Estabelecimento;
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

  with OrderPurchase.items.Detalhes do
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

procedure TRepOrderPurchase_01.QrptNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  inc(Page);
  MoreData := Page = 1;
  if MoreData then
  Begin
    Cabecalho;
    with OrderPurchase do
    Begin
      M_Pedido.Lines.Add ( IntToStr( Registro.Numero ) );
      M_Dt_Pedido.Lines.Add ( DateToStr( Order.Registro.Data ) );
      Faturamento;
      Cobranca;
      Fornecedor;
      Entrega;
      sumario;
    End;
  End;
end;

procedure TRepOrderPurchase_01.sbd_DetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  OrderItems
end;

procedure TRepOrderPurchase_01.SetVariable;
begin
  inherited;
  OrderPurchase.Registro.Codigo := CodigoRegistro;
  OrderPurchase.Registro.Estabelecimento := FInstitution.Registro.Codigo;
  OrderPurchase.getAllByKey;
  NumeroItensDetalhe;
end;

procedure TRepOrderPurchase_01.sumario;
begin
  with OrderPurchase do
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
