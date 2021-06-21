unit Network;


interface

uses
  IdTCPClient, System.SysUtils,FMX.DialogService;

  function verificaConexao(pHost,pPort:String):Boolean;
  function verificaConexaoServidor:Boolean;
  function verificaConexaoApiData:Boolean;
  function verificaConexaoApiAuth:Boolean;
const
  EOL = concat(Char(10),Char(13));

implementation

uses MainModule;

function verificaConexao(pHost,pPort:String):Boolean;
Var
  LcTcp : TidTCPClient;
Begin
  Try
    Try
      Result := True;
      LcTcp := TidTCPClient.Create(nil);
      with LcTcp do
      Begin
        ReadTimeout := 2000;
        ConnectTimeout := 2000;
        Port := StrToInt(pPort);
        Host := pHost;
        Connect;
        Disconnect;
      End;
    Except
      Result := False;
    End;
  Finally
    LcTcp.DisposeOf;
  End;
End;

function verificaConexaoServidor:Boolean;
Begin
  Result := True;
  if not verificaConexao(GbServidor,'80') then
  Begin
    Result := False;
    TDialogService.ShowMessage(
            concat('A T E N Ç Ã O!',
                  Char(10),Char(13),EOL,
                  'Não há conexão com o Servidor.',EOL,
                  'Verifique se está conectado a internet.',EOL,EOL,
                  'Verifique e tente novamente'
            )
    );
  End;
End;

function verificaConexaoApiData:Boolean;
Begin
  Result := True;
  if not verificaConexao('177.70.22.118','223') then
  Begin
    Result := False;
    TDialogService.ShowMessage(
            concat('A T E N Ç Ã O!',
                  Char(10),Char(13),EOL,
                  'Não há conexão com o Aplicação de Dados.',EOL,
                  'Verifique com o Administrador do Sistema.'
            )
    );
  End;
End;

function verificaConexaoApiAuth:Boolean;
Begin
  Result := True;
  if not verificaConexao('177.70.22.118','224') then
  Begin
    Result := False;
    TDialogService.ShowMessage(
            concat('A T E N Ç Ã O!',
                  Char(10),Char(13),EOL,
                  'Não há conexão com o Aplicação de Autenticação.',EOL,
                  'Verifique com o Administrador do Sistema.'
            )
    );
  End;
End;

end.



