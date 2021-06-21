unit cad_provider;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPanel,
  uniPageControl, uniRadioGroup, uniDateTimePicker, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, ControllerProvider,
  ControllerEntityFiscal,
  ControllerSocialMedia,
  ControllerMailing,
  ControllerPhone,
  ControllerAddress, Data.DB, Datasnap.DBClient;

type
  TCadProvider = class(TCadEntityFiscal)
    Rg_CadastroAtivo: TUniRadioGroup;
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;
    procedure Save;Override;
    procedure SaveProvider;
    procedure ShowData;Override;
    procedure ShowDataProvider;

    procedure SetVariable;Override;

    procedure getRegistroExistente;Override;
  public
    { Public declarations }
    provider : TControllerProvider;
  end;

var
  CadProvider: TCadProvider;

implementation

{$R *.dfm}

uses MainModule, UnFunctions;

{ TCadProvider }


procedure TCadProvider.getRegistroExistente;
begin
  with provider do
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
  End;

end;

procedure TCadProvider.InitVariable;
begin
  inherited;
  provider := TControllerProvider.Create(self);
end;

procedure TCadProvider.Save;
begin
  with provider do
  Begin
    saveEntityFiscal(Fiscal);
    SaveProvider;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.Email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadProvider.SaveProvider;
begin
  with Provider do
  Begin
    Registro.codigo := Fiscal.Registro.Codigo;
    Registro.Estabelecimento :=  UMM.GInstitution.registro.Codigo;
    if Rg_CadastroAtivo.ItemIndex = 0 then
      Registro.Ativo := 'S'
    else
      Registro.Ativo := 'N';
    save;
  End;
end;


procedure TCadProvider.SetVariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Provider.Registro.Codigo := CodigoRegistro;
    Provider.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Provider.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Provider.getAllByKey;
  End;
  inherited
end;

procedure TCadProvider.ShowData;
begin
  with provider do
  Begin
    ShowDataEntity(Fiscal);
    ShowDataAddress(Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing(Fiscal.Email);
    ShowDataSocialMedia(Fiscal.MidiaSocial);
    ShowDataFiscal(Fiscal);
    ShowDataProvider;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadProvider.ShowDataProvider;
begin
   //Estabelecimento
  with Provider.Registro do
  Begin
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;
  End;
end;


end.
