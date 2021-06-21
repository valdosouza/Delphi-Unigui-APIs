unit cad_project;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, ControllerProject, unmessages,
  UnFunctions, msg_form, MainModule, uniMemo, uniEdit, uniLabel, uniDateTimePicker
  ,fm_Situation, fm_customer;

type
  TCadProject = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    L_Description: TUniLabel;
    E_Description: TUniEdit;
    M_Detail: TUniMemo;
    UniLabel1: TUniLabel;
    L_Number: TUniLabel;
    E_Number: TUniEdit;
    ctn_Customer: TUniContainerPanel;
    ctn_Situacao: TUniContainerPanel;
    DTP_Date_Initial_forecast: TUniDateTimePicker;
    DTP_Date_End_forecast: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    DTP_dt_record: TUniDateTimePicker;
  private
    { Private declarations }
    FrSituation : TFmSituation;
    FrCustomer  : TFmCustomer;
    procedure ShowSituation;
    procedure ShowCustomer;
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
  public
    { Public declarations }
    Project : TControllerProject;
  end;

var
  CadProject: TCadProject;

implementation

{$R *.dfm}

{ TCadProject }

procedure TCadProject.Delete;
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
      Self.project.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadProject.FormatScreen;
begin
  inherited;
  ShowSituation;
  ShowCustomer;
end;

procedure TCadProject.InitVariable;
begin
  inherited;
  Project := TControllerProject.Create(Self);
end;

procedure TCadProject.Insert;
begin
  inherited;
  Project.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadProject.Save;
begin
  inherited;
  with Project.Registro do
  Begin
    Descricao := E_Description.Text;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    DataInicialPrevista := DTP_Date_Initial_forecast.DateTime;
    DataFinalPrevista := DTP_Date_End_forecast.DateTime;
    DataRegistro := DTP_dt_record.DateTime;
    CodigoCliente := FrCustomer.DBLCB_Lista.KeyValue;
    CodigoSituacao := FrSituation.DBLCB_Lista.KeyValue;
  End;
  Project.save;
  E_ID.Text := IntToStr(Project.Registro.codigo);

end;

procedure TCadProject.SetVariable;
begin
  Project.Registro.Codigo := CodigoRegistro;
  Project.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Project.getByKey;
  inherited;
end;

procedure TCadProject.ShowCustomer;
begin
  FrCustomer := TFmCustomer.Create(Self);
  FrCustomer.Parent := ctn_Customer;
  FrCustomer.Listar;
  FrCustomer.Align := alClient;
  FrCustomer.Show;
end;

procedure TCadProject.ShowData;
begin
  with Project.Registro do
  Begin
    E_ID.Text := IntToStr(Codigo);
    E_Description.Text := Descricao;
    DTP_Date_Initial_forecast.DateTime := DataInicialPrevista;
    DTP_Date_End_forecast.DateTime := DataFinalPrevista;
    DTP_dt_record.DateTime := DataRegistro;
    FrCustomer.DBLCB_Lista.KeyValue := Project.Registro.CodigoCliente;
    FrSituation.DBLCB_Lista.KeyValue := Project.Registro.CodigoSituacao;
  end;
  inherited;
end;

procedure TCadProject.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadProject.ShowSituation;
begin
  FrSituation := TFmSituation.Create(Self);
  FrSituation.Parent := ctn_Situacao;
  FrSituation.Listar;
  FrSituation.Align := alClient;
  FrSituation.Show;
end;

function TCadProject.ValidaInsert: boolean;
begin

end;

function TCadProject.ValidateDelete: boolean;
begin
 Result := true;
end;

function TCadProject.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_Description.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    if E_Description.CanFocus then E_Description.SetFocus;
    Result := False;
    exit;
  end;

end;

end.
