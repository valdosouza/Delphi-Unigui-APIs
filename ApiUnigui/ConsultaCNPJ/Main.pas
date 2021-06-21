unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,System.JSON,REST.Json,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniImage,
  uniGUIBaseClasses, uniPanel, uniTimer, ACBrBase, ACBrSocket, ACBrConsultaCNPJ,
  uniButton, uniBitBtn, uniEdit, CnpjReceita, uniMemo;

{$IFDEF CONDITIONALEXPRESSIONS}
   {$IF CompilerVersion >= 20.0}
     {$DEFINE DELPHI2009_UP}
   {$IFEND}
{$ENDIF}

{.$DEFINE SUPPORT_PNG}  // Remova o Ponto, se seu Delphi suporta PNG

{$IFDEF DELPHI2009_UP}
  {$DEFINE SUPPORT_PNG}
{$ENDIF}

type
  TMainForm = class(TUniForm)
    pnl_geral: TUniPanel;
    Image1: TUniImage;
    LabAtualizarCaptcha: TUniLabel;
    EditCaptcha: TUniEdit;
    ButBuscar: TUniBitBtn;
    LcCNPJ: TACBrConsultaCNPJ;
    Timer1: TUniTimer;
    MM_dados: TUniMemo;
    pnl_Botton: TUniPanel;
    pnl_botton_client: TUniPanel;
    pnl_botton_right: TUniPanel;
    UniLabel1: TUniLabel;
    EditCNPJ: TUniEdit;
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ButBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  JPEG
{$IFDEF SUPPORT_PNG}
  , pngimage
{$ENDIF}
  ,uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.ButBuscarClick(Sender: TObject);
var
  I: Integer;
  LcDados : TCnpjReceita;
  LcJson : TJsonObject;
begin
  if EditCaptcha.Text <> '' then
  begin
    if LcCNPJ.Consulta(
      EditCNPJ.Text,
      EditCaptcha.Text,
      FAlse
    ) then
    begin
        LcDados := TCnpjReceita.create;

        LcDados.EmpresaTipo   := LcCNPJ.EmpresaTipo;
        LcDados.RazaoSocial   := LcCNPJ.RazaoSocial;
        LcDados.Porte         := LcCNPJ.Porte;
        LcDados.Abertura      := LcCNPJ.Abertura;
        LcDados.Fantasia      := LcCNPJ.Fantasia;
        LcDados.Endereco      := LcCNPJ.Endereco;
        LcDados.Numero        := LcCNPJ.Numero;
        LcDados.Complemento   := LcCNPJ.Complemento;
        LcDados.Bairro        := LcCNPJ.Bairro;
        LcDados.Cidade        := LcCNPJ.Cidade;
        LcDados.UF            := LcCNPJ.UF;
        LcDados.CEP           := LcCNPJ.CEP;
        LcDados.Situacao      := LcCNPJ.Situacao;
        LcDados.CNAE1         := LcCNPJ.CNAE1;
        LcDados.EndEletronico := LcCNPJ.EndEletronico;
        LcDados.Telefone      := LcCNPJ.Telefone;


        LcDados.CNAE2.Clear;
        for I := 0 to LcCNPJ.CNAE2.Count - 1 do
          LcDados.CNAE2.Add(LcCNPJ.CNAE2[I]);


        LcJson := TJson.ObjectToJsonObject(LcDados);
        MM_dados.Clear;
        MM_dados.Text := LcJson.ToString;
    end;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    EditCaptcha.SetFocus;
  end;
end;

procedure TMainForm.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
//  Jpg: TJPEGImage;
{$IFDEF DELPHI2009_UP}
  png: TPngImage;
{$ELSE}
  ImgArq: String;
{$ENDIF}
begin
  {$IFNDEF SUPPORT_PNG}
    ShowMessage('Atenção: Seu Delphi não dá suporte nativo a imagens PNG. Queira verificar o código fonte deste exemplo para saber como proceder.');
    Exit;
    // COMO PROCEDER:
    //
    // 1) Caso o site da receita esteja utilizando uma imagem do tipo JPG, você pode utilizar o código comentado abaixo.
    //    * Comente ou apague o código que trabalha com PNG, incluindo o IFDEF/ENDIF;
    //    * descomente a declaração da variável jpg
    //    * descomente o código abaixo;
    // 2) Caso o site da receita esteja utilizando uma imagem do tipo PNG, você terá que utilizar uma biblioteca de terceiros para
    //conseguir trabalhar com imagens PNG.
    //  Neste caso, recomendamos verificar o manual da biblioteca em como fazer a implementação. Algumas sugestões:
    //    * Procure no Fórum do ACBr sobre os erros que estiver recebendo. Uma das maneiras mais simples está no link abaixo:
    //      - http://www.projetoacbr.com.br/forum/topic/20087-imagem-png-delphi-7/
    //    * O exemplo acima utiliza a biblioteca GraphicEX. Mas existem outras bibliotecas, caso prefira:
    //      - http://synopse.info/forum/viewtopic.php?id=115
    //      - http://graphics32.org/wiki/
    //      - http://cc.embarcadero.com/Item/25631
    //      - Várias outras: http://torry.net/quicksearchd.php?String=png&Title=Yes
  {$ENDIF}

  Stream:= TMemoryStream.Create;
  try
    LcCNPJ.Captcha(Stream);

   {$IFDEF DELPHI2009_UP}
    //Use esse código quando a imagem do site for do tipo PNG
    png:= TPngImage.Create;
    try
      png.LoadFromStream(Stream);
      Image1.Picture.Assign(png);
    finally
      png.Free;
    end;
    { //Use esse código quando a imagem do site for do tipo JPG
      Jpg:= TJPEGImage.Create;
      try
        Jpg.LoadFromStream(Stream);
        Image1.Picture.Assign(Jpg);
      finally
        Jpg.Free;
      end;
    }
   {$ELSE}
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromFile( ImgArq );
   {$ENDIF}

    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
  end;

end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  EditCNPJ.SetFocus;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
