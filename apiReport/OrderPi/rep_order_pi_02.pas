unit rep_order_pi_02;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Printers,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, jpeg, QRPDFFilt, QRWebFilt, QRExport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ControllerOrderPi, ControllerMedParts, tblMedParts,
  ControllerMedPosProg, ControllerMedInsertDate, ControllerMedPartsRt,
  tblMedPartsRt, ControllerMedPartsJr, tblMedPartsJr, tblMedInsertDate,
  System.Generics.Collections, ControllerEntity, grimgctrl, Vcl.StdCtrls,
  System.DateUtils, qrpctrls, base_report;

type
  TRepOrderPi_02 = class(TBaseReport)
    rbTitle: TQRBand;
    QRLabel12: TQRLabel;
    QRMemo8: TQRMemo;
    QRMemo9: TQRMemo;
    QRMemo10: TQRMemo;
    QRMemo11: TQRMemo;
    QRMemo12: TQRMemo;
    QRMemo13: TQRMemo;
    QRMemo14: TQRMemo;
    MM_Total_Ins: TQRMemo;
    MM_Negociado: TQRMemo;
    MM_Subtotal: TQRMemo;
    rbDetail: TQRStringsBand;
    MM_Total_Ins_detail: TQRMemo;
    MM_Negociado_detail: TQRMemo;
    MM_Subtotal_detail: TQRMemo;
    QRLabel1: TQRLabel;
    Lb_Formato00: TQRLabel;
    QRLabel3: TQRLabel;
    Lb_Peca1: TQRLabel;
    Lb_Formato1: TQRLabel;
    Lb_Material1: TQRLabel;
    Lb_Peca2: TQRLabel;
    Lb_Formato2: TQRLabel;
    Lb_Material2: TQRLabel;
    Lb_Peca3: TQRLabel;
    Lb_Formato3: TQRLabel;
    Lb_Material3: TQRLabel;
    Lb_Peca4: TQRLabel;
    Lb_Formato4: TQRLabel;
    Lb_Material4: TQRLabel;
    QRLabel4: TQRLabel;
    Lb_Formato01: TQRLabel;
    QRLabel6: TQRLabel;
    Lb_Peca5: TQRLabel;
    Lb_Formato5: TQRLabel;
    Lb_Material5: TQRLabel;
    Lb_Peca6: TQRLabel;
    Lb_Formato6: TQRLabel;
    Lb_Material6: TQRLabel;
    Lb_Peca7: TQRLabel;
    Lb_Formato7: TQRLabel;
    Lb_Material7: TQRLabel;
    Lb_Peca8: TQRLabel;
    Lb_Formato8: TQRLabel;
    Lb_Material8: TQRLabel;
    MM_Desconto: TQRMemo;
    MM_Desconto_detail: TQRMemo;
    QRMemo6: TQRMemo;
    QRLabel27: TQRLabel;
    Lb_Ve_Fantasia: TQRLabel;
    QRLabel29: TQRLabel;
    Lb_Ve_Endereco: TQRLabel;
    QRLabel32: TQRLabel;
    Lb_Ve_CNPJ: TQRLabel;
    QRLabel21: TQRLabel;
    Lb_Ve_Fone: TQRLabel;
    rbfoot: TQRBand;
    MM_Obs: TQRMemo;
    QRMemo49: TQRMemo;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    Lb_ValorLiquido: TQRLabel;
    Lb_MhaEmpresa: TQRLabel;
    Lb_VL_Bruto: TQRLabel;
    Lb_VL_Agencia: TQRLabel;
    Lb_VL_Liquido: TQRLabel;
    Lb_VL_Empresa: TQRLabel;
    MM_Responsavel: TQRMemo;
    MM_TotalGeral: TQRMemo;
    QRLabel7: TQRLabel;
    Lb_Responsavel: TQRLabel;
    StrExtraBand: TQRChildBand;
    MM_Obs_EXTRA: TQRMemo;
    RbPH: TQRBand;
    QRMemo5: TQRMemo;
    QRMemo3: TQRMemo;
    Lb_Emp_Razao: TQRLabel;
    Lb_Emp_Endereco: TQRLabel;
    Lb_Emp_CepBairroCidadeUf: TQRLabel;
    Lb_Emp_FoneFax: TQRLabel;
    Lb_Emp_Cnpj: TQRLabel;
    Lb_Emp_InscEst: TQRLabel;
    Lb_Emp_Site: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    Lb_Ag_Fantasia: TQRLabel;
    Lb_Ag_Razao: TQRLabel;
    Lb_Ag_endereco: TQRLabel;
    Lb_Ag_cepcidadeUf: TQRLabel;
    Lb_Ag_CNPJ: TQRLabel;
    QRLabel25: TQRLabel;
    Lb_Ag_InscEst: TQRLabel;
    QRLabel17: TQRLabel;
    Lb_Ag_Fone: TQRLabel;
    QRMemo7: TQRMemo;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    Lb_An_Fantasia: TQRLabel;
    Lb_An_Razao: TQRLabel;
    Lb_An_Endereco: TQRLabel;
    Lb_An_CepCidadeUf: TQRLabel;
    Lb_An_CNPJ: TQRLabel;
    Lb_Lb_An_InsEst: TQRLabel;
    Lb_An_InscEst: TQRLabel;
    Lb_An_Fone: TQRLabel;
    QRLabel23: TQRLabel;
    Lb_An_Doc: TQRLabel;
    QRMemo4: TQRMemo;
    QRLabel9: TQRLabel;
    QRPDFShape1: TQRMemo;
    Img_Logo: TQRImage;
    Lb_Pi_Empresa: TQRLabel;
    Lb_PI_Interno: TQRLabel;
    QRLabel55: TQRLabel;
    Lb_MesAnoVeic: TQRLabel;
    QRLabel63: TQRLabel;
    Lb_Dt_Vencimento: TQRLabel;
    Grid_Mes: TQRPGrid;
    MM_Colocacao: TQRMemo;
    MM_Peca: TQRMemo;
    Grid_Mes_Detail: TQRPGrid;
    MM_Colocacao_detail: TQRMemo;
    MM_Peca_detail: TQRMemo;
    Lb_PI_Orig: TQRLabel;
    Lb_Dt_PI_Orig: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel2: TQRLabel;
    E_Produto: TQRLabel;
    E_Campanha: TQRLabel;

    procedure rbTitleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure rbDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure LimparCampoDetalhe;
    procedure QrptBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure rbfootBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
     OrderPi : TControllerOrderPi;
     SequenciaPecas : Integer;
     procedure formataReport;
     procedure PreencheCabecalho;
     procedure PreencheAgencia;
     procedure PreencheVeiculo;
     procedure PreencheAnunciante;
     procedure DadosPi;
     procedure PreenchePecaJr(indice:Integer;LbPeca,LbFormato,LbMaterial:TQrLabel);
     procedure PreencheMatrizjr;
     procedure PreenchePecaRt(indice:Integer;LbPeca,LbFormato,LbMaterial:TQrLabel);
     procedure PreencheMatrizRt;
     procedure PreencheDetalhes;

     procedure preencheCabecalhoDataInsercao;
     procedure LimpaPeca;
     function getSequencia(Numero:Integer):String;

  public
    { Public declarations }
    It_TotIns:Integer;
    It_Cd_Peca : Integer;
    It_Imagem : TQRImage;
    procedure Pc_PreencheSemana(Registro : TMedInsertDate);
    procedure Pc_MostraValores(Pc_Mostra : Boolean);

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure ClearFields;Override;
    procedure execute;Override;

  end;

var
  RepOrderPi_02: TRepOrderPi_02;

implementation

uses UnFunctions, UnitConstantes, ClasseUtil, MainModule;

{$R *.dfm}

procedure TRepOrderPi_02.Pc_MostraValores(Pc_Mostra : Boolean);
Begin
  if Pc_Mostra then
  Begin
    Lb_ValorLiquido.top := 44;
    Lb_VL_Liquido.top := 44;
    Lb_MhaEmpresa.top := 65;
    Lb_VL_Empresa.top := 65;
    Lb_MhaEmpresa.Font.Color := clBlack;
    Lb_VL_Empresa.Font.Color := clBlack;
  end
  else
  Begin
    Lb_ValorLiquido.top := 65;
    Lb_VL_Liquido.top := 65;
    Lb_MhaEmpresa.top := 44;
    Lb_VL_Empresa.top := 44;
    Lb_MhaEmpresa.Font.Color := clWhite;
    Lb_VL_Empresa.Font.Color := clWhite;
  end;
end;

procedure TRepOrderPi_02.Pc_PreencheSemana(Registro : TMedInsertDate);
Var
  I : Integer;
  dt_insertion : TDateTime;
  LcMesano : String;
  LcDataFinal : TDAteTime;
  LcUltimoDia : Integer;
begin

  for I := 1 to Grid_Mes.Columns  do
    Grid_Mes.Cells[I-1,0].Caption := StrZero(I,2,0);


  dt_insertion  := Registro.DataInsercao;
  LcMesano      := Copy(DateTimeToStr(dt_insertion),3,8);
  LcDataFinal := EndOfTheMonth(dt_insertion);
  LcUltimoDia := StrToIntDef( Copy(DateToStr(LcDataFinal),1,2), 31);

  for I := 1 to Grid_Mes.Columns do
    Grid_Mes.Cells[I-1,1].Caption :=  '';

  for I := 1 to LcUltimoDia do
    Grid_Mes.Cells[I-1,1].Caption :=  copy(DiaDaSemana(StrToDate(StrZero(I,2,0)+LcMesano)),1,1);



end;

procedure TRepOrderPi_02.PreencheAgencia;
begin
  with OrderPi.Agency.Fiscal do
  Begin
    Lb_Ag_Fantasia.Caption  := Registro.ApelidoFantasia;
    Lb_Ag_Razao.Caption     := Registro.NomeRazao;
    Lb_Ag_Endereco.Caption  := concat(
                                 Endereco.Registro.Logradouro,', ',Endereco.Registro.NumeroPredial, ' - ' ,
                                 Endereco.Registro.Bairro);
    if Endereco.Registro.Complemento<>'' then
      Lb_Ag_Endereco.Caption  := concat(
                                 Endereco.Registro.Logradouro,', ',Endereco.Registro.NumeroPredial, ' - ' ,
                                 Endereco.Registro.Complemento, ' - ',
                                 Endereco.Registro.Bairro);

    Lb_Ag_cepcidadeUf.Caption  :=  concat(
                                      MaskCep(Endereco.Registro.Cep), ' - ',
                                      Endereco.Cidade.Registro.Nome, ' - ',
                                      Endereco.Estado.Registro.Abreviatura
                                  );

    Lb_Ag_CNPJ.Caption      := MaskDocFiscal(Juridica.Registro.CNPJ);
    Lb_Ag_InscEst.Caption   := Juridica.Registro.InscricaoEstadual;

    Telefone.Registro.Tipo := 'Fone';
    Telefone.Registro.Codigo := Registro.Codigo;
    Telefone.getByKey;
    Lb_Ag_Fone.Caption:= MaskFone(Telefone.Registro.Numero);

    Telefone.Registro.Tipo := 'Fax';
    Telefone.Registro.Codigo := Registro.Codigo;
    Telefone.getByKey;
    if Telefone.exist then
      Lb_Ag_Fone.Caption:= concat(
                                  Lb_Ag_Fone.Caption ,'/',
                                  MaskFone(Telefone.Registro.Numero)
                                  );
  End;
end;

procedure TRepOrderPi_02.PreencheAnunciante;
begin
  with OrderPi.Advertiser.Fiscal do
  Begin
    Lb_An_Fantasia.Caption  := Registro.ApelidoFantasia;
    Lb_An_Razao.Caption     := Registro.NomeRazao;
    Lb_An_Endereco.Caption  := concat(
                                 Endereco.Registro.Logradouro,', ',Endereco.Registro.NumeroPredial, ' - ' ,
                                 Endereco.Registro.Bairro);
    if Endereco.Registro.Complemento<>'' then
      Lb_An_Endereco.Caption  := concat(
                                 Endereco.Registro.Logradouro,', ',Endereco.Registro.NumeroPredial, ' - ' ,
                                 Endereco.Registro.Complemento, ' - ',
                                 Endereco.Registro.Bairro);

    Lb_An_cepcidadeUf.Caption  :=  concat(
                                      MaskCep(Endereco.Registro.Cep), ' - ',
                                      Endereco.Cidade.Registro.Nome, ' - ',
                                      Endereco.Estado.Registro.Abreviatura
                                  );


    if OrderPi.Advertiser.Fiscal.Fisica.Registro.CPF <> '' then
    Begin
      Lb_An_Doc.Caption       :=  'CPF';
      Lb_An_CNPJ.Caption      := MaskDocFiscal(Fisica.Registro.CPF);
      Lb_Lb_An_InsEst.Caption :='Ident: ';
      Lb_An_InscEst.Caption   :=  Fisica.Registro.RG;
    end
    else
    Begin
      Lb_An_Doc.Caption       :=  'CNPJ';
      Lb_An_CNPJ.Caption      := MaskDocFiscal(Juridica.Registro.CNPJ);
      Lb_Lb_An_InsEst.Caption :='I. Est.:';
      Lb_An_InscEst.Caption   := Juridica.Registro.InscricaoEstadual;
    end;

    Telefone.Registro.Tipo := 'Fone';
    Telefone.Registro.Codigo := Registro.Codigo;
    Telefone.getByKey;
    Lb_An_Fone.Caption:= MaskFone(Telefone.Registro.Numero);

  End;
end;

procedure TRepOrderPi_02.preencheCabecalho;
begin
  with OrderPi.Institution.Fiscal do
  Begin
    Img_Logo.Picture.LoadFromFile(concat(FEstabelecimento.PathImage,'logo.jpg'));

    Lb_Emp_Razao.Caption    := Registro.NomeRazao;
    Lb_Emp_Endereco.Caption := concat(Endereco.Registro.Logradouro,', ',
                                      Endereco.Registro.NumeroPredial,' - ',
                                      Endereco.Registro.Bairro);
    if Endereco.Registro.Complemento <> '' then
      Lb_Emp_Endereco.Caption := concat(Lb_Emp_Endereco.Caption, ' - ',
                                        Endereco.Registro.Complemento,' - ',
                                        Endereco.Registro.Bairro);
    Lb_Emp_CepBairroCidadeUf.Caption  :=  concat(
                                              MaskCep(Endereco.Registro.Cep), ' - ',
                                              Endereco.Cidade.Registro.Nome, ' - ',
                                              Endereco.Estado.Registro.Abreviatura
                                          );
    Telefone.Registro.Tipo := 'Fone';
    Telefone.Registro.Codigo := Registro.Codigo;
    Telefone.getByKey;
    Lb_Emp_FoneFax.Caption:= MaskFone(Telefone.Registro.Numero);

    Telefone.Registro.Tipo := 'Fax';
    Telefone.Registro.Codigo := Registro.Codigo;
    Telefone.getByKey;
    if Telefone.exist then
      Lb_Emp_FoneFax.Caption:= concat(
                                  Lb_Emp_FoneFax.Caption ,'/',
                                  MaskFone(Telefone.Registro.Numero)
                                  );

    if Juridica.Registro.CNPJ <> '' then
    begin
      Lb_Emp_Cnpj.Caption     := concat('CNPJ: ', MaskDocFiscal(Juridica.Registro.CNPJ));
      Lb_Emp_InscEst.Caption  :=  concat('Insc. Estadual: ', Juridica.Registro.InscricaoEstadual);
    end
      else
    begin
      Lb_Emp_Cnpj.Caption     := concat('CPF: ', MaskDocFiscal(Juridica.Registro.CNPJ));
      Lb_Emp_InscEst.Caption  :=  concat('Identidade: ', Juridica.Registro.InscricaoEstadual);
    end;

    Lb_Emp_Site.Caption:=concat('Site: ', MidiaSocial.Registro.Link);
  End;

  //Lb_PI.Caption:=OrderPi.Registro.NumeroOriginal;
end;

procedure TRepOrderPi_02.PreencheDetalhes;
Var
  LcDia : Integer;
  I : Integer;
  LcSubTotalIns : Integer;
  LcIndice : Integer;
begin
  with OrderPi.InsertDate do
  Begin
    //Posicao
    OrderPi.Parts.PartJR.Tabela.Registro.Codigo           := OrderPi.Parts.Lista[SequenciaPecas].TabelaPosicao;
    OrderPi.Parts.PartJR.Tabela.Registro.Estabelecimento  := OrderPi.Parts.Lista[SequenciaPecas].Estabelecimento;
    OrderPi.Parts.PartJR.Tabela.Registro.Veiculo          := OrderPi.Registro.Veiculo;
    OrderPi.Parts.PartJR.Tabela.getByKey;

    OrderPi.Parts.PartJR.Tabela.Posicao.Registro.Codigo           := OrderPi.Parts.Lista[SequenciaPecas].TabelaPosicao;
    OrderPi.Parts.PartJR.Tabela.Posicao.Registro.Estabelecimento  := OrderPi.Parts.Lista[SequenciaPecas].Estabelecimento;
    OrderPi.Parts.PartJR.Tabela.Posicao.getByKey;

    MM_Colocacao_detail.Lines.Insert(0,OrderPi.Parts.PartJR.Tabela.Posicao.Registro.Descricao);
    MM_Colocacao_detail.Font.Color:=clBlack;
    //Sequencia da Peça
    MM_Peca_detail.Lines.Insert(0,getSequencia(OrderPi.Parts.Lista[SequenciaPecas].Codigo));
    MM_Peca_detail.Font.Color:=clBlack;

    //Calendario das inserções
    Registro.PosicaoPecas     := OrderPi.Parts.Lista[SequenciaPecas].Codigo;
    Registro.Estabelecimento  := OrderPi.Parts.Lista[SequenciaPecas].Estabelecimento;
    Registro.Ordem            := OrderPi.Parts.Lista[SequenciaPecas].Ordem;
    getList;
    LcSubTotalIns := 0;
    for I := 0 to Lista.Count -1 do
    Begin

      LcDia :=  StrToIntdef(Copy(DateToStr( Lista[I].DataInsercao ),1,2),1);
      LcIndice := lcDia  -1;
      Grid_Mes_Detail.Cells[LcIndice,0].Caption := Lista[I].QuantidadeInsercao.ToString;

      //Calulo Subtotal de Inserções
      LcSubTotalIns := LcSubTotalIns + Lista[I].QuantidadeInsercao;
    End;
    //Subtotal de Inserções
    MM_Total_Ins_detail .Lines.Insert(0,IntToStr(LcSubTotalIns));
    MM_Total_Ins_detail.Font.Color:=clBlack;
    //Aliquota de Desconto
    MM_Desconto_detail.Lines.Insert(0,concat( FloatToStrF( OrderPi.Parts.Lista[SequenciaPecas].DescontoAliquota,ffNumber,10,2), ' '));
    MM_Desconto_detail.Font.Color:=clBlack;
    //Valor Unitario
    MM_Negociado_detail.Lines.Insert(0,concat( FloatToStrF( OrderPi.Parts.Lista[SequenciaPecas].ValorUnidade,ffNumber,10,2), ' '));
    MM_Negociado_detail.Font.Color:=clBlack;
    //Valor Total
    MM_Subtotal_detail.Lines.Insert(0,concat( FloatToStrF( OrderPi.Parts.Lista[SequenciaPecas].ValorTotal,ffNumber,10,2), ' '));
    MM_Subtotal_detail.Font.Color:=clBlack;

    //Total de Inserções
    It_TotIns := It_TotIns + LcSubTotalIns;
  End;
end;

procedure TRepOrderPi_02.PreenchePecaJr(indice:Integer;LbPeca,LbFormato,LbMaterial:TQrLabel);
Var
  I : Integer;
Begin
  with OrderPi.Parts do
  Begin
    LbPeca.Caption      := concat(getSequencia(PartJR.Lista[indice].Codigo),' - ', Lista[indice].Titulo);
    LbFormato.Caption   := concat(PartJR.Lista[indice].NumeroColuna,'Col X ',PartJR.Lista[indice].NumeroAltura,'cm');
    //Posicao
    material.Registro.Codigo := Lista[indice].Material;
    material.Registro.Estabelecimento := Lista[indice].Estabelecimento;
    material.getByKey;
    if PartJR.Lista[indice].Cor = 'SIM' then
      LbMaterial.Caption  := concat(material.Registro.Descricao,' - COR')
    else
      LbMaterial.Caption  := concat(material.Registro.Descricao,' - P&B')
  End;
End;


procedure TRepOrderPi_02.PreencheMatrizJr;
begin
  with OrderPi.Parts do
  Begin
    //Lista de Pecas
    Registro.Estabelecimento  := OrderPi.Registro.Estabelecimento;
    Registro.Ordem            := OrderPi.Registro.Codigo;
    getList;
    //Lista de Pecas de Jornal e Revista;
    PartJR.Registro.Estabelecimento  := OrderPi.Registro.Estabelecimento;
    PartJR.Registro.Ordem            := OrderPi.Registro.Codigo;
    PartJR.getList;
    if (Lista.Count >= 1) then
    begin
      PreenchePecaJr(0,
                     Lb_Peca1,
                     Lb_Formato1,
                     Lb_Material1);
    end;

    if (Lista.Count >= 2) then
    begin
      PreenchePecaJr(1,
                     Lb_Peca2,
                     Lb_Formato2,
                     Lb_Material2);
    end;

    if (Lista.Count >= 3) then
    begin
      PreenchePecaJr(2,
                     Lb_Peca3,
                     Lb_Formato3,
                     Lb_Material3);
    end;

    if (Lista.Count >= 4) then
    begin
      PreenchePecaJr(3,
                     Lb_Peca4,
                     Lb_Formato4,
                     Lb_Material4);
    end;

    if (Lista.Count >= 5) then
    begin
      PreenchePecaJr(4,
                     Lb_Peca5,
                     Lb_Formato5,
                     Lb_Material5);
    end;

    if (Lista.Count >= 6) then
    begin
      PreenchePecaJr(5,
                     Lb_Peca6,
                     Lb_Formato6,
                     Lb_Material6);
    end;

    if (Lista.Count >= 7) then
    begin
      PreenchePecaJr(6,
                     Lb_Peca7,
                     Lb_Formato7,
                     Lb_Material7);
    end;

    if (Lista.Count >= 8) then
    begin
      PreenchePecaJr(7,
                     Lb_Peca8,
                     Lb_Formato8,
                     Lb_Material8);
    end;
  End;
end;

procedure TRepOrderPi_02.PreenchePecaRt(indice:Integer;LbPeca, LbFormato, LbMaterial: TQrLabel);
Begin
  with OrderPi.Parts do
  Begin
    LbPeca.Caption      := concat(getSequencia(Registro.Codigo),' - ', Lista[indice].Titulo);
    LbFormato.Caption   := PartRT.Lista[indice].TempoDuracao;
    //Posicao
    PartJR.Tabela.Posicao.Registro.Codigo := Lista[indice].TabelaPosicao;
    PartJR.Tabela.Posicao.Registro.Estabelecimento := Lista[indice].Estabelecimento;
    PartJR.Tabela.Posicao.getByKey;

    //Material
    material.Registro.Codigo := Lista[indice].Material;
    material.Registro.Estabelecimento := Lista[indice].Estabelecimento;
    material.getByKey;
    LbMaterial.Caption  := concat(material.Registro.Descricao,' - ', PartRT.Lista[indice].Testemunhal);
  End;
end;

procedure TRepOrderPi_02.PreencheMatrizRt;
begin
  with OrderPi.Parts do
  Begin
    //Lista de Pecas
    Registro.Estabelecimento  := OrderPi.Registro.Estabelecimento;
    Registro.Ordem            := OrderPi.Registro.Codigo;
    getList;
    //Lista de Pecas de Jornal e Revista;
    PartRT.Registro.Estabelecimento  := OrderPi.Registro.Estabelecimento;
    PartRT.Registro.Ordem            := OrderPi.Registro.Codigo;
    PartRT.getList;
    if (Lista.Count >= 1) then
    begin
      PreenchePecaRt(0,
                     Lb_Peca1,
                     Lb_Formato1,
                     Lb_Material1);
    end;

    if (Lista.Count >= 2) then
    begin
      PreenchePecaRt(1,
                     Lb_Peca2,
                     Lb_Formato2,
                     Lb_Material2);
    end;

    if (Lista.Count >= 3) then
    begin
      PreenchePecaRt(2,
                     Lb_Peca3,
                     Lb_Formato3,
                     Lb_Material3);
    end;

    if (Lista.Count >= 4) then
    begin
      PreenchePecaRt(3,
                     Lb_Peca4,
                     Lb_Formato4,
                     Lb_Material4);
    end;

    if (Lista.Count >= 5) then
    begin
      PreenchePecaRt(4,
                     Lb_Peca5,
                     Lb_Formato5,
                     Lb_Material5);
    end;

    if (Lista.Count >= 6) then
    begin
      PreenchePecaRt(5,
                     Lb_Peca6,
                     Lb_Formato6,
                     Lb_Material6);
    end;

    if (Lista.Count >= 7) then
    begin
      PreenchePecaRt(6,
                     Lb_Peca7,
                     Lb_Formato7,
                     Lb_Material7);
    end;

    if (Lista.Count >= 8) then
    begin
      PreenchePecaRt(7,
                     Lb_Peca8,
                     Lb_Formato8,
                     Lb_Material8);
    end;
  End;
end;

procedure TRepOrderPi_02.preencheCabecalhoDataInsercao;
Var
  I : Integer;
  Registro : TMedInsertDate;
begin
  with OrderPi.InsertDate do
  Begin
    Registro.PosicaoPecas     := OrderPi.Parts.Lista[0].Codigo;
    Registro.Estabelecimento  := OrderPi.Parts.Lista[0].Estabelecimento;
    Registro.Ordem            := OrderPi.Parts.Lista[0].Ordem;
    getList;
    if Lista.Count > 0 then
    Begin
      Registro.Codigo             := Lista[0].Codigo;
      Registro.Estabelecimento    := Lista[0].Estabelecimento;
      Registro.Ordem              := Lista[0].Ordem;
      Registro.PosicaoPecas       := Lista[0].PosicaoPecas;
      Registro.DataInsercao       := Lista[0].DataInsercao;
      Registro.DiaSemana          := Lista[0].DiaSemana;
      Registro.QuantidadeInsercao := Lista[0].QuantidadeInsercao;

      MM_Colocacao.Lines.Clear;
      MM_Colocacao.Lines.Insert(0,' ');
      MM_Colocacao.Lines.Insert(1,'COLOCAÇÃO');
      MM_Colocacao.Lines.Insert(2,concat(
                                    DescricaoMes(NumeroMes(Registro.DataInsercao),False),'/',
                                    IntToStr(NumeroAno(Registro.DataInsercao,true))
                               ));
      MM_Negociado.Lines.Clear;
      MM_Negociado.Lines.Insert(0,'');
      if OrderPi.Registro.TipoMidia = 0 then
        MM_Negociado.Lines.Insert(1,'CM / COL')
      else
        MM_Negociado.Lines.Insert(1,'UNITÁRIO');
      MM_Negociado.Lines.Insert(2,'NEGOCIADO');
      Pc_PreencheSemana(Registro);
    End;
  end;

end;

procedure TRepOrderPi_02.PreencheVeiculo;
begin
  with OrderPi.Broadcaster.Fiscal do
  Begin
    Lb_Ve_Fantasia.Caption  := Registro.ApelidoFantasia;
    Lb_Ve_Endereco.Caption  := concat(
                                 Endereco.Registro.Logradouro,', ',Endereco.Registro.NumeroPredial, ' - ' ,
                                 Endereco.Registro.Bairro,' - ',
                                 Endereco.Cidade.Registro.Nome);
    if Endereco.Registro.Complemento<>'' then
      Lb_Ve_Endereco.Caption  := concat(
                                 Endereco.Registro.Logradouro,', ',Endereco.Registro.NumeroPredial, ' - ' ,
                                 Endereco.Registro.Complemento, ' - ',
                                 Endereco.Registro.Bairro,' - ',
                                 Endereco.Cidade.Registro.Nome);

    Lb_Ve_CNPJ.Caption      := MaskDocFiscal(Juridica.Registro.CNPJ);

    Telefone.Registro.Tipo := 'Fone';
    Telefone.Registro.Codigo := Registro.Codigo;
    Telefone.getByKey;
    Lb_Ve_Fone.Caption:= MaskFone(Telefone.Registro.Numero);

    Telefone.Registro.Tipo := 'Fax';
    Telefone.Registro.Codigo := Registro.Codigo;
    Telefone.getByKey;
    if Telefone.exist then
      Lb_Ve_Fone.Caption:= concat(
                                  Lb_Ve_Fone.Caption ,'/',
                                  MaskFone(Telefone.Registro.Numero)
                                  );
  End;
end;

procedure TRepOrderPi_02.rbTitleBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PreencheCabecalho;
  PreencheAgencia;
  PreencheVeiculo;
  PreencheAnunciante;
  DadosPi;
  LimpaPeca;
  case OrderPi.Registro.TipoMidia of
    0:PreencheMatrizjr;
    1:PreencheMatrizRt;
  end;
  preencheCabecalhoDataInsercao;
end;

procedure TRepOrderPi_02.rbDetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  LimparCampoDetalhe;
  if (SequenciaPecas < OrderPi.PArts.Lista.Count) then
    PreencheDetalhes;
  inc(SequenciaPecas);
end;


procedure TRepOrderPi_02.setImages;
begin
//
end;

procedure TRepOrderPi_02.SetVariable;
begin
  OrderPi.Registro.Codigo := CodigoRegistro;
  OrderPi.Registro.Estabelecimento := FEstabelecimento.Registro.Codigo;
  OrderPi.getAllByKey;
  SequenciaPecas := 0;
end;


procedure TRepOrderPi_02.ClearFields;
Var
  I,J:Integer;
begin
  For I := 0 to ((ComponentCount)-1) do
  begin
    if (Components[I].ClassName = 'TQRMemo') then
    Begin
       TQRMemo(Components[I]).Transparent := false;
    End;
  end;
end;

procedure TRepOrderPi_02.DadosPi;
begin
  //Dados Do PI
  with OrderPi.Registro do
  Begin
    Lb_PI_Interno.Caption :=  intTostr(NumeroInterno);
    Lb_PI_Orig.Caption    :=  NumeroOriginal;
    Lb_Dt_PI_Orig.Caption := Concat('Data: ', dateToStr(DataOriginal));
    Lb_MesAnoVeic.Caption := Copy(DateToStr(DataOriginal),4,7);

    Lb_Dt_Vencimento.Caption  :=  DateToStr(DataVencimento);
    E_Produto.Caption     := Produto;
    E_Campanha.Caption    :=  Campanha;
  End;

end;

procedure TRepOrderPi_02.execute;
begin
  formataReport;
  SetVariable;
  setImages;
  ClearFields;
end;

procedure TRepOrderPi_02.formataReport;
Var
  Lc_Top : Integer;
  Lc_left : Integer;
  Lc_Height : Integer;
begin
  Lc_Top := 123;
  //Cabeçalho
  Lc_left := 1;
  MM_Colocacao.Left := Lc_left;
  MM_Colocacao.Width := 160;
  MM_Colocacao.Top := Lc_Top;

  Lc_left := Lc_left + MM_Colocacao.Width;
  MM_Peca.Left := Lc_left;
  MM_Peca.Width := 27;
  MM_Peca.Top := Lc_Top;

  Lc_left := Lc_left + MM_Peca.Width;
  Grid_Mes.Left := Lc_left;
  Grid_Mes.Width :=541 + 1;
  Grid_Mes.Top := Lc_Top;

  Lc_left := Lc_left + Grid_Mes.Width;
  MM_Total_Ins.Left := Lc_left;
  MM_Total_Ins.Top := Lc_Top;
  MM_Total_Ins.Width := 42;

  Lc_left := Lc_left + MM_Total_Ins.Width;
  MM_Desconto.Left := Lc_left;
  MM_Desconto.Width := 60;
  MM_Desconto.Top := Lc_Top;

  Lc_left := Lc_left + MM_Desconto.Width;
  MM_Negociado.Left := Lc_left;
  MM_Negociado.Width := 105;
  MM_Negociado.Top := Lc_Top;

  Lc_left := Lc_left + MM_Negociado.Width;
  MM_Subtotal.Left := Lc_left;
  MM_Subtotal.Width := 108;
  MM_Subtotal.Top := Lc_Top;

  //Detalhe
  Lc_left := 1;
  Lc_Top := 0;
  Lc_Height := 24;
  MM_Colocacao_detail.Left := Lc_left;
  MM_Colocacao_detail.Width := 160;
  MM_Colocacao_detail.Top := Lc_Top;
  MM_Colocacao_detail.Height := Lc_Height;

  Lc_left := Lc_left + MM_Colocacao_detail.Width;
  MM_Peca_detail.Left := Lc_left;
  MM_Peca_detail.Width := 27;
  MM_Peca_detail.Top := Lc_Top;
  MM_Peca_detail.Height := Lc_Height;

  Lc_left := Lc_left + MM_Peca_detail.Width;
  Grid_Mes_Detail.Left := Lc_left;
  Grid_Mes_Detail.Width :=541 + 1;
  Grid_Mes_Detail.Top := Lc_Top;
  Grid_Mes_Detail.Height := Lc_Height;

  Lc_left := Lc_left + Grid_Mes_Detail.Width;
  MM_Total_Ins_Detail.Left := Lc_left;
  MM_Total_Ins_Detail.Top := Lc_Top;
  MM_Total_Ins_Detail.Width := 42;
  MM_Total_Ins_Detail.Height := Lc_Height -1;

  Lc_left := Lc_left + MM_Total_Ins_Detail.Width;
  MM_Desconto_Detail.Left := Lc_left;
  MM_Desconto_Detail.Width := 60;
  MM_Desconto_Detail.Top := Lc_Top;
  MM_Desconto_Detail.Height := Lc_Height;

  Lc_left := Lc_left + MM_Desconto_Detail.Width;
  MM_Negociado_Detail.Left := Lc_left;
  MM_Negociado_Detail.Width := 105;
  MM_Negociado_Detail.Top := Lc_Top;
  MM_Negociado_Detail.Height := Lc_Height;

  Lc_left := Lc_left + MM_Negociado_Detail.Width;
  MM_Subtotal_Detail.Left := Lc_left;
  MM_Subtotal_Detail.Width := 108;
  MM_Subtotal_Detail.Top := Lc_Top;
  MM_Subtotal_Detail.Height := Lc_Height;






end;

function TRepOrderPi_02.getSequencia(Numero: Integer): String;
begin
  case Numero of
    1:Result := 'A';
    2:Result := 'B';
    3:Result := 'C';
    4:Result := 'D';
    5:Result := 'E';
    6:Result := 'G';
    7:Result := 'H';
    8:Result := 'I';
    9:Result := 'J';
  else
    Result := 'X';
  end;
end;

procedure TRepOrderPi_02.QrptBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  It_TotIns:=0;
end;

procedure TRepOrderPi_02.rbfootBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  I:Integer;
  LcUser : TControllerEntity;
begin
  with OrderPi do
  Begin
    Ordem.Registro.Estabelecimento := Registro.Estabelecimento;
    Ordem.Registro.Codigo := Registro.Codigo;
    Ordem.Registro.TErminal := 0;
    Ordem.getByKey;
    if ordem.Registro.Observacao <>'' then
      MM_Obs.Lines.Add(concat('Observação: ',
                              ordem.Registro.Observacao
                    ));

    LcUser := TControllerEntity.Create(Self);
    LcUser.Registro.Codigo := ordem.Registro.Usuario;
    LcUser.getByKey;
    Lb_Responsavel.Caption  :=  LcUser.Registro.ApelidoFantasia;

    MM_TotalGeral.Lines.Clear;
    MM_TotalGeral.Lines.Insert(0,'');
    MM_TotalGeral.Lines.Insert(1,inTToStr(It_TotIns));

    Lb_VL_Bruto.Caption   := FloatToStrF( Registro.ValorBruto,ffCurrency,10,2);
    Lb_VL_Agencia.Caption := FloatToStrF( Registro.ValorComissao,ffCurrency,10,2);
    Lb_VL_Liquido.Caption := FloatToStrF( Registro.ValorLiquido,ffCurrency,10,2);
    Lb_VL_Empresa.Caption := FloatToStrF( Registro.ValorProprio,ffCurrency,10,2);

    if Registro.NotaExtra <>'' then
    Begin
      StrExtraBand.Visible := True;
      MM_Obs_EXTRA.Lines.Add(concat('Observação: ',
                                  Registro.NotaExtra
                    ));
      StrExtraBand.Height := MM_Obs_EXTRA.Height;
    End
    else
    Begin
      StrExtraBand.Visible := False;
      StrExtraBand.Height := 0;

    End;

  End;
end;

procedure TRepOrderPi_02.InitVariable;
begin
  inherited;
  OrderPi := TControllerOrderPi.create(self);
end;

procedure TRepOrderPi_02.LimpaPeca;
begin
  Lb_Peca1.Caption      := '';
  Lb_Formato1.Caption   := '';
  Lb_Material1.Caption  := '';

  Lb_Peca2.Caption      := '';
  Lb_Formato2.Caption   := '';
  Lb_Material2.Caption  := '';

  Lb_Peca3.Caption      := '';
  Lb_Formato3.Caption   := '';
  Lb_Material3.Caption  := '';

  Lb_Peca3.Caption      := '';
  Lb_Formato3.Caption   := '';
  Lb_Material3.Caption  := '';

  Lb_Peca4.Caption      := '';
  Lb_Formato4.Caption   := '';
  Lb_Material4.Caption  := '';

  Lb_Peca5.Caption      := '';
  Lb_Formato5.Caption   := '';
  Lb_Material5.Caption  := '';

  Lb_Peca6.Caption      := '';
  Lb_Formato6.Caption   := '';
  Lb_Material6.Caption  := '';

  Lb_Peca7.Caption      := '';
  Lb_Formato7.Caption   := '';
  Lb_Material7.Caption  := '';

  Lb_Peca8.Caption      := '';
  Lb_Formato8.Caption   := '';
  Lb_Material8.Caption  := '';

end;

procedure TRepOrderPi_02.LimparCampoDetalhe;
Var
  I: Integer;
begin
  MM_Colocacao_detail.Font.Color :=  clWhite;
  MM_Peca_detail.Font.Color      :=  clWhite;
  for I := 0 to Grid_Mes_Detail.Columns - 1 do
    Grid_Mes_Detail.Cells[I,0].Caption := '';
  MM_Total_Ins_detail.Font.Color:=clWhite;
  MM_Desconto_detail.Font.Color:=clWhite;
  MM_Negociado_detail.Font.Color:=clWhite;
  MM_Subtotal_detail.Font.Color:=clWhite;
end;


end.
