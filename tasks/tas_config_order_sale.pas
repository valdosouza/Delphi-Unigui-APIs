unit tas_config_order_sale;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_config, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniGUIClasses, uniPanel, uniLabel, uniEdit,
  uniGroupBox, uniRadioGroup, uniCheckBox;

type
  TTasConfigOrderSale = class(TTasConfig)
    UniCheckBox1: TUniCheckBox;
    UniCheckBox2: TUniCheckBox;
    UniCheckBox3: TUniCheckBox;
    UniCheckBox4: TUniCheckBox;
    UniCheckBox5: TUniCheckBox;
    UniCheckBox6: TUniCheckBox;
    UniCheckBox7: TUniCheckBox;
    UniCheckBox8: TUniCheckBox;
    UniCheckBox9: TUniCheckBox;
    UniCheckBox10: TUniCheckBox;
    UniCheckBox11: TUniCheckBox;
    UniCheckBox12: TUniCheckBox;
    UniCheckBox13: TUniCheckBox;
    UniCheckBox14: TUniCheckBox;
    UniCheckBox15: TUniCheckBox;
    UniRadioGroup1: TUniRadioGroup;
    UniGroupBox1: TUniGroupBox;
    UniEdit1: TUniEdit;
    UniLabel1: TUniLabel;
    UniGroupBox2: TUniGroupBox;
    UniEdit2: TUniEdit;
    UniLabel2: TUniLabel;
    UniGroupBox3: TUniGroupBox;
    UniEdit3: TUniEdit;
    UniLabel3: TUniLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasConfigOrderSale: TTasConfigOrderSale;

implementation

{$R *.dfm}

end.
