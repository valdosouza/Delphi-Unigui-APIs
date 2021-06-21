unit ControllerMedCopyEdition;

interface
uses System.Classes, System.SysUtils,BaseController,TypesCollection,
      tblMedCopyEdition, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param;

Type
  TControllerMedCopyEdition = Class(TBaseController)
  private

  public
    Registro : TMedCopyEdition;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure clear;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    procedure getlist;

  End;
implementation

{ TControllerMedCopyEdition }

procedure TControllerMedCopyEdition.clear;
begin

end;

constructor TControllerMedCopyEdition.Create(AOwner: TComponent);
begin
  inherited;

end;

function TControllerMedCopyEdition.delete: boolean;
begin

end;

destructor TControllerMedCopyEdition.Destroy;
begin

  inherited;
end;

function TControllerMedCopyEdition.getByKey: Boolean;
begin

end;

procedure TControllerMedCopyEdition.getlist;
begin

end;

function TControllerMedCopyEdition.insert: boolean;
begin

end;

function TControllerMedCopyEdition.save: boolean;
begin

end;

end.
