unit prm_result;

interface

uses
  System.SysUtils;

type
  TResult = class(TObject)
    private
    FCode: Integer;
    FID: Integer;
    FMensagem: String;
    procedure setFCode(const Value: Integer);
    procedure setFID(const Value: Integer);
    procedure setFMensagem(const Value: String);

    public
      constructor Create;Virtual;
      destructor Destroy;Virtual;
      property Mensagem: String read FMensagem write setFMensagem;
      property ID: Integer read FID write setFID;
      property Code: Integer read FCode write setFCode;
  end;

implementation

{ TResult }

constructor TResult.Create;
begin
  inherited;

end;

destructor TResult.Destroy;
begin

  inherited;
end;

procedure TResult.setFCode(const Value: Integer);
begin
  FCode := Value;
end;

procedure TResult.setFID(const Value: Integer);
begin
  FID := Value;
end;

procedure TResult.setFMensagem(const Value: String);
begin
  FMensagem := Value;
end;

end.
