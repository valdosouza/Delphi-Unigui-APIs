unit un_frx_base_report_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, un_frx_base_report, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass,
   frxExportCSV, frxExportPDF, frxDBSet, UnFunctions;

type
  TFrxBaseReportList = class(TFrxBaseReport)
  private
    { Private declarations }
  protected
    procedure Cabecalho; Virtual;
  public
    { Public declarations }
    procedure execute;Override;
  end;

var
  FrxBaseReportList: TFrxBaseReportList;

implementation

{$R *.dfm}

{ TFrxBaseReportList }

procedure TFrxBaseReportList.Cabecalho;
Var
  Lc_Aux: String;
  sLogo : string;
begin
  with FEstabelecimento do
  Begin
    getRepository(False,'');
    sLogo := concat(PathPublico,'logo.jpg');

    if FileExists(sLogo) then
      TfrxPictureView(frxBase.FindObject('Logo')).Picture.LoadFromFile(sLogo);
//      TfrxPictureView(frxReport.FindObject('Picture1')).Picture.LoadFromFile('c:\img.jpg');

    frxBase.variables['NomeFantasia'] := QuotedStr( Fiscal.Registro.NomeRazao );
    frxBase.Variables['DocFiscal']    := QuotedStr( 'C.N.P.J: '+ MaskDocFiscal(Fiscal.Juridica.Registro.CNPJ) + ' -  I.E.: '+ Fiscal.Juridica.Registro.InscricaoEstadual );
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
    frxBase.Variables['Endereco'] := QuotedStr( Lc_Aux );
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

    frxBase.Variables['Fones']     := QuotedStr( 'Fones: ' +  Lc_Aux );
    frxBase.Variables['website']  := QuotedStr( 'Site: ' + Fiscal.MidiaSocial.Registro.Link );
    frxBase.Variables['Email']    := QuotedStr( 'e-mail: ' +Fiscal.Email.Registro.Email );
  END;
  frxBase.Variables['Titulo'] := QuotedStr( Titulo );


end;

procedure TFrxBaseReportList.execute;
begin
  inherited;
  Cabecalho;
end;

end.
