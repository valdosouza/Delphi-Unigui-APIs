unit fm_StateCity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, fm_state, fm_city;

type
  TFmStateCity = class(TFmBaseFrame)
    ctn_state: TUniContainerPanel;
    ctn_city: TUniContainerPanel;
    procedure StateExit(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FrState : TFmState;
    FrCity : TFmCity;
    procedure ShowState;
    procedure ShowCity;

  end;

var
  FmStateCity: TFmStateCity;

implementation

{$R *.dfm}

{ TFmBaseFrame1 }

procedure TFmStateCity.ShowCity;
begin
  FrCity := TFmCity.Create(Self);
  FrCity.Parent := ctn_City;
  FrCity.Align := alClient;
  FrCity.Show;

end;

procedure TFmStateCity.ShowState;
begin
  FrState := TFmState.Create(Self);
  FrState.Parent := ctn_State;
  FrState.Align := alClient;
  FrState.DBLCB_Lista.OnExit := StateExit;
  FrState.Show;
end;

procedure TFmStateCity.StateExit(Sender: TObject);
begin
  with FrState do
  Begin
    if (DBLCB_Lista.Text <> '') and
       (DBLCB_Lista.KeyValue <> null) then
      FrCity.Listar(DBLCB_Lista.KeyValue)
    else
      FrCity.Listar(41);
  End;
end;

procedure TFmStateCity.UniFrameCreate(Sender: TObject);
begin
  inherited;
  ShowState;
  ShowCity;
end;

end.
