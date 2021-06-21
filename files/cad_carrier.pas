unit cad_carrier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPanel,
  uniPageControl, uniRadioGroup, uniDateTimePicker, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  ControllerCarrier, MainModule,ControllerEntityFiscal, Data.DB,
  Datasnap.DBClient;

type
  TCadCarrier = class(TCadEntityFiscal)
    Rg_CadastroAtivo: TUniRadioGroup;
  private
    { Private declarations }
  protected
    procedure InitVariable;Override;

    procedure Save;Override;
    procedure SaveCarrier;

    procedure ShowData;Override;
    procedure ShowDataCarrier;

    procedure setvariable;override;
    procedure getRegistroExistente;Override;
  public
    { Public declarations }
    carrier : TControllerCarrier;
  end;

var
  CadCarrier: TCadCarrier;

implementation

{$R *.dfm}

uses UnFunctions;

{ TCadCarrier }

procedure TCadCarrier.getRegistroExistente;
begin
  with carrier do
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

procedure TCadCarrier.InitVariable;
begin
  inherited;
  carrier := TControllerCarrier.Create(self);
end;

procedure TCadCarrier.Save;
begin
  with Carrier do
  Begin
    saveEntityFiscal(Fiscal);
    SaveCarrier;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.Email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;

end;


procedure TCadCarrier.SaveCarrier;
begin
  with carrier do
  Begin
    Registro.codigo := Fiscal.Registro.Codigo;
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    if Rg_CadastroAtivo.ItemIndex = 0 then
      Registro.Ativo := 'S'
    else
      Registro.Ativo := 'N';
    save;
  End;
end;


procedure TCadCarrier.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Carrier.Registro.Codigo := CodigoRegistro;
    Carrier.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Carrier.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Carrier.getAllByKey;
  End;
  inherited
end;

procedure TCadCarrier.ShowData;
begin
  with Carrier do
  Begin
    ShowDataEntity( Fiscal);
    ShowDataAddress( Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing( Fiscal.Email);
    ShowDataSocialMedia( Fiscal.MidiaSocial);
    ShowDataFiscal( Fiscal);
    ShowDataCarrier;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;

end;


procedure TCadCarrier.ShowDataCarrier;
begin
    //Estabelecimento
  with Carrier.Registro do
  Begin
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;
  End;
end;


end.
