unit send_email;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.MobilePreview,FMX.Platform.Android,
  base_form, System.ImageList, FMX.ImgList, FMX.Objects,IdSSLOpenSSL,IdSSL,IdText,
  FMX.Controls.Presentation, FMX.Ani, FMX.Layouts, FMX.ScrollBox, FMX.Memo,
  {$IFDEF ANDROID}
  FMX.Helpers.Android,
  Androidapi.Jni.GraphicsContentViewText,
  Androidapi.Jni.Net, Androidapi.Jni.JavaTypes,
  idUri, Androidapi.Jni, Androidapi.JNIBridge,
  Androidapi.Helpers,
  AndroidApi.Jni.App,
  AndroidAPI.jni.OS,
  {$ENDIF}
  MainModule;

type
  TSendEmail = class(TBaseForm)
    Layout1: TLayout;
    Memo1: TMemo;
    Sb_Cancelar: TSpeedButton;
    Lb_Progresso: TLabel;
    Sb_Send: TSpeedButton;
    Layout2: TLayout;
    procedure Sb_CancelarClick(Sender: TObject);
    procedure Sb_SendClick(Sender: TObject);
  private
    { Private declarations }
    It_SocketSSL : TIdSSLIOHandlerSocketOpenSSL;
    It_SocketBase : TIdSSLIOHandlerSocketBase;
  public
    { Public declarations }
    it_Cancela : Boolean;
    Terminado : Boolean;
    //[A]utomatico / [S]Solicitaçaõ
    KindSend : String;
    Subject : String;
    Destiny: TStringList;
    Body: string;
    Attach: TStringList;
    procedure DefineSender;
    {$IFDEF ANDROID}
    procedure Send;
    {$ENDIF}
    procedure AddStatusLine(S: string);
  end;

var
  SendEmail: TSendEmail;

implementation


{$R *.fmx}

uses System.IOUtils,  Network;
{$R *.LgXhdpiPh.fmx ANDROID}

{ TSendEmail }

procedure TSendEmail.AddStatusLine(S: string);
begin

end;


procedure TSendEmail.DefineSender;
begin
  {
  with Id_Mail do
  Begin
    if KindSend = 'A' then   // Envio Erros e outros do sistema
    Begin
      Host := 'setes.com.br';
      SetSSL := False;
      SetTLS := True;
      Username := 'suporte@setes.com.br';
      Password := 'Sucessoem2016!';
      Port := '587';
    End
    else
    Begin
      if KindSend = 'N' then // Envio NFE
      Begin
        Host := 'setes.com.br';
        SetSSL := False;
        SetTLS := True;
        Username := 'sistemanfe@setes.com.br';
        Password := 'Eqpm20mrdsncdJ16!';
        Port := '587';
      End
      else
      begin
        if KindSend = 'T' then   // Envio Erros e outros do sistema
        Begin

        End
        else
        Begin
          //Usuario Ativo
          //Pc_Define_RemententeAtivo;
        End;
      End;
    End;
  end;
  }
end;

procedure TSendEmail.Sb_CancelarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TSendEmail.Sb_SendClick(Sender: TObject);
begin
{$IFDEF ANDROID}
  send;
 {$ENDIF}
end;

{$IFDEF ANDROID}
procedure TSendEmail.Send;
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
end.
