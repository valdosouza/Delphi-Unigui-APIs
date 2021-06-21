unit uSM;

interface

uses
  System.StrUtils,System.SysUtils, System.Classes,Vcl.AppEvnts,

  Md5, UnitConstantes,ClasseUtil,System.JSON,REST.Json,
  QRPDFFilt;
type
  TSM = class(TComponent)
    procedure AppEventsException(Sender: TObject; E: Exception);
  private

  protected
    procedure Geralog(Origem,msg:String);
  public
    constructor Create(AOwner: TComponent); override;
    //Produto

  end;

implementation

uses uMain, MainModule, UnFunctions;


procedure TSM.AppEventsException(Sender: TObject; E: Exception);
begin
  LogTarefasDelphi(concat('Mensagem de Erro : ',E.Message));
end;

constructor TSM.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TSM.Geralog(Origem, msg: String);
begin
  GeralogFile(Origem,msg);
end;


end.

