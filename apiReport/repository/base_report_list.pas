unit base_report_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report, QRCtrls, QuickRpt,
  QRPDFFilt, Vcl.ExtCtrls,ControllerInstitution, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ControllerEntityFiscal, ControllerCompany, Vcl.StdCtrls;

type
  TBaseReportList = class(TBaseReport)
    PageHeader: TQRBand;
    E_Titulo: TQRLabel;
    Img_Logo: TQRImage;
    Lb_Emp_Nome: TQRLabel;
    Lb_Emp_Doc: TQRLabel;
    Lb_Emp_End: TQRLabel;
    Lb_Emp_Fones: TQRLabel;
    Lb_Emp_www: TQRLabel;
    Lb_Emp_email: TQRLabel;
    procedure Cabecalho;Virtual;
  private

  public

  end;

var
  BaseReportList: TBaseReportList;

implementation

{$R *.dfm}

uses
  UnFunctions, uSM, MainModule;

{ TBaseReportList }

procedure TBaseReportList.Cabecalho;
Var
  Lc_Aux: String;
  sLogo : string;
begin
  with FEstabelecimento do
  Begin
    getRepository(False,'');
    sLogo := concat(PathImage,'logo.jpg');
    if FileExists(sLogo) then
      Img_Logo.Picture.LoadFromFile(sLogo);
    Lb_Emp_Nome.Caption := Fiscal.Registro.ApelidoFantasia;
    Lb_Emp_Doc.Caption :=  concat(
                                'C.N.P.J: ', MaskDocFiscal( Fiscal.Juridica.Registro.CNPJ),
                                ' -  I.E.: ', Fiscal.Juridica.Registro.InscricaoEstadual);
    IF (trim( Fiscal.Endereco.Registro.Complemento) = '') then
    Begin
      Lc_Aux := concat(
                Fiscal.Endereco.Registro.Logradouro , ', ',
                Fiscal.Endereco.Registro.NumeroPredial , ' - ' ,
                Fiscal.Endereco.Registro.Bairro , ' - ' ,
                MaskCep(Fiscal.Endereco.Registro.Cep) , ' - ' ,
                Fiscal.Endereco.Cidade.Registro.Nome , ' - ' ,
                Fiscal.Endereco.Estado.Registro.Abreviatura
             );
    end
    else
    Begin
      Lc_Aux := concat(
                Fiscal.Endereco.Registro.Logradouro , ', ',
                Fiscal.Endereco.Registro.NumeroPredial , ' - ' ,
                Fiscal.Endereco.Registro.Complemento , ' - ' ,
                Fiscal.Endereco.Registro.Bairro , ' - ' ,
                MaskCep(Fiscal.Endereco.Registro.Cep) , ' - ' ,
                Fiscal.Endereco.Cidade.Registro.Nome , ' - ' ,
                Fiscal.Endereco.Estado.Registro.Abreviatura
                );
    end;
    Lb_Emp_End.Caption := Lc_Aux;
    Lc_Aux :='';
    Fiscal.Telefone.Registro.Codigo := Registro.Codigo;
    Fiscal.Telefone.Registro.Tipo := 'Fone';
    Fiscal.Telefone.getByKey;
    if Fiscal.Telefone.exist then
    Begin
      Lc_Aux := MaskFone(Fiscal.Telefone.Registro.Numero);
    End
    else
    BEgin
      Fiscal.Telefone.Registro.Codigo := Registro.Codigo;
      Fiscal.Telefone.Registro.Tipo := 'Fax';
      Fiscal.Telefone.getByKey;
      if (Trim(Lc_Aux) <> '') and Fiscal.Telefone.exist then
      BEgin
        Lc_Aux := Lc_Aux + ' / ' + MaskFone(Fiscal.Telefone.Registro.Numero);
      End
      else
      Begin
        Fiscal.Telefone.Registro.Codigo := Registro.Codigo;
        Fiscal.Telefone.Registro.Tipo := 'Celular';
        Fiscal.Telefone.getByKey;
        if Fiscal.Telefone.exist then
          Lc_Aux := MaskFone(Fiscal.Telefone.Registro.Numero);
      End;
    End;

    Lb_Emp_Fones.Caption  := concat( 'Fones: '  , Lc_Aux );
    Lb_Emp_www.Caption    := concat( 'Site: '   , Fiscal.MidiaSocial.Registro.Link);
    Lb_Emp_email.Caption  := concat( 'e-mail: ' , Fiscal.Email.Registro.Email );
  END;
  E_Titulo.Caption := Qrpt.ReportTitle;
end;


end.
