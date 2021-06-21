unit tas_check_ctrl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniBasicGrid, uniDBGrid, uniPageControl, uniDateTimePicker,
  uniRadioGroup, uniEdit, uniLabel, ControllerCheckCtrl, msg_form, unmessages,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TTasCheckCtrl = class(TBaseRegistry)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    E_ID: TUniEdit;
    Rg_Kind: TUniRadioGroup;
    UniLabel2: TUniLabel;
    Dtp_check_date: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    E_issuer: TUniEdit;
    UniLabel4: TUniLabel;
    E_bank_number: TUniEdit;
    UniLabel5: TUniLabel;
    E_bank_agency: TUniEdit;
    E_account: TUniEdit;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    TUniEdit: TUniEdit;
    UniLabel8: TUniLabel;
    E_check_value: TUniEdit;
    UniLabel9: TUniLabel;
    UniEdit8: TUniEdit;
    UniLabel10: TUniLabel;
    UniEdit9: TUniEdit;
    UniDateTimePicker2: TUniDateTimePicker;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniEdit10: TUniEdit;
    UniEdit11: TUniEdit;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniTabSheet2: TUniTabSheet;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    UniDBGrid1: TUniDBGrid;
    UniDBGrid2: TUniDBGrid;
    procedure InitVariable;Override;
    procedure setVariable; override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function  ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function  ValidateSave: boolean;Override;
    procedure Save;Override;
    function  ValidateDelete: boolean;
    procedure Delete;Override;
    { Private declarations }
  public
    { Public declarations }
    CheckCtrl : TControllerCheckCtrl;

  end;

var
  TasCheckCtrl: TTasCheckCtrl;

implementation

{$R *.dfm}

uses openForms, MainModule;

{ TTasCheckCtrl }

procedure TTasCheckCtrl.ClearAllFields;
begin
  inherited;
  CheckCtrl.clear;
end;

procedure TTasCheckCtrl.Delete;
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
          CheckCtrl.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TTasCheckCtrl.InitVariable;
begin
  inherited;
  CheckCtrl := TControllerCheckCtrl.Create(self);
end;

procedure TTasCheckCtrl.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasCheckCtrl.Save;
begin
  with CheckCtrl.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    if Rg_Kind.ItemIndex = 0 then
      tipo := 'P'
     else
      tipo := 'T';
    DataCheque := Dtp_check_date.DateTime;
    Emitente := E_issuer.Text;
    NumeroBanco := E_bank_number.Text;
    AgenciaBanco := E_bank_agency.Text;
    Conta := E_account.Text;
    ValorCheque := StrToFloatDef(E_check_value.Text,0);
  End;
  CheckCtrl.save;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := CheckCtrl.Registro.Codigo;
  E_ID.Text := IntToStr(CheckCtrl.Registro.codigo);
end;

procedure TTasCheckCtrl.setVariable;
begin
  CheckCtrl.Registro.Codigo := CodigoRegistro;
  CheckCtrl.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  CheckCtrl.getAllByKey;
  inherited
end;

procedure TTasCheckCtrl.ShowData;
begin
 with CheckCtrl.Registro do
 Begin
   E_ID.Text := IntToStr(CheckCtrl.Registro.Codigo);
   if Tipo = 'P' then
      Rg_Kind.ItemIndex := 0
     else
      Rg_Kind.ItemIndex := 1;
   Dtp_check_date.DateTime := DataCheque;
   E_issuer.Text := Emitente;
   E_bank_number.Text := NumeroBanco;
   E_bank_agency.Text := AgenciaBanco;
   E_account.Text := Conta;
   E_check_value.Text := FloatToStrF(ValorCheque,ffFixed,10,2);
 End;
end;

procedure TTasCheckCtrl.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

function TTasCheckCtrl.ValidaInsert: boolean;
begin
  Result := True;
end;

function TTasCheckCtrl.ValidateDelete: boolean;
begin
 Result := True;
end;

function TTasCheckCtrl.ValidateSave: boolean;
begin
 Result := True;

  if trim( E_issuer.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Emitente não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim( E_bank_number.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Banco não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim( E_bank_agency.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Agência não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim( E_check_value.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Valor não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

end.
