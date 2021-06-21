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

uses uMain;


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
    Lc_PathFileName := ExtractFilePath(Application.ExeName) + 'log_api_dados.txt';
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
  Main.StopServer;
  Main.StartServer;

end;


end.



