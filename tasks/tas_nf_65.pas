unit tas_nf_65;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_nf, uniButton, uniBitBtn,
  uniSpeedButton, uniGroupBox, uniPanel, uniPageControl, uniBasicGrid,
  uniDBGrid, uniGUIClasses, uniEdit, uniLabel, uniGUIBaseClasses, Vcl.Menus,
  uniMainMenu;

type
  TTasNf65 = class(TTasNf)
    UniPanel1: TUniPanel;
    UniLabel10: TUniLabel;
    E_Desc_Cfop: TUniEdit;
    UniLabel11: TUniLabel;
    E_Cfop: TUniEdit;
    UniLabel13: TUniLabel;
    E_Nr_Invoice: TUniEdit;
    UniLabel15: TUniLabel;
    E_Dt_Emission: TUniEdit;
    UniLabel7: TUniLabel;
    E_Company: TUniEdit;
    UniLabel21: TUniLabel;
    E_Cnpj_Cpf: TUniEdit;
    UniLabel8: TUniLabel;
    E_Cd_Company: TUniEdit;
    UniDBGrid1: TUniDBGrid;
    UniPanel2: TUniPanel;
    UniLabel14: TUniLabel;
    E_VL_Invoice: TUniEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TasNf65: TTasNf65;

implementation

{$R *.dfm}

end.
