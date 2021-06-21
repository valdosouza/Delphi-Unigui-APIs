unit fm_Address;

interface

uses
  uniGUIApplication,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  fm_country, fm_State,
  fm_City,ACBrCEP, uniButton, fm_BaseFrame, uniBitBtn, uniSpeedButton,
  uniGUIClasses, uniPanel, uniCheckBox, uniMultiItem, uniComboBox, uniEdit,
  uniGUIBaseClasses, uniLabel,  System.Classes,System.SysUtils,ControllerCity,
  ControllerState, fm_CountryStateCity ;

type
  TFmAddress = class(TFmBaseFrame)
    E_Neighborhood: TUniEdit;
    E_Region: TUniEdit;
    E_Number: TUniEdit;
    E_Kind: TUniComboBox;
    E_Compl: TUniEdit;
    E_Cep: TUniEdit;
    E_Celular: TUniEdit;
    E_Contact: TUniEdit;
    E_Fax: TUniEdit;
    E_Phone: TUniEdit;
    Chbx_Whatsapp: TUniCheckBox;
    Sb_address: TUniSpeedButton;
    Sb_Cep: TUniSpeedButton;
    pnl_row_1_cep: TUniPanel;
    pnl_row_1: TUniPanel;
    ctn_CountryStateCity: TUniContainerPanel;
    pnl_row_2: TUniPanel;
    E_Street: TUniEdit;
    pnl_row_3: TUniPanel;
    pnl_Row_4: TUniPanel;
    procedure setImages;override;
    procedure E_PhoneKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure E_FaxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure E_CelularKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFrameCreate(Sender: TObject);
    procedure E_CepKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Sb_CepClick(Sender: TObject);
    procedure PreencheEndereco(Sender: TComponent; AResult:Integer);
    procedure Sb_addressClick(Sender: TObject);
    procedure E_PhoneExit(Sender: TObject);
    procedure E_FaxExit(Sender: TObject);
    procedure E_CelularExit(Sender: TObject);
    procedure E_CepExit(Sender: TObject);
  private
    { Private declarations }
    procedure ShowCountryStateCity;
    procedure BuscaCep(Fc_Cep:String);
  public
    { Public declarations }
    FrCountryStateCity : TFmCountryStateCity;
  end;

var
  FmAddress: TFmAddress;


implementation

{$R *.dfm}

uses unMessages, pes_cepLogradouro, UnFunctions,
  ControllerCountry;

procedure TFmAddress.BuscaCep(Fc_Cep:String);
Var
  cep : TACBrCEP;
  Lc_State : TControllerState;
  Lc_City : TControllerCity;
Begin
  cep := TACBrCEP.Create(Self);
  with cep do begin
    WebService := wsRepublicaVirtual;;
    BuscarPorCEP(Fc_CEP);
    if Enderecos.Count > 0 then
    Begin
      with Enderecos[0] do Begin
        E_Cep.Text := unMaskField(CEP);
        MaskCep(E_Cep);
        if (Trim(Tipo_Logradouro) <> '') then
          E_Street.Text := Trim(Tipo_Logradouro) + ' ' + Logradouro
        else
          E_Street.Text := Logradouro;
        E_Compl.Text := Complemento;
        E_Neighborhood.Text := Bairro;

        FrCountryStateCity.FrCountry.DBLCB_Lista.KeyValue := 1058;
        //Estado
        FrCountryStateCity.FrState.Listar(1058);
        Lc_State := TControllerState.Create(Self);
        Lc_State.Registro.Abreviatura := UF;
        Lc_State.getByAbbreviation;
        FrCountryStateCity.FrState.DBLCB_Lista.KeyValue := Lc_State.Registro.Codigo;
        //Cidade
        FrCountryStateCity.FrCity.Listar(Lc_State.Registro.Codigo);
        Lc_City := TControllerCity.Create(Self);
        Lc_City.Registro.Nome := UpperCase(Municipio);
        Lc_City.Registro.CodigoEstado := Lc_State.Registro.Codigo;
        Lc_City.getByName;
        FrCountryStateCity.FrCity.DBLCB_Lista.KeyValue := Lc_City.Registro.Codigo;

        //Libera
        FreeAndNil(Lc_State);
        FreeAndNil(Lc_City);
        E_Number.SetFocus;
      end;
    End
    else
    Begin
      MensageAlert(['A T E N Ç Ã O!.',
                    '',
                    'Endereço Não Encontrado.']);
    End;
  end;
  FreeAndNil(Cep);
end;

procedure TFmAddress.ShowCountryStateCity;
begin
  FrCountryStateCity := TFmCountryStateCity.Create(Self);
  FrCountryStateCity.Parent := ctn_CountryStateCity;
  FrCountryStateCity.FrCountry.Listar;
  FrCountryStateCity.Show;
end;


procedure TFmAddress.UniFrameCreate(Sender: TObject);
begin
  inherited;
  ShowCountryStateCity;
end;

procedure TFmAddress.E_CelularExit(Sender: TObject);
begin
  inherited;
  MaskPhone(Sender as TUniEdit);
end;

procedure TFmAddress.E_CelularKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  MaskPhone(Sender as TUniEdit);
end;

procedure TFmAddress.E_CepExit(Sender: TObject);
begin
  inherited;
  MaskCep(Sender as TUniEdit);
end;

procedure TFmAddress.E_CepKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  MaskCep(Sender as TUniEdit);
end;

procedure TFmAddress.E_FaxExit(Sender: TObject);
begin
  inherited;
  MaskPhone(Sender as TUniEdit);
end;

procedure TFmAddress.E_FaxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  MaskPhone(Sender as TUniEdit);
end;

procedure TFmAddress.E_PhoneExit(Sender: TObject);
begin
  inherited;
  MaskPhone(Sender as TUniEdit);
end;

procedure TFmAddress.E_PhoneKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  MaskPhone(Sender as TUniEdit);
end;

procedure TFmAddress.PreencheEndereco(Sender: TComponent; AResult: Integer);
Var
  Lc_State : TControllerState;
  Lc_City : TControllerCity;
Begin
  if ((Sender as TPesCepLogradouro).Consulta) then
  Begin
    with (Sender as TPesCepLogradouro).StrGrdResult do
    Begin
      E_Cep.Text := unMaskField(Cells[1,Row]);
      MaskCep(E_Cep);
      E_Street.Text := Cells[2,Row];
      E_Compl.Text := '';
      E_Neighborhood.Text := Cells[3,Row];
      FrCountryStateCity.FrCountry.DBLCB_Lista.KeyValue := 1058;
      //Estado
      FrCountryStateCity.FrState.Listar(1058);
      Lc_State := TControllerState.Create(Self);
      Lc_State.Registro.Abreviatura := Cells[5,Row];
      Lc_State.getByAbbreviation;
      FrCountryStateCity.FrState.DBLCB_Lista.KeyValue := Lc_State.Registro.Codigo;
      //Cidade
      FrCountryStateCity.FrCity.Listar(Lc_State.Registro.Codigo);
      Lc_City := TControllerCity.Create(Self);
      Lc_City.Registro.Nome := UpperCase(Cells[4,Row]);
      Lc_City.Registro.CodigoEstado := Lc_State.Registro.Codigo;
      Lc_City.getByName;
      FrCountryStateCity.FrCity.DBLCB_Lista.KeyValue := Lc_City.Registro.Codigo;
      E_Number.SetFocus;
      //Libera
      FreeAndNil(Lc_State);
      FreeAndNil(Lc_City);
    end;
  end;
end;

procedure TFmAddress.Sb_addressClick(Sender: TObject);
Var
  Lc_Form : TPesCepLogradouro;
begin
  Lc_Form := TPesCepLogradouro.Create(UniApplication);
  Lc_Form.Consulta := False;
  Lc_Form.Show(PreencheEndereco);
end;

procedure TFmAddress.Sb_CepClick(Sender: TObject);
begin
  if (E_cep.Text = '') then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Informe o Número do Cep.']);
    if E_cep.CanFocus then
      E_cep.SetFocus;
  end else
    BuscaCep(E_cep.Text);
end;

procedure TFmAddress.setImages;
begin
  buttonIcon(Sb_address,'findAddress.bmp');
  buttonIcon(Sb_Cep,'findAddress.bmp');
end;



end.
