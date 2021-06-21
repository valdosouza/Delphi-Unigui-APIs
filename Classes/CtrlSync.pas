unit CtrlSync;

interface

uses REST.Json,System.Json,System.Generics.Collections;

Type
  TCtrlSync = Class;

  TObjListCtrlSync = TObjectList<TCtrlSync>;

  TCtrlSync = Class
  private
    FAtualizado: String;
    FName: String;
    FExecucao: Boolean;
    FUltimaAtualizacao: String;
    FJson: String;
    FBaixado: String;
    procedure setFAtualizado(const Value: String);
    procedure setFBaixado(const Value: String);
    procedure setFExecucao(const Value: Boolean);
    procedure setFJson(const Value: String);
    procedure setFName(const Value: String);
    procedure setFUltimaAtualizacao(const Value: String);
    public
      property Name :String read FName write setFName;
      property JSon : String read FJson write setFJson;
      property Baixado : String read FBaixado write setFBaixado;
      property Atualizado : String read FAtualizado write setFAtualizado;
      property Execucao : Boolean read FExecucao write setFExecucao;
      property UltimaAtualizacao : String read FUltimaAtualizacao write setFUltimaAtualizacao;

  End;

implementation


{ TCtrlSync }

procedure TCtrlSync.setFAtualizado(const Value: String);
begin
  FAtualizado := Value;
end;

procedure TCtrlSync.setFBaixado(const Value: String);
begin
  FBaixado := Value;
end;

procedure TCtrlSync.setFExecucao(const Value: Boolean);
begin
  FExecucao := Value;
end;

procedure TCtrlSync.setFJson(const Value: String);
begin
  FJson := Value;
end;

procedure TCtrlSync.setFName(const Value: String);
begin
  FName := Value;
end;

procedure TCtrlSync.setFUltimaAtualizacao(const Value: String);
begin
  FUltimaAtualizacao := Value;
end;

end.
