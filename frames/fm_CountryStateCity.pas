unit fm_CountryStateCity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_BaseFrame, uniButton, uniBitBtn,
  uniSpeedButton, uniLabel, uniGUIBaseClasses, uniGUIClasses, uniEdit, uniPanel,
  fm_country, fm_state, fm_city;

type
  TFmCountryStateCity = class(TFmBaseFrame)
    ctn_Country: TUniContainerPanel;
    ctn_state: TUniContainerPanel;
    ctn_city: TUniContainerPanel;
    procedure CountryExit(Sender: TObject);
    procedure StateExit(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
  public
    FrCountry : TFmCountry;
    FrState : TFmState;
    FrCity : TFmCity;
    procedure ShowCountry;
    procedure ShowState;
    procedure ShowCity;
  end;

var
  FmCountryStateCity: TFmCountryStateCity;

implementation

{$R *.dfm}

procedure TFmCountryStateCity.CountryExit(Sender: TObject);
begin
  with FrCountry do
  Begin
    if (DBLCB_Lista.Text <> '') and
       (DBLCB_Lista.KeyValue <> null) then
      FrState.Listar(DBLCB_Lista.KeyValue)
    else
      FrState.Listar(1058);
  End;
end;

procedure TFmCountryStateCity.ShowCity;
begin
  FrCity := TFmCity.Create(Self);
  FrCity.Parent := ctn_City;
  FrCity.Align := alClient;
  FrCity.Show;
end;

procedure TFmCountryStateCity.ShowCountry;
begin
  FrCountry := TFmCountry.Create(Self);
  FrCountry.Parent := ctn_Country;
  FrCountry.Align := alClient;
  FrCountry.DBLCB_Lista.OnExit := CountryExit;
  FrCountry.Show;
end;

procedure TFmCountryStateCity.ShowState;
begin
  FrState := TFmState.Create(Self);
  FrState.Parent := ctn_State;
  FrState.Align := alClient;
  FrState.DBLCB_Lista.OnExit := StateExit;
  FrState.Show;
end;

procedure TFmCountryStateCity.StateExit(Sender: TObject);
begin
  with FrState do
  Begin
    if (DBLCB_Lista.Text <> '') and
       (DBLCB_Lista.KeyValue <> null) then
      FrCity.Listar(DBLCB_Lista.KeyValue)
    else
      FrState.Listar(41);
  End;
end;

procedure TFmCountryStateCity.UniFrameCreate(Sender: TObject);
begin
  inherited;
  ShowCountry;
  ShowState;
  ShowCity;
end;

end.
