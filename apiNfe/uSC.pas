unit uSC;

interface

uses System.SysUtils, System.Classes,  Datasnap.DSTCPServerTransport,Datasnap.DSServer,
    Datasnap.DSCommonServer, Datasnap.DSAuth, IPPeerServer, Vcl.Forms, FireDAC.Comp.Client,
    Generics.Collections, Datasnap.DSSession,  System.IniFiles,uSM,
    Data.DBXJSON, System.JSON, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
    FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
    Data.DB, FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
    FireDAC.VCLUI.Wait;

type
  TSC = class(TDataModule)

    DSServer1: TDSServer;
    DSTCPServerTransport1: TDSTCPServerTransport;
    DSServerClass1: TDSServerClass;
    procedure DSServerClass1GetClass(DSServerClass: TDSServerClass;
      var PersistentClass: TPersistentClass);
  private

  public


  end;

var
  SC: TSC;
  AppPath: string;
  GbUser : Integer;

implementation

{$R *.dfm}

uses Winapi.Windows,  UnFunctions;




procedure TSC.DSServerClass1GetClass(
  DSServerClass: TDSServerClass; var PersistentClass: TPersistentClass);
begin
  PersistentClass := uSM.TSM;
end;




end.
