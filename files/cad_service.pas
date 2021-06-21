unit cad_service;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel, uniMemo, uniCheckBox, Fm_measure, Fm_category,
  ControllerServices, Data.DB, Datasnap.DBClient;

type
  TCadService = class(TBaseRegistry)
    label1: TUniLabel;
    E_Codigo: TUniEdit;
    label2: TUniLabel;
    E_Description: TUniEdit;
    ctn_Category: TUniContainerPanel;
    UniLabel1: TUniLabel;
    E_Aliq_comissao: TUniEdit;
    UniLabel3: TUniLabel;
    E_Margem_lucro: TUniEdit;
    E_preço_venda: TUniEdit;
    UniLabel4: TUniLabel;
    M_memo: TUniMemo;
    UniLabel5: TUniLabel;
    Chbx_active: TUniCheckBox;

    procedure InitVariable;Override;
    procedure FormatScreen;Override;
    Procedure SetVariable;Override;
    
    procedure ShowData;Override;
    procedure ShowDataProduct;
    procedure ShowDataPreco;
    
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    function ValidateSaveMerchandise: boolean;Virtual;

    procedure Save;Override;
    procedure SaveProduct;
    Procedure SaveListaPreco;
    procedure SavePreco;
    Procedure SaveService;
    
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
    procedure EditionControl;Override;

  private
    { Private declarations }
    procedure ShowCategory;
  public
    { Public declarations }
    Services    : TControllerServices;
    FrCategory  : TFmCategory;
  end;

var
  CadService: TCadService;

implementation

{$R *.dfm}

uses MainModule;

{ TCadService }

procedure TCadService.ClearAllFields;
begin
  inherited;
//
end;

procedure TCadService.Delete;
begin
  inherited;
//
end;

procedure TCadService.EditionControl;
begin
  inherited;
//
end;

procedure TCadService.FormatScreen;
begin
  inherited;
  ShowCategory;
end;

procedure TCadService.InitVariable;
begin
  inherited;
  Services    := TControllerServices.Create(self);
end;

procedure TCadService.Insert;
begin
  inherited;
//
end;

procedure TCadService.Save;
begin
  inherited;
  SaveProduct;
  SaveListaPreco;
  SavePreco;
  SaveService;

  E_Codigo.Text := IntToStr(Services.Registro.codigo);
  CodigoRegistro := Services.Registro.Codigo;
end;

procedure TCadService.SaveListaPreco;
begin
  with Services.ListaPreco.Registro do
  begin
    Codigo          := 1;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    MargemLucro     := StrToFloatDef(E_Margem_lucro.Text,0);
    
  end;
  Services.ListaPreco.save;
end;

procedure TCadService.SavePreco;
begin
  with Services.Preco.Registro do
  begin
    Tabela          := Services.ListaPreco.Registro.Codigo;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Produto         := Services.Produto.Registro.Codigo;
    Preco           := StrToFloatDef(E_preço_venda.Text,0);
    Comissao        := StrToFloatDef(E_Aliq_comissao.Text,0);
    MargemLucro     := Services.ListaPreco.Registro.MargemLucro
    
  end;
  Services.Preco.save;
end;

procedure TCadService.SaveProduct;
begin
  with Services.Produto.Registro do
  begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Descricao       := E_Description.Text;
    Categoria       := FrCategory.DBLCB_Lista.KeyValue;
    Observaocao     := M_memo.Text;
    if Chbx_active.Checked then
      Ativo := 'S'
    else  
      Ativo := 'N';
      
  end;
  Services.Produto.save;
end;

procedure TCadService.SaveService;
begin
  with Services.Registro do
  begin
    Codigo := Services.Produto.Registro.Codigo;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
  end;
  Services.Save;
end;

procedure TCadService.SetVariable;
begin
  Services.Registro.Codigo                      := CodigoRegistro;
  Services.Registro.Estabelecimento             := UMM.GInstitution.registro.Codigo;
  Services.getByKey;

  Services.Produto.Registro.Codigo              := Services.Registro.Codigo;
  Services.Produto.Registro.Estabelecimento     := Services.Registro.Estabelecimento;
  Services.Produto.getByKey;

  Services.ListaPreco.Registro.Codigo           := 1;
  Services.ListaPreco.Registro.Estabelecimento  := Services.Registro.Estabelecimento;
  Services.ListaPreco.getByKey;

  Services.Preco.Registro.Estabelecimento       := Services.Registro.Estabelecimento;
  Services.Preco.Registro.Tabela                := Services.ListaPreco.Registro.Codigo;
  Services.Preco.Registro.Produto               := Services.Produto.Registro.Codigo;
  Services.Preco.getByKey;
  inherited;
end;

procedure TCadService.ShowCategory;
begin
  FrCategory := TFmCategory.Create(Self);
  FrCategory.Parent := ctn_Category;
  FrCategory.Align := alClient;
  FrCategory.Listar;
  FrCategory.Show;
end;

procedure TCadService.ShowData;
begin
  inherited;
  ShowDataProduct;
  ShowDataPreco;
end;

procedure TCadService.ShowDataPreco;
begin
  E_Aliq_comissao.Text  := FloatToStrF(Services.Preco.Registro.Comissao, ffFixed,10,2);
  E_Margem_lucro.Text   := FloatToStrF(Services.Preco.Registro.MargemLucro, ffFixed,10,2);
  E_preço_venda.Text    := FloatToStrF(Services.Preco.Registro.Preco, ffFixed,10,2);
  FrCategory.DBLCB_Lista.KeyValue := Services.Produto.Registro.Categoria;
end;

procedure TCadService.ShowDataProduct;
begin
  E_Codigo.Text         := IntToStr(Services.Produto.Registro.Codigo);
  E_Description.Text    := Services.Produto.Registro.Descricao;
  if Services.Produto.Registro.Ativo = 'S' then
    Chbx_active.Checked := true ;
end;


procedure TCadService.ShowNoData;
begin
  inherited;
//
end;

function TCadService.ValidaInsert: boolean;
begin
//
end;

function TCadService.ValidateDelete: boolean;
begin
//
end;

function TCadService.ValidateSave: boolean;
begin
//
end;

function TCadService.ValidateSaveMerchandise: boolean;
begin
//
end;

end.
