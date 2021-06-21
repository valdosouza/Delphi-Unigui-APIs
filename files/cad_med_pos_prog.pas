unit cad_med_pos_prog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel,ControllerMedPosProg,MainModule,unMessages, msg_form,UniCheckBox,UniEdit,
  UniLabel, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadMedPosProg = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    L_Descricao: TUniLabel;
    chbx_cad_active: TUniCheckBox;
    E_ID: TUniEdit;
    E_Description: TUniEdit;
  private
  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;

    procedure ShowData;Override;
    procedure ShowNoData;Override;
    //Inserir
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    //Editar
    function ValidateChange():boolean;Override;
    procedure Change;Override;
    //Salvar
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    //Deletar
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
  public
     MedPosProg : TControllerMedPosProg;
  end;

var
  CadMedPosProg: TCadMedPosProg;

implementation

{$R *.dfm}

{ TCadMedPosProg }

procedure TCadMedPosProg.Change;
begin
  inherited;
end;

procedure TCadMedPosProg.Delete;
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
      Self.MedPosProg.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadMedPosProg.FormatScreen;
begin
  inherited;

end;

procedure TCadMedPosProg.InitVariable;
begin
  inherited;
  MedPosProg := TControllerMedPosProg.create(Self);
end;

procedure TCadMedPosProg.Insert;
begin
  inherited;
  MedPosProg.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadMedPosProg.Save;
begin
  inherited;
  with MedPosProg.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Descricao := E_Description.Text;
    if chbx_cad_active.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
   End;
  MedPosProg.save;
  E_ID.Text := IntToStr(MedPosProg.Registro.codigo);

end;

procedure TCadMedPosProg.SetVariable;
begin
  MedPosProg.Registro.Codigo := CodigoRegistro;
  MedPosProg.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  MedPosProg.getByKey;
  inherited;
end;

procedure TCadMedPosProg.ShowData;
begin
  if MedPosProg.exist then
  Begin
    E_ID.Text := IntToStr(MedPosProg.Registro.Codigo);
    E_Description.Text := MedPosProg.Registro.Descricao;
   End;
  inherited;
 end;

procedure TCadMedPosProg.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadMedPosProg.ValidaInsert: boolean;
begin
  Result := true;
end;

function TCadMedPosProg.ValidateChange: boolean;
begin
  Result := true;
end;

function TCadMedPosProg.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadMedPosProg.ValidateSave: boolean;
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
