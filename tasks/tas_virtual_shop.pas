unit tas_virtual_shop;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniCheckBox, uniPanel,
  uniGUIClasses, uniEdit, uniLabel, Vcl.Menus, uniMainMenu, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, fm_price_list, fm_stock_list,
  ControllerVirtualShop, msg_form, unmessages, Data.DB, Datasnap.DBClient;

type
  TTasVirtualShop = class(TBaseRegistry)
    UniLabel1: TUniLabel;
    E_domain: TUniEdit;
    UniLabel2: TUniLabel;
    E_Title: TUniEdit;
    Ctn_Price_List: TUniContainerPanel;
    Ctn_Stock_List: TUniContainerPanel;
    UniLabel3: TUniLabel;
    E_google_analytics_id: TUniEdit;
    UniLabel4: TUniLabel;
    UniEdit4: TUniEdit;
    Cbx_Active: TUniCheckBox;
    Cbx_Vitrine: TUniCheckBox;
    Cbx_dealer: TUniCheckBox;
    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure FormatScreen;Override;
    procedure EditionControl;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    function  ValidateDelete: boolean;
    procedure Delete;Override;
  private
    { Private declarations }
     procedure ShowPriceList;
     procedure ShowStockList;
  public
    { Public declarations }
    FrPriceList : TFmPriceList;
    FrStockList : TFmStockList;
    VirtualShop : TControllerVirtualShop;
  end;

var
  TasVirtualShop: TTasVirtualShop;

implementation

{$R *.dfm}

uses MainModule, openForms, UnFunctions;

{ TTasVirtualShop }

procedure TTasVirtualShop.ClearAllFields;
begin
  inherited;
  ClearFields(FrStockList);
  ClearFields(FrPriceList);
  VirtualShop.clear;
end;

procedure TTasVirtualShop.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          VirtualShop.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TTasVirtualShop.FormatScreen;
begin
  inherited;
  ShowPriceList;
  ShowStockList;
end;

procedure TTasVirtualShop.InitVariable;
begin
  inherited;
  VirtualShop := TControllerVirtualShop.Create(self);
end;

procedure TTasVirtualShop.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasVirtualShop.Save;
begin
  with VirtualShop.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Dominio := E_domain.Text;
    Titulo := E_Title.Text;
    TabelaPreco := FrPriceList.DBLCB_Lista.KeyValue;
    Estoque := FrStockList.DBLCB_Lista.KeyValue;
    IdenGoogle := E_google_analytics_id.Text;
    if Cbx_Active.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
    if Cbx_Vitrine.Checked then
      Vitrine := 'S'
    else
      Vitrine := 'N';
    if Cbx_dealer.Checked then
      Revendedor := 'S'
    else
      Revendedor := 'N';
  End;
  VirtualShop.save;
end;

procedure TTasVirtualShop.setVariable;
begin
  VirtualShop.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  VirtualShop.getAllByKey;
end;

procedure TTasVirtualShop.ShowData;
begin
  with VirtualShop.Registro do
  Begin
    E_domain.Text := Dominio;
    E_Title.Text := Titulo;
    FrPriceList.DBLCB_Lista.KeyValue := TabelaPreco;
    FrStockList.DBLCB_Lista.KeyValue := Estoque;
    E_google_analytics_id.Text := IdenGoogle;
    Cbx_Active.Checked := (VirtualShop.Registro.Ativo = 'S');
    Cbx_Vitrine.Checked := (VirtualShop.Registro.Vitrine = 'S');
    Cbx_dealer.Checked := (VirtualShop.Registro.Revendedor = 'S');
  End;
end;

procedure TTasVirtualShop.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

procedure TTasVirtualShop.ShowPriceList;
begin
  FrPriceList := TFmPriceList.Create(Self);
  FrPriceList.Parent := Ctn_Price_List;
  FrPriceList.Listar;
  FrPriceList.Align := alClient;
  FrPriceList.Show;
end;

procedure TTasVirtualShop.ShowStockList;
begin
  FrStockList := TFmStockList.Create(Self);
  FrStockList.Parent := Ctn_Stock_List;
  FrStockList.Listar;
  FrStockList.Align := alClient;
  FrStockList.Show;
end;

procedure TTasVirtualShop.EditionControl;
begin
  inherited;
  EditionControler(FrPriceList);
  EditionControler(FrStockList);
end;

function TTasVirtualShop.ValidaInsert: boolean;
begin
  Result := True;
end;

function TTasVirtualShop.ValidateDelete: boolean;
begin
  Result := True;
end;

function TTasVirtualShop.ValidateSave: boolean;
begin
  Result := True;
end;

end.
