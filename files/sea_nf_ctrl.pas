unit sea_nf_ctrl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniDateTimePicker,
  uniLabel, uniRadioGroup, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniPageControl, uniGUIBaseClasses, uniPanel;

type
  TBaseSearch1 = class(TBaseSearch)
    UniRadioGroup1: TUniRadioGroup;
    UniRadioGroup2: TUniRadioGroup;
    UniLabel1: TUniLabel;
    UniDateTimePicker1: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    UniDateTimePicker2: TUniDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseSearch1: TBaseSearch1;

implementation

{$R *.dfm}

end.
