unit ServerModule;

interface

uses
  SysUtils, uniGUIServer, uniGUIMainModule, dialogs, shellapi;

type
  TUSM = class(TUniGUIServerModule)
    procedure UniGUIServerModuleCreate(Sender: TObject);

  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }

  end;

function USM: TUSM;

procedure Exploreweb(page:Pchar);
implementation

{$R *.dfm}

uses
  UniGUIVars, MainModule, Vcl.Forms;

function USM: TUSM;
begin
  Result:=TUSM(UniGUIServerInstance);
end;


procedure TUSM.FirstInit;
begin
  InitServerModule(Self);
end;


procedure Exploreweb(page:Pchar);
Var
  ReturnValue : Integer;
Begin
  ReturnValue := Shellexecute(0,'open', page,nil,nil,1);
  if ReturnValue <= 32 then
  BEgin
    case ReturnValue of
      0:ShowMessage('Erro: Sem Mem�ria.');
      2:ShowMessage('Erro: Arquivo n�o encontrado.');
      3:ShowMessage('Erro: Diretorio n�o encontrado.');
      11:ShowMessage('Erro: Arquivo Corrompido ou inv�lido.');
    else
      ShowMessage(Pchar('Erro: Nr ') + IntToStr(ReturnValue) + ' na execu��o do aplicativo');
    end;

  End;



End;
procedure TUSM.UniGUIServerModuleCreate(Sender: TObject);
Var
  lcPorta : String;
begin
  lcPorta := '8072';  //Area de Produ��o
  //lcPorta := '8071'; //area de testes
  //Abre o Navegador ao abrir a aplica�ao
  port := StrToInt(lcPorta);
  Exploreweb(PWideChar(concat('http://localhost:',lcPorta)));

end;

initialization
  RegisterServerModuleClass(TUSM);
end.
