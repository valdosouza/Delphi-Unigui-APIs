unit sea_payment_type;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,base_search, uniCheckBox, uniEdit,
  uniLabel, Datasnap.Provider, Data.DB, Datasnap.DBClient, uniButton, uniBitBtn,
  uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid, uniGUIBaseClasses,
  uniPanel;

type
  TSeaPaymentType = class(TBaseSearch)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Codigo: TUniEdit;
    E_Description: TUniEdit;
    chbx_cadAtivo: TUniCheckBox;
    procedure GetView;Override;
    procedure SetRegister;Override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeaPaymentType: TSeaPaymentType;

implementation

{$R *.dfm}

uses openForms;

{ TSeaPaymentType }

procedure TSeaPaymentType.GetView;
Var
  lcodigo : TuniEdit;
begin
  lcodigo := TuniEdit.Create(Self);
  lcodigo.Tag := 4004;
  openCadPaymentTypes(lcodigo);
end;

procedure TSeaPaymentType.SetRegister;
begin
 openCadPaymentTypes(nil);
end;

end.
