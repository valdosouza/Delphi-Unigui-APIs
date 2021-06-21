unit cad_bank_charge_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniGUIClasses, uniEdit,
  uniLabel, Vcl.Menus, uniMainMenu, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, ControllerBankChargeKind, MainModule, msg_form, unmessages, fm_bank,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadBankChargeKind = class(TBaseRegistry)
    pnl_row_2: TUniPanel;
    E_Id: TUniEdit;
    E_Abbreviation: TUniEdit;
    E_Description: TUniEdit;
    pnl_row_1: TUniPanel;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure EditionControl;Override;
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
    procedure ShowBank;
  public
    { Public declarations }
    Bank_id : Integer;
    BankChargeKind : TControllerBankChargeKind;
    FrBank : TFmBank;
  end;

var
  CadBankChargeKind: TCadBankChargeKind;

implementation

{$R *.dfm}

uses openForms;

{ TCadBankChargeKind }

procedure TCadBankChargeKind.ClearAllFields;
begin
  inherited;
  ClearFields(FrBank);
  BankChargeKind.clear;
end;

procedure TCadBankChargeKind.Delete;
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
          BankChargeKind.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TCadBankChargeKind.EditionControl;
begin
  inherited;
  EditionControler(FrBank);
end;

procedure TCadBankChargeKind.InitVariable;
begin
  inherited;
  BankChargeKind := TControllerBankChargeKind.Create(self);
end;

procedure TCadBankChargeKind.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadBankChargeKind.Save;
begin
  inherited;
  BankChargeKind.Registro.Abreviacao := E_Abbreviation.Text;
  BankChargeKind.Registro.Descricao := E_Description.Text;
  BankChargeKind.Registro.Banco := FrBank.DBLCB_Lista.KeyValue;
  BankChargeKind.save;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := BankChargeKind.Registro.Codigo;
  E_ID.Text := IntToStr(BankChargeKind.Registro.codigo);
end;

procedure TCadBankChargeKind.setVariable;
begin
  BankChargeKind.Registro.Codigo := CodigoRegistro;
  BankChargeKind.Registro.Banco := Bank_id;
  BankChargeKind.getbyKey;
  inherited;
end;

procedure TCadBankChargeKind.ShowBank;
begin
  FrBank := TfmBank.Create(Self);
//  FrBank.Parent := Ctn_Bank;
  FrBank.Listar;
  FrBank.Align := alClient;
  FrBank.Show;
end;

procedure TCadBankChargeKind.ShowData;
begin
 E_ID.Text := IntToStr(BankChargeKind.Registro.Codigo);
 E_Description.Text := BankChargeKind.Registro.Descricao;
 E_Abbreviation.Text := BankChargeKind.Registro.Abreviacao;
 FrBank.DBLCB_Lista.KeyValue := BankChargeKind.Registro.Banco;
end;

procedure TCadBankChargeKind.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadBankChargeKind.ValidaInsert: boolean;
begin
 Result := True;
end;

function TCadBankChargeKind.ValidateDelete: boolean;
begin
 Result := True;
end;

function TCadBankChargeKind.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Nome não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;

   if trim( FrBank.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Banco não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;

end.
