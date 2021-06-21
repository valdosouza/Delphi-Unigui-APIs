unit fm_bank_historic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_frame_List, Data.DB,
  Datasnap.DBClient, Datasnap.Provider, uniGUIClasses, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniLabel;

type
  TBaseFrameList1 = class(TBaseFrameList)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseFrameList1: TBaseFrameList1;

implementation

{$R *.dfm}

end.
