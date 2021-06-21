unit cad_stock_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniCheckBox,
  uniGUIClasses, uniEdit, uniLabel, Vcl.Menus, uniMainMenu, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel, ControllerStock,
  unmessages, msg_form;

type
  TBaseRegistry1 = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
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
    Stock : TControllerStock;
  end;

var
  BaseRegistry1: TBaseRegistry1;

implementation

{$R *.dfm}

{ TBaseRegistry1 }

procedure TBaseRegistry1.ClearAllFields;
begin
  inherited;
  //Stock.clear;
  //Stock.Institution.Estabelecimento := 0;
  //Stock.Institution.CodigoStock := 0;
  //Stock.Institution.Ativo := 'N';
end;

procedure TBaseRegistry1.Delete;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.']);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      //Self.Stock.desactiveRegiter;
      //Self.Close;
    End;
  end
  );

end;

procedure TBaseRegistry1.FormatScreen;
begin
  inherited;
  Height := 193;
end;

procedure TBaseRegistry1.InitVariable;
begin
  inherited;
  Stock := TControllerStock.create(Self);
end;

procedure TBaseRegistry1.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TBaseRegistry1.Save;
begin
  inherited;
  with Stock.Registro do
  Begin
    //Codigo := StrToIntDef(E_ID.Text,0);
    //Descricao := E_Description.Text;
  End;
  Stock.save;
  //with Stock.Institution do
  Begin
    //Estabelecimento := GbInstitution;
    //CodigoEstoque := Stock.Registro.Codigo;
    //if chbx_cad_active.Checked then
      //Stock.Institution.Ativo := 'S'
    //else
      //Stock.Institution.Ativo := 'N';
  End;
  //Stock.SaveInstitution;
 // E_ID.Text := IntToStr(Stock.Registro.codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  //CodigoRegistro := Stock.Registro.Codigo;
end;


procedure TBaseRegistry1.SetVariable;
begin
  //CodigoRegistro := Brand.Registro.Codigo;
  inherited;
end;

procedure TBaseRegistry1.ShowData;
begin
  //Brand.getbyKey;
  //if Brand.exist then
  Begin
    //E_ID.Text := IntToStr(Brand.Registro.Codigo);
    //E_Description.Text := Brand.Registro.Descricao;
    //chbx_cad_active.Checked := (Brand.Institution.Ativo = 'S');
  End;
  inherited;

end;

procedure TBaseRegistry1.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TBaseRegistry1.ValidaInsert: boolean;
begin
  inherited;
  //
end;

function TBaseRegistry1.ValidateDelete: boolean;
begin
  Result := true;
end;

function TBaseRegistry1.ValidateSave: boolean;
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
end;

end.
