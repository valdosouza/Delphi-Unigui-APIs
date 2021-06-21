unit cad_clin_professional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_entity_fiscal, Vcl.Menus,
  uniMainMenu, Data.DB, Datasnap.DBClient, uniMultiItem, uniComboBox, uniLabel,
  uniCheckBox, uniMemo, uniPageControl, uniPanel, uniRadioGroup, uniEdit,
  uniGUIClasses, uniDateTimePicker, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses,ControllerClinProfessional, uniBasicGrid, uniDBGrid,
  Datasnap.Provider;

type
  TCadClinProfessional = class(TCadEntityFiscal)
    Rg_CadastroAtivo: TUniRadioGroup;
    pnl_outrasinfo_row_1: TUniPanel;
    tbs_PatientList: TUniTabSheet;
    UniPanel1: TUniPanel;
    DBG_Patient: TUniDBGrid;
    sb_Insert_Items: TUniSpeedButton;
    sb_Delete_Items: TUniSpeedButton;
    cds_patient: TClientDataSet;
    ds_patient: TDataSource;
    cds_patientname_company: TStringField;
    cds_patientid: TIntegerField;
    procedure sb_Insert_ItemsClick(Sender: TObject);
    procedure sb_Delete_ItemsClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowPatientList;
    function validateAddPatient(ID : Integer):Boolean;
    function ValidadeAddPatientList:boolean;
    procedure addPatientList;
    function  validateDeletePatient:Boolean;
    procedure deletePatientList;
    procedure DeletedPAtient;
  protected
    procedure FormatScreen;Override;
    procedure InitVariable;Override;
    procedure EditionControl;Override;

    procedure Save;Override;
    procedure SaveClinProfessional;
    procedure SavePatientList;

    procedure ShowData;Override;
    procedure ShowDataClinProfessional;

    procedure setvariable;override;
    procedure getRegistroExistente;Override;

  public
    { Public declarations }
      Professional : TControllerClinProfessional;
  end;

var
  CadClinProfessional: TCadClinProfessional;

implementation

{$R *.dfm}

uses MainModule,UnFunctions, openForms, sea_clin_patient,unmessages,msg_form;

{ TCadClinProfessional }

procedure TCadClinProfessional.addPatientList;
Var
  Form : TSeaClinPatient;
  LcID : Integer;
  LcNameCompany : String;
begin
  if Form = nil then
    Form := TSeaClinPAtient.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if form.cds_searchid.AsInteger > 0 then
      Begin
        LcID          := form.cds_searchid.AsInteger;
        LcNameCompany := form.cds_searchname_company.AsString;
        MensageYesNo(['C O N F I R M A Ç Ã O!',
                      '',
                      'Deseja realmente vincular este paciente neste cadastro?',
                      'clique em SIM para confirmar.'],mpAlerta);
          FormMsg.ShowModal(
            Procedure(Sender: TComponent; AResult:Integer)
            begin
              if (Sender as TMsgForm).BotaoEscolhido > 0 then
              Begin
                if validateAddPatient(LcID) then
                Begin
                  if not Self.cds_patient.Active then Self.cds_patient.createDataset;
                  Self.cds_patient.Append;
                  Self.cds_patientid.AsInteger := LcID;
                  Self.cds_patientname_company.AsString := LcNameCompany;
                  Self.cds_patient.post;
                End
              End;
            end
          );
      End;
      Form := nil;
    end
  );
end;

procedure TCadClinProfessional.DeletedPAtient;
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_patient.ChangeCount > 0 then
  Begin
    Try
      cds_temp := TClientDataSet.Create(nil);
      cds_temp.Data := cds_patient.Delta;
      cds_temp.First;
      cds_patient.First;
      //Trata somente os dados deletados
      while not cds_temp.eof do
      Begin
        with Professional do
        Begin
          if cds_temp.UpdateStatus = usDeleted then
          Begin
            //Detalhe
            HasPatient.Registro.Paciente        := cds_Temp.FieldByName('id').AsInteger;
            HasPatient.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
            HasPatient.Registro.Profissional    := Registro.Codigo;
            HasPatient.delete;
          End;
        End;
        cds_temp.Next;
      end;
    Finally
      cds_temp.Close;
      cds_temp.DisposeOf;
    End;
  End;
end;

procedure TCadClinProfessional.deletePatientList;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          cds_patient.Delete;
        End;
      end
    );
end;

procedure TCadClinProfessional.EditionControl;
begin
  inherited;

end;

procedure TCadClinProfessional.FormatScreen;
begin
  inherited;
  FrLineBusiness.DBLCB_Lista.FieldLabel := 'Especialidade/Profissão';
end;

procedure TCadClinProfessional.getRegistroExistente;
begin
  with professional do
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

procedure TCadClinProfessional.InitVariable;
begin
  PInterface := 48;
  inherited;
  Professional := TControllerClinProfessional.Create(self);
end;

procedure TCadClinProfessional.Save;
begin
  with Professional do
  Begin
    saveEntityFiscal(Fiscal);
    SaveClinProfessional;
    SaveAddress(Registro.Codigo,Fiscal.Endereco);
    SavePhone(Registro.Codigo,Fiscal.Telefone);
    SaveMailing(Registro.Codigo,'principal',Fiscal.Email);
    SaveSocialMedia(Registro.Codigo,Fiscal.MidiaSocial);
    SavePatientList;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;

end;

procedure TCadClinProfessional.SaveClinProfessional;
begin
  inherited;
  with Professional do
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

procedure TCadClinProfessional.SavePatientList;
begin
  DeletedPAtient;
  if cds_patient.ChangeCount > 0 then
  Begin
    Try
      cds_patient.First;
      //Trata somente os dados Inseridos ou Alterados
      while not cds_patient.eof do
      Begin
        with Professional do
        Begin
          HasPatient.Registro.Paciente        := cds_patient.FieldByName('id').AsInteger;
          HasPatient.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
          HasPatient.Registro.Profissional    := Registro.Codigo;
          case cds_patient.UpdateStatus of
            usInserted: HasPatient.insert;
          end;
        End;
        cds_patient.next;
      End;
    Finally
      cds_patient.MergeChangeLog;
    End;
  End;
end;

procedure TCadClinProfessional.sb_Delete_ItemsClick(Sender: TObject);
begin
  if validateDeletePatient then
    deletePatientList;
end;

procedure TCadClinProfessional.sb_Insert_ItemsClick(Sender: TObject);
begin
  if ValidadeAddPatientList then
    addPatientList;
end;

procedure TCadClinProfessional.setvariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Professional.Registro.Codigo := CodigoRegistro;
    Professional.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Professional.Fiscal.Email.Grupo.Registro.Descricao := 'principal';
    Professional.getAllByKey;
  End;
  inherited
end;

procedure TCadClinProfessional.ShowData;
begin
  with professional do
  Begin
    ShowDataEntity(Fiscal);
    ShowDataAddress(Fiscal.Endereco);
    ShowDataPhone(registro.Codigo, Fiscal.Telefone);
    ShowDataMailing(Fiscal.Email);
    ShowDataSocialMedia(Fiscal.MidiaSocial);
    ShowDataFiscal(Fiscal);
    ShowDataClinProfessional;
    ShowPatientList;
    //Setando a variavel para controle de botãoe (Alterar/Excluir
    CodigoRegistro := Registro.Codigo;
    E_ID.Text := IntToStr(Registro.codigo);
  End;
end;

procedure TCadClinProfessional.ShowDataClinProfessional;
begin
   //Estabelecimento
  with Professional.Registro do
  Begin
    if ( Ativo = 'S' ) then
      Rg_CadastroAtivo.ItemIndex := 0
    else
      Rg_CadastroAtivo.ItemIndex := 1;
  End;
end;

procedure TCadClinProfessional.ShowPatientList;
begin
  with umm.Qr_Crud do
  BEgin
    cds_patient.Active := False;
    Active := False;
    SQL.Clear;
    SQL.Add(concat(
              'select pa.id, pa.name_company ',
              'from tb_clin_professional_has_patient php ',
              '   inner join tb_entity pa ',
              '   on (pa.id = php.tb_clin_patient_id) ',
              'where php.tb_institution_id =:tb_institution_id ',
              'and php.tb_clin_professional_id =:tb_clin_professional_id '
    ));
    ParamByName('tb_institution_id').AsInteger := umm.GInstitution.Registro.Codigo;
    ParamByName('tb_clin_professional_id').AsInteger := Professional.Registro.Codigo;
    Active := True;
    First;
    if not cds_patient.Active then cds_patient.CreateDataSet;
    cds_patient.LogChanges := False;
    cds_patient.EmptyDataSet;
    while not eof do
    Begin
      cds_patient.Append;
      cds_patientid.AsInteger           := FieldByNAme('id').AsInteger;
      cds_patientname_company.AsString  := FieldByNAme('name_company').AsString;
      cds_patient.post;
      Next;
    End;
    cds_patient.LogChanges := True;
  End;
end;

function TCadClinProfessional.ValidadeAddPatientList: boolean;
begin
  Result := True;
  if Professional.Registro.Codigo = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Por favor finalize e salve o este ',
                  'cadastro para continuars.',
                  'Clique em OK para continuar ']);
    Result := False;
  End;
end;

function TCadClinProfessional.validateAddPatient(ID : Integer): Boolean;
begin
  Result := True;
  cds_patient.First;
  if cds_patient.Locate('id',ID,[]) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Este paciente já está na lista.',
                  'Verifique! ']);
    Result := False;
  End;
end;

function TCadClinProfessional.validateDeletePatient: Boolean;
begin
  Result := True;
  if cds_patient.RecordCount = 0 then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não existe registro para excluir.',
                  'Verifique e tente novamente. ']);
    Result := False;
  end;
end;

end.
