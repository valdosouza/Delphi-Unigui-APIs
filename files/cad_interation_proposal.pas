unit cad_interation_proposal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_interation, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniPanel, uniMemo, uniGUIClasses, uniEdit,
  uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniDateTimePicker, fm_customer, fm_situation, UnFunctions, MainModule,
  ControllerProposal, uniPageControl, Datasnap.Provider, uniFileUpload,
  uniBasicGrid, uniDBGrid, unmessages, uniHTMLMemo;

type
  TCadInterationProposal = class(TCadInteration)
    E_tag_value: TUniEdit;
    DTP_forecast_time: TUniDateTimePicker;
  private
    { Private declarations }
  protected
    procedure SetVariable;Override;
    procedure ShowData;Override;
    //Deletar
    function ValidateDelete():boolean;Override;
    procedure Delete;Override;
    //Salvar
    function ValidateSave():boolean;Override;
    procedure Save;Override;
    function ValidateSaveBeforeAtachament():Boolean;Override;
    procedure SaveBeforeAtachament;Override;
    procedure SaveProposal;
  public

  end;

var
  CadInterationProposal: TCadInterationProposal;

implementation

{$R *.dfm}

{ TCadInterationProposal }

procedure TCadInterationProposal.Delete;
begin
  inherited;
end;

procedure TCadInterationProposal.Save;
begin
  inherited;
  SaveProposal;
end;

procedure TCadInterationProposal.SaveBeforeAtachament;
begin
  inherited;
  if (EditionState = 'I') then
    SaveProposal;
  //depois de salvar temos que mudar o estado de edidçao para E, evitando cadstro duplo
  EditionState := 'E';
end;

procedure TCadInterationProposal.SaveProposal;
begin
  with Interation.Proposal do
  Begin
    with Registro do
    Begin
      Estabelecimento   := Interation.Order.Registro.Estabelecimento ;
      Ordem             := Interation.Order.Registro.Codigo;
      Iteracao          := Interation.registro.codigo;
      Valor             := StrToFloat(E_tag_value.Text);
      TempoPrevsto      := DTP_forecast_time.DateTime;
    End;
  End;
  Interation.Proposal.save;
end;

procedure TCadInterationProposal.SetVariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Interation.Proposal.Registro.Iteracao := Interation.registro.codigo;
    Interation.Proposal.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Interation.Proposal.Registro.Ordem := Interation.registro.Ordem;
    Interation.Proposal.getbyKey;
  End;
  inherited;
end;

procedure TCadInterationProposal.ShowData;
begin
  inherited;
  DTP_forecast_time.DateTime :=  Interation.Proposal.Registro.TempoPrevsto;
  E_tag_value.text           :=  FloatToStrF(Interation.Proposal.Registro.Valor,ffFixed,10,2);
end;

function TCadInterationProposal.ValidateDelete: boolean;
begin
  REsult := True;
end;

function TCadInterationProposal.ValidateSave: boolean;
begin
  Result := True;
  if trim(FrCustomer.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Cliente não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrSituation.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Sittuação não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_Description.Text) = '' then
  begin
      MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_tag_value.Text) = '' then
  begin
      MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo valor da proposta não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(m_Detail.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Detalhe não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
end;

function TCadInterationProposal.ValidateSaveBeforeAtachament: Boolean;
begin
  result := true;
  if not ValidateSave then
  Begin
    result := False;
    exit;
  End;
end;

end.
