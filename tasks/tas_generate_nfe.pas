unit tas_generate_nfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, uniPanel, Vcl.StdCtrls,DBXJSON,
  uniMemo, uniMultiItem,  uniGUIClasses, uniEdit, uniLabel, uniGUIBaseClasses,
  uniPageControl, fm_state, prm_to_invoice, REST.Json,System.Json,ClientProxy,
  REST.JsonReflect,DBXJSONReflect, UnFunctions, Data.DB, Datasnap.DBClient,
  uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniSpeedButton, prm_simple,
  MainModule,Registry, prm_nfe;

type
  TTasGenerateNfe = class(TBaseForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    SB_conference: TUniSpeedButton;
    SB_authorize: TUniSpeedButton;
    SB_Consult: TUniSpeedButton;
    SB_Cancel: TUniSpeedButton;
    SB_Print: TUniSpeedButton;
    Sb_Close: TUniSpeedButton;
    sb_Email: TUniSpeedButton;
    Pnl_Cert_Expir: TUniPanel;
    Pnl_Cert_Valid: TUniPanel;
    UniPanel5: TUniPanel;
    dbg_Msg: TUniDBGrid;
    procedure setImages;Override;
    procedure setVariable;Override;
    procedure Sb_CloseClick(Sender: TObject);
  private
    { Private declarations }
    procedure SSL2_TLS1;

  protected
    Ffinished : Boolean;
    FResult : Boolean;
  public
    { Public declarations }
    ParamNfe : TPrmNFe;
  end;

var
  TasGenerateNfe: TTasGenerateNfe;

implementation

{ TTasMsgProcess.TChatCallback }

uses Main;


{$R *.dfm}

procedure TTasGenerateNfe.SSL2_TLS1;
var
  Lc_Registro: TRegistry;
begin
  //acertando opções da internet (revogados / SSL / TSL)
  //verificar revogação de certificados do servidor
  Lc_Registro := TRegistry.Create(KEY_WRITE);
  Lc_Registro.RootKey := HKEY_CURRENT_USER;
  if Lc_registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\Internet Settings', true) then
  begin
    Lc_Registro.WriteInteger('CertificateRevocation', 0);
  end;
  Lc_registro.CloseKey;

  //verificar se há certificados revogados do fornecedor
  if Lc_registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing', true) then
  begin
    Lc_Registro.WriteInteger('State', 146944);
  end;
  Lc_registro.CloseKey;

  //Usar SSL 2.0 / Usar TSL 1.0
  if Lc_registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\Internet Settings', true) then
  begin
    Lc_Registro.WriteInteger('SecureProtocols', 136);
  end;
  Lc_registro.CloseKey;

  //força para IE não ficar trabalhando off line
  if Lc_registro.OpenKey('Software\Microsoft\Windows\CurrentVersion\Internet Settings', true) then
  begin
    Lc_Registro.WriteInteger('GlobalUserOffline', 0);
  end;
  Lc_registro.CloseKey;
  Lc_registro.Free;
end;

procedure TTasGenerateNfe.Sb_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TTasGenerateNfe.setImages;
begin
  inherited;
  buttonIcon(SB_conference,'conference.bmp');
  buttonIcon(SB_authorize,'confirm.bmp');
  buttonIcon(SB_Consult,'consult.bmp');
  buttonIcon(SB_Cancel,'abort.bmp');
  buttonIcon(SB_Print,'print.bmp');
  buttonIcon(sb_Email,'email.bmp');
  buttonIcon(Sb_Close,'close.bmp');
end;

procedure TTasGenerateNfe.setVariable;
begin
  inherited;
  SSL2_TLS1;
  getValidityCertificate(Pnl_Cert_Valid,Pnl_Cert_Expir);
end;

end.
