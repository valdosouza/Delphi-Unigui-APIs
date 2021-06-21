unit rep_order_pi_01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, jpeg, QRPDFFilt, QRWebFilt, QRExport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ControllerOrderPi;

type
  TRL_PI = class(TForm)
    Qrpt: TQuickRep;
    PageHeader: TQRBand;
    Qr_Logo: TQRImage;
    Lb_Emp_Nome: TQRLabel;
    Lb_Emp_End: TQRLabel;
    Lb_Emp_Fones: TQRLabel;
    Lb_Emp_Doc: TQRLabel;
    Lb_Emp_Email: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    Lb_Ag_Fantasia: TQRLabel;
    Lb_Ag_Razao: TQRLabel;
    Lb_Ag_end: TQRLabel;
    Lb_Ag_cepcidadeUf: TQRLabel;
    Lb_Ag_CNPJ: TQRLabel;
    QRLabel25: TQRLabel;
    Lb_Ag_InscEst: TQRLabel;
    QRLabel55: TQRLabel;
    Lb_MesAnoVeic: TQRLabel;
    Lb_TipoPI: TQRLabel;
    Lb_PI_Orig: TQRLabel;
    Lb_Pi_Empresa: TQRLabel;
    Lb_PI_Interno: TQRLabel;
    QRLabel61: TQRLabel;
    Lb_Dt_PI_Orig: TQRLabel;
    QRLabel63: TQRLabel;
    QRMemo1: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo2: TQRMemo;
    QRMemo5: TQRMemo;
    QRMemo8: TQRMemo;
    QRMemo9: TQRMemo;
    QRMemo10: TQRMemo;
    QRMemo11: TQRMemo;
    QRMemo12: TQRMemo;
    QRMemo13: TQRMemo;
    QRMemo14: TQRMemo;
    QRMemo84: TQRMemo;
    QRMemo85: TQRMemo;
    QRMemo86: TQRMemo;
    QRMemo87: TQRMemo;
    QRMemo88: TQRMemo;
    QRMemo89: TQRMemo;
    QRMemo90: TQRMemo;
    QRMemo91: TQRMemo;
    QRMemo92: TQRMemo;
    QRMemo93: TQRMemo;
    QRMemo94: TQRMemo;
    QRMemo95: TQRMemo;
    QRMemo96: TQRMemo;
    QRMemo97: TQRMemo;
    QRMemo98: TQRMemo;
    QRMemo99: TQRMemo;
    QRMemo100: TQRMemo;
    QRMemo101: TQRMemo;
    QRMemo102: TQRMemo;
    QRMemo103: TQRMemo;
    QRMemo104: TQRMemo;
    QRMemo105: TQRMemo;
    QRMemo106: TQRMemo;
    QRMemo107: TQRMemo;
    QRMemo108: TQRMemo;
    QRMemo109: TQRMemo;
    QRMemo110: TQRMemo;
    QRMemo111: TQRMemo;
    QRMemo112: TQRMemo;
    QRMemo113: TQRMemo;
    MM_Colocacao: TQRMemo;
    QRMemo115: TQRMemo;
    QRMemo116: TQRMemo;
    QRMemo117: TQRMemo;
    QRMemo118: TQRMemo;
    QRMemo119: TQRMemo;
    QRMemo120: TQRMemo;
    QRMemo121: TQRMemo;
    QRMemo122: TQRMemo;
    QRMemo123: TQRMemo;
    QRMemo124: TQRMemo;
    QRMemo125: TQRMemo;
    QRMemo126: TQRMemo;
    QRMemo127: TQRMemo;
    QRMemo128: TQRMemo;
    QRMemo129: TQRMemo;
    QRMemo130: TQRMemo;
    QRMemo131: TQRMemo;
    QRMemo132: TQRMemo;
    QRMemo133: TQRMemo;
    QRMemo134: TQRMemo;
    QRMemo135: TQRMemo;
    QRMemo136: TQRMemo;
    QRMemo137: TQRMemo;
    QRMemo138: TQRMemo;
    QRMemo139: TQRMemo;
    QRMemo140: TQRMemo;
    QRMemo141: TQRMemo;
    QRMemo142: TQRMemo;
    QRMemo143: TQRMemo;
    QRMemo144: TQRMemo;
    QRMemo145: TQRMemo;
    QRMemo146: TQRMemo;
    QRMemo147: TQRMemo;
    MM_Negociado: TQRMemo;
    QRMemo150: TQRMemo;
    QRStringsBand1: TQRStringsBand;
    MM_01: TQRMemo;
    MM_02: TQRMemo;
    MM_03: TQRMemo;
    MM_04: TQRMemo;
    MM_05: TQRMemo;
    MM_06: TQRMemo;
    MM_07: TQRMemo;
    MM_08: TQRMemo;
    MM_09: TQRMemo;
    MM_10: TQRMemo;
    MM_11: TQRMemo;
    MM_12: TQRMemo;
    MM_13: TQRMemo;
    MM_14: TQRMemo;
    MM_15: TQRMemo;
    MM_16: TQRMemo;
    MM_17: TQRMemo;
    MM_18: TQRMemo;
    MM_19: TQRMemo;
    MM_20: TQRMemo;
    MM_21: TQRMemo;
    MM_22: TQRMemo;
    MM_23: TQRMemo;
    MM_24: TQRMemo;
    MM_25: TQRMemo;
    MM_26: TQRMemo;
    MM_27: TQRMemo;
    MM_28: TQRMemo;
    MM_29: TQRMemo;
    MM_30: TQRMemo;
    MM_31: TQRMemo;
    MM_Posicao: TQRMemo;
    MM_00: TQRMemo;
    MM_TOTINS: TQRMemo;
    MM_VLUNIT: TQRMemo;
    MM_VLTOTAL: TQRMemo;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    Lb_29: TQRLabel;
    Lb_30: TQRLabel;
    Lb_31: TQRLabel;
    Lb_S1: TQRLabel;
    Lb_S2: TQRLabel;
    Lb_S3: TQRLabel;
    Lb_S4: TQRLabel;
    Lb_S5: TQRLabel;
    Lb_S6: TQRLabel;
    Lb_S7: TQRLabel;
    Lb_S8: TQRLabel;
    Lb_S9: TQRLabel;
    Lb_S10: TQRLabel;
    Lb_S11: TQRLabel;
    Lb_S12: TQRLabel;
    Lb_S13: TQRLabel;
    Lb_S14: TQRLabel;
    Lb_S15: TQRLabel;
    Lb_S16: TQRLabel;
    Lb_S17: TQRLabel;
    Lb_S18: TQRLabel;
    Lb_S19: TQRLabel;
    Lb_S20: TQRLabel;
    Lb_S21: TQRLabel;
    Lb_S22: TQRLabel;
    Lb_S23: TQRLabel;
    Lb_S24: TQRLabel;
    Lb_S25: TQRLabel;
    Lb_S26: TQRLabel;
    Lb_S27: TQRLabel;
    Lb_S28: TQRLabel;
    Lb_S29: TQRLabel;
    Lb_S30: TQRLabel;
    Lb_S31: TQRLabel;
    Lb_Dt_Vencimento: TQRLabel;
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
    QRLabel17: TQRLabel;
    Lb_Ag_Fone: TQRLabel;
    QRMemo15: TQRMemo;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRMemo16: TQRMemo;
    MM_Aliq_Desc: TQRMemo;
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
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    Lb_PI: TQRLabel;
    QRMemo6: TQRMemo;
    QRLabel27: TQRLabel;
    Lb_Ve_Fantasia: TQRLabel;
    QRLabel28: TQRLabel;
    Lb_Ve_Razao: TQRLabel;
    QRLabel29: TQRLabel;
    Lb_Ve_Endereco: TQRLabel;
    QRLabel32: TQRLabel;
    Lb_Ve_CNPJ: TQRLabel;
    QRLabel21: TQRLabel;
    Lb_Ve_Fone: TQRLabel;
    QRBand2: TQRBand;
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
    StrBand: TQRChildBand;
    Qry: TFDQuery;
    QrpPDF: TQRPDFFilter;
    procedure InitVariable;
    procedure SetVariable;

    procedure PageHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRStringsBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QrptBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    OrderPi : TControllerOrderPi;
  public
    { Public declarations }
    Pecas: array[1..8,1..4]of string;
    CodigoRegistro : Integer;
    It_I:Integer;
    It_TotIns:Integer;
    It_Cd_Peca : Integer;
    It_Imagem : TQRImage;
    procedure Pc_PreencheSemana;
    procedure Pc_MostraValores(Pc_Mostra : Boolean);
  end;

var
  RL_PI: TRL_PI;

implementation

uses UnFunctions;

{$R *.dfm}

procedure TRL_PI.Pc_MostraValores(Pc_Mostra : Boolean);
Begin
//  if Pc_Mostra then
//    Begin
//    Lb_ValorLiquido.top := 44;
//    Lb_VL_Liquido.top := 44;
//    Lb_MhaEmpresa.top := 65;
//    Lb_VL_Empresa.top := 65;
//    Lb_MhaEmpresa.Font.Color := clBlack;
//    Lb_VL_Empresa.Font.Color := clBlack;
//    end
//  else
//    Begin
//    Lb_ValorLiquido.top := 65;
//    Lb_VL_Liquido.top := 65;
//    Lb_MhaEmpresa.top := 44;
//    Lb_VL_Empresa.top := 44;
//    Lb_MhaEmpresa.Font.Color := clWhite;
//    Lb_VL_Empresa.Font.Color := clWhite;
//    end;
end;

procedure TRL_PI.Pc_PreencheSemana;
//var
//  dt_insertion : TDateTime;
begin
//  dt_insertion  := OrderPi.MedInsertDate.Registro.DataInsercao;
//
//  Lb_S1.Caption:=  copy(DiaDaSemana(StrTodateDef('01'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S2.Caption:=  copy(DiaDaSemana(StrTodateDef('02'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S3.Caption:=  copy(DiaDaSemana(StrTodateDef('03'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S4.Caption:=  copy(DiaDaSemana(StrTodateDef('04'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S5.Caption:=  copy(DiaDaSemana(StrTodateDef('05'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S6.Caption:=  copy(DiaDaSemana(StrTodateDef('06'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S7.Caption:=  copy(DiaDaSemana(StrTodateDef('07'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S8.Caption:=  copy(DiaDaSemana(StrTodateDef('08'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S9.Caption:=  copy(DiaDaSemana(StrTodateDef('09'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S10.Caption:= copy(DiaDaSemana(StrTodateDef('10'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S11.Caption:= copy(DiaDaSemana(StrTodateDef('11'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S12.Caption:= copy(DiaDaSemana(StrTodateDef('12'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S13.Caption:= copy(DiaDaSemana(StrTodateDef('13'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S14.Caption:= copy(DiaDaSemana(StrTodateDef('14'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S15.Caption:= copy(DiaDaSemana(StrTodateDef('15'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S16.Caption:= copy(DiaDaSemana(StrTodateDef('16'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S17.Caption:= copy(DiaDaSemana(StrTodateDef('17'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S18.Caption:= copy(DiaDaSemana(StrTodateDef('18'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S19.Caption:= copy(DiaDaSemana(StrTodateDef('19'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S20.Caption:= copy(DiaDaSemana(StrTodateDef('20'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S21.Caption:= copy(DiaDaSemana(StrTodateDef('21'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S22.Caption:= copy(DiaDaSemana(StrTodateDef('22'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S23.Caption:= copy(DiaDaSemana(StrTodateDef('23'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S24.Caption:= copy(DiaDaSemana(StrTodateDef('24'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S25.Caption:= copy(DiaDaSemana(StrTodateDef('25'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S26.Caption:= copy(DiaDaSemana(StrTodateDef('26'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S27.Caption:= copy(DiaDaSemana(StrTodateDef('27'+Copy(dt_insertion,3,8))),1,1);
//  Lb_S28.Caption:= copy(DiaDaSemana(StrTodateDef('28'+Copy(dt_insertion,3,8))),1,1);
//  try
//    Lb_29.Font.Color:=clBlack;
//    Lb_S29.Caption:=  copy(DiaDaSemana(StrTodate('29'+Copy(dt_insertion,3,8))),1,1);
//  except
//    Lb_S29.Caption:='';
//    Lb_29.Font.Color:=clWhite;
//  end;
//
//  try
//    Lb_30.Font.Color:=clBlack;
//    Lb_S30.Caption:=  copy(DiaDaSemana(StrTodate('30'+Copy(dt_insertion,3,8))),1,1);
//  except
//    Lb_S30.Caption:='';
//    Lb_30.Font.Color:=clWhite;
//  end;
//
//  try
//    Lb_31.Font.Color:=clBlack;
//    Lb_S31.Caption:=  copy(DiaDaSemana(StrTodate('31'+Copy(dt_insertion,3,8))),1,1);
//  except
//    Lb_S31.Caption:='';
//    Lb_31.Font.Color:=clWhite;
//  end;
end;

procedure TRL_PI.PageHeaderBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
//Var
//  I,J:Integer;
begin
//  DM.Tb_MhaEmp.Active:=True;
//  Qr_Logo.Picture.LoadFromFile(Gb_PathLogo);
//  //Dados da Empresa
//  Lb_Emp_Razao.Caption:=DM.Tb_MhaEmpEMP_NOME.AsString;
//  Lb_Emp_Endereco.Caption:=DM.Tb_MhaEmpEMP_ENDER.AsString;
//  Lb_Emp_CepBairroCidadeUf.Caption:=Copy(DM.Tb_MhaEmpEMP_CEP.AsString,1,5)+'-'+Copy(DM.Tb_MhaEmpEMP_CEP.AsString,6,3)+' - '+
//                                    DM.Tb_MhaEmpEMP_BAIRRO.AsString+' - '+
//                                    DM.Tb_MhaEmpEMP_CIDADE.AsString+' - '+
//                                    DM.Tb_MhaEmpEMP_ESTADO.AsString;
//  if DM.Tb_MhaEmpEMP_FONE.AsString<>''then
//    Lb_Emp_FoneFax.Caption:='Fone: ('+copy(DM.Tb_MhaEmpEMP_FONE.AsString,1,2)+') '+copy(DM.Tb_MhaEmpEMP_FONE.AsString,3,4)+'-'+copy(DM.Tb_MhaEmpEMP_FONE.AsString,7,4)
//  else
//    Lb_Emp_FoneFax.Caption:='';
//  if DM.Tb_MhaEmpEMP_FAX.AsString<>''then
//    Lb_Emp_FoneFax.Caption:=Lb_Emp_FoneFax.Caption+' / '+
//                                 '('+copy(DM.Tb_MhaEmpEMP_FAX.AsString,1,2)+') '+copy(DM.Tb_MhaEmpEMP_FAX.AsString,3,4)+'-'+copy(DM.Tb_MhaEmpEMP_FAX.AsString,7,4);
//  Lb_Emp_Cnpj.Caption:='CNPJ: '+Copy(DM.Tb_MhaEmpEMP_CNPJ.AsString,1,2)+'.'+Copy(DM.Tb_MhaEmpEMP_CNPJ.AsString,3,3)+'.'+copy(DM.Tb_MhaEmpEMP_CNPJ.AsString,6,3)+'/'+Copy(DM.Tb_MhaEmpEMP_CNPJ.AsString,9,4)+'-'+copy(DM.Tb_MhaEmpEMP_CNPJ.AsString,13,2);
//  Lb_Emp_InscEst.Caption:='Inscr. Estadual: '+DM.Tb_MhaEmpEMP_NUMINSC.AsString;
//  Lb_Emp_Email.Caption:='E-mail: '+DM.Tb_MhaEmpEMP_EMAIL.AsString;
//
//  Lb_PI.Caption:=Fr_PI.E_Ped_Orig.Text;
//
//  //Dados da Agencia
//  Lb_Ag_Fantasia.Caption:=DM.Tb_AgenciaEMP_FANTASIA.AsString;
//  Lb_Ag_Razao.Caption:=DM.Tb_AgenciaEMP_NOME.AsString;
//  Lb_Ag_Endereco.Caption:=DM.Tb_AgenciaEMP_ENDER.AsString + ' - ' + DM.Tb_AgenciaEMP_BAIRRO.AsString;
//  if DM.Tb_AgenciaEMP_COMPLEM.AsString<>'' then
//    Lb_Ag_Endereco.Caption:=DM.Tb_AgenciaEMP_ENDER.AsString+' - '+DM.Tb_AgenciaEMP_COMPLEM.AsString + ' - ' + DM.Tb_AgenciaEMP_BAIRRO.AsString;
//  Lb_Ag_cepcidadeUf.Caption:=Copy(DM.Tb_AgenciaEMP_CEP.AsString,1,5)+'-'+Copy(DM.Tb_AgenciaEMP_CEP.AsString,6,3)+' - '+
//                                    DM.Tb_AgenciaEMP_CIDADE.AsString+' - '+
//                                    DM.Tb_AgenciaEMP_ESTADO.AsString;
//  Lb_Ag_CNPJ.Caption:=Copy(DM.Tb_AgenciaEMP_CNPJ.AsString,1,2)+'.'+
//                      Copy(DM.Tb_AgenciaEMP_CNPJ.AsString,3,3)+'.'+
//                      copy(DM.Tb_AgenciaEMP_CNPJ.AsString,6,3)+'/'+
//                      Copy(DM.Tb_AgenciaEMP_CNPJ.AsString,9,4)+'-'+
//                      copy(DM.Tb_AgenciaEMP_CNPJ.AsString,13,2);
//  Lb_Ag_InscEst.Caption:=DM.Tb_AgenciaEMP_NUMINSC.AsString;
//  if DM.Tb_AgenciaEMP_FONE.AsString<>'' then
//    Lb_Ag_Fone.Caption:='('+copy(DM.Tb_AgenciaEMP_FONE.AsString,1,2)+') '+copy(DM.Tb_AgenciaEMP_FONE.AsString,3,4)+'-'+copy(DM.Tb_AgenciaEMP_FONE.AsString,7,4)
//  else
//    Lb_Ag_Fone.Caption:='';
//  if DM.Tb_AgenciaEMP_FAX.AsString<>'' then
//    Lb_Ag_Fone.Caption:=Lb_Ag_Fone.Caption+' / '+
//                                 '('+copy(DM.Tb_AgenciaEMP_FAX.AsString,1,2)+') '+copy(DM.Tb_AgenciaEMP_FAX.AsString,3,4)+'-'+copy(DM.Tb_AgenciaEMP_FAX.AsString,7,4);
//
//  //Dados do Veiculo
//  Lb_Ve_Fantasia.Caption:=DM.Tb_VeiculoEMP_FANTASIA.AsString;
//  Lb_Ve_Razao.Caption:=DM.Tb_VeiculoEMP_NOME.AsString;
//  Lb_Ve_Endereco.Caption:=DM.Tb_veiculoEMP_ENDER.AsString;
//  if DM.Tb_veiculoEMP_COMPLEM.AsString<>'' then
//  Lb_Ve_Endereco.Caption:=DM.Tb_veiculoEMP_ENDER.AsString+' - '+DM.Tb_veiculoEMP_COMPLEM.AsString;
//  Lb_Ve_CNPJ.Caption:=Copy(DM.Tb_veiculoEMP_CNPJ.AsString,1,2)+'.'+
//                      Copy(DM.Tb_veiculoEMP_CNPJ.AsString,3,3)+'.'+
//                      copy(DM.Tb_veiculoEMP_CNPJ.AsString,6,3)+'/'+
//                      Copy(DM.Tb_veiculoEMP_CNPJ.AsString,9,4)+'-'+
//                      copy(DM.Tb_veiculoEMP_CNPJ.AsString,13,2);
//
//  if DM.Tb_VeiculoEMP_FONE.AsString<>'' then
//    Lb_Ve_Fone.Caption:='('+copy(DM.Tb_VeiculoEMP_FONE.AsString,1,2)+') '+copy(DM.Tb_VeiculoEMP_FONE.AsString,3,4)+'-'+copy(DM.Tb_VeiculoEMP_FONE.AsString,7,4)
//  else
//    Lb_Ve_Fone.Caption:='';
//  if DM.Tb_VeiculoEMP_FAX.AsString<>'' then
//  Lb_Ve_Fone.Caption:=Lb_Ve_Fone.Caption+' / '+
//                                 '('+copy(DM.Tb_VeiculoEMP_FAX.AsString,1,2)+') '+copy(DM.Tb_VeiculoEMP_FAX.AsString,3,4)+'-'+copy(DM.Tb_VeiculoEMP_FAX.AsString,7,4);
//
//  //Dados do Anunciante
//  Lb_An_Fantasia.Caption:=DM.Tb_AnuncianteEMP_FANTASIA.AsString;
//  Lb_An_Razao.Caption:=DM.Tb_AnuncianteEMP_NOME.AsString;
//  Lb_An_Endereco.Caption:=DM.Tb_AnuncianteEMP_ENDER.AsString + ' - ' + DM.Tb_AnuncianteEMP_BAIRRO.AsString;
//  if DM.Tb_AnuncianteEMP_COMPLEM.AsString<>'' then
//  Lb_An_Endereco.Caption:=DM.Tb_AnuncianteEMP_ENDER.AsString+' - '+DM.Tb_AnuncianteEMP_COMPLEM.AsString + ' - ' + DM.Tb_AnuncianteEMP_BAIRRO.AsString;
//  Lb_An_cepcidadeUf.Caption:=Copy(DM.Tb_AnuncianteEMP_CEP.AsString,1,5)+'-'+Copy(DM.Tb_AnuncianteEMP_CEP.AsString,6,3)+' - '+
//                                    DM.Tb_AnuncianteEMP_CIDADE.AsString+' - '+
//                                    DM.Tb_AnuncianteEMP_ESTADO.AsString;
//  if DM.Tb_AnuncianteEMP_TIPOPESSOA.AsInteger=0 then
//    Begin
//    Lb_An_Doc.Caption:='CPF';
//    Lb_An_CNPJ.Caption:=Copy(DM.Tb_AnuncianteEMP_CNPJ.AsString,1,3)+'.'+
//                        Copy(DM.Tb_AnuncianteEMP_CNPJ.AsString,4,3)+'.'+
//                        copy(DM.Tb_AnuncianteEMP_CNPJ.AsString,7,3)+'-'+
//                        Copy(DM.Tb_AnuncianteEMP_CNPJ.AsString,10,2);
//    Lb_Lb_An_InsEst.Caption:='Ident: ';
//    Lb_An_InscEst.Caption:=DM.Tb_AnuncianteEMP_NUMINSC.AsString;
//    end
//  else
//    Begin
//    Lb_An_Doc.Caption:='CNPJ';
//    Lb_An_CNPJ.Caption:=Copy(DM.Tb_AnuncianteEMP_CNPJ.AsString,1,2)+'.'+
//                        Copy(DM.Tb_AnuncianteEMP_CNPJ.AsString,3,3)+'.'+
//                        copy(DM.Tb_AnuncianteEMP_CNPJ.AsString,6,3)+'/'+
//                        Copy(DM.Tb_AnuncianteEMP_CNPJ.AsString,9,4)+'-'+
//                        copy(DM.Tb_AnuncianteEMP_CNPJ.AsString,13,2);
//    Lb_Lb_An_InsEst.Caption:='I. Est.:';
//    Lb_An_InscEst.Caption:=DM.Tb_AnuncianteEMP_NUMINSC.AsString;
//    end;
//
//  if DM.Tb_AnuncianteEMP_FONE.AsString<>'' then
//    Lb_An_Fone.Caption:='('+copy(DM.Tb_AnuncianteEMP_FONE.AsString,1,2)+') '+copy(DM.Tb_AnuncianteEMP_FONE.AsString,3,4)+'-'+copy(DM.Tb_AnuncianteEMP_FONE.AsString,7,4)
//  else
//    Lb_An_Fone.Caption:='';
//  if DM.Tb_AnuncianteEMP_FAX.AsString<>'' then
//  Lb_An_Fone.Caption:=Lb_An_Fone.Caption+' / '+
//                                 '('+copy(DM.Tb_AnuncianteEMP_FAX.AsString,1,2)+') '+copy(DM.Tb_AnuncianteEMP_FAX.AsString,3,4)+'-'+copy(DM.Tb_AnuncianteEMP_FAX.AsString,7,4);
//
//
//  //Dados Do PI
//  Lb_Pi_Empresa.Caption := 'P.I. ' + Fc_NomeReduzido(DM.Tb_MhaEmpEMP_FANTASIA.AsString);
//  Lb_PI_Interno.Caption:=Fr_PI.E_Ped_Int.Text;
//  Lb_PI_Orig.Caption:=Fr_PI.E_Ped_Orig.Text;
//  Lb_Dt_PI_Orig.Caption:=Fr_PI.E_Data_Orig.Text;
//  Fr_PI.Tb_Pecas.Active := False;
//  Fr_PI.Tb_Pecas.ParamByName('PDI_CODIGO').AsInteger := Fr_PI.TB_PIPDI_CODIGO.AsInteger;
//  Fr_PI.Tb_Pecas.Active := True;
//  Fr_PI.Tb_Pecas.First;
//
//  Fr_PI.Tb_DataIns.Active := False;
//  Fr_PI.Tb_DataIns.ParamByName('PCA_CODIGO').AsInteger := Fr_PI.Tb_PecasPCA_CODIGO.AsInteger;
//  Fr_PI.Tb_DataIns.Active := True;
//  Fr_PI.Tb_DataIns.First;
//
//
//  Lb_MesAnoVeic.Caption:=Fc_DesMes(StrToIntdef(Copy(Fr_PI.Tb_DataInsDIN_DATA.AsString,4,2),0),True)+'/'+Copy(Fr_PI.Tb_DataInsDIN_DATA.AsString,7,4);
//  Lb_Dt_Vencimento.Caption:=Fr_PI.E_Vencimento.Text;
//
//  //Apaga os dados da MAtriz
//  For I:=1 to 8 do
//    For J:=2 to 4 do
//      Pecas[I,J]:=' ';
//  Pecas[1,1]:='A';
//  Pecas[2,1]:='B';
//  Pecas[3,1]:='C';
//  Pecas[4,1]:='D';
//  Pecas[5,1]:='E';
//  Pecas[6,1]:='F';
//  Pecas[7,1]:='G';
//  Pecas[8,1]:='H';

//  Preenche a Matriz com Peca Formato Material
//  Fr_PI.Tb_Pecas.First;
//  I:=1;
//  while not Fr_PI.Tb_Pecas.Eof do
//    Begin
//    case Fr_PI.Cb_Aplicacao.ItemIndex of
//      0:Begin
//        Pecas[I,2]:=Fr_PI.Tb_PecasPCA_TITULO.AsString;
//        Pecas[I,3]:=Fr_PI.Tb_PecasPCA_COLUNA.AsString+'Col X '+Fr_PI.Tb_PecasPCA_ALTURA.AsString+'cm';
//        Pecas[I,4]:=Fr_PI.Tb_PecasMTR_DESCRICAO.AsString + ' - ' + Fr_PI.Tb_PecasPCA_COR.AsString;
//        end;
//      1:Begin
//        Pecas[I,2]:=Fr_PI.Tb_PecasPCA_TITULO.AsString;
//        Pecas[I,3]:=Fr_PI.Tb_PecasPCA_DIA.AsString;
//        Pecas[I,4]:=Fr_PI.Tb_PecasMTR_DESCRICAO.AsString;
//        end;
//      2:Begin
//        Pecas[I,2]:=Fr_PI.Tb_PecasPCA_TITULO.AsString;
//        Pecas[I,3]:=Fr_PI.Tb_PecasTBV_POSICAO.AsString;
//        Pecas[I,4]:=Fr_PI.Tb_PecasMTR_DESCRICAO.AsString;
//        end;
//    end;
//    I:=I+1;
//    Fr_PI.Tb_Pecas.Next;
//    end;
//
//  //Preecnhe a PI
//  IF Pecas[1,2]<>' ' then Lb_Peca1.Caption:=pecas[1,1]+' - '+pecas[1,2] else Lb_Peca1.Caption:=pecas[1,2];
//  IF Pecas[2,2]<>' ' then Lb_Peca2.Caption:=pecas[2,1]+' - '+pecas[2,2] else Lb_Peca2.Caption:=pecas[2,2];
//  IF Pecas[3,2]<>' ' then Lb_Peca3.Caption:=pecas[3,1]+' - '+pecas[3,2] else Lb_Peca3.Caption:=pecas[3,2];
//  IF Pecas[4,2]<>' ' then Lb_Peca4.Caption:=pecas[4,1]+' - '+pecas[4,2] else Lb_Peca4.Caption:=pecas[4,2];
//  IF Pecas[5,2]<>' ' then Lb_Peca5.Caption:=pecas[5,1]+' - '+pecas[5,2] else Lb_Peca5.Caption:=pecas[5,2];
//  IF Pecas[6,2]<>' ' then Lb_Peca6.Caption:=pecas[6,1]+' - '+pecas[6,2] else Lb_Peca6.Caption:=pecas[6,2];
//  IF Pecas[7,2]<>' ' then Lb_Peca7.Caption:=pecas[7,1]+' - '+pecas[7,2] else Lb_Peca7.Caption:=pecas[7,2];
//  IF Pecas[8,2]<>' ' then Lb_Peca8.Caption:=pecas[8,1]+' - '+pecas[8,2] else Lb_Peca8.Caption:=pecas[8,2];
//  IF StrToIntDef( Fr_PI.TB_PIPDI_TIPOVEIC.AsString,0) = 0 THEN Lb_Formato00.Caption := 'FORMATO' else Lb_Formato00.Caption := 'TEMPO';
//  IF StrToIntDef( Fr_PI.TB_PIPDI_TIPOVEIC.AsString,0) = 0 THEN Lb_Formato01.Caption := 'FORMATO' else Lb_Formato01.Caption := 'TEMPO';
//  Lb_Formato1.Caption:=pecas[1,3];
//  Lb_Formato2.Caption:=pecas[2,3];
//  Lb_Formato3.Caption:=pecas[3,3];
//  Lb_Formato4.Caption:=pecas[4,3];
//  Lb_Formato5.Caption:=pecas[5,3];
//  Lb_Formato6.Caption:=pecas[6,3];
//  Lb_Formato7.Caption:=pecas[7,3];
//  Lb_Formato8.Caption:=pecas[8,3];
//  Lb_Material1.Caption:=pecas[1,4];
//  Lb_Material2.Caption:=pecas[2,4];
//  Lb_Material3.Caption:=pecas[3,4];
//  Lb_Material4.Caption:=pecas[4,4];
//  Lb_Material5.Caption:=pecas[5,4];
//  Lb_Material6.Caption:=pecas[6,4];
//  Lb_Material7.Caption:=pecas[7,4];
//  Lb_Material8.Caption:=pecas[8,4];

//  MM_Colocacao.Lines.Clear;
//  MM_Colocacao.Lines.Insert(0,' ');
//  MM_Colocacao.Lines.Insert(1,'COLOCAÇÃO');
//  MM_Colocacao.Lines.Insert(2,Fc_DesMes(StrToIntdef(Copy(Fr_PI.Tb_DataInsDIN_DATA.AsString,4,2),0),True)+'/'+Copy(Fr_PI.Tb_DataInsDIN_DATA.AsString,7,4));
//  if StrToIntDef(Fr_PI.TB_PIPDI_TIPOVEIC.AsString,0) = 0 then
//    Begin
//    MM_Negociado.Lines.Clear;
//    MM_Negociado.Lines.Insert(0,'');
//    MM_Negociado.Lines.Insert(1,'CM / COL');
//    MM_Negociado.Lines.Insert(2,'NEGOCIADO');
//    end
//  else
//    Begin
//    MM_Negociado.Lines.Clear;
//    MM_Negociado.Lines.Insert(0,'');
//    MM_Negociado.Lines.Insert(1,'UNITÁRIO');
//    MM_Negociado.Lines.Insert(2,'NEGOCIADO');
//    end;
//  Pc_PreencheSemana;
//  Fr_PI.Tb_Pecas.First;
//  It_I:=1;
end;

procedure TRL_PI.QRStringsBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
//Var
//  Insercao:Array[1..31] of String;
//  I:Integer;
//  Lc_TotIns:Integer;
begin
//  MM_Posicao.Font.Color:=clWhite;
//  MM_00.Font.Color:=clWhite;
//  MM_01.Font.Color:=clWhite;
//  MM_02.Font.Color:=clWhite;
//  MM_03.Font.Color:=clWhite;
//  MM_04.Font.Color:=clWhite;
//  MM_05.Font.Color:=clWhite;
//  MM_06.Font.Color:=clWhite;
//  MM_07.Font.Color:=clWhite;
//  MM_08.Font.Color:=clWhite;
//  MM_09.Font.Color:=clWhite;
//  MM_10.Font.Color:=clWhite;
//  MM_11.Font.Color:=clWhite;
//  MM_12.Font.Color:=clWhite;
//  MM_13.Font.Color:=clWhite;
//  MM_14.Font.Color:=clWhite;
//  MM_15.Font.Color:=clWhite;
//  MM_16.Font.Color:=clWhite;
//  MM_17.Font.Color:=clWhite;
//  MM_18.Font.Color:=clWhite;
//  MM_19.Font.Color:=clWhite;
//  MM_20.Font.Color:=clWhite;
//  MM_21.Font.Color:=clWhite;
//  MM_22.Font.Color:=clWhite;
//  MM_23.Font.Color:=clWhite;
//  MM_24.Font.Color:=clWhite;
//  MM_25.Font.Color:=clWhite;
//  MM_26.Font.Color:=clWhite;
//  MM_27.Font.Color:=clWhite;
//  MM_28.Font.Color:=clWhite;
//  MM_29.Font.Color:=clWhite;
//  MM_30.Font.Color:=clWhite;
//  MM_31.Font.Color:=clWhite;
//  MM_TOTINS.Font.Color:=clWhite;
//  MM_Aliq_Desc.Font.Color:=clWhite;
//  MM_VLUNIT.Font.Color:=clWhite;
//  MM_VLTOTAL.Font.Color:=clWhite;

//  if Fr_PI.Tb_Pecas.eof then exit;
//  if Fr_PI.Tb_PecasTBV_POSICAO.AsString<> '' then
//    Begin
//    MM_Posicao.Font.Color:=clBlack;
//    MM_Posicao.Lines.Insert(0,' '+Fr_PI.Tb_PecasTBV_POSICAO.AsString);
//    MM_00.Font.Color:=clBlack;
//    MM_00.Lines.Insert(0,pecas[It_I,1]);
//    Fr_PI.Tb_DataIns.First;
//    For I:=1 to 31 do
//      Insercao[I]:=' ';
//    Lc_TotIns:=0;
//    Fr_PI.Tb_DataIns.Active := False;
//    Fr_PI.Tb_DataIns.ParamByName('PCA_CODIGO ').AsInteger := Fr_PI.Tb_PecasPCA_CODIGO.AsInteger;
//    Fr_PI.Tb_DataIns.Active := true;
//    Fr_PI.Tb_DataIns.First;
//    while not Fr_PI.Tb_DataIns.Eof do
//      Begin
//      Insercao[StrToInt(copy(Fr_PI.Tb_DataInsDIN_DATA.AsString,1,2))]:=Fr_PI.Tb_DataInsDIN_INSERCAO.AsString;
//      Lc_TotIns:=Lc_TotIns+Fr_PI.Tb_DataInsDIN_INSERCAO.AsInteger;
//      Fr_PI.Tb_DataIns.Next;
//      end;
//    It_TotIns:=It_TotIns+Lc_TotIns;
//    MM_01.Font.Color:=clBlack;    MM_01.Lines.Insert(0,insercao[1]);
//    MM_02.Font.Color:=clBlack;    MM_02.Lines.Insert(0,insercao[2]);
//    MM_03.Font.Color:=clBlack;    MM_03.Lines.Insert(0,insercao[3]);
//    MM_04.Font.Color:=clBlack;    MM_04.Lines.Insert(0,insercao[4]);
//    MM_05.Font.Color:=clBlack;    MM_05.Lines.Insert(0,insercao[5]);
//    MM_06.Font.Color:=clBlack;    MM_06.Lines.Insert(0,insercao[6]);
//    MM_07.Font.Color:=clBlack;    MM_07.Lines.Insert(0,insercao[7]);
//    MM_08.Font.Color:=clBlack;    MM_08.Lines.Insert(0,insercao[8]);
//    MM_09.Font.Color:=clBlack;    MM_09.Lines.Insert(0,insercao[9]);
//    MM_10.Font.Color:=clBlack;    MM_10.Lines.Insert(0,insercao[10]);
//    MM_11.Font.Color:=clBlack;    MM_11.Lines.Insert(0,insercao[11]);
//    MM_12.Font.Color:=clBlack;    MM_12.Lines.Insert(0,insercao[12]);
//    MM_13.Font.Color:=clBlack;    MM_13.Lines.Insert(0,insercao[13]);
//    MM_14.Font.Color:=clBlack;    MM_14.Lines.Insert(0,insercao[14]);
//    MM_15.Font.Color:=clBlack;    MM_15.Lines.Insert(0,insercao[15]);
//    MM_16.Font.Color:=clBlack;    MM_16.Lines.Insert(0,insercao[16]);
//    MM_17.Font.Color:=clBlack;    MM_17.Lines.Insert(0,insercao[17]);
//    MM_18.Font.Color:=clBlack;    MM_18.Lines.Insert(0,insercao[18]);
//    MM_19.Font.Color:=clBlack;    MM_19.Lines.Insert(0,insercao[19]);
//    MM_20.Font.Color:=clBlack;    MM_20.Lines.Insert(0,insercao[20]);
//    MM_21.Font.Color:=clBlack;    MM_21.Lines.Insert(0,insercao[21]);
//    MM_22.Font.Color:=clBlack;    MM_22.Lines.Insert(0,insercao[22]);
//    MM_23.Font.Color:=clBlack;    MM_23.Lines.Insert(0,insercao[23]);
//    MM_24.Font.Color:=clBlack;    MM_24.Lines.Insert(0,insercao[24]);
//    MM_25.Font.Color:=clBlack;    MM_25.Lines.Insert(0,insercao[25]);
//    MM_26.Font.Color:=clBlack;    MM_26.Lines.Insert(0,insercao[26]);
//    MM_27.Font.Color:=clBlack;    MM_27.Lines.Insert(0,insercao[27]);
//    MM_28.Font.Color:=clBlack;    MM_28.Lines.Insert(0,insercao[28]);
//    MM_29.Font.Color:=clBlack;    MM_29.Lines.Insert(0,insercao[29]);
//    MM_30.Font.Color:=clBlack;    MM_30.Lines.Insert(0,insercao[30]);
//    MM_31.Font.Color:=clBlack;    MM_31.Lines.Insert(0,insercao[31]);
//    MM_TOTINS.Font.Color:=clBlack;    MM_TOTINS.Lines.Insert(0,intToStr(Lc_TotIns));
//    MM_Aliq_Desc.Font.Color:=clBlack;    MM_Aliq_Desc.Lines.Insert(0,FloatTostrF(Fr_PI.Tb_PecasPCA_ALIQ_DESC.AsFloat,ffFixed,10,2)+'% ');
//    MM_VLUNIT.Font.Color:=clBlack;    MM_VLUNIT.Lines.Insert(0,FloatTostrF(Fr_PI.Tb_PecasPCA_VL_UNIT.AsFloat,ffCurrency,10,2)+' ');
//    MM_VLTOTAL.Font.Color:=clBlack;    MM_VLTOTAL.Lines.Insert(0,FloatTostrF(Fr_PI.Tb_PecasPCA_VL_TOTAL.AsFloat,ffCurrency,10,2)+' ');
//    end;
// Fr_PI.Tb_Pecas.Next;
// It_I:=It_I+1;
end;

procedure TRL_PI.SetVariable;
begin
//   inherited;
//  OrderPi.Registro.Codigo := CodigoRegistro;
//  OrderPi.Registro.Estabelecimento := FEstabelecimento.Registro.Codigo
//  OrderPi.getAllByKey;
end;

procedure TRL_PI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Qrpt.Destroy;
//  Action:=Cafree;
//  RL_PI:=nil;

end;

procedure TRL_PI.QrptBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
//Var
//  Lc_I : Integer;
//  St_Image:TStream;
//  Bmp_IMage: TBitmap;
//  Jpg_IMage: TJPEGImage;

begin
//  It_TotIns:=0;
//  Qr_Anuncio.Active := False;
//  Qr_Anuncio.ParamByName('ANC_CODPCA').AsInteger :=  It_Cd_Peca ;
//  Qr_Anuncio.Active := True;
//  Qr_Anuncio.FetchAll;
//  if Qr_Anuncio.RecordCount = 0 then
//    Begin
//    StrBand.Height := 0;
//    StrBand.Visible := False;
//    end
//  else
//    Begin
//    StrBand.Visible := true;;
//    Jpg_IMage := TJPEGImage.Create;
//    Bmp_IMage := TBitmap.Create;
//
//    St_Image := Qr_Anuncio.CreateBlobStream(Qr_Anuncio.FieldByName('ANC_IMAGEM'),bmRead);
//    if St_Image.Size > 0 then
//      begin
//      //Cria componente Grade
//
//
//      //Cria componente imagem
//      It_Imagem := TQRImage.Create(Application);
//      It_Imagem.Visible := TRUE;
//      It_Imagem.Parent := StrBand;
//      It_Imagem.AutoSize := True;
//      It_Imagem.Stretch := True;
//      It_Imagem.Picture := nil;
//
//
//      Bmp_IMage.LoadFromStream(St_Image);
//      It_imagem.Picture := nil;
//      Jpg_IMage.Assign(Bmp_IMage);
//      It_Imagem.Picture.Graphic := Jpg_IMage;
//
//      StrBand.Height := 30 + It_Imagem.Height + 30;
//      It_Imagem.Left := Trunc( (StrBand.Width /2) - (It_Imagem.Width/2));
//      It_Imagem.Top := Trunc( (StrBand.Height /2) - (It_Imagem.Height/2)) + 25;
//      Bmp_IMage.Destroy;
//      Jpg_IMage.Destroy;
//      end;
//  end
end;

procedure TRL_PI.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
//var
//  I:Integer;
begin
//  Lb_MhaEmpresa.Caption := Fc_NomeReduzido(DM.Tb_MhaEmpEMP_FANTASIA.AsString);
//  DM.Tb_UsuAtivo.Active:=False;
//  DM.Tb_UsuAtivo.ParamByName('CODUSU').AsInteger:=Gb_CodUsu;
//  DM.Tb_UsuAtivo.Active:=true;
//  if Fr_PI.DBM_Observ.Text<>'' then
//    Begin
//    For I:=0 to (Fr_PI.DBM_Observ.Lines.Count-1) do
//      Begin
//      If I=0 then
//        MM_Obs.Lines.Insert(I,' Observação: '+Fr_PI.DBM_Observ.Lines.Strings[I])
//      else
//        MM_Obs.Lines.Insert(I,' '+Fr_PI.DBM_Observ.Lines.Strings[I]);
//      end;
//    end;
//
//  Qr_Usuario.Active := False;
//  Qr_Usuario.ParamByName('USU_CODIGO').AsInteger := Fr_PI.TB_PIPDI_CODUSU.AsInteger;
//  Qr_Usuario.Active := true;
//  Qr_Usuario.FetchAll;
//  if Qr_Usuario.RecordCount > 0 then
//    begin
//    Lb_Responsavel.Caption:=Qr_UsuarioUSU_NOME.AsString;
//    end
//  else
//    Begin
//    Lb_Responsavel.Caption:=DM.Tb_UsuAtivoUSU_NOME.AsString;
//    end;
//  MM_TotalGeral.Lines.Clear;
//  MM_TotalGeral.Lines.Insert(0,'');
//  MM_TotalGeral.Lines.Insert(1,inTToStr(It_TotIns));
//  if Fr_PI.Pg_PI.ActivePageIndex=0 then
//    Begin
//    Lb_VL_Bruto.Caption:=Fr_PI.E_Vl_Bruto.Text;
//    Lb_VL_Agencia.Caption:=Fr_PI.E_VL_Comissao.Text;
//    Lb_VL_Liquido.Caption:=Fr_PI.E_VL_Liquido.Text;
//    Lb_VL_Empresa.Caption:=Fr_PI.E_VL_Empresa.Text;
//    end
//  else
//    Begin
//    Lb_VL_Bruto.Caption:=FloatToStrF(Fr_PI.TB_PIPDI_VL_BRUTO.asfloat,ffCurrency,10,2);
//    Lb_VL_Agencia.Caption:=FloatToStrF(Fr_PI.TB_PIPDI_VL_COMISSAO.asfloat,ffCurrency,10,2);
//    Lb_VL_Liquido.Caption:=FloatToStrF(Fr_PI.TB_PIPDI_VL_LIQUIDO.asfloat,ffCurrency,10,2);
//    Lb_VL_Empresa.Caption:=FloatToStrF(Fr_PI.TB_PIPDI_VL_EMPRESA.asfloat,ffCurrency,10,2);
//    end;
end;

procedure TRL_PI.FormCreate(Sender: TObject);
begin
//  DM.Tb_Usuario.Active:=true;
end;

procedure TRL_PI.InitVariable;
begin
//   inherited;
//  OrderPi := TControllerOrderPi.create(self);
end;

end.
