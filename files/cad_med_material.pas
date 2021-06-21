unit cad_med_material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniCheckBox, uniEdit, uniLabel,UniComboBox,ControllerMedMaterial,MainModule,
  unMessages, msg_form, uniMultiItem, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadMedMaterial = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    L_Descricao: TUniLabel;
    E_Description: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    Cb_destiny: TUniComboBox;
    UniLabel1: TUniLabel;

  private

  protected
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    procedure ClearAllFields;Override;

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
     MedMaterial : TControllerMedMaterial;
  end;

var
  CadMedMaterial: TCadMedMaterial;

implementation

{$R *.dfm}



{ TCadMedMaterial }

procedure TCadMedMaterial.Change;
begin
  inherited;
//
end;

procedure TCadMedMaterial.ClearAllFields;
begin
  inherited;
//
end;

procedure TCadMedMaterial.Delete;
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
      Self.MedMaterial.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadMedMaterial.FormatScreen;
begin
  inherited;
end;

procedure TCadMedMaterial.InitVariable;
begin
  inherited;
  MedMaterial := TControllerMedMaterial.create(Self);
end;

procedure TCadMedMaterial.Insert;
begin
 inherited;
  MedMaterial.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadMedMaterial.Save;
begin
  inherited;
  with MedMaterial.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Descricao := E_Description.Text;
    Destino := Cb_destiny.ItemIndex;
    if chbx_cad_active.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
   End;
  MedMaterial.save;
  CodigoRegistro := MedMaterial.Registro.Codigo;
  E_ID.Text := IntToStr(MedMaterial.Registro.codigo);

end;

procedure TCadMedMaterial.SetVariable;
begin
  MedMaterial.Registro.Codigo := CodigoRegistro;
  MedMaterial.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  MedMaterial.getByKey;
  inherited;
end;

procedure TCadMedMaterial.ShowData;
begin
  if MedMaterial.exist then
  Begin
    E_ID.Text := IntToStr(MedMaterial.Registro.Codigo);
    E_Description.Text := MedMaterial.Registro.Descricao;
    Cb_destiny.ItemIndex := MedMaterial.Registro.Destino;
   End;
  inherited;
 end;

procedure TCadMedMaterial.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadMedMaterial.ValidaInsert: boolean;
begin
  Result := true;
end;

function TCadMedMaterial.ValidateChange: boolean;
begin
  Result := true;
end;

function TCadMedMaterial.ValidateDelete: boolean;
begin
  Result := true;
end;


function TCadMedMaterial.ValidateSave: boolean;
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
