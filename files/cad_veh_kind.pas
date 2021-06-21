unit cad_veh_kind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniLabel, ControllerVehKind, Data.DB, Datasnap.DBClient;

type
  TCadVehKind = class(TBaseRegistry)
    label1: TUniLabel;
    E_Codigo: TUniEdit;
    label2: TUniLabel;
    E_Description: TUniEdit;
    UniLabel1: TUniLabel;
    E_renavam: TUniEdit;

    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
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
    VehKind : TControllerVehKind;
  end;

var
  CadVehKind: TCadVehKind;

implementation

{$R *.dfm}

{ TCadVehicleKind }

procedure TCadVehKind.ClearAllFields;
begin
  inherited;
  VehKind.clear;
end;

procedure TCadVehKind.Delete;
begin
  inherited;
//
end;

procedure TCadVehKind.FormatScreen;
begin
  inherited;
//
end;

procedure TCadVehKind.InitVariable;
begin
  inherited;
  VehKind := TControllerVehKind.Create(self);
end;

procedure TCadVehKind.Insert;
begin
  inherited;
  ClearAllFields;
end;

procedure TCadVehKind.Save;
begin
  inherited;
  with VehKind do
  begin
    Registro.Renavam    := E_renavam.Text;
    Registro.Descricao  := E_Description.Text;
  end;
  VehKind.save;

  CodigoRegistro := VehKind.Registro.Codigo;
  E_Codigo.Text := IntToStr(VehKind.Registro.codigo);
end;

procedure TCadVehKind.SetVariable;
begin
  VehKind.Registro.Codigo := CodigoRegistro;
  VehKind.getbyKey;
  inherited;
end;

procedure TCadVehKind.ShowData;
begin
  with VehKind do
  begin
    E_Codigo.Text       := IntToStr(Registro.Codigo);
    E_Description.Text  := Registro.Descricao;
    E_renavam.Text      := Registro.Renavam;
  end;
  inherited;
end;

procedure TCadVehKind.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadVehKind.ValidaInsert: boolean;
begin
  result := true;
end;

function TCadVehKind.ValidateDelete: boolean;
begin
 Result := True;
end;

function TCadVehKind.ValidateSave: boolean;
begin
 Result := True;
end;

end.
