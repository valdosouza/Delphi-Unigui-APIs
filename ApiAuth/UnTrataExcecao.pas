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
    Pc_Erro(concat('O serviço da NF-e está paralisado momentaneamente.',#13,#13,
                   'Aguarde o serviço retornar para autorização on-line.'
            ));
    exit;
  end;

  if (Pos('is not a valid BCD value', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('Não foi digitado um valor válido',#13,#13,
                   'Verifique se não tem 2 virgulas ou caracter inválido.'
            ));
    exit;
  end;

  if (Pos('is not a valid date', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('Não foi digitado uma data válida',#13,#13,
                   'Verifique para continuar.'
            ));
    exit;
  end;

  if (Pos('is not a valid BCD value', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('Não foi digitado um valor válido',#13,#13,
                   'Verifique se não tem 2 virgulas ou caracter inválido.'
            ));
    exit;
  end;


  if (Pos('O tempo limite da operação foi atingido', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('O tempo para execução da tarefa expirou.',#13,#13,
                   'Tente novamente.'
            ));
    exit;
  end;

  if (Pos('não pôde ser resolvido', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro(concat('O Sistema não conseguiu encontrar o servidor da receita',#13,#13,
                   'Verifique as conexões com a internet ou tente novamente.'
            ));
    exit;
  end;

  if (Pos('violation of FOREIGN KEY constraint', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('Existe algum problema de relacionamento entre Tabelas'+#13+#13+
            'Este registro foi ou não consegue ser referenciado com outras tabelas.');
    exit;
  end;

  if (Pos('Uma conexão com o servidor não pôde ser', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('Conexão com o servidor não pode ser estabelecida.'+#13+#13+
            'Erro de conexão com a internet ou apenas falha de conexão momentânea.');
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
    Pc_Erro('CPF do destinatário inválido'+#13+
            'Verifique antes de continuar');
    exit;
  end;

  if (Pos('Ja existe pedido de Inutilizacao com a mesma faixa de inutilizacao', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('Já existe pedido de Inutilização com a mesma faixa de inutilização'+#13+
            'Verifique antes de continuar');
    exit;
  end;

  if (Pos('CNPJ deve ter 14 dígitos', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('CNPJ deve ter 14 dígitos'+#13+
            'Verifique antes de continuar');
    exit;
  end;


  if (Pos('Data de Validade do Certificado já expirou', Lc_Msg_erro) > 0) then
  begin
    Pc_Erro('Data de Validade do Certificado já expirou.'+#13+
            'Verifique antes de continuar');
    exit;
  end;


  //quando a operação e cancelada pelo usuario
  Lc_Erro := Copy( Lc_Msg_erro,1,37);
  IF (Lc_Erro = 'A operação foi cancelada pelo usuário') then
  Begin
    exit;
  end;
  //trata os erros que não precisam de mensagem na tela
  if (Copy( Lc_Msg_erro,1,40) = 'The connection with the server was reset') then exit;
  if (Copy( Lc_Msg_erro,1,42) = 'A conexão com o servidor foi reconfigurada') then exit;

  //trata os Erros que não precisam de envio de email

  //erro interno gerado pela Receita
  Lc_Erro := Copy( Lc_Msg_erro,1,12);
  IF (Lc_Erro = 'Erro interno') then
    Begin
    Pc_Erro('A servidor da Receita gerou um erro interno.' + EOLN +
            'Aguarde alguns instantes e tente novamente.');
    exit;
    end;


  //Quando a impressora selecionada não é valida
  Lc_Erro := Copy( Lc_Msg_erro,1,29);
  IF (Lc_Erro = 'Printer selected is not valid') then
    Begin
    Pc_Erro('Impressora selecionda não é válida.' + EOLN +
            'Verifique se a impressora está ligada e acessível.');
    exit;
    end;

  //Quando a impressora não está imprimindo
  Lc_Erro := Copy( Lc_Msg_erro,1,20);
  IF (Lc_Erro = 'Printing in progress') then
  Begin
    Pc_Erro('                   Impressão em andamento.' + EOLN +
            'Solicitar múltiplas impressões antes da resposta da impressora' + EOLN +
            'pode gerar instabilidade no sistema, aguarde um instante.');
    exit;
  end;

  //Quando a impressora não está imprimindo
  Lc_Erro := Copy( Lc_Msg_erro,1,33);
  IF (Lc_Erro = 'Printer is not currently printing') then
  Begin
    Pc_Erro('Impressora não está imprimindo.' + EOLN +
            'Verifique se a impressora está ligada e acessível.');
    exit;
  end;

  //Quando a impressora não está imprimindo
  Lc_Erro := Copy( Lc_Msg_erro,1,46);
  IF (Lc_Erro = 'There is no default printer currently selected') then
  Begin
    Pc_Erro('Não há impressora padrão selecionada.' + EOLN +
            'Verifique antes de continuar.');
    exit;
  end;

  //Consulta WebService receita
  Lc_Erro := Copy( Lc_Msg_erro,1,34);
  IF (Lc_Erro = 'WebService Consulta Status serviço') then
  Begin
    exit;
  end;

  //Backup
  Lc_Erro := Copy( Lc_Msg_erro,1,23);
  IF (Lc_Erro = 'cannot open backup file') then
  Begin
    Pc_Erro('Verifique se as mídias (pendrive/hd externo) estão conectadas.' + EOLN +
            'Observe também a letra da unidade de disco.');
    exit;
  end;

  //criar arquivo
  Lc_Erro := Copy( Lc_Msg_erro,1,18);
  IF (Lc_Erro = 'Cannot create file') then
  Begin
    Pc_Erro('O arquivo não pode ser criado.' + EOLN +
            'Verique problemas de permissão, ou ele está sendo usado por outro processo.');
    exit;
  end;

  //criar arquivo
  Lc_Erro := Copy( Lc_Msg_erro,1,18);
  IF (Lc_Erro = 'Cannot open file') then
  Begin
    Pc_Erro('O arquivo não pode ser aberto.' + EOLN +
            'O sistema não achou o arquivo.');
    exit;
  end;


  //Lote em processamento
  Lc_Erro := Copy( Lc_Msg_erro,1,21);
  IF (Lc_Erro = 'Lote em processamento') then
  Begin
    Pc_Erro('O lote de Notas enviadas estão em processamento.' + EOLN +
            'Aguarde alguns instantes e solicite o retorno.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,35);
  IF (Lc_Erro = 'Socket Error # 11001 Host not found') then
  Begin
    Pc_Erro('Libere o sistema no seu anti vírus / firewall ' + EOLN +
            'ou tente executar o sistema como administrador.');
    exit;
  end;

  //Erro Sem certficado
  IF (Copy( Lc_Msg_erro,1,59) = 'A certificate is required to complete client authentication') or
     (Copy( Lc_Msg_erro,1,59) = 'É necessário ter um certificado para concluir a autenticaçã') or
     (Copy( Lc_Msg_erro,1,34) = 'Certificado Digital não encontrado') or
     ( (Copy( Lc_Msg_erro,1,11) = 'Certificado') and (pos('não encontrado',Lc_Msg_erro)>0 )  ) then
  Begin
    Pc_Erro('Por favor verifique se o certificado está presente.' + EOLN +
            'O sistema precisa fazer a autenticação para continuar.');
    exit;
  end;


  Lc_Erro := Copy( Lc_Msg_erro,1,34);
  IF (Lc_Erro = 'Serviço Paralisado Momentaneamente') then
  Begin
    Pc_Erro('A Receita informa que o serviço está paralisado momentâneamente.' + EOLN +
            'Aguarde alguns instantes e tente novamente.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,18);
  IF (Copy( Lc_Msg_erro,1,19) = 'Certificado Digital') or
     (Copy( Lc_Msg_erro,1,19) = 'O conjunto de chave') or
     (Copy( Lc_Msg_erro,1,18) = 'A chave não existe') or
     (Copy( Lc_Msg_erro,1,47) = 'An error occurred in the secure channel support') then
  Begin
    Pc_Erro('Por favor verifique se o certificado está presente.' + EOLN +
            'O sistema precisa fazer a autenticação para continuar.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,21);
  IF (Lc_Erro = 'Classe não registrada') then
  Begin
    Pc_Erro('Classe não registrada ' + EOLN +
            'Instale as DLL''s necessárias para operar o Certificado.' + EOLN +
            'Execute esta operação antes de continuar.');
    exit;
  end;


  IF (Copy( Lc_Msg_erro,1,53) = 'A connection with the server could not be established') or
     (Copy( Lc_Msg_erro,1,19) = 'Service Unavailable') then
  Begin
    Pc_Erro('A conexão com o servidor não pôde ser estabelecida.' + EOLN +
            'Se está operando NF-e. aguarde uns instantes antes de continuar.');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,24);
  IF (Lc_Erro = 'Nota(s) não confirmadas:') then
  Begin
    Pc_Erro(Lc_Msg_erro);
    exit;
  end;

  if (Pos('The operation timed out - URL:https://nfe', Lc_Msg_erro) > 0) or
     (Pos('O tempo limite da oper', Lc_Msg_erro) > 0) then
  Begin
    Pc_Erro('O Servidor não respondeu no tempo esperado.' + EOLN +
            'Sua solicitação está na fila, aguardando avaliação.' + EOLN+
            'Aguarde uns instantes e solicite o retorno.');
    exit;
  end;

  if (Pos('O tempo limite da operação foi atingido', Lc_Msg_erro) > 0) then
  Begin
    Pc_Erro('O Servidor não respondeu no tempo esperado.' + EOLN +
            'Isso acontece por questões de segurança.' + EOLN+
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
    Pc_Erro('O endereço de email está errado ou ' + EOLN +
            'foi rejeitado pelo servidor. Verifique!');
    exit;
  end;

  Lc_Erro := Copy( Lc_Msg_erro,1,48);
  IF (Lc_Erro = 'Serviço Paralisado Momentaneamente (curto prazo)') then
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
  IF (Lc_Erro = 'System Error. Code: 1722. O servidor RPC não está disponível') then
  Begin
    Pc_Erro('Sem resposta a uma chamada do Sistema Operacional.' + EOLN +
            'O servidor RPC não está disponível.');
    exit;
  end;
  //The requested operation has been cancelled by the user
  Lc_Erro := Copy( Lc_Msg_erro,1,54);
  IF (Lc_Erro = 'The requested operation has been cancelled by the user') then
  Begin
    //É apenas informação e escapamos aqui
    exit;
   end;

  //Erro I/O error 64 - Erro de Rede
  Lc_Erro := Copy( Lc_Msg_erro,1,12);
  IF (Lc_Erro = 'I/O error 64') then
  Begin
    Pc_Erro('Por favor verifique as conexões de rede.' + EOLN +
            'O sistema identificou instabilidade em sua rede.');
    exit;
  end;

  //Erro I/O error 21 - Mídia não encontrada
  Lc_Erro := Copy( Lc_Msg_erro,1,12);
  IF (Lc_Erro = 'I/O error 21') then
  Begin
    Pc_Erro('O sistema está tentando acessar uma mídia que não está disponível.' + EOLN +
            'Verifique, reconecte a mídia se for o caso e tente novamente.');
    exit;
  end;

  //Erro I/O error 103 - File not open
  Lc_Erro := Copy( Lc_Msg_erro,1,13);
  IF (Lc_Erro = 'I/O error 103') then
  Begin
    Pc_Erro('Por favor verifique as conexões da Impressora.' + EOLN +
            'O sistema não consegue enviar a impressão.');
    exit;
  end;

  //Erro I/O error 103 - não consegue abrir um arquivo que está na rede
  Lc_Erro := Copy( Lc_Msg_erro,1,12);
  IF (Lc_Erro = 'I/O error 53') then
  Begin
    Pc_Erro('Por favor verifique as conexões de rede.' + EOLN +
            'O sistema não consegue abrir um arquivo que está na rede.');
    exit;
  end;


  //Erro I/O error 105 - File not open for output
  Lc_Erro := Copy( Lc_Msg_erro,1,13);
  IF (Lc_Erro = 'I/O error 105') then
  Begin
    Pc_Erro('Por favor verifique as configurações da Impressora.' + EOLN +
            'O sistema não consegue enviar a impressão.');
    exit;
  end;

  //The operation timed out - O servidor não respondeu no tempo esperado
  Lc_Erro := Copy( Lc_Msg_erro,1,23);
  if (Pos('The operation timed out', Lc_Msg_erro) > 0) then
  Begin
    Pc_Erro('O Servidor Web não respondeu no tempo esperado.' + EOLN +
            'A operação pode não ter sido realizada, tente novamente.');
    exit;
  end;

  //Invalid floating ponint operation - Valor não real não é valido
  Lc_Erro := Copy( Lc_Msg_erro,1,33);
  IF (Lc_Erro = 'Invalid floating ponint operation') then
  Begin
    Pc_Erro('O valor que foi digitado, não obedece o formato de valores' + EOLN +
            'configurados no painel de controle do windows.');
    exit;
  end;

  //deadlock update conflicts with
  Lc_Erro := Copy( Lc_Msg_erro,1,30);
  IF (Lc_Erro = 'deadlock update conflicts with') then
  Begin
    Pc_Erro('Existe outra tela utilizando alguma tabela ao mesmo tempo.' + EOLN+
            'Não é possivel atualizar duas tabelas ao mesmo tempo.'+ EOLN+
            'Encerre esta operação e tente novamente.');
    exit;
  end;

  //Erro na consulta do CNPJ na receita
  Lc_Erro := Copy( Lc_Msg_erro,1,16);
  IF (Lc_Erro = 'Erro na Consulta') then
  Begin
    Pc_Erro('Erro na consulta.' + EOLN+
            'Verifique os dados na imagem ou sua conexão com a internet.');
    exit;
  end;

  //Erro na consulta do CNPJ na receita
  Lc_Erro := Copy( Lc_Msg_erro,1,53);
  IF (Lc_Erro = 'Erro na hora de fazer o download da imagem do captcha') then
  Begin
    Pc_Erro('Erro ao buscar a imagem do capctha.' + EOLN+
            'Verifique sua conexão com a internet.');
    exit;
  end;

  //Erro na consulta do CNPJ na receita
  Lc_Erro := Copy( Lc_Msg_erro,1,29);
  IF (Lc_Erro = 'Erro: Requisição não enviada.') then
  Begin
    Pc_Erro('Por favor veirifique configurações do Certificado Digital.' + EOLN+
            'Eles devem estar com SSL 2.0 e TLS 1.0.');
    exit;
  end;

  if (Pos('Informado NCM inexistente', Lc_Msg_erro) > 0) then
  Begin
    Pc_Erro('O NCM informado é inválido ou não é mais utilizado' + EOLN +
            'Veja na tela de acompamento qual é o item que precisa se reviado');
    exit;
  end;


  Lc_Erro := Copy(Lc_Msg_erro,1,27);
  IF (Lc_Erro = 'Access violation at address') then
  Begin
    Pc_Erro(Lc_Msg_erro);
  end;


  ///Mostra a mensagem caso não tenha sido tratada acima
  Pc_Erro(Lc_Msg_erro);
end;


end.



