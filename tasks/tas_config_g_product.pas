unit tas_config_g_product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_config, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIBaseClasses, uniGUIClasses, uniPanel, uniEdit, uniLabel,
  uniRadioButton, uniRadioGroup, uniGroupBox, uniCheckBox, Vcl.Menus,
  uniMainMenu, Data.DB, Datasnap.DBClient, uniPageControl;

type
  TTasConfigGProduct = class(TTasConfig)
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
    UniRadioGroup1: TUniRadioGroup;
    UniRadioGroup2: TUniRadioGroup;
    rdg_from_update_pricetag: TUniRadioGroup;
    UniGroupBox2: TUniGroupBox;
    Rb_Kind_Formule_1: TUniRadioButton;
    Rb_Kind_Formule_2: TUniRadioButton;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniGroupBox3: TUniGroupBox;
    UniLabel3: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel4: TUniLabel;
    UniCheckBox24: TUniCheckBox;
    UniGroupBox4: TUniGroupBox;
    UniRadioGroup4: TUniRadioGroup;
    UniRadioGroup5: TUniRadioGroup;
    UniPageControl1: TUniPageControl;
    tbs_general: TUniTabSheet;
    tbs_calc: TUniTabSheet;
    tbs_abas: TUniTabSheet;
    UniCheckBox13: TUniCheckBox;
    UniCheckBox14: TUniCheckBox;
    UniCheckBox15: TUniCheckBox;
    UniCheckBox16: TUniCheckBox;
    UniCheckBox17: TUniCheckBox;
    UniCheckBox18: TUniCheckBox;
    UniCheckBox19: TUniCheckBox;
    UniCheckBox20: TUniCheckBox;
    UniCheckBox21: TUniCheckBox;
    UniCheckBox22: TUniCheckBox;
    Chbx_AutoCalcPriceTag: TUniCheckBox;
  private
    { Private declarations }
    procedure Save;Override;
    procedure ShowData;Override;
    function ValidateSave: Boolean;Override;

  public
    { Public declarations }
  end;

var
  TasConfigGProduct: TTasConfigGProduct;

implementation

{$R *.dfm}

{ TTasConfigGProduct }

procedure TTasConfigGProduct.Save;
begin
  inherited;
  IF Chbx_AutoCalcPriceTag.Checked then
    Configuracao('G','PRO_G_AUTO_CALC_PRICETAG','S')
  else
    Configuracao('G','PRO_G_AUTO_CALC_PRICETAG','N');

  if rdg_from_update_pricetag.ItemIndex = 0 then
    Configuracao('G','PRO_G_FROM_UPDATE_PRICETAG','C')
  else
    Configuracao('G','PRO_G_FROM_UPDATE_PRICETAG','R');

  if Rb_Kind_Formule_1.Checked then
    Configuracao('G','PRO_G_FORMULA_UPDATE_PRICETAG','1')
  else
    Configuracao('G','PRO_G_FORMULA_UPDATE_PRICETAG','2');
end;

procedure TTasConfigGProduct.ShowData;
begin
  inherited;
  Chbx_AutoCalcPriceTag.Checked := (Configuracao('L','PRO_G_AUTO_CALC_PRICETAG','S') = 'S');
  IF Configuracao('L','PRO_G_FROM_UPDATE_PRICETAG','C') = 'C' THEN
    rdg_from_update_pricetag.ItemIndex:=0
  else
    rdg_from_update_pricetag.ItemIndex:=1;

  Rb_Kind_Formule_1.Checked := ( Configuracao('L','PRO_G_FORMULA_UPDATE_PRICETAG','1') = '1' );
  Rb_Kind_Formule_2.Checked := ( Configuracao('L','PRO_G_FORMULA_UPDATE_PRICETAG','2') = '2' ) ;
end;

function TTasConfigGProduct.ValidateSave: Boolean;
begin

end;

end.
