unit msg_form;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  uniGUIBaseClasses,unFunctions,
  uniGUIClasses, uniButton, uniGUIApplication, uniImage,UniLabel,
  uniGUIForm, Data.DB, Datasnap.DBClient, Winapi.Windows,
  uniMainMenu, uniGUITypes, Vcl.Menus, Vcl.Forms;

type

  TMsgForm = class(TUniForm)
    procedure FormatScreen;
    procedure UniFormKeyPress(Sender: TObject; var Key: Char);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
    IconTextWidth, IconTextHeight, X: Integer;
    IconID: PChar;
    TextRect: TRect;
    HorzMargin, VertMargin, HorzSpacing, VertSpacing, ButtonWidth,
    ButtonHeight, ButtonSpacing, ButtonCount, ButtonGroupWidth,
    MaiorTamanho : Integer;

    procedure MrbotaoPress(Sender : TObject);
  protected
    procedure InitVariable;

  public
    { Public declarations }
    BotaoEscolhido : Integer;
    Finalized : Boolean;
    BotaoEscape : array of TMsgEscape;
    TipoPadrao : TMsgPadrao;
    Opcoes : array of string;
    Msg: array of string;
    Titulo : String;
    Property TamanhoBotao:Integer read ButtonWidth write ButtonWidth;
  end;

var
  DialogUnits: TPoint;
const
  IconIDs: array[TMsgPadrao] of PChar = (IDI_EXCLAMATION, IDI_HAND, IDI_QUESTION, IDI_ASTERISK);
  mcButtonWidth = 50;


implementation

{$R *.dfm}

uses unMessages, MainModule;


{Mensagem Padrao - Retorna o maior de dois valores}
function Max(I, J: Integer): Integer;
begin
  if I > J then Result := I else Result := J;
end;

procedure TMsgForm.InitVariable;
begin

end;

procedure TMsgForm.MrbotaoPress(Sender : TObject);
Begin
  BotaoEscolhido := (Sender as TUniButton).Tag;
  Finalized := True;
  Close;
End;

procedure TMsgForm.FormatScreen;
Var
  Lc_Idx : Integer;
  compara : Integer;
  Lb_Msg : TUniLabel;
begin
  Self.Menu := nil;
//  BorderStyle := bsDialog;
  BorderIcons := [];
  //Muda o estilo da fonte para bold, apenas para realizar os cálculos
  //Font.Style := [fsBold];
  //Font.Color := clBlack;
  //SetRect(TextRect, 0, 0, Screen.Width div 4, 0);
  Font.Style := [];

  HorzMargin := 12;
  VertMargin := 8;
  HorzSpacing := 10;
  VertSpacing := 10;
  if ButtonWidth < 50 then
    ButtonWidth := 50;
  ButtonHeight := 25;
  ButtonSpacing := 4;


  IconID := IconIDs[TipoPadrao];
  IconTextHeight := TextRect.Bottom;
  if IconID <> nil then
  begin
    Inc(IconTextWidth, 20 + HorzSpacing);
    if IconTextHeight < 22 then
      IconTextHeight := 22;
  end;
  ButtonCount := 0;
  for Lc_Idx := 0 to High(Opcoes) do
  begin
    ButtonCount := ButtonCount + 1;
  end;

  {Calcula a largura do botao}
  repeat
    //ButtonWidth := 50;
    ButtonGroupWidth := 0;
    if ButtonCount <> 0 then
      ButtonGroupWidth := ButtonWidth * ButtonCount + ButtonSpacing * (ButtonCount - 1);
  until ButtonGroupWidth <= 600;

 {Mostra o titulo no formulario}
  Caption := Titulo;

  {Coloca a imagem no formulario}
  if IconID <> nil then
  begin
    with TUniImage.Create(Self) do
    begin
      Name := 'Image';
      Parent := Self;
      Picture.Icon.Handle := LoadIcon(0, IconID);
      SetBounds(HorzMargin, VertMargin, 100, 100);
      end;
  end;

  {Escreve a mensagem no formulário}
  MaiorTamanho := 0;
  for Lc_Idx := 0 to High(Msg) do
  begin
    Lb_Msg := TUniLabel.Create(Self);
    Lb_Msg.Name := 'MsgLine' + IntToStr(Lc_Idx);
    Lb_Msg.Parent := Self;
    //Lb_Msg.Font.Style := [fsBold];   //Ajusta a fonte para bold, pode vazar para fora
    Lb_Msg.Caption := Msg[Lc_Idx];
    Lb_Msg.AutoSize := True;
    compara := tamStringpxl(Lb_Msg);
    if MaiorTamanho < compara then
    Begin
      MaiorTamanho := compara;
    End;
    Lb_Msg.Height := 13;
    if (Lc_Idx > 0)  then
      VertMargin := VertMargin + Lb_Msg.Height;
    Lb_Msg.Top := VertMargin;
    Lb_Msg.left := 70;
  end;
  IconTextWidth := MaiorTamanho * 2;
  VertMargin := VertMargin + Lb_Msg.Height;
  {Define o tamanho do formulario}
  Width := Max(IconTextWidth, ButtonGroupWidth) + (HorzMargin * 2);

  Height := IconTextHeight + ButtonHeight + VertMargin + ButtonHeight + (VertSpacing * 2);

  {Coloca os botoes no formulario}
  X := (ClientWidth - ButtonGroupWidth) div 2;
  for Lc_Idx := 0 to High(Opcoes) do
  begin
    with TUniButton.Create(Self) do
    begin
      Parent := Self;
      ParentBackground := False;
      ParentColor := False;
      ParentFont := False;
      Font.Style := [];
      //Font.Color :=clBlack;
      Caption := Opcoes[Lc_Idx];
      tag := Lc_Idx;
      OnClick := MrbotaoPress;
      if (BotaoEscape[Lc_Idx] = bEscape) then
      begin
        TabOrder := 0;
      end;
      //+ VertSpacing
      SetBounds(X, IconTextHeight + VertMargin , ButtonWidth, ButtonHeight);
      Inc(X, ButtonWidth + ButtonSpacing);
    end;
  end;

end;

procedure TMsgForm.UniFormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #27) then
  begin
    BotaoEscolhido := -1;
    Close;
  end;
end;

procedure TMsgForm.UniFormShow(Sender: TObject);
begin
  inherited;
  Self.Menu := nil;
end;

end.
