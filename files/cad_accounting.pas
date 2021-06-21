unit cad_accounting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPageControl,
  uniRadioGroup, uniPanel, uniDateTimePicker, uniGUIClasses, uniEdit, uniLabel,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, ControllerAccounting,
  Data.DB, Datasnap.DBClient, Vcl.Controls, Vcl.Forms;

type
  TCadAccounting = class(TCadEntityFiscal)
    Rg_CadastroAtivo: TUniRadioGroup;
  private
    procedure ShowDataProvider;
    { Private declarations }
  protected
    procedure InitVariable;Override;

    procedure Save;Override;
    procedure SaveAccounting;
    procedure ShowData;Override;
    procedure ShowDataAccounting;

    procedure SetVariable;Override;
    procedure getRegistroExistente;Override;
  public
    { Public declarations }
    Accounting : TControllerAccounting;
  end;

var
  CadAccounting: TCadAccounting;

implementation

{$R *.dfm}

uses MainModule, UnFunctions;

{ TCadAccounting }

procedure TCadAccounting.getRegistroExistente;
begin
  with Accounting do
  Begin
    if ( RG_Pessoa.ItemIndex = 0 ) then
    Begin
      CodigoRegistro := Fiscal.Fisica.getIDbyCPF(unMaskField(E_DocFiscal.Text));
    End
    else
    Begin
      CodigoRegistro := Fiscal.Juridica.getIDbyCnpj(unMaskField(E_DocFiscal.Text));
    End;
    if ( CodigoRegistro > 0 ) then
    Begin
      ShowRegistroExistente(Fiscal);
    End;
  end;
end;

procedure TCadAccounting.InitVariable;
begin
  inherited;
  Accounting := TControllerAccounting.Create(self);
end;

procedure TCadAccounting.Save;
begin
  with Accounting do
  Begin
    saveEntityFiscal( Fiscal);
    SaveAccounting;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadAccounting.SaveAccounting;
begin
  with Accounting do
  Begin
    with Registro do
    Begin
      codigo := Accounting.Fiscal.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      if Rg_CadastroAtivo.ItemIndex = 0 then
        Ativo := 'S'
      else
        Ativo := 'N';
    End;
    save;
  End;
end;

procedure TCadAccounting.SetVariable;
begin
   if CodigoRegistro > 0 then
  Begin
    Accounting.Registro.Codigo := CodigoRegistro;
    Accounting.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Accounting.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Accounting.getAllByKey;
  End;
  inherited;
end;

procedure TCadAccounting.ShowData;
begin
  with Accounting do
  Begin
    ShowDataEntity( Fiscal);
    ShowDataAddress( Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing( Fiscal.Email);
    ShowDataSocialMedia( Fiscal.MidiaSocial);
    ShowDataFiscal( Fiscal);
    ShowDataProvider;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadAccounting.ShowDataAccounting;
begin
   //Estabelecimento
  with Accounting.Registro do
  Begin
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;
  End;
end;

procedure TCadAccounting.ShowDataProvider;
begin
 //
end;

end.
