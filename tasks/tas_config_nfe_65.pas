unit tas_config_nfe_65;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, tas_config_nfe, uniCheckBox,
  uniRadioGroup, uniRadioButton, uniGUIClasses, uniEdit, uniGroupBox, uniBitBtn,
  uniSpeedButton, uniButton, uniLabel, uniGUIBaseClasses, uniPanel, Vcl.Menus,
  uniMainMenu, uniSpinEdit, uniMultiItem, uniComboBox, ControllerConfigNfe65, ControllerConfigNfe,
  MainModule, msg_form, unmessages, UnFunctions, Data.DB, uniFileUpload,
  Datasnap.DBClient;

type
  TTasConfigNfe65 = class(TTasConfigNfe)
    procedure InitVariable;Override;
    procedure ShowNoData;Override;
    procedure ClearAllFields;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    procedure Delete;Override;
  private
    { Private declarations }
  public
    { Public declarations }
    ConfigNfe65 : TControllerConfigNfe65;
    ConfigNfe : TControllerConfigNfe;
  end;

var
  TasConfigNfe65: TTasConfigNfe65;

implementation

{$R *.dfm}

uses openForms;

{ TTasConfigNfe2 }

procedure TTasConfigNfe65.ClearAllFields;
begin
   inherited;
  ConfigNfe65.clear;
  ConfigNfe.clear;
end;

procedure TTasConfigNfe65.Delete;
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
          ConfigNfe.delete;
          ConfigNfe65.delete;
          ClearAllFields;
        End;
      end
    );

end;

procedure TTasConfigNfe65.InitVariable;
begin
  inherited;
  ConfigNfe := TControllerConfigNfe.Create(Self);
  ConfigNfe65 := TControllerConfigNfe65.Create(Self);
end;

procedure TTasConfigNfe65.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TTasConfigNfe65.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

function TTasConfigNfe65.ValidaInsert: boolean;
begin
 Result := True;
end;

end.
