unit tas_config_nfe_56;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_config_nfe, Vcl.Menus, uniMainMenu,
  Data.DB, uniGUIBaseClasses, uniGUIClasses, uniFileUpload, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniPanel, base_registry;

type
  TTasConfigNfe56 = class(TBaseRegistry)
    pnl_topo: TUniPanel;
    UniPanel5: TUniPanel;
    Pnl_Dt_Expira: TUniPanel;
    Pnl_Validade: TUniPanel;
    UniFileUpload: TUniFileUpload;
    procedure UniFileUploadCompleted(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasConfigNfe56: TTasConfigNfe56;

implementation

{$R *.dfm}

procedure TTasConfigNfe56.UniFileUploadCompleted(Sender: TObject;
  AStream: TFileStream);
var
  DestName : string;
  DestFolder : string;
  LcNewFile : String;
  LcEstab : TControllerInstitution;
begin
  Try
    LcEstab := TControllerInstitution.create(nil);
    LcEstab.Registro.Codigo := GbInstitution;
    LcEstab.getByKey;
    DestFolder := LcEstab.getRepository(True,'');
    DestName  := concat(DestFolder , ExtractFileName(UniFileUpload.FileName));
    CopyFile(PChar(AStream.FileName), PChar(DestName), False);

    LcNewFile := concat(DestFolder, 'cert_', LcEstab.EntityFiscal.Juridica.Registro.CNPJ,'.pfx');
    RenameFile(DestName,LcNewFile);
  Finally
    FreeAndNil(LcEstab);
  End;

end;

end.
