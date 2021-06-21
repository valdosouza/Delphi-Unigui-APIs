unit cad_bank_historic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel,  MainModule, msg_form, unmessages, fm_bank, ControllerBankHistoric,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadBankHistoric = class(TBaseRegistry)
    E_ID: TUniEdit;
    E_Description: TUniEdit;
    Ctn_Bank: TUniContainerPanel;
    pnl_row_1: TUniPanel;
    procedure InitVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    procedure EditionControl;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure Delete;Override;
    procedure setVariable; override;
  private
    { Private declarations }
    procedure ShowBank;
  public
    { Public declarations }
    Bank_id : Integer;
    FrBank : TFmBank;
    BankHistoric : TControllerBankHistoric;
  end;

var
  CadBankHistoric: TCadBankHistoric;

implementation

{$R *.dfm}

uses openForms;

{ TCadBankHistoric }

procedure TCadBankHistoric.ClearAllFields;
begin
  inherited;
  ClearFields(FrBank);
  BankHistoric.clear;
end;

procedure TCadBankHistoric.Delete;
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
          BankHistoric.delete;
          ClearAllFields;
        End;
      end
    );

end;

procedure TCadBankHistoric.EditionControl;
begin
  inherited;
  EditionControler(FrBank);
end;

procedure TCadBankHistoric.FormatScreen;
begin
 inherited;
  ShowBank;
end;

procedure TCadBankHistoric.InitVariable;
begin
  inherited;
  BankHistoric := TControllerBankHistoric.Create(self);
end;

procedure TCadBankHistoric.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadBankHistoric.Save;
begin
  BankHistoric.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  BankHistoric.Registro.Descricao := E_Description.Text;
  BankHistoric.Registro.Banco := FrBank.DBLCB_Lista.KeyValue;
  BankHistoric.save;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := BankHistoric.Registro.Codigo;
  E_ID.Text := IntToStr(BankHistoric.Registro.codigo);
end;

procedure TCadBankHistoric.setVariable;
begin
  BankHistoric.Registro.Codigo := CodigoRegistro ;
  BankHistoric.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  BankHistoric.Registro.Banco := Bank_id;
  BankHistoric.getbyKey;
  inherited;
end;

procedure TCadBankHistoric.ShowBank;
begin
  FrBank := TfmBank.Create(Self);
  FrBank.Parent := Ctn_Bank;
  FrBank.Listar;
  FrBank.Align := alClient;
  FrBank.Show;
end;

procedure TCadBankHistoric.ShowData;
begin
 with BankHistoric.Registro do
 Begin
  E_ID.Text := IntToStr(Codigo);
  E_Description.Text := Descricao;
  FrBank.DBLCB_Lista.KeyValue := Banco;
 End;
end;

procedure TCadBankHistoric.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

function TCadBankHistoric.ValidaInsert: boolean;
begin
 Result := True;
end;

function TCadBankHistoric.ValidateSave: boolean;
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
