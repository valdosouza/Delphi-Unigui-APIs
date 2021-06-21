unit cad_financial_plans;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses,uniGUIAbstractClasses,
  uniPanel, uniTreeView, uniEdit, uniLabel, uniCheckBox, uniGroupBox,tblFinancialPlans,
  ControllerFinancialPlans, uniRadioGroup, Data.DB, Datasnap.DBClient;

type
  TCadFinancialPlans = class(TBaseRegistry)
    L_NameCompany: TUniLabel;
    E_Description: TUniEdit;
    Trw_Cadastro: TUniTreeView;
    chbx_cad_active: TUniCheckBox;
    Gbox1: TUniGroupBox;
    UniLabel1: TUniLabel;
    E_Search: TUniEdit;
    Sb_Search: TUniSpeedButton;
    Sb_Filter: TUniSpeedButton;
    E_Posit_Level: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    Rg_Cluster: TUniRadioGroup;
    Rg_Kind: TUniRadioGroup;
    Rg_Source_: TUniRadioGroup;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure setImages;Override;
    procedure ShowData;Override;
    procedure ShowNoData;Override;
    function ValidaInsert():boolean;Override;
    procedure Insert;Override;
    function ValidateChange():boolean;Override;
    procedure Change;Override;
    function ValidateSave: boolean;Override;
    procedure Save;Override;
    function ValidateDelete:boolean;Override;
    procedure Delete;Override;
    procedure EditionControl;Override;
    function getLevel( s : String ) : integer;
    procedure FillTreeViewUni(cat : TFinancialPlans);
    procedure FillTreeView;
    procedure NodeByName (Tree : TUniTreeView; Value:String);
    procedure getToChange;
    procedure Sb_FilterClick(Sender: TObject);
    procedure Trw_CadastroChange(Sender: TObject; Node: TUniTreeNode);
    procedure Sb_SearchClick(Sender: TObject);
  private
    { Private declarations }
    SelectedNode : TUniTreeNode;
  public
    { Public declarations }
    FinancialPlans : TControllerFinancialPlans;
  end;

var
  CadFinancialPlans: TCadFinancialPlans;

implementation

{$R *.dfm}

uses msg_form, unMessages, UnFunctions, MainModule;

{ TCadCategory }

procedure TCadFinancialPlans.getToChange;
Var
  I : Integer;
  lcat : Integer;
Begin
 lcat := StrToIntDef( Copy( SelectedNode.Text ,1,4) ,0);
  for I := 0 to FinancialPlans.Lista.Count - 1  do
  Begin
    if ( lcat = TFinancialPlans( Self.FinancialPlans.Lista.Items[I]).Codigo ) then
    Begin
      FinancialPlans.Registro :=  FinancialPlans.Lista[I] ;
      CodigoRegistro := FinancialPlans.Registro.Codigo;
      break;
    End;
  End;
End;


procedure TCadFinancialPlans.Change;
begin
  EditionState := 'E';
  EditionControl;
  E_Description.Text := FinancialPlans.Registro.Descricao;
end;

procedure TCadFinancialPlans.Delete;
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
          Self.FinancialPlans.deleteByLevel;
          Self.FillTreeView;
        End;
      end
    );
end;


procedure TCadFinancialPlans.EditionControl;
begin
  inherited;
  E_Search.ReadOnly := False;
  sb_filter.Enabled := ( EditionState = 'B' );
  Sb_Search.Enabled := ( EditionState = 'B' );
end;

procedure TCadFinancialPlans.InitVariable;
begin
  inherited;
  FinancialPlans := TControllerFinancialPlans.Create(Self);
end;

procedure TCadFinancialPlans.Insert;
Var
  lBotao : Integer;
begin
  MensagePadrao('Mensagem de Confirmação',
                ['Infome o tipo de Operação.'],
                ['Nivel','SubNível','Cancelar'],
                [bNormal,bNormal,bEscape],
                mpConfirmacao);
  FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      lBotao := (Sender as TMsgForm).BotaoEscolhido;
      case lBotao of
        0:Begin
            SelectedNode := nil;
            Self.FinancialPlans.clear;
          End;
        1:Begin
            Self.FinancialPlans.Registro.Codigo := 0;
            CodigoRegistro := Self.FinancialPlans.Registro.Codigo;
          End
        else
          Begin
            Exit;
          End;
      end;
      EditionState := 'I';
      EditionControl;
      //self.ClearAllFields;
      E_Description.SetFocus;
    end
  );
end;

procedure TCadFinancialPlans.Save;
Var
  lText : String;
begin
  with FinancialPlans.Registro do
  Begin
    Descricao := E_Description.Text;
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Tipo := 'P';
    NivelPosicao := E_Posit_Level.Text;
    if Rg_Cluster.ItemIndex = 0 then
      Agrupador := 'S'
     else
      Agrupador := 'A';
    if Rg_Kind.ItemIndex = 0 then
      Tipo := 'C'
     else
      Tipo := 'R';
    if Rg_Source_.ItemIndex = 0 then
      Fonte := 'C'
     else
      Fonte := 'D';
    if chbx_cad_active.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
  End;
  FinancialPlans.save;
  //Mostra na Arvore
  Self.FillTreeView;
  inherited;
  NodeByName(Trw_Cadastro,E_Description.Text);
end;

function TCadFinancialPlans.getLevel( s : String ) : integer;
Var
  LRes : Integer;
begin
  LRes := Length( StringReplace( s, '.', '', [rfReplaceAll]));
  Result := Length( s )- LRes ;
end;

procedure TCadFinancialPlans.FillTreeViewUni(cat : TFinancialPlans);
Var
  lLevel : Integer;
  lText : String;
BEgin
  lLevel := getLevel( cat.NivelPosicao );
  if ( lLevel = 0 ) then
  Begin
    SelectedNode := nil;
    lText :=  StrZero( cat.Codigo,4,0);
    lText := lText + ' - ' + cat.Descricao;
    Trw_Cadastro.Items.AddChild(SelectedNode, lText );
    SelectedNode := Trw_Cadastro.Items.Item[Trw_Cadastro.Items.Count-1];
  End
  else
  Begin
    lText :=  StrZero( cat.Codigo,4,0);
    lText := lText + ' - ' + cat.Descricao;
    Trw_Cadastro.Items.AddChild(SelectedNode, lText );
  End;
  SelectedNode.ImageIndex := cat.Codigo;
End;

procedure TCadFinancialPlans.FillTreeView;
var
  I : Integer;
begin
  Self.Trw_Cadastro.Items.Clear;
  Self.FinancialPlans.getAll;
  for I := 0 to FinancialPlans.Lista.Count - 1 do
  Begin
    FillTreeViewUni( TFinancialPlans(FinancialPlans.Lista[i]) );
  End;
end;

procedure TCadFinancialPlans.Sb_SearchClick(Sender: TObject);
begin
  inherited;
  NodeByName(Trw_Cadastro,E_Search.Text);
end;

procedure TCadFinancialPlans.Sb_FilterClick(Sender: TObject);
begin
  FillTreeView;
end;

procedure TCadFinancialPlans.setImages;
begin
  inherited;
  buttonIcon(Sb_Filter,'filter.bmp');
end;

procedure TCadFinancialPlans.SetVariable;
begin
  FinancialPlans.Registro.Codigo := CodigoRegistro;
  FinancialPlans.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  inherited;
end;

procedure TCadFinancialPlans.ShowData;
begin
  inherited;
  //
end;

procedure TCadFinancialPlans.ShowNoData;
begin
  inherited;
  //
end;

procedure TCadFinancialPlans.Trw_CadastroChange(Sender: TObject; Node: TUniTreeNode);
begin
  if ( Trw_Cadastro.Items.Count > 0 ) then
  Begin
    SelectedNode := Node;
    getToChange;
    E_Description.Text := FinancialPlans.Registro.Descricao;
    if FinancialPlans.Registro.Agrupador = 'S' then
      Rg_Cluster.ItemIndex := 0
     else
      Rg_Cluster.ItemIndex := 1;
    if FinancialPlans.Registro.Tipo = 'C' then
      Rg_Kind.ItemIndex := 0
     else
      Rg_Kind.ItemIndex := 1;
    if FinancialPlans.Registro.Fonte = 'C' then
      Rg_Source_.ItemIndex := 0
     else
      Rg_Source_.ItemIndex := 1;
    E_Posit_Level.Text := FinancialPlans.Registro.NivelPosicao;
    chbx_cad_active.Checked := (FinancialPlans.Registro.Ativo = 'S');
    EditionState := 'B';
    EditionControl;
  End;
end;

function TCadFinancialPlans.ValidaInsert: boolean;
begin
  //
end;

function TCadFinancialPlans.ValidateChange: boolean;
Var
  I : Integer;
  lCat : Integer;
begin
  Result := True;
  exit;
  if SelectedNode = nil then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhum registro Selecionado.',
                  'Verifique antes de continuar.']);
    Result := False;
    exit;
  End;

  getToChange;
  if (FinancialPlans.Registro.Codigo = 0 ) then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Registro Selecionado não encontrado.',
                  'Verifique antes de continuar.']);
    Result := False;
    exit;
  End;

end;

function TCadFinancialPlans.ValidateDelete: boolean;
begin
  //
end;

function TCadFinancialPlans.ValidateSave: boolean;
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

Procedure TCadFinancialPlans.NodeByName (Tree : TUniTreeView; Value:String);
var
  I  : Integer;
  lText : String;
begin
  For I := 0 to Tree.Items.Count - 1 do
  begin
    lText := Copy(Tree.Items[I].Text,8, Length(Tree.Items[I].Text));
    if (Pos(UpperCase(Value), UpperCase(lText)) > 0) then
    begin
      Tree.Items.Item[I].Selected:=True;
      Break;
    end;
  End;
end;

end.
