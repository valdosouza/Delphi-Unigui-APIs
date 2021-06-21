unit cad_deter_base_tax_icms_st;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel,UniLabel,UniEdit,ControllerDeterBaseTaxIcmsST, MainModule, unMessages, msg_form,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadDeterBaseTaxIcmsST = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_Group: TUniEdit;
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
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
     DeterBaseTaxIcmsST : TControllerDeterBaseTaxIcmsST;
  end;

var
  CadDeterBaseTaxIcmsST: TCadDeterBaseTaxIcmsST;

implementation

{$R *.dfm}

{ TCadDeterBaseTaxIcmsST }

procedure TCadDeterBaseTaxIcmsST.Delete;
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
      Self.DeterBaseTaxIcmsST.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadDeterBaseTaxIcmsST.InitVariable;
begin
  inherited;
  DeterBaseTaxIcmsST := TControllerDeterBaseTaxIcmsST.create(Self);
end;

procedure TCadDeterBaseTaxIcmsST.Insert;
begin
  inherited;
  DeterBaseTaxIcmsST.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;
procedure TCadDeterBaseTaxIcmsST.Save;
begin
  inherited;
  with DeterBaseTaxIcmsST.Registro do
  Begin
    Descricao := E_Description.Text;
    Codigo := E_Group.Text;

  End;
  DeterBaseTaxIcmsST.save;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := DeterBaseTaxIcmsST.Registro.Codigo;
end;

procedure TCadDeterBaseTaxIcmsST.SetVariable;
begin
  DeterBaseTaxIcmsST.Registro.Codigo := CodigoRegistro;
  DeterBaseTaxIcmsST.getByKey;
  inherited;
end;

procedure TCadDeterBaseTaxIcmsST.ShowData;
begin
  if DeterBaseTaxIcmsST.exist then
  Begin
    E_Description.Text := DeterBaseTaxIcmsST.Registro.Descricao;
    E_Group.Text := DeterBaseTaxIcmsST.Registro.Codigo;
   End;
  inherited;

end;

procedure TCadDeterBaseTaxIcmsST.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;


function TCadDeterBaseTaxIcmsST.ValidaInsert: boolean;
begin
 //
end;

function TCadDeterBaseTaxIcmsST.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadDeterBaseTaxIcmsST.ValidateSave: boolean;
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

  if trim(E_Group.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Grupo Taxa não informado.',
                  'Preencha o campo para continuar']);
    if E_Group.CanFocus then E_Group.SetFocus;
    Result := False;
    exit;
  end;

end;

end.
