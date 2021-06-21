unit SyncApp;

interface

uses
  SysUtils, Classes, updateTables;

type
  Lista = class(TObject)
  private
    // Message sent from producer to consumer.
    Msg: string;
    // True if consumer should wait for producer to send message, false
    // if producer should wait for consumer to retrieve message.
    Empty: Boolean;
  public
    constructor Create;
    function Take: string;
    procedure Put(AMessage: string);
  end;

  Producer = class(TThread)
  private
    FDrop: Drop;
  public
    constructor Create(ADrop: Drop);
    procedure Execute; override;
  end;

  Consumer = class(TThread)
  private
    FDrop: Drop;
  public
    constructor Create(ADrop: Drop);
    procedure Execute; override;
  end;


implementation

end.
