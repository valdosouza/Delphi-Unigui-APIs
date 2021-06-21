unit cad_clin_patient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, Data.DB, Datasnap.DBClient, uniMultiItem, uniComboBox, uniLabel,
  uniCheckBox, uniMemo, uniPageControl, uniPanel, uniRadioGroup, uniEdit,
  uniGUIClasses, uniDateTimePicker, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses,fm_clin_module, ControllerClinPatient;

type
  TCadClinPatient = class(TCadEntityFiscal)
    pnl_outrasinfo_row_1: TUniPanel;
    Rg_CadastroAtivo: TUniRadioGroup;
    ctn_clin_module: TUniContainerPanel;
  private
    { Private declarations }
    FrClinModule : TFmClinModule;
    procedure ShowClinModule;

  protected
    procedure FormatScreen;Override;
    procedure InitVariable;Override;
    procedure EditionControl;Override;

    procedure Save;Override;
    procedure SaveClinPatient;

    procedure ShowData;Override;
    procedure ShowDataClinPatient;

    procedure setvariable;override;
    procedure getRegistroExistente;Override;

  public
    { Public declarations }
      Patient : TControllerClinPatient;
  end;

var
  CadClinPatient: TCadClinPatient;

implementation

{$R *.dfm}

uses MainModule,UnFunctions;

{ TCadClinPatient }

procedure TCadClinPatient.EditionControl;
begin
  inherited;
  EditionControler(FrClinModule);
end;

procedure TCadClinPatient.FormatScreen;
begin
  inherited;
  ShowClinModule;
  FrLineBusiness.DBLCB_Lista.FieldLabel := 'Profissão/Ocupação';
end;

procedure TCadClinPatient.getRegistroExistente;
begin
  with Patient do
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

procedure TCadClinPatient.InitVariable;
begin
  PInterface := 50;
  inherited;
  Patient := TControllerClinPatient.Create(self);
end;

procedure TCadClinPatient.Save;
begin
  with Patient do
  Begin
    saveEntityFiscal(Fiscal);
    SaveClinPatient;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.Email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;


end;

procedure TCadClinPatient.SaveClinPatient;
begin
  inherited;
  with Patient do
  Begin
    Registro.codigo := Fiscal.Registro.Codigo;
    Registro.Estabelecimento :=  UMM.GInstitution.registro.Codigo;
    if Rg_CadastroAtivo.ItemIndex = 0 then
      Registro.Ativo := 'S'
    else
      Registro.Ativo := 'N';

    if FrClinModule.DBLCB_Lista.KeyValue <> null then
      Registro.Modulo := FrClinModule.DBLCB_Lista.KeyValue
    else
      Registro.Modulo := 0;
    save;
  End;

end;

procedure TCadClinPatient.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Patient.Registro.Codigo := CodigoRegistro;
    Patient.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Patient.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Patient.getAllByKey;
  End;
  inherited
end;

procedure TCadClinPatient.ShowClinModule;
begin
  FrClinModule := TFmClinModule.Create(Self);
  FrClinModule.Parent := ctn_clin_module;
  FrClinModule.Listar;
  FrClinModule.Show;
  FrClinModule.Align := alClient;
end;

procedure TCadClinPatient.ShowData;
begin
  with Patient do
  Begin
    ShowDataEntity(Fiscal);
    ShowDataAddress(Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing(Fiscal.Email);
    ShowDataSocialMedia(Fiscal.MidiaSocial);
    ShowDataFiscal(Fiscal);
    ShowDataClinPatient;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;


end;

procedure TCadClinPatient.ShowDataClinPatient;
begin
   //Estabelecimento
  with Patient.Registro do
  Begin
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;

    FrClinModule.DBLCB_Lista.KeyValue := Modulo;
  End;

end;

end.
