unit uSM;

interface

uses System.SysUtils, System.Classes, System.Json,DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth,REST.json, Vcl.Forms,synacode,zlib,
  FireDAC.Phys.MySQL, FireDAC.Comp.UI,Winapi.Windows,
  FireDAC.Phys.MySQLDef, FireDAC.UI.Intf, FireDAC.ConsoleUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  System.IniFiles,ClasseUtil, UnitConstantes, prm_result,
  Data.DB, FireDAC.Comp.Client, Vcl.AppEvnts;

type

  {$METHODINFO ON}


  TSM = class(TComponent)
  private

    //procedure LimpaMemoria;
  protected
     Retorno : TResult;
    //function setRequest(Par:String):TPrmBase;
    //function setRetorno(Msg:String;ID:Integer;Code:Integer):TResult;
    procedure Geralog(Origem,msg:String);
    function setReturn(VAlue:AnsiString):String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;
  {$METHODINFO OFF}



implementation

uses UnFunctions, uMain;

constructor TSM.Create(AOwner: TComponent);
begin
  inherited;
  Retorno := TResult.Create;
end;

destructor TSM.Destroy;
begin
  Retorno.disposeOf;
  inherited;
end;

procedure TSM.Geralog(Origem, msg: String);
begin
  GeralogFile(Origem,msg);
end;

function TSM.setReturn(VAlue: AnsiString): String;
begin
//  Result := EncodeBase64( Value );
  Result := ZCompressString (Value,zcDefault  )
end;


end.
