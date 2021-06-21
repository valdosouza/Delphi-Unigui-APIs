unit ApiResult;


interface

Uses Classes, SysUtils;

Type
  //nome da classe de entidade

  TApiResult = class(TPersistent)
  private
    FCode: Integer;
    FID: Integer;
    FMensagem: String;
    procedure setFCode(const Value: Integer);
    procedure setFID(const Value: Integer);
    procedure setFMensagem(const Value: String);

    public
      property Mensagem: String read FMensagem write setFMensagem;
      property ID: Integer read FID write setFID;
      property Code: Integer read FCode write setFCode;
  end;


implementation

{ TApiResult }

procedure TApiResult.setFCode(const Value: Integer);
begin
  FCode := Value;
end;

procedure TApiResult.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TApiResult.setFMensagem(const Value: String);
begin
  FMensagem := Value;
end;

end.
