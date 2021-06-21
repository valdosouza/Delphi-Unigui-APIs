unit pes_cnpjOnLine;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
base_form, uniGUIClasses, uniEdit,
  uniLabel, uniGUIBaseClasses, uniImage, uniButton, uniBitBtn, uniTimer,
  ACBrBase, ACBrSocket, ACBrConsultaCNPJ, uniSpeedButton,UnFunctions, Data.DB,
  Vcl.Controls, Datasnap.DBClient, Vcl.Forms, Vcl.Menus, uniMainMenu;

type
  TPesCnpjOnLine = class(TBaseForm)
    UniImage1: TUniImage;
    LabAtualizarCaptcha: TUniLabel;
    E_Captcha: TUniEdit;
    UniLabel2: TUniLabel;
    Cpn_Timer: TUniTimer;
    Sb_Search: TUniSpeedButton;
    procedure setImages;override;
    procedure Sb_SearchClick(Sender: TObject);
    procedure Cpn_TimerTimer(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Consulta : Boolean;
    CNPJ : String;
  end;

var
  PesCnpjOnLine: TPesCnpjOnLine;

implementation

{$R *.dfm}

{ TBaseForm1 }


procedure TPesCnpjOnLine.Cpn_TimerTimer(Sender: TObject);
begin
  Cpn_Timer.Enabled:= False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
end;

procedure TPesCnpjOnLine.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  ImgArq: String;
begin
  {
  Stream:= TMemoryStream.Create;
  try
    //Cpn_CNPJ.Captcha(Stream);
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    UniImage1.Picture.LoadFromFile( ImgArq );
    E_Captcha.Clear;
    E_Captcha.SetFocus;
  finally
    Stream.Free;
  end;
  }
end;

procedure TPesCnpjOnLine.Sb_SearchClick(Sender: TObject);
begin
  {
  if E_Captcha.Text <> '' then
  begin
    Consulta := Cpn_CNPJ.Consulta(CNPJ , E_Captcha.Text);
    if Consulta then
      Self.Close;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    E_Captcha.SetFocus;
  end;
  }
end;

procedure TPesCnpjOnLine.setImages;
begin
  buttonIcon(Sb_Search,'search.bmp');
end;

end.
