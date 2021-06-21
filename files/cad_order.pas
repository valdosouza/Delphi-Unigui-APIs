unit cad_order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniEdit, uniDateTimePicker, uniLabel, unmessages, msg_form, ControllerOrder,
  MainModule, uniMemo, unimMemo;

type
  TCadOrder = class(TBaseRegistry)
    L_Validade: TUniLabel;
    DTP_Date: TUniDateTimePicker;
    L_Observação: TUniLabel;
    UniLabel1: TUniLabel;
    E_Status: TUniEdit;
    M_Note: TUniMemo;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
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
    //StockList : TControllerStockList;
  public
    { Public declarations }
    Order : TControllerOrder;
  end;

var
  CadOrder: TCadOrder;

implementation

{$R *.dfm}

{ TCadOrder }

procedure TCadOrder.Delete;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.']);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      Self.Order.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadOrder.FormatScreen;
begin
  inherited;
  Height := 300;
end;

procedure TCadOrder.InitVariable;
begin
  inherited;
  Order := TControllerOrder.create(Self);
end;

procedure TCadOrder.Insert;
begin
  inherited;
  ClearAllFields;
  M_Note.SetFocus;
  E_Status.SetFocus;
end;

procedure TCadOrder.Save;
begin
  inherited;
  with Order.Registro do
  Begin
    Observacao       := M_Note.Text;
    Status           := E_Status.Text;
    Data             := DTP_Date.DateTime;
    Estabelecimento  := GbInstitution;

  End;
  Order.save;
  //Setando a variavel para controle de botãoe (Alterar/Excluir
  CodigoRegistro := Order.Registro.Codigo;
end;

procedure TCadOrder.SetVariable;
begin
  Order.Registro.Codigo := CodigoRegistro;
  Order.Registro.Estabelecimento := GbInstitution;
  inherited;
end;

procedure TCadOrder.ShowData;
begin
  Order.getbyKey(Order.Registro);
  if Order.exist then
  Begin
    M_Note.Text := Order.Registro.Observacao;
    E_Status.Text := Order.Registro.Status;
  End;
  inherited;

end;

procedure TCadOrder.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadOrder.ValidaInsert: boolean;
begin
  Result := true;
end;

function TCadOrder.ValidateDelete: boolean;
begin
//
end;

function TCadOrder.ValidateSave: boolean;
begin
  Result := True;
  if trim(M_Note.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    if M_Note.CanFocus then M_Note.SetFocus;
    Result := False;
    exit;
  end;
end;

end.
