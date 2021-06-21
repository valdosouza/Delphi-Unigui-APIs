unit cad_agency;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Data.DB, Datasnap.DBClient, Vcl.Menus, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, uniMainMenu, uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPanel,
  uniPageControl, uniRadioGroup, uniDateTimePicker, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  cad_entity_fiscal,
  ControllerAgency,
  ControllerLineBusiness,
  ControllerEntityFiscal, System.Math;

type
  TCadAgency = class(TCadEntityFiscal)
  Rg_CadastroAtivo: TUniRadioGroup;
    E_kickback: TUniFormattedNumberEdit;
    UniLabel13: TUniLabel;
    Lb_kickback: TUniLabel;
  private
  protected
    procedure setvariable;override;
    procedure InitVariable;Override;

    procedure Insert;Override;

    procedure Save;Override;
    procedure ShowData;Override;
    procedure getRegistroExistente;Override;
  public
    agency: TControllerAgency;
    procedure SaveAgency;
    procedure ShowDataAgency;
   end;

var
  CadAgency: TCadAgency;

implementation

{$R *.dfm}

uses
  MainModule,
  UnFunctions, ClasseUtil;

{ TCadAgency }

procedure TCadAgency.getRegistroExistente;
begin
  with agency do
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

procedure TCadAgency.InitVariable;
begin
  inherited;
  agency := TControllerAgency.Create(self);
end;


procedure TCadAgency.Insert;
begin
  inherited;
  rg_CadastroAtivo.ItemIndex := 0;
end;

procedure TCadAgency.Save;
begin
  with Agency do
  Begin
    saveEntityFiscal(Fiscal);
    SaveAgency;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.Email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;


procedure TCadAgency.SaveAgency;
begin
  with Agency do
  Begin
    Registro.Codigo := Fiscal.Registro.Codigo;
    Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Registro.DataRegistro := Now();
    if (Rg_CadastroAtivo.ItemIndex = 0 ) then
      Registro.Ativo := 'S'
    else
      Registro.Ativo := 'N';
    Registro.AliqComissao := StrToFloatDef( E_kickback.Text,0);
    Registro.RegistroCriado := Now();
    Registro.RegistroAlterado := Now();
    Save;
  End;
end;

procedure TCadAgency.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Agency.Registro.Codigo := CodigoRegistro;
    Agency.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Agency.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Agency.getAllByKey;
  End;
  inherited
end;

procedure TCadAgency.ShowData;
begin
  with Agency do Begin
    ShowDataEntity(Fiscal);
    ShowDataAddress(Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing(Fiscal.Email);
    ShowDataSocialMedia(Fiscal.MidiaSocial);
    ShowDataFiscal(Fiscal);
    ShowDataAgency;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
    Rg_CadastroAtivo.ItemIndex := 0;
  End;
end;

procedure TCadAgency.ShowDataAgency;
begin
   inherited;
  Agency.Registro.Codigo := CodigoRegistro;
  Agency.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Agency.getbyKey;
  E_DateRegistry.DateTime := agency.Registro.DataRegistro;
  Rg_CadastroAtivo.ItemIndex := IfThen(Agency.Registro.Ativo='S',0,1);
  E_kickback.Text := FloatToStrF(Agency.Registro.AliqComissao,ffFixed,10,2) ;
end;


end.
