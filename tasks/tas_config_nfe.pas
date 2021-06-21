unit tas_config_nfe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  uniMainMenu,Data.DB, uniGUIBaseClasses, uniGUIClasses, uniFileUpload, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniPanel, base_registry, Vcl.Menus,
  Vcl.Controls, Vcl.Forms, ControllerInstitution, MainModule;

type
  TTasConfigNfe = class(TBaseRegistry)
    pnl_topo: TUniPanel;
    UniPanel5: TUniPanel;
    Pnl_Cert_Expir: TUniPanel;
    Pnl_Cert_Valid: TUniPanel;
    UniFileUpload: TUniFileUpload;
    procedure UniFileUploadCompleted(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasConfigNfe: TTasConfigNfe;

implementation

{$R *.dfm}

procedure TTasConfigNfe.UniFileUploadCompleted(Sender: TObject;
  AStream: TFileStream);
var
  DestName : string;
  DestFolder : string;
  LcNewFile : String;
  LcEstab : TControllerInstitution;
begin
  Try
    LcEstab := TControllerInstitution.create(nil);
    LcEstab.Registro.Codigo := UMM.GInstitution.registro.Codigo;
    LcEstab.getByKey;
    LcEstab.getRepository(True,'');
    DestName  := concat(LcEstab.PathPrivado , ExtractFileName(UniFileUpload.FileName));
    CopyFile(PChar(AStream.FileName), PChar(DestName), False);

    LcNewFile := concat(LcEstab.PathPrivado, 'cert_', LcEstab.Fiscal.Juridica.Registro.CNPJ,'.pfx');
    RenameFile(DestName,LcNewFile);
  Finally
    FreeAndNil(LcEstab);
  End;

end;

end.
