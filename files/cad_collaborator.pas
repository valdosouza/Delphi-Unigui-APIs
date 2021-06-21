unit cad_collaborator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, uniMultiItem, uniComboBox, uniCheckBox, uniMemo, uniPanel,
  uniPageControl, uniRadioGroup, uniDateTimePicker, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, ControllerCollaborator,
  MainModule, ControllerEntityFiscal, Data.DB, Datasnap.DBClient;

type
  TCadCollaborator = class(TCadEntityFiscal)
    UniLabel4: TUniLabel;
    E_Father: TUniEdit;
    UniLabel5: TUniLabel;
    E_Mother: TUniEdit;
    UniLabel6: TUniLabel;
    E_military: TUniEdit;
    UniLabel7: TUniLabel;
    E_Salary: TUniEdit;
    UniLabel8: TUniLabel;
    E_title: TUniEdit;
    UniLabel9: TUniLabel;
    E_zone: TUniEdit;
    UniLabel10: TUniLabel;
    E_secção: TUniEdit;
    UniLabel11: TUniLabel;
    E_Pis: TUniEdit;
    l_date_adm: TUniLabel;
    UniLabel13: TUniLabel;
    Dt_adm: TUniDateTimePicker;
    Dt_Dem: TUniDateTimePicker;
    Rg_CadastroAtivo: TUniRadioGroup;
  protected
    procedure FormatScreen;Override;
    procedure InitVariable;Override;

    procedure Save;Override;
    procedure SaveCollaborator;

    procedure ShowData;Override;
    procedure ShowDataCollaborator;

    procedure setvariable;override;
    procedure getRegistroExistente;Override;
  private
    { Private declarations }
  public
    { Public declarations }
    Collaborator : TControllerCollaborator;
  end;

var
  CadCollaborator: TCadCollaborator;

implementation

{$R *.dfm}

uses UnFunctions;

{ TCadEntityFiscal1 }




procedure TCadCollaborator.FormatScreen;
begin
  inherited;
end;

procedure TCadCollaborator.getRegistroExistente;
begin
  with Collaborator do
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

procedure TCadCollaborator.InitVariable;
begin
  inherited;
  Collaborator := TControllerCollaborator.Create(self);
end;

procedure TCadCollaborator.Save;
begin
  with Collaborator do
  Begin
    saveEntityFiscal(Fiscal);
    SaveCollaborator;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.Email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;


procedure TCadCollaborator.SaveCollaborator;
begin
inherited;
  with Collaborator.Registro do
  Begin
    Codigo := Collaborator.Fiscal.Registro.Codigo;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Salario := StrToFloatDef(E_Salary.Text,0);
    Pai := E_Father.Text;
    Mamae := E_Mother.Text;
    Titulo := E_title.Text;
    Zona := E_zone.Text;
    Sessão := E_secção.Text;
    Certificado := E_military.Text;
    DataAdmissao := Dt_adm.DateTime;
    DataDemissao := Dt_Dem.DateTime;
    Pis := E_Pis.Text;

    if ( Rg_CadastroAtivo.ItemIndex = 0 ) then
       Ativo := 'S'
    else
      Ativo := 'N';

  End;
  Collaborator.save;
end;

procedure TCadCollaborator.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Collaborator.Registro.Codigo := CodigoRegistro;
    Collaborator.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Collaborator.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Collaborator.getAllByKey;
  End;
  inherited
end;

procedure TCadCollaborator.ShowData;
begin
  with Collaborator do
  Begin
    ShowDataEntity(Fiscal);
    ShowDataAddress(Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing(Fiscal.Email);
    ShowDataSocialMedia(Fiscal.MidiaSocial);
    ShowDataFiscal(Fiscal);
    ShowDataCollaborator;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadCollaborator.ShowDataCollaborator;
begin
  inherited;
  with Collaborator do
  Begin
    with Registro do
    Begin
      Codigo := Collaborator.Registro.Codigo;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      E_Salary.Text := FloatToStrF(Salario,fffixed,10,2);
      E_Father.Text := Pai;
      E_Mother.Text := Mamae;
      E_title.Text := Titulo;
      E_zone.Text := Zona;
      E_secção.Text := Sessão;
      E_military.Text := Certificado;
      Dt_adm.DateTime := DataAdmissao;
      E_Pis.Text := Pis;
     // Dt_Dem.DateTime := DataDemissao;
      if ( Ativo = 'S' ) then
        Rg_CadastroAtivo.ItemIndex := 0
      else
        Rg_CadastroAtivo.ItemIndex := 1;
    End;
    save;
  End;
end;

end.
