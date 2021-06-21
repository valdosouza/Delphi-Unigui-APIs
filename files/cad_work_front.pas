unit cad_work_front;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniCheckBox,
  uniGUIClasses, uniEdit, uniLabel, Vcl.Menus, uniMainMenu, uniButton,
  uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel, ControllerWorkFront,
  MainModule, msg_form, unMessages, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadWorkFront = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    E_ID: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
  private
    { Private declarations }
  public
    { Public declarations }
    Work : TControllerWorkFront;
  end;

var
  CadWorkFront: TCadWorkFront;

implementation

{$R *.dfm}

{ TCadWorkFront }

procedure TCadWorkFront.ClearAllFields;
begin
  inherited;
  Work.clear;
end;

procedure TCadWorkFront.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      Self.Work.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadWorkFront.InitVariable;
begin
  inherited;
  Work := TControllerWorkFront.create(Self);


end;

procedure TCadWorkFront.Insert;
begin
  inherited;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadWorkFront.Save;
begin
  inherited;
  with Work.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Descricao := E_Description.Text;
    if chbx_cad_active.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
  End;
  Work.save;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Work.Registro.Codigo;
  E_ID.Text := IntToStr(Work.Registro.codigo);
end;

procedure TCadWorkFront.SetVariable;
begin
  Work.Registro.Codigo := CodigoRegistro ;
  Work.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Work.getbyKey;
  inherited;
end;

procedure TCadWorkFront.ShowData;
begin
  if Work.exist then
  Begin
    E_ID.Text := IntToStr(Work.Registro.Codigo);
    E_Description.Text := Work.Registro.Descricao;
    chbx_cad_active.Checked := (Work.Registro.Ativo = 'S');
  End;
  inherited;
end;

procedure TCadWorkFront.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadWorkFront.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadWorkFront.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadWorkFront.ValidateSave: boolean;
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
