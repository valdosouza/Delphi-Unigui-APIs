unit UnTrataExcecao;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, Vcl.Forms;

type
  TTrata_Excecao = class(TThread)
  private
    { Private declarations }
    It_E: Exception;
    it_ArquivoBmp : String;

    procedure Pc_Erro(Pc_MsgErro: String);
    procedure HandleExcept;
  protected
      email : Boolean;
  public
      constructor Create(CreateSuspended: Boolean;E : Exception);
      destructor Destroy; override;
      procedure execute;override;
  end;


Var
  It_cd_Script : Integer;
  It_TxtSql    : String;

const
  EOLN=chr(13)+chr(10);   //Usado para fazer fim de linha nos quadros de mensagens

implementation


constructor TTrata_Excecao.Create(CreateSuspended: Boolean;E : Exception);
begin
  inherited Create (CreateSuspended);
  It_E := E;
  FreeOnTerminate := False;
end;

destructor TTrata_Excecao.Destroy;
begin

  inherited;
end;

procedure TTrata_Excecao.Pc_Erro(Pc_MsgErro: String);
var
  Lc_File: TextFile;
  Lc_PathFileName : String;
  Lc_DateTime : String;
begin
  Try
    Lc_PathFileName := ExtractFilePath(Application.ExeName) + 'log_api_auth.txt';
    AssignFile(Lc_File, Lc_PathFileName);
    if FileExists(Lc_PathFileName) then
      Append(Lc_File)
    else
      Rewrite(Lc_File);
    Lc_DateTime := DateTimeToStr(Now);
    Writeln(Lc_File, Lc_DateTime + ' - ' + Pc_MsgErro);
    Flush(Lc_File);  { ensures that the text was actusally written to file }
                    { insert code here that would require a Flush before closing the file }
  Finally
    CloseFile(Lc_File);
  End;
end;

procedure TTrata_Excecao.execute;
begin
  HandleExcept;
end;


procedure TTrata_Excecao.HandleExcept;
var
  Lc_I:integer;
  Lc_Destinatario, Lc_Anexo: TStringlist;
  Lc_NomeTabela:String;
  Lc_Msg_erro : String;
  Lc_Erro : String;
Begin
  Lc_Msg_erro := It_E.Message;

  if (Pos('Servico Paralisado Momentaneamente', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('O servi�o da NF-e est� paralisado momentaneamente.',#13,#13,
                   'Aguarde o servi�o retornar para autoriza��o on-line.'
            ));
    exit;
  end;

  if (Pos('is not a valid BCD value', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('N�o foi digitado um valor v�lido',#13,#13,
                   'Verifique se n�o tem 2 virgulas ou caracter inv�lido.'
            ));
    exit;
  end;

  if (Pos('is not a valid date', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('N�o foi digitado uma data v�lida',#13,#13,
                   'Verifique para continuar.'
            ));
    exit;
  end;

  if (Pos('is not a valid BCD value', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('N�o foi digitado um valor v�lido',#13,#13,
                   'Verifique se n�o tem 2 virgulas ou caracter inv�lido.'
            ));
    exit;
  end;


  if (Pos('O tempo limite da opera��o foi atingido', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('O tempo para execu��o da tarefa expirou.',#13,#13,
                   'Tente novamente.'
            ));
    exit;
  end;

  if (Pos('n�o p�de ser resolvido', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('O Sistema n�o conseguiu encontrar o servidor da receita',#13,#13,
                   'Verifique as conex�es com a internet ou tente novamente.'
            ));
    exit;
  end;

  if (Pos('violation of FOREIGN KEY constraint', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('Existe algum problema de relacionamento entre Tabelas'+#13+#13+
            'Este registro foi ou n�o consegue ser referenciado com outras tabelas.');
    exit;
  end;

  if (Pos('Uma conex�o com o servidor n�o p�de ser', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('Conex�o com o servidor n�o pode ser estabelecida.'+#13+#13+
            'Erro de conex�o com a internet ou apenas falha de conex�o moment�nea.');
    exit;
  end;

  if (Pos('is not a valid floating point value', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('Verifique o valor digitado');
    exit;
  end;

  if (Pos('multiple sources or destinations specified', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('Tem algo errado com o destino do Backup'+#13+
            'Verifique antes de continuar');
    exit;
  end;


  if (Pos('CPF do destinatario invalido', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('CPF do destinat�rio inv�lido'+#13+
            'Verifique antes de continuar');
    exit;
  end;

  if (Pos('Ja existe pedido de Inutilizacao com a mesma faixa de inutilizacao', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('J� existe pedido de Inutiliza��o com a mesma faixa de inutiliza��o'+#13+
            'Verifique antes de continuar');
    exit;
  end;

  if (Pos('CNPJ deve ter 14 d�gitos', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('CNPJ deve ter 14 d�gitos'+#13+
            'Verifique antes de continuar');
    exit;
  end;


  if (Pos('Data de Validade do Certificado j� expirou', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('Data de Validade do Certificado j� expirou.'+#13+
            'Verifique antes de continuar');
    exit;
  end;


  //quando a opera��o e cancelada pelo usuario
  Lc_Erro := Copy( Lc_Msg_erro,1,37);
  IF (Lc_Erro = 'A opera��o foi cancelada pelo usu�rio') then
  Begin
    exit;
  end;
  //trata os erros que n�o precisam de mensagem na tela
  if (Copy( Lc_Msg_erro,1,40) = 'The connection with the server was reset') then exit;
  if (Copy( Lc_Msg_erro,1,42) = 'A conex�o com o servidor foi reconfigurada') then exit;

  //trata os Erros que n�o precisam de envio de email

  //erro interno gerado pela Receita
  Lc_Erro := Copy( Lc_Msg_erro,1,12);
  IF (Lc_Erro = 'Erro interno') then
    Begin
    Pc_Erro('A servidor da Receita gerou um erro interno.' + EOLN +
            'Aguarde alguns instantes e tente novamente.');
    exit;
    end;


  //Quando a impressora selecionada n�o � valida
  Lc_Erro := Copy( Lc_Msg_erro,1,29);
  IF (Lc_Erro = 'Printer selected is not valid') then
    Begin
    Pc_Erro('Impressora selecionda n�o � v�lida.' + EOLN +
            'Verifique se a impressora est� ligada e acess�vel.');
    exit;
    end;

  //Quando a impressora n�o est� imprimindo
  Lc_Erro := Copy( Lc_Msg_erro,1,20);
  IF (Lc_Erro = 'Printing in progress') then
  Begin
    Pc_Erro('                   Impress�o em andamento.' + EOLN +
            'Solicitar m�ltiplas impress�es antes da resposta da impressora' + EOLN +
            'pode gerar instabilidade no sistema, aguarde um instante.');
    exit;
  end;

  //Quando a impressora n�o est� imprimindo
  Lc_Erro := Copy( Lc_Msg_erro,1,33);
  IF (Lc_Erro = 'Printer is not currently printing') then
  Begin
    Pc_Erro('Impressora n�o est� imprimindo.' + EOLN +
            'Verifique se a impressora est� ligada e acess�vel.');
    exit;
  end;

  //Quando a impressora n�o est� imprimindo
  Lc_Erro := Copy( Lc_Msg_erro,1,46);
  IF (Lc_Erro = 'There is no default printer currently selected') then
  Begin
    Pc_Erro('N�o h� impressora padr�o selecionada.' + EOLN +
            'Verifique antes de continuar.');
    exit;
  end;

  //Consulta WebService receita
  Lc_Erro := Copy( Lc_Msg_erro,1,34);
  IF (Lc_Erro = 'WebService Consulta Status servi�o') then
  Begin
    exit;
  end;

  //Backup
  Lc_Erro := Copy( Lc_Msg_erro,1,23);
  IF (Lc_Erro = 'cannot open backup file') then
  Begin
    Pc_Erro('Verifique se as m�dias (pendrive/hd externo) est�o conectadas.' + EOLN +
            'Observe tamb�m a letra da unidade de disco.');
    exit;
  end;

  //criar arquivo
  Lc_Erro := Copy( Lc_Msg_erro,1,18);
  IF (Lc_Erro = 'Cannot create file') then
  Begin
    Pc_Erro('O arquivo n�o pode ser criado.' + EOLN +
            'Verique problemas de permiss�o, ou ele est� sendo usado por outro processo.');
    exit;
  end;

  //criar arquivo
  Lc_Erro := Copy( Lc_Msg_erro,1,18);
  IF (Lc_Erro = 'Cannot open file') then
  Begin
    Pc_Erro('O arquivo n�o pode ser aberto.' + EOLN +
            'O sistema n�o achou o arquivo.');
    exit;
  end;


  //Lote em processamento
  Lc_Erro := Copy( Lc_Msg_erro,1,21);
  IF (Lc_Erro = 'Lote em processamento') then
  Begin
    Pc_Erro('O lote de Notas enviadas est�o em processamento.' + EOLN +
            'Aguarde alguns instantes e solicite o retorno.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,35);
  IF (Lc_Erro = 'Socket Error # 11001 Host not found') then
  Begin
    Pc_Erro('Libere o sistema no seu anti v�rus / firewall ' + EOLN +
            'ou tente executar o sistema como administrador.');
    exit;
  end;

  //Erro Sem certficado
  IF (Copy( Lc_Msg_erro,1,59) = 'A certificate is required to complete client authentication') or
     (Copy( Lc_Msg_erro,1,59) = '� necess�rio ter um certificado para concluir a autentica��') or
     (Copy( Lc_Msg_erro,1,34) = 'Certificado Digital n�o encontrado') or
     ( (Copy( Lc_Msg_erro,1,11) = 'Certificado') and (pos('n�o encontrado',Lc_Msg_erro)>0 )  ) then
  Begin
    Pc_Erro('Por favor verifique se o certificado est� presente.' + EOLN +
            'O sistema precisa fazer a autentica��o para continuar.');
    exit;
  end;


  Lc_Erro := Copy( Lc_Msg_erro,1,34);
  IF (Lc_Erro = 'Servi�o Paralisado Momentaneamente') then
  Begin
    Pc_Erro('A Receita informa que o servi�o est� paralisado moment�neamente.' + EOLN +
            'Aguarde alguns instantes e tente novamente.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,18);
  IF (Copy( Lc_Msg_erro,1,19) = 'Certificado Digital') or
     (Copy( Lc_Msg_erro,1,19) = 'O conjunto de chave') or
     (Copy( Lc_Msg_erro,1,18) = 'A chave n�o existe') or
     (Copy( Lc_Msg_erro,1,47) = 'An error occurred in the secure channel support') then
  Begin
    Pc_Erro('Por favor verifique se o certificado est� presente.' + EOLN +
            'O sistema precisa fazer a autentica��o para continuar.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,21);
  IF (Lc_Erro = 'Classe n�o registrada') then
  Begin
    Pc_Erro('Classe n�o registrada ' + EOLN +
            'Instale as DLL''s necess�rias para operar o Certificado.' + EOLN +
            'Execute esta opera��o antes de continuar.');
    exit;
  end;


  IF (Copy( Lc_Msg_erro,1,53) = 'A connection with the server could not be established') or
     (Copy( Lc_Msg_erro,1,19) = 'Service Unavailable') then
  Begin
    Pc_Erro('A conex�o com o servidor n�o p�de ser estabelecida.' + EOLN +
            'Se est� operando NF-e. aguarde uns instantes antes de continuar.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,24);
  IF (Lc_Erro = 'Nota(s) n�o confirmadas:') then
  Begin
    Pc_Erro(Lc_Msg_erro);
    exit;
  end;

  if (Pos('The operation timed out - URL:https://nfe', Lc_Msg_erro) > 0) or
     (Pos('O tempo limite da oper', Lc_Msg_erro) > 0) then
  Begin
    Pc_Erro('O Servidor n�o respondeu no tempo esperado.' + EOLN +
            'Sua solicita��o est� na fila, aguardando avalia��o.' + EOLN+
            'Aguarde uns instantes e solicite o retorno.');
    exit;
  end;

  if (Pos('O tempo limite da opera��o foi atingido', Lc_Msg_erro) > 0) then
  Begin
    Pc_Erro('O Servidor n�o respondeu no tempo esperado.' + EOLN +
            'Isso acontece por quest�es de seguran�a.' + EOLN+
            'Tente novamente.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,20);
  IF (Lc_Erro = 'Invalid input value.') then
  Begin
    Pc_Erro('Por favor preencha o campo adequadamente.' + EOLN +
            'Observe o formato do dado que o campo necessita.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,42);
  IF (Lc_Erro = 'Unable to complete network request to host') then
  Begin
    Pc_Erro(Lc_Erro)
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,34);
  IF (Lc_Erro = '5.1.3 Bad recipient address syntax') then
  Begin
    Pc_Erro('O endere�o de email est� errado ou ' + EOLN +
            'foi rejeitado pelo servidor. Verifique!');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,48);
  IF (Lc_Erro = 'Servi�o Paralisado Momentaneamente (curto prazo)') then
  Begin
    Pc_Erro(Lc_Msg_erro);
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,31);
  IF (Lc_Erro = 'A call to an OS function failed') then
  Begin
    Pc_Erro('Sem resposta a uma chamada do Sistema Operacional.' + EOLN +
            'Tente novamente.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,60);
  IF (Lc_Erro = 'System Error. Code: 1722. O servidor RPC n�o est� dispon�vel') then
  Begin
    Pc_Erro('Sem resposta a uma chamada do Sistema Operacional.' + EOLN +
            'O servidor RPC n�o est� dispon�vel.');
    exit;
  end;
  //The requested operation has been cancelled by the user
  Lc_Erro := Copy( Lc_Msg_erro,1,54);
  IF (Lc_Erro = 'The requested operation has been cancelled by the user') then
  Begin
    //� apenas informa��o e escapamos aqui
    exit;
   end;

  //Erro I/O error 64 - Erro de Rede
  Lc_Erro := Copy( Lc_Msg_erro,1,12);
  IF (Lc_Erro = 'I/O error 64') then
  Begin
    Pc_Erro('Por favor verifique as conex�es de rede.' + EOLN +
            'O sistema identificou instabilidade em sua rede.');
    exit;
  end;

  //Erro I/O error 21 - M�dia n�o encontrada
  Lc_Erro := Copy( Lc_Msg_erro,1,12);
  IF (Lc_Erro = 'I/O error 21') then
  Begin
    Pc_Erro('O sistema est� tentando acessar uma m�dia que n�o est� dispon�vel.' + EOLN +
            'Verifique, reconecte a m�dia se for o caso e tente novamente.');
    exit;
  end;

  //Erro I/O error 103 - File not open
  Lc_Erro := Copy( Lc_Msg_erro,1,13);
  IF (Lc_Erro = 'I/O error 103') then
  Begin
    Pc_Erro('Por favor verifique as conex�es da Impressora.' + EOLN +
            'O sistema n�o consegue enviar a impress�o.');
    exit;
  end;

  //Erro I/O error 103 - n�o consegue abrir um arquivo que est� na rede
  Lc_Erro := Copy( Lc_Msg_erro,1,12);
  IF (Lc_Erro = 'I/O error 53') then
  Begin
    Pc_Erro('Por favor verifique as conex�es de rede.' + EOLN +
            'O sistema n�o consegue abrir um arquivo que est� na rede.');
    exit;
  end;


  //Erro I/O error 105 - File not open for output
  Lc_Erro := Copy( Lc_Msg_erro,1,13);
  IF (Lc_Erro = 'I/O error 105') then
  Begin
    Pc_Erro('Por favor verifique as configura��es da Impressora.' + EOLN +
            'O sistema n�o consegue enviar a impress�o.');
    exit;
  end;

  //The operation timed out - O servidor n�o respondeu no tempo esperado
  Lc_Erro := Copy( Lc_Msg_erro,1,23);
  if (Pos('The operation timed out', Lc_Msg_erro) > 0) then
  Begin
    Pc_Erro('O Servidor Web n�o respondeu no tempo esperado.' + EOLN +
            'A opera��o pode n�o ter sido realizada, tente novamente.');
    exit;
  end;

  //Invalid floating ponint operation - Valor n�o real n�o � valido
  Lc_Erro := Copy( Lc_Msg_erro,1,33);
  IF (Lc_Erro = 'Invalid floating ponint operation') then
  Begin
    Pc_Erro('O valor que foi digitado, n�o obedece o formato de valores' + EOLN +
            'configurados no painel de controle do windows.');
    exit;
  end;

  //deadlock update conflicts with
  Lc_Erro := Copy( Lc_Msg_erro,1,30);
  IF (Lc_Erro = 'deadlock update conflicts with') then
  Begin
    Pc_Erro('Existe outra tela utilizando alguma tabela ao mesmo tempo.' + EOLN+
            'N�o � possivel atualizar duas tabelas ao mesmo tempo.'+ EOLN+
            'Encerre esta opera��o e tente novamente.');
    exit;
  end;

  //Erro na consulta do CNPJ na receita
  Lc_Erro := Copy( Lc_Msg_erro,1,16);
  IF (Lc_Erro = 'Erro na Consulta') then
  Begin
    Pc_Erro('Erro na consulta.' + EOLN+
            'Verifique os dados na imagem ou sua conex�o com a internet.');
    exit;
  end;

  //Erro na consulta do CNPJ na receita
  Lc_Erro := Copy( Lc_Msg_erro,1,53);
  IF (Lc_Erro = 'Erro na hora de fazer o download da imagem do captcha') then
  Begin
    Pc_Erro('Erro ao buscar a imagem do capctha.' + EOLN+
            'Verifique sua conex�o com a internet.');
    exit;
  end;

  //Erro na consulta do CNPJ na receita
  Lc_Erro := Copy( Lc_Msg_erro,1,29);
  IF (Lc_Erro = 'Erro: Requisi��o n�o enviada.') then
  Begin
    Pc_Erro('Por favor veirifique configura��es do Certificado Digital.' + EOLN+
            'Eles devem estar com SSL 2.0 e TLS 1.0.');
    exit;
  end;

  if (Pos('Informado NCM inexistente', Lc_Msg_erro) > 0) then
  Begin
    Pc_Erro('O NCM informado � inv�lido ou n�o � mais utilizado' + EOLN +
            'Veja na tela de acompamento qual � o item que precisa se reviado');
    exit;
  end;


  Lc_Erro := Copy(Lc_Msg_erro,1,27);
  IF (Lc_Erro = 'Access violation at address') then
  Begin
    Pc_Erro(Lc_Msg_erro);
  end;


  ///Mostra a mensagem caso n�o tenha sido tratada acima
  Pc_Erro(Lc_Msg_erro);
end;


end.



