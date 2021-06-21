unit cad_vendor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPanel,
  uniPageControl, uniRadioGroup, uniDateTimePicker, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses;

type
  TCadEntityFiscal1 = class(TCadEntityFiscal)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadEntityFiscal1: TCadEntityFiscal1;

implementation

{$R *.dfm}

end.
