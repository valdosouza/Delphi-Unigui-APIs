unit cad_ext_tester;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniCheckBox, uniLabel, uniEdit, ControllerExtTester, msg_form, unmessages,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadExtTester = class(TBaseRegistry)
    UniLabel1: TUniLabel;
    E_name_company: TUniEdit;
    chbx_cad_active: TUniCheckBox;
    procedure InitVariable;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    procedure Delete;Override;
    procedure setVariable; override;
  private
    { Private declarations }
  public
    { Public declarations }
    ExtTester : TControllerExtTester;
  end;

var
  CadExtTester: TCadExtTester;

implementation

{$R *.dfm}

uses MainModule;

{ TCadExtTester }

procedure TCadExtTester.ClearAllFields;
begin
  inherited;
  ExtTester.clear;
end;

procedure TCadExtTester.Delete;
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
          ExtTester.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TCadExtTester.InitVariable;
begin
  inherited;
  ExtTester := TControllerExtTester.Create(self);
end;

procedure TCadExtTester.Insert;
begin
  inherited;
  ExtTester := TControllerExtTester.Create(self);
end;

procedure TCadExtTester.Save;
begin
  with ExtTester.Entity.Registro do
  Begin
   NomeRazao := E_name_company.Text;
  End;
  ExtTester.Entity.save;

  with ExtTester.Registro do
  Begin
    Codigo := ExtTester.Entity.Registro.Codigo;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    if chbx_cad_active.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
  End;
  ExtTester.save;

  CodigoRegistro := ExtTester.Registro.Codigo;

end;

procedure TCadExtTester.SetVariable;
begin
  ExtTester.Registro.Codigo := CodigoRegistro ;
  ExtTester.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  ExtTester.getbyKey;
  inherited;
end;

procedure TCadExtTester.ShowData;
begin
  E_name_company.Text := ExtTester.Entity.Registro.NomeRazao;
  chbx_cad_active.Checked := (ExtTester.Registro.Ativo = 'S');
end;

procedure TCadExtTester.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

function TCadExtTester.ValidaInsert: boolean;
begin
 Result := True;
end;

function TCadExtTester.ValidateSave: boolean;
begin
  Result := True;
end;

end.
