unit cad_ext_seal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniDateTimePicker, uniLabel, ControllerExtSeal, MainModule, msg_form, unmessages,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadExtSeal = class(TBaseRegistry)
    UniLabel1: TUniLabel;
    Dtp_dt_record: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    E_nr_initial: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    E_nr_las_used: TUniEdit;
    E_nr_final: TUniEdit;
    UniButton1: TUniButton;
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
    ExtSeal : TControllerExtSeal;
  end;

var
  CadExtSeal: TCadExtSeal;

implementation

{$R *.dfm}

{ TCadExtSeal }

procedure TCadExtSeal.ClearAllFields;
begin
  inherited;
  ExtSeal.clear;
end;

procedure TCadExtSeal.Delete;
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
          ExtSeal.delete;
          ClearAllFields;
        End;
      end
    );
end;

procedure TCadExtSeal.InitVariable;
begin
  inherited;
  ExtSeal := TControllerExtSeal.Create(self);
end;

procedure TCadExtSeal.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadExtSeal.Save;
begin
  ExtSeal.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  ExtSeal.Registro.DataRegistro := Dtp_dt_record.DateTime;
  ExtSeal.Registro.LoteIni := E_nr_initial.Text;
  ExtSeal.Registro.LoteFin := E_nr_final.Text;
  ExtSeal.Registro.UltUsado := E_nr_las_used.Text;
  ExtSeal.save;

  CodigoRegistro := ExtSeal.Registro.Codigo;
end;

procedure TCadExtSeal.setVariable;
begin
  ExtSeal.Registro.Codigo := CodigoRegistro ;
  ExtSeal.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  ExtSeal.getbyKey;
  inherited;
end;

procedure TCadExtSeal.ShowData;
begin
  Dtp_dt_record.DateTime := ExtSeal.Registro.DataRegistro;
  E_nr_initial.Text := ExtSeal.Registro.LoteIni ;
  E_nr_final.Text := ExtSeal.Registro.LoteFin;
  E_nr_las_used.Text := ExtSeal.Registro.UltUsado;
end;

procedure TCadExtSeal.ShowNoData;
begin
  ClearAllFields;
  inherited;
end;

function TCadExtSeal.ValidaInsert: boolean;
begin
  Result := True;
end;

function TCadExtSeal.ValidateSave: boolean;
begin
  Result := True;
end;

end.
