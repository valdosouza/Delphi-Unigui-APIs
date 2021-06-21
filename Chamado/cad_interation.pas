unit cad_interation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,Soap.EncdDecd,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,synacode,ClipBrd,
  uniGUIClasses, uniGUIForm,  uniGUIBaseClasses, uniButton, uniLabel, MainModule,
  uniPanel, uniEdit, uniMemo, Vcl.Menus, uniMainMenu, Jpeg,
  Data.DB, Datasnap.DBClient, controlleriteration, base_register, uniImage,
  uniPageControl, uniScrollBox, uniBitBtn, uniSpeedButton,
  System.Generics.Collections, Datasnap.Provider, ObjFile,REST.Json,
  uniBasicGrid, uniDBGrid, uniFileUpload,ControllerInstitution, UnFunctions,
  Vcl.StdCtrls, uniHTMLFrame, uniCanvas, ServerModule, System.DateUtils,
  uDataCM, Vcl.Imaging.GIFImg,Vcl.Imaging.PngImage, uniHTMLMemo;

type
  TCadInteration = class(TBaseRegister)
    pnl_row_1: TUniPanel;
    E_Descricao: TUniEdit;
    pnl_button: TUniPanel;
    Sb_Save: TUniSpeedButton;
    Sb_Close: TUniSpeedButton;
    pc_main: TUniPageControl;
    tbs_interation: TUniTabSheet;
    tbs_prints: TUniTabSheet;
    pnl_print_button: TUniPanel;
    Sb_print_save: TUniSpeedButton;
    UniPopupMenu1: TUniPopupMenu;
    ExcluirAnexo1: TUniMenuItem;
    tbs_atachament: TUniTabSheet;
    pnl_attach_button: TUniPanel;
    Sb_Attach_update: TUniSpeedButton;
    dbg_attach: TUniDBGrid;
    DSP: TDataSetProvider;
    cds_attachament: TClientDataSet;
    Ds_cds_attachament: TDataSource;
    Sb_Attach_download: TUniSpeedButton;
    UniFileUpload: TUniFileUpload;
    Sb_Attach_load: TUniSpeedButton;
    Sb_Attach_delete: TUniSpeedButton;
    FramePrint: TUniHTMLFrame;
    pnl_print_img: TUniPanel;
    cds: TClientDataSet;
    cdsimg: TBlobField;
    ds: TDataSource;
    M_Detail: TUniHTMLMemo;
    procedure Sb_SaveClick(Sender: TObject);
    procedure Sb_CloseClick(Sender: TObject);
    procedure Sb_print_saveClick(Sender: TObject);
    procedure Sb_Attach_updateClick(Sender: TObject);
    procedure UniFileUploadCompleted(Sender: TObject; AStream: TFileStream);
    procedure pc_mainChange(Sender: TObject);
    procedure Sb_Attach_loadClick(Sender: TObject);
    procedure Sb_Attach_downloadClick(Sender: TObject);
    procedure Sb_Attach_deleteClick(Sender: TObject);
    procedure UniFormAjaxEvent(Sender: TComponent; EventName: string;
      Params: TUniStrings);


  private
    { Private declarations }
    ListofAtachament : TDictionary<Integer, TBitmap>;
    function AdicionaImagem:boolean;
    procedure MostraImagem;
    procedure LimpaScrollImagens;
    procedure PosicionaIndiceImagem(Sender: TObject);
    procedure ExcluirImagem(Sender: TObject);
    function validaExcluiAnexo:Boolean;
    procedure DrawDBImage;
    procedure SendPrintScreen;
    function ValidateSavePrintScreen:boolean;
    function ValidateSaveAttachament:boolean;
  protected
    procedure SerchAttchament;
    procedure setImages;override;
    procedure InitVariable;override;
    procedure FormatScreen;override;
    Procedure geralog(acesso : string);
    function ValidateSave():boolean;override;
    procedure Save;override;
    procedure SaveOrder;
    procedure SaveIteration;
    procedure SaveHasIteration;
    procedure SaveAttachment;
    procedure ShowData;override;
    procedure ShowNoData;override;
  public
    { Public declarations }
    Iteration : TcontrollerIteration;
    NumeroAtendimento : Integer;
    procedure setVariable;override;
  end;

function CadInteration: TCadInteration;

implementation

{$R *.dfm}

uses unMessages, msg_form;

function CadInteration: TCadInteration;
begin
  Result := TCadInteration(UMM.GetFormInstance(TCadInteration));
end;

{ TCadInteration }

procedure TCadInteration.Sb_SaveClick(Sender: TObject);
  begin
  if ValidateSave then
  begin
    save;
    close;
  end;
end;


procedure TCadInteration.DrawDbImage;
begin
end;

procedure TCadInteration.FormatScreen;
begin
  inherited;
  Sb_Save.Enabled := (Iteration.Registro.Codigo = 0);
end;

procedure TCadInteration.geralog(acesso: string);
begin

end;

procedure TCadInteration.InitVariable;
begin
  Iteration := TcontrollerIteration.create(self);
  ListofAtachament :=  TDictionary<Integer, TBitmap>.create;
  ListofAtachament.Clear;
//  sb_load_print.ClientEvents.ExtEvents.Values['click']:= //'function(sender){}';
//      concat(' function (event) {           ',
//        ' var items = (window.clipboardData  || window.originalEvent.clipboardData).items; ',
//        'console.log(JSON.stringify(items)); // will give you the mime types             ',
////      '   var blob = null;                                                                ',
//      '    alert("Fazendo o loop"); ',
//      '}'
//      );

//      '     for (var i = 0; i < items.length; i++) {                                      ',
//      '       if (items[i].type.indexOf("image") === 0) {                                 ',
//      '         blob = items[i].getAsFile();                                              ',
//      '       }                                                                           ',
//      '     }                                                                             ',
//      '   alert("terminando o loop") ',
//      '   if (blob !== null) {                                                            ',
//      '     alert("Tem Print")                                                                ',
//      '   }else{                                                                               ',
//      '  alert("Não tem print")                                                                ',
//      '  }',
//      '}                                                                                  '




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

procedure TCadInteration.Save;
begin
  inherited;
  SaveOrder;
  SaveIteration;
  SaveHasIteration;
end;

procedure TCadInteration.SaveAttachment;
Var
  LcNewFile : String;
  LcPath : String;
  LcUrl : String;
begin
  Iteration.Anexo.Registro.Estabelecimento  := Iteration.Registro.Estabelecimento;
  Iteration.Anexo.Registro.Ordem            := Iteration.Registro.Ordem;
  Iteration.Anexo.Registro.Iteracao         := Iteration.Registro.Codigo;
  Iteration.Anexo.Registro.Codigo           := Iteration.Anexo.getnext;
  //carregar o anexo propriamente dito
  UMM.GInstitution.getRepository;
  LcNewFile := concat('img_iteration_',
                    Iteration.Anexo.Registro.Estabelecimento.ToString,'_',
                    Iteration.Anexo.Registro.Ordem.ToString,'_',
                    Iteration.Anexo.Registro.Iteracao.ToString,'_',
                    Iteration.Anexo.Registro.Codigo.ToString,'.jpg');

  LcPath := concat(UMM.GInstitution.PathPublico,'chamados','\');
  ForceDirectories(LcPath);

  LcUrl   := concat(UMM.GInstitution.URL,'chamados');
  //Depois de carregar o arquivo salva o caminho
  Iteration.Anexo.Registro.Caminho := concat(LcUrl,'/',LcNewFile);
  //Iteration.Anexo.Registro.Caminho := StringReplace(Iteration.Anexo.Registro.Caminho, '\', '-', [rfReplaceAll]);
  Iteration.Anexo.save;
end;

procedure TCadInteration.SaveHasIteration;
begin
  if Iteration.HasInteration.Registro.MasterId > 0 then
  Begin
    with Iteration.HasInteration.Registro do
    Begin
      //é preehido na entrada da tela onde sabemos quem é  master desta iteração
      //Estabelecimento     := Iteration.Order.Registro.Estabelecimento;
      //Ordem               := Iteration.Order.Registro.Codigo;
      //MasterId            := 0;
      DetailId            := Iteration.Registro.Codigo;
    End;
    Iteration.HasInteration.insert;
  End;
end;

procedure TCadInteration.SaveIteration;
begin
  with Iteration do
  Begin
    with Registro do
    Begin
      Codigo              := 0;
      Estabelecimento     := Order.Registro.Estabelecimento ;
      Usuario             := UMM.GInstitution.User.Registro.Codigo;
      Ordem               := Order.Registro.Codigo;
      Cliente             := umm.Customer ;
      Descricao           := E_Descricao.text;
      Detalhe             := M_Detail.text;
      Tipo                := '1';//atendimento;
      Situacao            := 1;//aberto;
      Anexo               := '';
    End;
  End;
  Iteration.insert;
end;

procedure TCadInteration.SaveOrder;
begin
  if Iteration.HasInteration.Registro.Ordem = 0 then
  Begin
    with Iteration.Order.Registro do
    Begin
      Codigo          := 0;
      Estabelecimento := UMM.GInstitution.Registro.Codigo;
      Terminal        := 0;
      Data            := Date;
      Observacao      := '';
      Origem          := '';
      Status          := 'N';
      SendoUsado      := 'N';
      Usuario         := UMM.GInstitution.User.Registro.Codigo;
    End;
     Iteration.Order.insert;
  End
  else
  Begin
    with Iteration.Order.Registro do
    Begin
      Codigo          := Iteration.HasInteration.Registro.Ordem;
      Estabelecimento := UMM.GInstitution.Registro.Codigo;
    End;
  End;
end;

procedure TCadInteration.Sb_print_saveClick(Sender: TObject);
begin
 if ValidateSavePrintScreen then
  begin
    if Iteration.Registro.Codigo = 0 then
      Save;
    SaveAttachment;
    SendPrintScreen;
  end;
end;

procedure TCadInteration.setImages;
begin
  inherited;

end;

procedure TCadInteration.setVariable;
begin
  inherited;
  if Iteration.Registro.Codigo > 0 then
    Iteration.getByKey;
  if Iteration.exist then
  BEgin
    ShowData;
  End;


end;

procedure TCadInteration.ShowData;
begin
  inherited;
  E_Descricao.Text := Iteration.Registro.Descricao;
  M_Detail.Text :=    Iteration.Registro.Detalhe;
end;

procedure TCadInteration.ShowNoData;
begin
  inherited;

end;

function TCadInteration.AdicionaImagem:Boolean;
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

procedure TCadInteration.Sb_CloseClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TCadInteration.Sb_Attach_deleteClick(Sender: TObject);
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
        Self.Iteration.Anexo.Registro.Estabelecimento := cds_attachament.FieldByName('tb_institution_id').AsInteger;
        Self.Iteration.Anexo.Registro.Ordem           := cds_attachament.FieldByName('tb_order_id').AsInteger;
        Self.Iteration.Anexo.Registro.Codigo          := cds_attachament.FieldByName('id').AsInteger;
        Self.Iteration.Anexo.Registro.Iteracao        := cds_attachament.FieldByName('tb_iteration_id').AsInteger;
        Self.Iteration.Anexo.delete;
        SerchAttchament;
      End;
    end
    );
  End;
end;

procedure TCadInteration.Sb_Attach_downloadClick(Sender: TObject);
begin
  UniSession.AddJS(concat('window.open(''',cds_attachament.FieldByName('path_file').AsString,''')'));

//  UniSession.SendFile(cds_attachament.FieldByName('path_file').AsString);
end;

procedure TCadInteration.UniFileUploadCompleted(Sender: TObject;
  AStream: TFileStream);
var
  DestFolder : string;
  LcNewFile : String;
  LcPath : String;
  LcUrl : String;
begin
  //carregar o anexo propriamente dito
  UMM.GInstitution.getRepository;
  LcNewFile := concat('img_iteration_',
                    Iteration.Anexo.Registro.Estabelecimento.ToString,'_',
                    Iteration.Anexo.Registro.Ordem.ToString,'_',
                    Iteration.Anexo.Registro.Iteracao.ToString,'_',
                    Iteration.Anexo.Registro.Codigo.ToString,'.jpg');

  CopyFile(PChar(AStream.FileName), PChar(LcNewFile), False);

  LcPath := concat(UMM.GInstitution.PathPublico,'chamados','\');
  ForceDirectories(LcPath);
  RenameFile(LcNewFile,concat(LcPath,LcNewFile));
end;

procedure TCadInteration.UniFormAjaxEvent(Sender: TComponent; EventName: string;
  Params: TUniStrings);
var
  Input: TStringStream;
  Content : String;
  blob: TStream;

begin
  if EventName = 'saveimg' then
  begin
    Content := Params.Values['img'];
    Input := TStringStream.Create(Content);
    if not cds.Active then cds.CreateDataSet;
    cds.EmptyDataSet;
    cds.Append;
    blob := cds.CreateBlobStream(cds.FieldByName('img'), bmWrite);
    DecodeStream(Input, blob);
    blob.Free;
    Input.Free;
    cds.Post;
  end;
end;

procedure TCadInteration.pc_mainChange(Sender: TObject);
begin
  inherited;
  if TUniPageControl(Sender).ActivePage = tbs_atachament then
  BEgin
    SerchAttchament;
  End;
end;

procedure TCadInteration.Sb_Attach_loadClick(Sender: TObject);
begin
  if ValidateSaveAttachament then
  begin
    SaveAttachment;
    uniFileUpload.TargetFolder := 'c:\Temp\';
    uniFileUpload.Execute;
  end;
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

procedure TCadInteration.Sb_Attach_updateClick(Sender: TObject);
Var
  LcPath,LcFile : String;
  LcUrl : String;
begin
  SerchAttchament;
end;

procedure TCadInteration.SendPrintScreen;
var
  fs: TFileStream;
  Output: TStream;
  LcNewFile : String;
  LcPath : String;

begin
  Output := cds.CreateBlobStream(cds.FieldByName('img'), bmRead);

  UMM.GInstitution.getRepository;
  LcNewFile := concat('img_iteration_',
                     Iteration.Anexo.Registro.Estabelecimento.ToString,'_',
                      Iteration.Anexo.Registro.Ordem.ToString,'_',
                      Iteration.Anexo.Registro.Iteracao.ToString,'_',
                      Iteration.Anexo.Registro.Codigo.ToString,'.jpg');
  LcPath := concat(UMM.GInstitution.PathPublico,'chamados','\');
  ForceDirectories(LcPath);

  fs := TFileStream.Create(LcPath + LcNewFile, fmCreate);
  fs.CopyFrom(Output, Output.Size);

  Output.Free;
  fs.Free;
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
    ParamByName('tb_institution_id').AsInteger := Iteration.Registro.Estabelecimento;
    ParamByName('tb_order_id').AsInteger := Iteration.Registro.Ordem;
    ParamByName('tb_iteration_id').AsInteger := Iteration.Registro.Codigo;
    active := True;
  End;
  cds_attachament.Active := True;
end;

procedure TCadInteration.PosicionaIndiceImagem(Sender: TObject);
begin
  Try
    UniPopupMenu1.Tag := TUniImage(Sender).Tag;
  except
    exit;
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

function TCadInteration.ValidateSave: boolean;
begin
  Result := True;
  if trim(E_Descricao.Text) = '' then
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
end;

function TCadInteration.ValidateSaveAttachament: boolean;
begin
  REsult := True;
  if not ValidateSave then
  begin
    Result := False;
    exit;
  end;
end;

function TCadInteration.ValidateSavePrintScreen: boolean;
begin
  REsult := True;
  if not ValidateSave then
  begin
    Result := False;
    exit;
  end;
  if cds.RecordCount = 0 then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Nenhum imagem de PrintScreen localizado.',
                  'Verifique e tente novamente']);
    Result := False;
    exit;
  end;

end;

end.
