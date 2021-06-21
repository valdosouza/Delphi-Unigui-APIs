unit cad_ext_motivos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniMultiItem,
  uniComboBox, uniGUIClasses, uniEdit, uniLabel, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel, MainModule, msg_form, unmessages,
  ControllerExtMotivos;

type
  TCadExtMotivos = class(TBaseRegistry)
    UniLabel1: TUniLabel;
    E_Description: TUniEdit;
    Cb_Kind: TUniComboBox;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    E_rule: TUniEdit;
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
    ExtMotivos : TControllerExtMotivos;
  end;

var
  CadExtMotivos: TCadExtMotivos;

implementation

{$R *.dfm}

{ TCadExtMotivos }

procedure TCadExtMotivos.ClearAllFields;
begin
  inherited;
  ExtMotivos.clear;
end;

procedure TCadExtMotivos.Delete;
begin
  inherited;
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.']);
    FormMsg.ShowModal(
      Procedure(Sender: TComponent; AResult:Integer)
      begin
        if (Sender as TMsgForm).BotaoEscolhido > 0 then
        Begin
          ExtMotivos.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TCadExtMotivos.InitVariable;
begin
  inherited;
  ExtMotivos := TControllerExtMotivos.Create(self);
end;

procedure TCadExtMotivos.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadExtMotivos.Save;
begin
  inherited;
  if Cb_Kind.ItemIndex = 0 then
     ExtMotivos.Registro.Tipo := 'C'
    else
     ExtMotivos.Registro.Tipo := 'R';
  ExtMotivos.Registro.Descricao := E_Description.Text;
  ExtMotivos.Registro.Norma := E_rule.Text;
  ExtMotivos.save;
end;

procedure TCadExtMotivos.SetVariable;
begin
  ExtMotivos.Registro.Codigo := CodigoRegistro;
  ExtMotivos.getbyKey;
  inherited;
end;

procedure TCadExtMotivos.ShowData;
begin
 E_rule.Text := ExtMotivos.Registro.Norma;
 E_Description.Text := ExtMotivos.Registro.Descricao;
 if ExtMotivos.Registro.Tipo = 'C' then
     Cb_Kind.ItemIndex := 0
    else
     Cb_Kind.ItemIndex := 1;
end;

procedure TCadExtMotivos.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadExtMotivos.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadExtMotivos.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadExtMotivos.ValidateSave: boolean;
begin
  Result := True;
end;

end.
