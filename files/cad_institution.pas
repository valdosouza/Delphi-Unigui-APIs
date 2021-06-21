unit cad_institution;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPanel,
  uniPageControl, uniRadioGroup, uniDateTimePicker, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, ControllerInstitution,
  Data.DB, Datasnap.DBClient,tblEntity;

type
  TCadInstitution = class(TCadEntityFiscal)
    Rg_CadastroAtivo: TUniRadioGroup;
    procedure UsuariosClick(Sender: TObject);

  private
    { Private declarations }
  protected
    procedure InitVariable;Override;

    procedure Save;Override;
    procedure SaveInstitution(Entidade:TEntity);

    procedure ShowData;Override;
    procedure ShowDataInstitution;

    procedure SetVariable;Override;

    procedure getRegistroExistente;Override;
  public
    { Public declarations }
    Institution : TControllerInstitution;
  end;

var
  CadInstitution: TCadInstitution;

implementation

{$R *.dfm}

uses UnFunctions, MainModule, openForms;

{ TCadInstitution }


procedure TCadInstitution.getRegistroExistente;
begin
  with Institution do
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

procedure TCadInstitution.InitVariable;
begin
  inherited;
  Institution := TControllerInstitution.Create(self);
end;

procedure TCadInstitution.Save;
begin
  with Institution do
  Begin
    saveEntityFiscal(Fiscal);
    SaveInstitution(Fiscal.Registro);
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.email);
    SaveSocialMedia(Registro.Codigo,Fiscal.Midiasocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadInstitution.SaveInstitution(Entidade:TEntity);
begin
  Institution.Registro.Codigo := Entidade.Codigo;
  if Rg_CadastroAtivo.ItemIndex = 0 then
    Institution.Registro.Ativo := 'S'
  else
    Institution.Registro.Ativo := 'N';
  Institution.save;
end;

procedure TCadInstitution.SetVariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Institution.Registro.Codigo := CodigoRegistro;
    Institution.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Institution.getAllByKey;
  End;
  inherited;

end;

procedure TCadInstitution.ShowData;
begin
  with Institution do
  Begin
    ShowDataEntity( Fiscal);
    ShowDataFiscal( Fiscal);
    ShowDataAddress( Fiscal.endereco);
    ShowDataPhone(Registro.Codigo, Fiscal.Telefone);
    ShowDataMailing( Fiscal.email);
    ShowDataSocialMedia( Fiscal.MidiaSocial);
    ShowDataInstitution;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;


procedure TCadInstitution.ShowDataInstitution;
begin
  //Estabelecimento
  with Institution.Registro do
  Begin
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;
  End;
end;


procedure TCadInstitution.UsuariosClick(Sender: TObject);
begin
  openSeaUser(UMM.GInstitution.registro.Codigo);
end;

end.
