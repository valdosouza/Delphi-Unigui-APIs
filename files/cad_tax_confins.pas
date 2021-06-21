unit cad_tax_confins;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel;

type
  TCadTaxConfins = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_Taxa: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    UniSimplePanel1: TUniSimplePanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniEdit1: TUniEdit;
    UniLabel3: TUniLabel;
    E_ID: TUniEdit;
    E_Tax_Group: TUniEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadTaxConfins: TCadTaxConfins;

implementation

{$R *.dfm}

end.
