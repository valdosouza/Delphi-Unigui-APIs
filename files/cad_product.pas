unit cad_product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel,fm_category,  uniMemo, uniPageControl,
  uniCheckBox, ControllerProduct, Data.DB, Datasnap.DBClient;

type
  TCadProduct = class(TBaseRegistry)
    ctn_Category: TUniContainerPanel;
    Pg_Main: TUniPageControl;
    tb_Obs: TUniTabSheet;
    E_note: TUniMemo;
    ChBx_highlights: TUniCheckBox;
    ChBx_active: TUniCheckBox;
    chbx_published: TUniCheckBox;
    chbx_promotion: TUniCheckBox;
    Configurao1: TUniMenuItem;
    pnl_topo: TUniPanel;
    L_Codigo: TUniLabel;
    UniLabel1: TUniLabel;
    E_ID: TUniEdit;
    E_Identifier: TUniEdit;
    pnl_linha_2: TUniPanel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    procedure Configurao1Click(Sender: TObject);
  private
    { Private declarations }
  protected
    FrCategory : TFmCategory;
    procedure ShowCategory;
    procedure FormatScreen;Override;
    function ValidateSaveProduct: boolean;Virtual;
    procedure ClearAllFields;Override;
  public
    { Public declarations }

  end;

var
  CadProduct: TCadProduct;

implementation

{$R *.dfm}

uses msg_form, unMessages, MainModule, openForms;


{ TCadProduct }

procedure TCadProduct.ClearAllFields;
begin
  inherited;
  ClearFields(FrCategory);
end;

procedure TCadProduct.Configurao1Click(Sender: TObject);
begin
  inherited;
  openTasConfigGProduct(0);
end;

procedure TCadProduct.FormatScreen;
begin
  inherited;
  ShowCategory;
end;

procedure TCadProduct.ShowCategory;
begin
  FrCategory := TFmCategory.Create(Self);
  FrCategory.Parent := ctn_Category;
  FrCategory.Align := alClient;
  FrCategory.Listar;
  FrCategory.Show;

end;

function TCadProduct.ValidateSaveProduct: boolean;
Begin
  Result := True;
  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;

  if trim(FrCategory.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Categoria não informado.',
                  'Preencha o campo para continuar']);
    if FrCategory.DBLCB_Lista.CanFocus then FrCategory.DBLCB_Lista.SetFocus;
    Result := False;
    exit;
  end;
End;


end.
