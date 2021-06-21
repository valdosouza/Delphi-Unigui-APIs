unit cad_interation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel,controllerIteration, uniMemo,
  uniEdit, uniLabel,unmessages,msg_form,UnFunctions,fm_Situation, fm_customer,
  uniPageControl, uniDBGrid, Datasnap.Provider, uniFileUpload, uniBasicGrid, uniImage,
  System.Generics.Collections, Vcl.Clipbrd, uniHTMLMemo;

type
  TCadInteration = class(TBaseRegistry)
    E_Description: TUniEdit;
    ctn_Customer: TUniContainerPanel;
    Pc_interacao: TUniPageControl;
    tbs_interacao: TUniTabSheet;
    tbs_atachament: TUniTabSheet;
    ctn_Situacao: TUniContainerPanel;
    UniPanel3: TUniPanel;
    Sb_search_Attachament: TUniSpeedButton;
    Btn_Download: TUniSpeedButton;
    UniSpeedButton2: TUniSpeedButton;
    Btn_ApagarAnexo: TUniSpeedButton;
    UniDBGrid1: TUniDBGrid;
    UniFileUpload: TUniFileUpload;
    DSP: TDataSetProvider;
    cds_attachament: TClientDataSet;
    Ds_cds_attachament: TDataSource;
    UniPopupMenu1: TUniPopupMenu;
    ExcluirAnexo1: TUniMenuItem;
    pnl_row_2: TUniPanel;
    pnl_row_1: TUniPanel;
    pnl_interacao_row_1: TUniPanel;
    M_Detail: TUniHTMLMemo;
    procedure Sb_search_AttachamentClick(Sender: TObject);
    procedure UniSpeedButton2Click(Sender: TObject);
    procedure Btn_ApagarAnexoClick(Sender: TObject);
    procedure Btn_DownloadClick(Sender: TObject);
    procedure UniFileUploadCompleted(Sender: TObject; AStream: TFileStream);
  private
    { Private declarations }
    ListofAtachament : TDictionary<Integer, TBitmap>;
    procedure ShowCustomer;
    procedure ShowSituation;
    function validaExcluiAnexo:Boolean;
    function AdicionaImagem:boolean;
    procedure MostraImagem;
    procedure CarregaPrint;
    procedure LimpaScrollImagens;
    procedure PosicionaIndiceImagem(Sender: TObject);
    procedure ExcluirImagem(Sender: TObject);
  protected
    CustomerID : Integer;
    FrSituation : TFmSituation;
    FrCustomer  : TFmCustomer;
    procedure SerchAttchament;
    procedure setImages;override;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    Procedure geralog(acesso : string);

    procedure ShowData;Override;
    procedure ShowNoData;override;
    procedure Insert;Override;


    //Deletar
    function ValidateDelete():boolean;Override;
    procedure Delete;Override;
    //Salvar
    function ValidateSave():boolean;Override;
    procedure Save;Override;
    function ValidateSaveBeforeAtachament():Boolean;virtual;
    procedure SaveBeforeAtachament;virtual;
    procedure SaveOrder;
    procedure SaveIteration;Virtual;
    procedure SaveHasIteration;

    //Cancelar
    function ValidateCancel():boolean;Override;
    procedure Cancel;Override;

    procedure EditionControl;Override;
    procedure EditionCustomer;
  public
    { Public declarations }
    Interation : TcontrollerIteration;
    kinditeration : String;
    NumeroAtendimento : Integer;
  end;

var
  CadInteration: TCadInteration;

implementation

{$R *.dfm}

uses MainModule;

{ TCadInteration }

function TCadInteration.AdicionaImagem: boolean;
var
  bmp: TBitmap;
  LcImage: TUniImage;
  LcNrCount : Integer;
  LcNrCol : Integer;
  LcNrRow : Integer;
  I : Integer;
begin
  Result := True;
  if ListofAtachament.Count >=9 then
  Begin
    ShowMessage('Total de prints máximo permitido atingido!');
    Result := False;
    exit;
  End;
  if not Clipboard.HasFormat(CF_PICTURE) then
  begin
    ShowMessage('Imagem não encontrada na área de Transferência!');
    Result := False;
    exit;
  end;
  bmp := TBitmap.Create;
  try
    bmp.Assign(Clipboard);
    ListofAtachament.Add(ListofAtachament.Count + 1, bmp);
  except
    Result := False;
  end;
end;

procedure TCadInteration.Btn_ApagarAnexoClick(Sender: TObject);
begin
  if validaExcluiAnexo then
  Begin
    MensageYesNo(['C O N F I R M A Ç Ã O!',
                  '',
                  'Deseja realmente excluir este registro?',
                  'clique em SIM para confirmar.'],mpAlerta);
    FormMsg.ShowModal(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if (Sender as TMsgForm).BotaoEscolhido > 0 then
      Begin
        Self.Interation.Anexo.Registro.Estabelecimento := cds_attachament.FieldByName('tb_institution_id').AsInteger;
        Self.Interation.Anexo.Registro.Ordem           := cds_attachament.FieldByName('tb_order_id').AsInteger;
        Self.Interation.Anexo.Registro.Codigo          := cds_attachament.FieldByName('id').AsInteger;
        Self.Interation.Anexo.Registro.Iteracao        := cds_attachament.FieldByName('tb_iteration_id').AsInteger;
        Self.Interation.Anexo.delete;
        SerchAttchament;
      End;
    end
    );
  End;

end;

procedure TCadInteration.Btn_DownloadClick(Sender: TObject);
begin
  UniSession.AddJS(concat('window.open(''',cds_attachament.FieldByName('path_file').AsString,''')'));

//  UniSession.SendFile(cds_attachament.FieldByName('path_file').AsString);
end;

procedure TCadInteration.Cancel;
begin
  inherited;

end;



procedure TCadInteration.CarregaPrint;
begin
 { if not Clipboard.HasFormat(CF_PICTURE) then
  begin
    ShowMessage('Imagem não encontrada na área de Transferência!');
    exit;
  end;
  try
    img_Print.Picture.Graphic := nil;
    img_Print.Picture.Bitmap.Assign(Clipboard);
  except

  end;
 }
end;

procedure TCadInteration.Delete;
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
      //Anexo
      self.Interation.Anexo.registro.Estabelecimento := self.Interation.Registro.Estabelecimento;
      self.Interation.Anexo.registro.Ordem           := self.Interation.Registro.Ordem;
      self.Interation.Anexo.deletebyIteration;
      //Has Interation
      self.Interation.HasInteration.registro.Estabelecimento  := self.Interation.Registro.Estabelecimento;
      self.Interation.HasInteration.registro.Ordem            := self.Interation.Registro.Ordem;
      self.Interation.HasInteration.deletebyIteration;
      //Interation
      self.Interation.registro.Estabelecimento := self.Interation.Registro.Estabelecimento;
      self.Interation.registro.Ordem            := self.Interation.Registro.Ordem;
      self.Interation.registro.Codigo           := self.Interation.Registro.Codigo;
      self.Interation.delete;
      //order
      self.Interation.Order.delete;
      Self.Close;
    End;
  end
  );


end;

procedure TCadInteration.EditionControl;
begin
  inherited;
  EditionControler(FrCustomer);
  EditionControler(FrSituation);
  EditionCustomer;
end;

procedure TCadInteration.EditionCustomer;
begin
//  if ( EditionState = 'E' ) then
  if Interation.Registro.Cliente > 0 then
  Begin
    FrCustomer.DBLCB_Lista.ReadOnly := (FrCustomer.DBLCB_Lista.Text <> '');
    FrCustomer.Sb_Register.Enabled  := (FrCustomer.DBLCB_Lista.Text = '');
    FrCustomer.Sb_Search.Enabled    := (FrCustomer.DBLCB_Lista.Text = '');
  End;
end;

procedure TCadInteration.ExcluirImagem(Sender: TObject);
var
   pt : TPoint;
begin
  pt.x := TUniImage(Sender).Left + 1;
  pt.y := TUniImage(Sender).Top + TUniImage(Sender).Height + 1;
  pt := Self.ClientToScreen( pt );
  UniPopupMenu1.popup( pt.x, pt.y );
end;

procedure TCadInteration.FormatScreen;
begin
  inherited;
  ShowCustomer;
  ShowSituation;
end;

procedure TCadInteration.geralog(acesso: string);
begin

end;

procedure TCadInteration.InitVariable;
begin
  inherited;
  Interation := TcontrollerIteration.create(Self);
  ListofAtachament :=  TDictionary<Integer, TBitmap>.create;
  ListofAtachament.Clear;
  Pc_interacao.ActivePage := tbs_interacao
end;

procedure TCadInteration.Insert;
begin
  inherited;
  //ClearAllFields; os dados são repassados  na chamada da tela
  FrCustomer.DBLCB_Lista.KeyValue := Interation.Registro.Cliente;
  EditionCustomer;
  E_Description.Clear;
  E_Description.SetFocus;
  M_Detail.Clear;
  Interation.Registro.Codigo := 0;
end;

procedure TCadInteration.LimpaScrollImagens;
Label Inicio;
begin
Inicio:
{  if Sbx_Atachament.ComponentCount > 0 then
  Begin
    TUniImage(Sbx_Atachament.Components[0]).DisposeOf;
    goto Inicio;
  End;
}
end;

procedure TCadInteration.MostraImagem;
var
  LcImage: TUniImage;
  LcNrCount : Integer;
  LcNrCol : Integer;
  LcNrRow : Integer;
  I : Integer;
begin
  {
  LcNrCount := ListofAtachament.Count;
  if LcNrCount > 0 then
  Begin
    LcNrCol := 0 ;
    for I := 1 to LcNrCount do
    Begin
      case ListofAtachament.Count of
        0..3:LcNrRow := 1;
        4..6:LcNrRow := 2;
        7..9:LcNrRow := 3;
      end;
      case LcNrRow of
        1:LcNrCol := LcNrCount;
        2:LcNrCol := LcNrCount - 3;
        3:LcNrCol := LcNrCount - 6;
      end;
      if ListofAtachament.ContainsKey(I) then
      Begin
        LcImage := TUniImage.create(Sbx_Atachament);
        LcImage.Width   := 255;
        LcImage.Height  := 255;
        LcImage.Left  := 255 * (LcNrCol-1);
        LcImage.Top   := 255 * (LcNrRow-1);
        LcImage.Tag := I;
        LcImage.Picture.Bitmap.Assign(ListofAtachament[I]);
        LcImage.Parent := Sbx_Atachament;
        LcImage.OnClick := ExcluirImagem;
        LcImage.OnMouseEnter := PosicionaIndiceImagem;
      End;
    End;
  End;
  }
end;

procedure TCadInteration.PosicionaIndiceImagem(Sender: TObject);
begin
  Try
    UniPopupMenu1.Tag := TUniImage(Sender).Tag;
  except
    exit;
  End;
end;

procedure TCadInteration.Save;
begin
  inherited;
  if (EditionState = 'I') then
    SaveOrder;
  SaveIteration;
  if (EditionState = 'I') then
    SaveHasIteration;

end;

procedure TCadInteration.SaveBeforeAtachament;
begin
  if (EditionState = 'I') then
    SaveOrder;
  SaveIteration;
  if (EditionState = 'I') then
    SaveHasIteration;
  //depois de salvar temos que mudar o estado de edidçao para E, evitando cadstro duplo
  EditionState := 'E';
end;

procedure TCadInteration.SaveHasIteration;
begin
  if Interation.HasInteration.Registro.MasterId > 0 then
  Begin
    with Interation.HasInteration.Registro do
    Begin
      //é preehido na entrada da tela onde sabemos quem é  master desta iteração
      //Estabelecimento     := Iteration.Order.Registro.Estabelecimento;
      //Ordem               := Iteration.Order.Registro.Codigo;
      //MasterId            := 0;
      DetailId            := Interation.Registro.Codigo;
    End;
    Interation.HasInteration.insert;
  End;

end;

procedure TCadInteration.SaveIteration;
begin
  with Interation do
  Begin
    with Registro do
    Begin
      Estabelecimento     := Order.Registro.Estabelecimento ;
      Ordem               := Order.Registro.Codigo;
      Cliente             := FrCustomer.DBLCB_Lista.KeyValue;
      Descricao           := E_Description.text;
      Detalhe             := M_Detail.text;
      Tipo                := kinditeration;//atendimento;
      Situacao            := FrSituation.DBLCB_Lista.KeyValue;
      Anexo               := '';
    End;
  End;
  Interation.save;
end;

procedure TCadInteration.SaveOrder;
begin
  if Interation.HasInteration.Registro.Ordem = 0 then
  Begin
    with Interation.Order.Registro do
    Begin
      Codigo          := 0;
      Estabelecimento := UMM.GInstitution.registro.Codigo;
      Terminal        := 0;
      Data            := Date;
      Observacao      := '';
      Origem          := '';
      Status          := 'N';
      SendoUsado      := 'N';
      Usuario         := UMM.GInstitution.User.Registro.Codigo;
    End;
     Interation.Order.insert;
  End
  else
  Begin
    with Interation.Order.Registro do
    Begin
      Codigo          := Interation.HasInteration.Registro.Ordem;
      Estabelecimento := Interation.HasInteration.Registro.Estabelecimento;
    End;
  End;

end;

procedure TCadInteration.Sb_search_AttachamentClick(Sender: TObject);
Var
  LcPath,LcFile : String;
  LcUrl : String;
begin
  SerchAttchament;
end;

procedure TCadInteration.SerchAttchament;
begin
  cds_attachament.Active := False;
  with UMM.Qr_Crud do
  BEgin
    active := false;
    sql.Clear;
    sql.Add(concat(
        'select * ',
        'from tb_iteration_attachment ',
        'where  ( tb_institution_id=:tb_institution_id ) ',
        ' and ( tb_order_id =:tb_order_id )              ',
        ' and ( tb_iteration_id =:tb_iteration_id )              '
    ));
    ParamByName('tb_institution_id').AsInteger := Interation.Registro.Estabelecimento;
    ParamByName('tb_order_id').AsInteger := Interation.Registro.Ordem;
    ParamByName('tb_iteration_id').AsInteger := Interation.Registro.Codigo;
    active := True;
  End;
  cds_attachament.Active := True;
end;

procedure TCadInteration.setImages;
begin
  inherited;

end;

procedure TCadInteration.SetVariable;
begin
  if CodigoRegistro > 0 then
  BEgin
    Interation.Registro.Codigo := CodigoRegistro ;
    Interation.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Interation.getbyKey;
  End;
  inherited;

end;

procedure TCadInteration.ShowCustomer;
begin
  FrCustomer := TFmCustomer.Create(Self);
  FrCustomer.Parent := Ctn_Customer;
  FrCustomer.Align := alClient;
  FrCustomer.listar;
  FrCustomer.Show;
end;

procedure TCadInteration.ShowData;
begin
  if Interation.exist then
  Begin
    FrCustomer.DBLCB_Lista.KeyValue := Interation.Registro.Cliente;
    E_Description.Text  := Interation.Registro.Descricao;
    M_Detail.Text     := Interation.Registro.Detalhe;
    FrSituation.DBLCB_Lista.KeyValue := Interation.Registro.Situacao;
  End;
  inherited;
end;


procedure TCadInteration.ShowNoData;
begin
  inherited;

end;

procedure TCadInteration.ShowSituation;
begin
  FrSituation := TFmSituation.Create(Self);
  FrSituation.Parent := ctn_Situacao;
  FrSituation.Listar;
  FrSituation.Align := alClient;
  FrSituation.Show;
end;


procedure TCadInteration.UniFileUploadCompleted(Sender: TObject;
  AStream: TFileStream);
var
  DestName : string;
  DestFolder : string;
  LcNewFile : String;
  LcPath : String;
  LcUrl : String;
begin
  if ValidateSaveBeforeAtachament then
  begin
    Self.showMask('Carregando...');
    //Salva o chamado antes de carregar o anexo
    if Interation.Registro.Codigo = 0 then
    Begin
      SaveBeforeAtachament
    End;
    Interation.Anexo.Registro.Codigo           := Interation.Anexo.getnext;
    Interation.Anexo.Registro.Estabelecimento  := Interation.Registro.Estabelecimento;
    Interation.Anexo.Registro.Ordem            := Interation.Registro.Ordem;
    Interation.Anexo.Registro.Iteracao         := Interation.Registro.Codigo;
    //carregar o anexo propriamente dito
    UMM.GInstitution.getRepository(False,'');
    DestName  := concat(UMM.GInstitution.PathPublico , ExtractFileName(UniFileUpload.FileName));
    CopyFile(PChar(AStream.FileName), PChar(DestName), False);

    LcPath := concat(UMM.GInstitution.PathPublico,UMM.GInstitution.User.Registro.Codigo.ToString,'\','chamados','\');
    ForceDirectories(LcPath);
    LcNewFile := concat('img_iteration_',
                      Interation.Anexo.Registro.Estabelecimento.ToString,'_',
                      Interation.Anexo.Registro.Ordem.ToString,'_',
                      Interation.Anexo.Registro.Iteracao.ToString,'_',
                      Interation.Anexo.Registro.Codigo.ToString,'.jpg');
    RenameFile(DestName,concat(LcPath,LcNewFile));

    LcUrl   := concat(UMM.GInstitution.URL,UMM.GInstitution.User.Registro.Codigo.ToString,'/','chamados');
    //Depois de carregar o arquivo salva o caminho
    Interation.Anexo.Registro.Caminho := concat(LcUrl,'/',LcNewFile);
    //Iteration.Anexo.Registro.Caminho := StringReplace(Iteration.Anexo.Registro.Caminho, '\', '-', [rfReplaceAll]);
    Interation.Anexo.save;
    SerchAttchament;
    self.HideMask;
  end;
end;

procedure TCadInteration.UniSpeedButton2Click(Sender: TObject);
begin
  inherited;
  uniFileUpload.TargetFolder := 'c:\Temp\';
  uniFileUpload.Execute;
end;

function TCadInteration.validaExcluiAnexo: Boolean;
begin
  Result := TRue;
  if not cds_attachament.Active then
  Begin
     MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para excluir.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  End;

  if cds_attachament.RecordCount = 0 then
  Begin
     MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para excluir.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  End;
end;

function TCadInteration.ValidateCancel: boolean;
begin

end;

function TCadInteration.ValidateDelete: boolean;
begin
  Result := true;
end;

function TCadInteration.ValidateSave: boolean;
begin
  Result := True;
  if trim(FrCustomer.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Cliente não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(E_Description.Text) = '' then
  begin
      MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Descrição não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;
  if trim(m_Detail.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Detalhe não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

  if trim(FrSituation.DBLCB_Lista.Text) = '' then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Campo Sittuação não informado.',
                  'Preencha o campo para continuar']);
    Result := False;
    exit;
  end;

end;

function TCadInteration.ValidateSaveBeforeAtachament: Boolean;
begin
  result := true;
  if not ValidateSave then
  Begin
    result := False;
    exit;
  End;

end;

end.
