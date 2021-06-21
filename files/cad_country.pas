unit cad_country;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniScrollBox, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniGUIClasses, uniPanel, uniEdit, uniLabel,ControllerCountry, UnFunctions,
  Data.DB, Datasnap.DBClient;

type
  TCadCountry = class(TBaseRegistry)
    L_Descricao: TUniLabel;
    L_Codigo: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
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
    Country : TControllerCountry;
  end;

var
  CadCountry: TCadCountry;

implementation

{$R *.dfm}

uses msg_form, unMessages;

{ TCadCountry }


procedure TCadCountry.Delete;
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
        Self.Country.delete;
        Self.Close;
      End;
    end
  );
end;


procedure TCadCountry.InitVariable;
begin
  inherited;
  Country := TControllerCountry.create(nil);
end;

procedure TCadCountry.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;

end;

procedure TCadCountry.Save;
begin
  inherited;
  with Country.Registro do
  Begin
    Codigo := StrToIntDef(E_ID.Text,0);
    Nome := E_Description.Text;
  End;
  Country.save;
  E_ID.Text := IntToStr(Country.Registro.codigo);
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Country.Registro.Codigo;
end;

procedure TCadCountry.SetVariable;
begin
  Country.Registro.Codigo := CodigoRegistro;
  Country.getByKey;
  inherited;
end;

procedure TCadCountry.ShowData;
begin
  if Country.exist then
  Begin
    E_ID.Text := IntToStr(Country.Registro.Codigo);
    E_Description.Text := Country.Registro.Nome;
  End;
  inherited;
end;

procedure TCadCountry.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadCountry.ValidaInsert: boolean;
begin
  inherited;
  //
end;

function TCadCountry.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadCountry.ValidateSave: boolean;
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
