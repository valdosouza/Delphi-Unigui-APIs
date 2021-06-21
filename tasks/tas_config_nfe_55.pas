unit tas_config_nfe_55;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_config_nfe, uniCheckBox,
  uniRadioGroup, uniRadioButton, uniGUIClasses, uniEdit, uniGroupBox, uniBitBtn,
  uniSpeedButton, uniButton, uniLabel, uniGUIBaseClasses, uniPanel, ControllerConfigNfe55,
  ControllerConfigNfe, MainModule, msg_form, unmessages, Vcl.Menus, uniMainMenu,
  UnFunctions, uniFileUpload, Data.DB, Datasnap.DBClient, uniMultiItem,
  uniComboBox;

type
  TTasConfigNfe55 = class(TTasConfigNfe)
    Chbx_sendNfeToaccounting: TUniCheckBox;
    Chbx_sendNfeToyourSelf: TUniCheckBox;
    Rg_orientation: TUniRadioGroup;
    UniGroupBox1: TUniGroupBox;
    Chbx_set_invoice: TUniCheckBox;
    Chbx_set_duplicate: TUniCheckBox;
    Rg_receipt_posit: TUniRadioGroup;
    Rg_Layer: TUniRadioGroup;
    Gb_Certificate: TUniGroupBox;
    E_certificate_pass: TUniEdit;
    UniLabel3: TUniLabel;
    sb_Load_certificado: TUniButton;
    Rg_type_emission: TUniRadioGroup;
    Chbx_set_view_msg: TUniCheckBox;
    Sair1: TUniMenuItem;
    UniLabel1: TUniLabel;
    Cb_version: TUniComboBox;
    procedure sb_Load_certificadoClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
  protected
    procedure EditionControl;Override;
    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure ShowData;Override;
    procedure FormatScreen;override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;

  private
    { Private declarations }
  public
    { Public declarations }
    ConfigNfe55 : TControllerConfigNfe55;
  end;

var
  TasConfigNfe55: TTasConfigNfe55;

implementation

{$R *.dfm}

uses openForms;

{ TTasConfigNfe1 }

procedure TTasConfigNfe55.EditionControl;
begin
  sb_Load_certificado.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
  inherited;
end;

procedure TTasConfigNfe55.ClearAllFields;
begin
  inherited;
  ConfigNfe55.clear;
end;

procedure TTasConfigNfe55.FormatScreen;
begin
  inherited;

end;

procedure TTasConfigNfe55.InitVariable;
begin
  inherited;
  ConfigNfe55 := TControllerConfigNfe55.Create(Self);
end;


procedure TTasConfigNfe55.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TTasConfigNfe55.Save;
Begin
  with ConfigNfe55.ConfigNfe.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Ambiente := IntToStr(Rg_Layer.ItemIndex);
    TipoEmissao := IntToStr(Rg_type_emission.ItemIndex);
    Senha := E_certificate_pass.Text;
    if Chbx_set_view_msg.Checked  then
      VisualizarMensagem := 'S'
    else
      VisualizarMensagem := 'N';
    if Cb_version.ItemIndex = 0 then
      Versao := '310'
    else
      Versao := '400';

  End;
  ConfigNfe55.ConfigNfe.save;

  //ConfigNfe55
  with ConfigNfe55.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Orientacao := IntToStr (Rg_orientation.ItemIndex);
    Recebimento := IntToStr (Rg_receipt_posit.ItemIndex);
    if Chbx_set_invoice.Checked then
      Fatura := 'S'
    else
      Fatura := 'N';
    If Chbx_set_duplicate.Checked then
      Duplicata := 'S'
    else
      Duplicata := 'N';
    if Chbx_sendNfeToaccounting.Checked then
      EnviarContabilidade := 'S'
    else
      EnviarContabilidade := 'N';
    if Chbx_sendNfeToyourSelf.Checked then
      ReceberCopia := 'S'
    else
      ReceberCopia := 'N';
  End;
  ConfigNfe55.save;
End;


procedure TTasConfigNfe55.setVariable;
begin
  ConfigNfe55.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  ConfigNfe55.getByKey;
  inherited;
end;

procedure TTasConfigNfe55.ShowData;
begin
  with ConfigNfe55.ConfigNfe.Registro do
  Begin
    Rg_Layer.ItemIndex := StrToIntDef(Ambiente,0);
    Rg_type_emission.ItemIndex := StrToIntDef(TipoEmissao,0);
    E_certificate_pass.Text := Senha;
    if VisualizarMensagem = 'S'  then
      Chbx_set_view_msg.Checked := True
     else
      Chbx_set_view_msg.Checked := False;
    if Versao = '310' then
      Cb_version.ItemIndex := 0
    else
      Cb_version.ItemIndex := 1;
  End;

  with ConfigNfe55.Registro do
  Begin
   Rg_orientation.ItemIndex := StrToIntDef(Orientacao,0);
   Rg_receipt_posit.ItemIndex := StrToIntDef(Recebimento,0);

   if Fatura = 'S'  then
      Chbx_set_invoice.Checked := True
     else
      Chbx_set_invoice.Checked := False;

   if Duplicata = 'S'then
      Chbx_set_duplicate.Checked := True
     else
      Chbx_set_duplicate.Checked := False;

   if EnviarContabilidade = 'S' then
      Chbx_sendNfeToaccounting.Checked := True
     else
      Chbx_sendNfeToaccounting.Checked := False;

   if ReceberCopia = 'S' then
      Chbx_sendNfeToyourSelf.Checked := True
     else
      Chbx_sendNfeToyourSelf.Checked := False;
  End;
  try
    getValidityCertificate(Pnl_Cert_Valid,Pnl_Cert_Expir);
  Except
     exit;
  end;
end;

procedure TTasConfigNfe55.ShowNoData;
begin
  //Esta tela não tem várias inserções então se não tiver dados vamos para inserção
  EditionState := 'B';
end;


procedure TTasConfigNfe55.UniFormReady(Sender: TObject);
begin
  inherited;
  EditionControl;
end;

procedure TTasConfigNfe55.sb_Load_certificadoClick(Sender: TObject);
begin
  UniFileUpload.Execute;
  ConfigNfe55.ConfigNfe.Registro.Arquivo := UniFileUpload.FileName;
end;

function TTasConfigNfe55.ValidateSave: boolean;
begin
  Result := True;
  if trim( E_certificate_pass.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Senha não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
