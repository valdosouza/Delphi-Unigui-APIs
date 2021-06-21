unit cad_price_list;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,
  uniPanel,uniCheckBox,uniEdit,uniLabel,UniDateTimePicker,UniRadioGroup,ControllerPriceList,
  UnFunctions, Data.DB, Datasnap.DBClient;

type
  TCadPriceList = class(TBaseRegistry)
    L_Codigo: TUniLabel;
    E_ID: TUniEdit;
    L_Validade: TUniLabel;
    E_Description: TUniEdit;
    L_MargemLucro: TUniLabel;
    DTP_Validity: TUniDateTimePicker;
    E_Aliq_Profit: TUniEdit;
    Rg_Modality: TUniRadioGroup;
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
    PriceList : TControllerPriceList;
  end;

var
  CadPriceList: TCadPriceList;

implementation

{$R *.dfm}

uses MainModule, unMessages, msg_form;

{ TCadPriceList }

procedure TCadPriceList.Delete;
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
      Self.PriceList.delete;
      Self.Close;
    End;
  end
  );

end;

procedure TCadPriceList.InitVariable;
begin
  inherited;
  PriceList := TControllerPriceList.create(Self);
end;

procedure TCadPriceList.Insert;
begin
  inherited;
  PriceList.clear;
  ClearAllFields;
  E_Description.SetFocus;
end;

procedure TCadPriceList.Save;
begin
  inherited;
  with PriceList.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Descricao := E_Description.Text;
     if DTP_Validity.Text = '30/12/1899' then
      Validade         := 0.0
    else
      Validade         := DTP_Validity.DateTime;
    MargemLucro := StrToFloatDef(E_Aliq_Profit.text,0);

    case Rg_Modality.ItemIndex of
      0 : PriceList.Registro.Modalidade := 'V';
      1 : PriceList.Registro.Modalidade := 'P';
      2 : PriceList.Registro.Modalidade := 'A';
    end;

  End;
  PriceList.save;
  E_ID.Text := IntToStr(PriceList.Registro.codigo);

end;

procedure TCadPriceList.SetVariable;
begin
  PriceList.Registro.Codigo := CodigoRegistro;
  PriceList.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  PriceList.getByKey;
  inherited;
end;

procedure TCadPriceList.ShowData;
begin
  if PriceList.exist then
  Begin
    E_ID.Text := IntToStr(PriceList.Registro.Codigo);
    E_Description.Text := PriceList.Registro.Descricao;
    if DateToStr(PriceList.registro.Validade) <> '30/12/1899' then
      DTP_Validity.DateTime := PriceList.registro.Validade
    else
      DTP_Validity.DateTime := 0.0;
    E_Aliq_Profit.Text := FloatToStrF (PriceList.Registro.MargemLucro,ffFixed,10,2);

    case AnsiIndexStr(UpperCase(PriceList.Registro.Modalidade), ['V', 'P','A']) of
      0 : Rg_Modality.ItemIndex := 0;
      1 : Rg_Modality.ItemIndex := 1;
      2 : Rg_Modality.ItemIndex := 2;
    end;
  End;
  inherited;

end;

procedure TCadPriceList.ShowNoData;
begin
  inherited;
  ClearAllFields;
end;

function TCadPriceList.ValidaInsert: boolean;
begin
      //
end;

function TCadPriceList.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadPriceList.ValidateSave: boolean;
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
