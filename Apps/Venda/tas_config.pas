unit tas_config;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_registry, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts,
  FMX.Edit, FMX.ListBox, FMX.DialogService, UnFunctions,
  ctrl_mob_config, System.ImageList, FMX.ImgList, FMX.Ani, FMX.Effects,
  {$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.Jni.GraphicsContentViewText,
  Androidapi.Jni.Net, Androidapi.Jni.JavaTypes,
  idUri, Androidapi.Jni, Androidapi.JNIBridge,
  Androidapi.Helpers,
  AndroidApi.Jni.App,
  AndroidAPI.jni.OS,
  {$ENDIF}
  System.IOUtils, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView;


type
  TTasConfig = class(TBaseRegistry)
    Ly_device_print: TRectangle;
    Lb_device_print: TLabel;
    Cb_device_print: TComboBox;
    Sb_device_test: TSpeedButton;
    Ly_Buttons: TLayout;
    Layout1: TLayout;
    Sb_Send_Database: TSpeedButton;
    procedure Sb_device_testClick(Sender: TObject);
    procedure Sb_Send_DatabaseClick(Sender: TObject);
  private
    { Private declarations }
    procedure SendemailDatabase;
    {$IFDEF ANDROID}
    procedure SendDataBaseByWhatsApp;
    {$ENDIF}

  protected
    Config : TCtrlMobConfig;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;override;
    function validateSave:Boolean;Override;
    procedure save;Override;

  public
    { Public declarations }
  end;

var
  TasConfig: TTasConfig;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses MainModule;


procedure TTasConfig.InitVariable;
begin
  inherited;
  Config := TCtrlMobConfig.Create(Self);

end;


procedure TTasConfig.save;
begin
  if (Cb_device_print.Selected <> nil) and (Cb_device_print.Selected.Text <> '') then
  begin
    Config.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Config.Registro.Campo := 'IMPRESSORA';
    Config.Registro.Usuario := GbUser;
    Config.Registro.Conteudo  := Cb_device_print.Selected.Text;
    Config.save;
  end;

end;

procedure TTasConfig.Sb_device_testClick(Sender: TObject);
begin
  if (Cb_device_print.Selected <> nil) and (Cb_device_print.Selected.Text <> '') then
  begin
    UMM.Print.ConectarImpressora(Cb_device_print.Selected.Text);
    if UMM.Print.FSocket.Connected then
    begin
      TDialogService.ShowMessage(
              concat('A T E N Ç Ã O!',
                    Char(10),Char(13),EOL,
                    'Conexão efetuada com Sucesso.',EOL,EOL
              )
      );
    end
    else
    begin
      TDialogService.ShowMessage(
              concat('A T E N Ç Ã O!',
                    Char(10),Char(13),EOL,
                    'Não há foi possivel conectar.',EOL,
                    'Verifique e tente novamente'
              )
      );
    end;
  end
  else
  begin
      TDialogService.ShowMessage(
              concat('A T E N Ç Ã O!',
                    Char(10),Char(13),EOL,
                    'Não há foi possivel conectar.',EOL,
                    'Selecione um dispositivo.',EOL,EOL,
                    'Verifique e tente novamente'
              )
      );
  end;
end;

procedure TTasConfig.Sb_Send_DatabaseClick(Sender: TObject);
begin
  inherited;
  {$IFDEF ANDROID}
  SendDataBaseByWhatsApp;
  {$ENDIF}
end;

{$IFDEF ANDROID}
procedure TTasConfig.SendDataBaseByWhatsApp;
var
  IntentWhats : JIntent;
  Uri: Jnet_Uri;
  texto : string;
  AttachmentFile: JFile;
  LcCopy : String;
BEgin
  texto := concat('Enviando Database: ',GbNameUser);
  IntentWhats := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND);
  IntentWhats.setPackage(StringToJString('com.whatsapp'));

  LcCopy := concat(System.IOUtils.TPath.Combine(System.IOUtils.TPath.GetSharedDownloadsPath,'gestaomob.db'));
  if TFile.Exists(LcCopy) then
    TFile.Delete(LcCopy);
  TFile.Copy(GbDataBase, LcCopy);

  AttachmentFile := TJFile.JavaClass.init(StringToJString(LcCopy));

  Uri := TJnet_Uri.JavaClass.fromFile(AttachmentFile);

  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_TEXT,StringToJString(texto));


  IntentWhats.setType(StringToJString('text/plain'));
  IntentWhats.putExtra(TJIntent.JavaClass.EXTRA_STREAM, TJParcelable.Wrap((Uri as ILocalObject).GetObjectID));
  IntentWhats.setType(StringToJString('*/*'));
  IntentWhats.addFlags(TJIntent.JavaClass.FLAG_GRANT_READ_URI_PERMISSION);

  SharedActivity.startActivity(IntentWhats);



end;
{$ENDIF}

procedure TTasConfig.SendemailDatabase;
Var
  Lc_Aux : String;
  Lc_Destinatario : TStringList;
  Lc_Corpo : String;
  Lc_arq_pdf : string;
  lc_anexo :TStringList;
//  Form : TSendEmail;
begin
  {
  //Envia email para a propria empresa
  Lc_Destinatario := TStringList.Create;
  Lc_Destinatario.Clear;
  Lc_Destinatario.Add(' valdo@setes.com.br ');
  //Sobre Anexos
  Lc_Anexo        := TStringList.Create;
  Lc_Anexo.Clear;
  Lc_Anexo.add( GbDataBase);

  Lc_Corpo := '<html>'+
              '<head>'+
              '  <meta content="text/html; charset=ISO-8859-1"'+
              ' http-equiv="content-type">'+
              '</head>'+
              '<body>'+
              'Ol&aacute;,<br>'+
              '<br>'+
              'SEgue o banco de dados do '+GbNameUser+
              '<br>'+
              '</body>'+
              '</html>';
  form := TSendEmail.create(self);
  with form do
  Begin
    kindSend  := 'A';
    Subject   := 'Envio Database';
    Destiny   := Lc_Destinatario;
    Body      := Lc_Corpo;
    Attach    := lc_anexo;
  End;
  Form.ShowModal(
  procedure(ModalResult : TModalResult)
  begin
    Form := nil;
  end);
  }
end;

procedure TTasConfig.SetVariable;
begin
  UMM.Print.ListarDispositivos( Cb_device_print);
  Config.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
  Config.Registro.Campo := 'IMPRESSORA';
  Config.getByKey;
  CodigoRegistro := Config.Registro.Estabelecimento;
  inherited;;
end;

procedure TTasConfig.ShowData;
Var
  I : Integer;
begin
  if Config.exist then
  BEgin
    for I := 0 to Cb_device_print.Items.Count -1 do
    BEgin
      if (Cb_device_print.Items[I] = Config.Registro.Conteudo )then
      Begin
        Cb_device_print.ItemIndex := I;
        break;
      End;
    End;
  End;
end;

function TTasConfig.validateSave: Boolean;
begin
  REsult := True;
end;

end.

