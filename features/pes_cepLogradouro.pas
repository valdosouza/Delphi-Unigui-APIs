unit pes_cepLogradouro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  base_form, uniLabel, uniGUIClasses,fm_state,
  uniEdit, uniPanel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniBasicGrid, uniStringGrid, ACBrCEP, ACBrBase, ACBrSocket, Data.DB,
  Datasnap.DBClient, Vcl.Controls, Vcl.Forms;

type
  TPesCepLogradouro = class(TBaseForm)
    Pnl_Fundo: TUniPanel;
    Pnl_Parametros: TUniPanel;
    Pnl_Botoes: TUniPanel;
    Sb_Close: TUniSpeedButton;
    Sb_View: TUniSpeedButton;
    Sb_Search: TUniSpeedButton;
    ctn_state: TUniContainerPanel;
    E_busca_Cidade: TUniEdit;
    UniLabel3: TUniLabel;
    E_busca_Logradouro: TUniEdit;
    UniLabel1: TUniLabel;
    E_Busca_Tipo: TUniEdit;
    UniLabel2: TUniLabel;
    StrGrdResult: TUniStringGrid;
    procedure UniFormCreate(Sender: TObject);
    procedure setImages;Override;
    procedure Sb_ViewClick(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
    procedure ShowState;
    procedure MontaGradeLogradouro;
    Function ValidaBusca:Boolean;
    Procedure BuscarCepLogradouro;
    Function ValidaVisualizacao:Boolean;
  public
    { Public declarations }
    FrState : TFmState;
    Consulta : Boolean;
  end;

var
  PesCepLogradouro: TPesCepLogradouro;

implementation

{$R *.dfm}

uses fm_BaseFrame, unMessages, UnFunctions;

{ TPesCepLogradouro }

procedure TPesCepLogradouro.MontaGradeLogradouro;
Begin
  with StrGrdResult do
  Begin
    ColWidths[0]:=17;
    ColWidths[1]:=63;
    ColWidths[2]:=240;
    ColWidths[3]:=140;
    ColWidths[4]:=240;
    ColWidths[5]:=45;
    Cells[1,0] := 'Cep';
    Cells[2,0] := 'Logradouro';
    Cells[3,0] := 'Bairro';
    Cells[4,0] := 'Cidade';
    Cells[5,0] := 'UF';
  End;
end;

procedure TPesCepLogradouro.Sb_CloseClick(Sender: TObject);
begin
  Consulta := False;
  Close;
end;

procedure TPesCepLogradouro.Sb_SearchClick(Sender: TObject);
begin
  if ValidaBusca then
    BuscarCepLogradouro;
end;

procedure TPesCepLogradouro.Sb_ViewClick(Sender: TObject);
begin
  if ValidaVisualizacao then
  Begin
    Consulta := True;
    Close;
  End;
end;

Function TPesCepLogradouro.ValidaBusca:Boolean;
Begin
  Result := True;
  //Insere o Xml dentro do Componente
  if (Length(Trim(E_busca_Logradouro.Text))<=1) then
  Begin
    MensageAlert(['I N F O R M A Ç Ã O!.',
                  '',
                  'Por favor preencha o Logradouro com pelo menos com duas letras.',
                  'Verifique e tente novamente.']);
    Result := False;
    exit;
  end;

  if Trim(E_busca_Cidade.Text) = '' then
  Begin
    MensageAlert(['I N F O R M A Ç Ã O!.',
                  '',
                  'Por favor preencha o nome da Cidade.',
                  'Verifique e tente novamente.']);
    Result := False;
    exit;
  end;

  if Trim(FrState.DBLCB_Lista.Text) = '' then
  Begin
    MensageAlert(['I N F O R M A Ç Ã O!.',
                  '',
                  'Por favor preencha o Estado.',
                  'Verifique e tente novamente.']);
    Result := False;
    exit;
  end;
End;


function TPesCepLogradouro.ValidaVisualizacao: Boolean;
begin
  Result := True;
  if Trim(FrState.DBLCB_Lista.Text) = '' then
  Begin
    MensageAlert(['I N F O R M A Ç Ã O!.',
                  '',
                  'Não há registro para Visualizar.',
                  'Verifique e tente novamente.']);
    Result := False;
    exit;
  end;
end;

Procedure TPesCepLogradouro.BuscarCepLogradouro;
Var
  Lc_I : Integer;
  cep : TACBrCEP;
Begin
  cep := TACBrCEP.Create(Self);
  with cep DO
  Begin
    WebService := wsBuscarCep;
    ChaveAcesso := '1STa9eKhhfKvc7Ljh6W6CO5Kr/bFOl.';
    BuscarPorLogradouro(E_busca_Cidade.Text,
                        E_Busca_Tipo.Text,
                        E_busca_Logradouro.Text,
                        FrState.DBLCB_Lista.Text,
                        '');
    //Preenche o Registro
    if Enderecos.Count > 0 then
    Begin
      StrGrdResult.RowCount := Enderecos.Count + 1;
      For Lc_I := 0 to Enderecos.Count-1 do
      begin
        with Enderecos[Lc_I],StrGrdResult do
        begin
          Cells[1,Lc_I + 1] := Cep;
          Cells[2,Lc_I + 1] := UpperCase(Tipo_Logradouro+ ' ' +Logradouro);
          Cells[3,Lc_I + 1] := UpperCase(Bairro);
          Cells[4,Lc_I + 1] := UpperCase(Municipio);
          Cells[5,Lc_I + 1] := UpperCase(UF);
        end ;
      end ;
    End;
  end;
  FreeAndNil(cep);
end;

procedure TPesCepLogradouro.setImages;
begin
  inherited;
  buttonIcon(Sb_Search,'search.bmp');
  buttonIcon(Sb_View,'viewer.bmp');
  buttonIcon(Sb_Close,'close.bmp');
end;

procedure TPesCepLogradouro.ShowState;
begin
  FrState := TFmState.Create(Self);
  FrState.Parent := ctn_state;
  FrState.Align := alClient;
  FrState.Listar(1058);
  FrState.Show;
end;

procedure TPesCepLogradouro.UniFormCreate(Sender: TObject);
begin
  inherited;
  ShowState;
  MontaGradeLogradouro;
end;

end.
