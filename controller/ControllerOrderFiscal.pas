unit ControllerOrderFiscal;

interface

uses System.Classes, System.SysUtils,
      tblOrder, FireDAC.Comp.Client,FireDAC.Stan.Param,
      System.AnsiStrings,UnFunctions, Data.DBXJSON, System.JSON;

Type
  TControllerOrderFiscal = Class(TComponent)

    Private

    Public
      FCallback: TDBXCallback;

      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      Procedure MsgCallBack(Seq,Value:String);


      procedure ValidaDestinatario;
      procedure ValidateItemsFiscal;
      procedure ValidateItemsCadastro;
      function ValidTributacao:Boolean;


  End;

implementation

{ TControllerOrderFiscal }

uses uSM;



end.
