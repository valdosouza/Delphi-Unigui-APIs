unit msg_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UnFunctions, Vcl.StdCtrls;

type
  TMsgForm = class(TForm)
    Label1: TLabel;
    procedure FormatScreen;
  private
    { Private declarations }
  public
    { Public declarations }
    BotaoEscolhido : Integer;
    Finalized : Boolean;
    BotaoEscape : array of TMsgEscape;
    TipoPadrao : TMsgPadrao;
    Opcoes : array of string;
    Msg: array of string;
    Titulo : String;
  end;

var
  MsgForm: TMsgForm;

implementation

{$R *.dfm}


{ TMsgForm }

procedure TMsgForm.FormatScreen;
begin
  //Muda o estilo da fonte para bold, apenas para realizar os cálculos
end;

end.
