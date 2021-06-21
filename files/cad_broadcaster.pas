 unit cad_broadcaster;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPanel,
  uniPageControl, uniRadioGroup, uniDateTimePicker, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  ControllerBroadcaster,ControllerEntityFiscal, Data.DB, Datasnap.DBClient,
  System.StrUtils;

type
  TCadBroadCaster = class(TCadEntityFiscal)
    Rg_CadastroAtivo: TUniRadioGroup;
    Lista1: TUniMenuItem;
    UniLabel6: TUniLabel;
    Cb_kind_media: TUniComboBox;
    E_kickback: TUniFormattedNumberEdit;
    UniLabel13: TUniLabel;
    Lb_kickback: TUniLabel;
    abelaOnLine1: TUniMenuItem;
    abelaPortal1: TUniMenuItem;
    iragem1: TUniMenuItem;
    procedure Lista1Click(Sender: TObject);
    procedure abelaOnLine1Click(Sender: TObject);
    procedure abelaPortal1Click(Sender: TObject);
    procedure iragem1Click(Sender: TObject);
  private
  protected
    procedure InitVariable;Override;
    procedure setvariable;override;

    procedure ShowData;Override;

    procedure Save;Override;
    procedure getRegistroExistente;Override;

  public
    Broadcaster : TControllerBroadcaster;
    procedure SaveBroadcaster;
    procedure ShowDataBroadcaster;
  end;

var
  CadBroadCaster: TCadBroadCaster;

implementation

{$R *.dfm}

uses
  MainModule,
  UnFunctions,
  openForms,
  ClasseUtil;

{ TCadBroadCaster }

procedure TCadBroadCaster.abelaOnLine1Click(Sender: TObject);
begin
  openCadMedPriceListRT(Broadcaster.Registro.Codigo);
end;

procedure TCadBroadCaster.abelaPortal1Click(Sender: TObject);
begin
  openCadMedPriceListON(Broadcaster.Registro.Codigo);
end;

procedure TCadBroadCaster.getRegistroExistente;
begin
  with Broadcaster do
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

procedure TCadBroadCaster.InitVariable;
begin
  inherited;
  Broadcaster := TControllerBroadcaster.Create(self);
end;

procedure TCadBroadCaster.iragem1Click(Sender: TObject);
begin
  inherited;
  openCadMedBroadCasterCoverage(Broadcaster.Registro.Codigo);
end;

procedure TCadBroadCaster.Lista1Click(Sender: TObject);
begin
  openCadMedPriceListJR(Broadcaster.Registro.Codigo);
end;

procedure TCadBroadCaster.Save;
begin
  with Broadcaster do
  Begin
    saveEntityFiscal(Fiscal);
    SaveBroadcaster;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;


procedure TCadBroadCaster.SaveBroadcaster;
begin
  inherited;
  with Broadcaster do
  Begin
    with Registro do
    Begin
      Codigo := Fiscal.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      TipoMidia := Cb_kind_media.ItemIndex;
      AliqComissao := StrToFloatDef( E_kickback.Text,0);
      Ativo := IfThen(Rg_CadastroAtivo.ItemIndex = 0, 'S','N');
      DataRegistro := E_DateRegistry.DateTime;
      RegistroCriado := Now();
      RegistroAlterado :=  Now();
    End;
    Save;
  End;
end;

procedure TCadBroadCaster.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    Broadcaster.Registro.Codigo := CodigoRegistro;
    Broadcaster.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Broadcaster.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Broadcaster.getAllByKey;
  End;
  inherited
end;

procedure TCadBroadCaster.ShowData;
begin
  with BroadCaster do
  Begin
    ShowDataEntity(Fiscal);
    ShowDataAddress(Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing(Fiscal.email);
    ShowDataSocialMedia(Fiscal.MidiaSocial);
    ShowDataFiscal(Fiscal);
    ShowDataBroadcaster;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadBroadCaster.ShowDataBroadcaster;
begin
  inherited;
  Broadcaster.Registro.Codigo := Broadcaster.Registro.Codigo;
  Broadcaster.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Broadcaster.getbyKey;
  with Broadcaster.Registro do
  Begin
    Cb_kind_media.ItemIndex := TipoMidia;
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;
    E_kickback.Text := FloatToStrF(AliqComissao,ffFixed,10,2) ;
  End;
end;


end.
