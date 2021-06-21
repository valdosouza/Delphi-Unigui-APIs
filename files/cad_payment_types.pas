unit cad_payment_types;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniCheckBox, uniEdit, uniLabel, ControllerPaymentTypes, UnFunctions,
  Data.DB, Datasnap.DBClient;

type
  TCadPaymentTypes = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
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
    PaymentTypes : TControllerPaymentTypes;
  end;

var
  CadPaymentTypes: TCadPaymentTypes;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;

{ TCadPaymentTypes }

procedure TCadPaymentTypes.ClearAllFields;
begin
  inherited;
  PaymentTypes.clear;
  PaymentTypes.Institution.Estabelecimento := 0;
  PaymentTypes.Institution.TipoPagamento := 0;
  PaymentTypes.Institution.Ativo := 'N';
end;

procedure TCadPaymentTypes.Delete;
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
          Self.PaymentTypes.desactiveRegiter;
          Self.Close;
        End;
      end
    );
end;


procedure TCadPaymentTypes.InitVariable;
begin
  inherited;
  PaymentTypes := TControllerPaymentTypes.create(Self);
end;

procedure TCadPaymentTypes.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadPaymentTypes.Save;
begin
  inherited;
  with PaymentTypes.Registro do
  Begin
    Descricao := E_Description.Text;
  End;
  with PaymentTypes.Institution do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    if chbx_cad_active.Checked then
      PaymentTypes.Institution.Ativo := 'S'
    else
      PaymentTypes.Institution.Ativo := 'N';
  End;
  PaymentTypes.saveByDescription;
 //Setando a variavel para controle de botãoe (Alterar/Excluir
 CodigoRegistro := PaymentTypes.Registro.Codigo;
 E_ID.Text := IntToStr(PaymentTypes.Registro.codigo);
end;

procedure TCadPaymentTypes.SetVariable;
begin
  PaymentTypes.Registro.Codigo := CodigoRegistro;
  PaymentTypes.Institution.Estabelecimento := UMM.GInstitution.registro.Codigo;
  PaymentTypes.getbyKey;
  inherited;
end;

procedure TCadPaymentTypes.ShowData;
begin
  if PaymentTypes.exist then
  Begin
    E_ID.Text := IntToStr(PaymentTypes.Registro.Codigo);
    E_Description.Text := PaymentTypes.Registro.Descricao;
    chbx_cad_active.Checked := (PaymentTypes.Institution.Ativo = 'S');
  End;
  inherited;
end;

procedure TCadPaymentTypes.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadPaymentTypes.ValidaInsert: boolean;
begin
  inherited;
  //
end;

function TCadPaymentTypes.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadPaymentTypes.ValidateSave: boolean;
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

