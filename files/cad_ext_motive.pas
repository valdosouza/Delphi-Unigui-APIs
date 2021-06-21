unit cad_ext_motive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, uniMultiItem,
  uniComboBox, uniGUIClasses, uniEdit, uniLabel, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel, MainModule, msg_form, unmessages,
  ControllerExtMotive, UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadExtMotive = class(TBaseRegistry)
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
  CadExtMotive: TCadExtMotive;

implementation

{$R *.dfm}

{ TCadExtMotivos }

procedure TCadExtMotive.ClearAllFields;
begin
  inherited;
  ExtMotivos.clear;
end;

procedure TCadExtMotive.Delete;
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
          ExtMotivos.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TCadExtMotive.InitVariable;
begin
  inherited;
  ExtMotivos := TControllerExtMotivos.Create(self);
end;

procedure TCadExtMotive.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadExtMotive.Save;
begin
  inherited;
  if Cb_Kind.ItemIndex = 0 then
     ExtMotivos.Registro.Tipo := 'C'
    else
     ExtMotivos.Registro.Tipo := 'R';
  ExtMotivos.Registro.Descricao := E_Description.Text;
  ExtMotivos.Registro.Norma := E_rule.Text;
  ExtMotivos.save;

  CodigoRegistro := ExtMotivos.Registro.Codigo;
end;

procedure TCadExtMotive.SetVariable;
begin
  ExtMotivos.Registro.Codigo := CodigoRegistro;
  ExtMotivos.getbyKey;
  inherited;
end;

procedure TCadExtMotive.ShowData;
begin
 E_rule.Text := ExtMotivos.Registro.Norma;
 E_Description.Text := ExtMotivos.Registro.Descricao;
 if ExtMotivos.Registro.Tipo = 'C' then
     Cb_Kind.ItemIndex := 0
    else
     Cb_Kind.ItemIndex := 1;
end;

procedure TCadExtMotive.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadExtMotive.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadExtMotive.ValidateDelete: boolean;
begin
  Result := True;
end;

function TCadExtMotive.ValidateSave: boolean;
begin
  Result := True;
end;

end.
