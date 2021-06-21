unit base_register;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_form, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient;

type
  TBaseRegister = class(TBaseForm)
  private
    { Private declarations }
 protected
    procedure ShowData;Virtual;
    procedure ShowNoData;Virtual;
    procedure ClearAllFields;Virtual;
    //inserir
    function ValidaInsert():boolean;Virtual;
    procedure Insert;Virtual;
    //Editar
    function ValidateChange():boolean;Virtual;
    procedure Change;Virtual;
    //Deletar
    function ValidateDelete():boolean;Virtual;
    procedure Delete;Virtual;
    //Salvar
    function ValidateSave():boolean;Virtual;
    procedure Save;Virtual;
    //Cancelar
    function ValidateCancel():boolean;Virtual;
    procedure Cancel;Virtual;

    procedure EditionControl;Virtual;
  public
    { Public declarations }
  end;

var
  BaseRegister: TBaseRegister;

implementation

{$R *.dfm}

{ TBaseRegister }

procedure TBaseRegister.Cancel;
begin

end;

procedure TBaseRegister.Change;
begin

end;

procedure TBaseRegister.ClearAllFields;
begin

end;

procedure TBaseRegister.Delete;
begin

end;

procedure TBaseRegister.EditionControl;
begin

end;

procedure TBaseRegister.Insert;
begin

end;

procedure TBaseRegister.Save;
begin

end;

procedure TBaseRegister.ShowData;
begin

end;

procedure TBaseRegister.ShowNoData;
begin

end;

function TBaseRegister.ValidaInsert: boolean;
begin

end;

function TBaseRegister.ValidateCancel: boolean;
begin

end;

function TBaseRegister.ValidateChange: boolean;
begin

end;

function TBaseRegister.ValidateDelete: boolean;
begin

end;

function TBaseRegister.ValidateSave: boolean;
begin

end;

end.
