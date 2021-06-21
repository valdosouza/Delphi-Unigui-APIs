unit cad_stock_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniCheckBox, uniEdit, uniLabel, ControllerStockList, unmessages, msg_form,
   MainModule, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadStockList = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_ID: TUniEdit;
    E_Description: TUniEdit;
    chbx_kind: TUniCheckBox;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
  private
    { Private declarations }
  public
    { Public declarations }
    StockList : TControllerStockList;
  end;

var
  CadStockList: TCadStockList;

implementation

{$R *.dfm}

{ TBaseRegistry1 }


procedure TCadStockList.Delete;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      Self.StockList.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadStockList.InitVariable;
begin
  inherited;
  StockList := TControllerStockList.create(Self);
end;

procedure TCadStockList.Insert;
begin
  inherited;
  StockList.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadStockList.Save;
begin
  inherited;
  with StockList.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Descricao := E_Description.Text;
    if chbx_kind.Checked then
      Tipo := 'S'
    else
      Tipo := 'N';
  End;
  StockList.save;
  StockList.setProducts;
  E_ID.Text := IntToStr(StockList.Registro.codigo);

end;

procedure TCadStockList.SetVariable;
begin
  StockList.Registro.Codigo := CodigoRegistro;
  StockList.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  StockList.getByKey;
  inherited;
end;
procedure TCadStockList.ShowData;
begin
  if StockList.exist then
  Begin
    E_ID.Text := IntToStr(StockList.Registro.Codigo);
    E_Description.Text := StockList.Registro.Descricao;
    chbx_kind.Checked := (StockList.Registro.Tipo = 'S');
  End;
  inherited;
end;

procedure TCadStockList.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadStockList.ValidaInsert: boolean;
begin
  Result := true;
end;

function TCadStockList.ValidateDelete: boolean;
begin
//
end;

function TCadStockList.ValidateSave: boolean;
begin
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

  if chbx_kind.Checked then
  Begin
    if StockList.IsMain  then
    begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Um outro estoque principal foi definido.',
                  'Redefina quem será o estoque principal antes de continuar.']);
      Result:=false;
      chbx_kind.Checked := FAlse;
      Exit;
    end;
  End;

end;
end.
