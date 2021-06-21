unit cad_advertiser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPanel,
  uniPageControl, uniRadioGroup, uniDateTimePicker, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  ControllerAdvertiser, ControllerEntityFiscal, Data.DB, Datasnap.DBClient,
  System.Math, System.StrUtils;

type
  TCadAdvertiser = class(TCadEntityFiscal)
  Rg_CadastroAtivo: TUniRadioGroup;

  private
  protected
    procedure InitVariable;Override;
    procedure setvariable;override;

    procedure ShowData;Override;

    procedure Save;Override;
    procedure SaveAdvertiser;

    procedure getRegistroExistente;Override;
  public
    Advertiser : TControllerAdvertiser;
    procedure ShowDataAdvertiser;
  end;

var
  CadAdvertiser: TCadAdvertiser;

implementation

{$R *.dfm}

uses
  MainModule,
  UnFunctions,
  ClasseUtil;


{ TCadAdvertiser }

procedure TCadAdvertiser.getRegistroExistente;
begin
  with Advertiser do
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

procedure TCadAdvertiser.InitVariable;
begin
  inherited;
  Advertiser := TControllerAdvertiser.Create(self);
  Rg_CadastroAtivo.ItemIndex := 0;
end;

procedure TCadAdvertiser.Save;
begin
  with Advertiser do
  Begin
    saveEntityFiscal(Fiscal);
    SaveAdvertiser;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.Email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;

end;

procedure TCadAdvertiser.SaveAdvertiser;
begin
  inherited;
  with Advertiser do
  Begin
    Registro.Codigo := Fiscal.Registro.Codigo;
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Registro.Ativo  := IfThen(Rg_CadastroAtivo.ItemIndex=0,'S','N');
    Registro.DataRegistro  := E_DateRegistry.DateTime;
    Registro.RegistroCriado := Now();
    Registro.RegistroAlterado := Now();
    Save;
  End;
end;


procedure TCadAdvertiser.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Advertiser.Registro.Codigo := CodigoRegistro;
    Advertiser.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Advertiser.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Advertiser.getAllByKey;
  End;
  inherited
end;

procedure TCadAdvertiser.ShowData;
begin
  with advertiser do
  Begin
    ShowDataEntity( Fiscal);
    ShowDataAddress( Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing( Fiscal.Email);
    ShowDataSocialMedia(Fiscal.MidiaSocial);
    ShowDataFiscal( Fiscal);
    ShowDataAdvertiser;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;


procedure TCadAdvertiser.ShowDataAdvertiser;
begin
  inherited;
  Advertiser.Registro.Codigo := CodigoRegistro;
  Advertiser.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Advertiser.getbyKey;
  with Advertiser.Registro do
  Begin
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;
  End;
end;


end.
