unit Cad_Promotion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_registry, Vcl.Menus, uniMainMenu,
  Data.DB, Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniGroupBox, uniBasicGrid,
  uniDBGrid, uniEdit, uniLabel, Datasnap.Provider, controllerPromotion, mainmodule, unmessages,
  uniCheckBox, ControllerPromotionItems, tblPromotionItems, fm_product, ControllerStock,
  sea_product;

type
  TCadPromotion = class(TBaseRegistry)
    E_promocao: TUniEdit;
    E_Valor: TUniFormattedNumberEdit;
    e_Quantidade: TUniFormattedNumberEdit;
    DBG_Produtos: TUniDBGrid;
    pnl_fundo_linha_1: TUniPanel;
    E_Cd_Barras: TUniEdit;
    UniLabel4: TUniLabel;
    Sb_Ins_Produto: TUniBitBtn;
    Sb_Exc_Produto: TUniBitBtn;
    cds_promotion_itens: TClientDataSet;
    Ds_promotion_itens: TDataSource;
    ChBx_Ativa: TUniCheckBox;
    cds_promotion_itenstb_institution_id: TIntegerField;
    cds_promotion_itenstb_promotion_id: TIntegerField;
    cds_promotion_itenstb_product_id: TIntegerField;
    cds_promotion_itensdescription: TStringField;
    pnl_fundo_linha_2: TUniPanel;
    pnl_fundo_linha_3: TUniPanel;
    E_ValorTotal: TUniFormattedNumberEdit;
    E_Produto: TUniEdit;
    Sb_Search: TUniSpeedButton;
    procedure Sb_Ins_ProdutoClick(Sender: TObject);
    procedure Sb_Exc_ProdutoClick(Sender: TObject);
    procedure E_Cd_BarrasExit(Sender: TObject);
    procedure e_QuantidadeExit(Sender: TObject);
    procedure E_ValorTotalExit(Sender: TObject);
    procedure Sb_SearchClick(Sender: TObject);
  private
    VerifyPromotion : TcontrollerPromotion;
    function AdicionaImagem:boolean;
    procedure MostraImagem;
    procedure GravarItems(cds_promotion_itens: TClientDataSet; PromotionID: Integer);
    function montadescription:String;
  protected
    procedure setImages;override;
    procedure InitVariable;Override;
    procedure SetVariable;Override;
    procedure FormatScreen;Override;
    Procedure geralog(acesso : string);
    procedure ShowData;Override;
    procedure ShowItem;
    procedure ShowlisttItems( cds_promotion_itens : TClientDataSet; CodigoID:Integer);
    procedure ShowNoData;override;
    procedure Insert;Override;
    function VerificaProdutoDuplicado:Boolean;
    function ValidaInsertItem:Boolean;
    procedure InsertItem;
    procedure ClearAllFields;Virtual;

    //Deletar
    function ValidateDelete():boolean;Override;
    procedure Delete;Override;
    procedure DeleteItemCDS;
    procedure DeleteItems(cds_promotion_itens : TClientDataSet; order_id:Integer);
    function ValidaDeleteItems:Boolean;
    //Editar
    function ValidateChange():boolean;Override;
    procedure Change;Override;
    //Salvar
    function ValidateSave():boolean;Override;
    procedure Save;Override;
    procedure SavePromotion;
    procedure SaveItems(cds_promotion_itens : TClientDataSet; PromotionID:Integer);
    //Cancelar
    function ValidateCancel():boolean;Override;
    procedure Cancel;Override;
    procedure EditionControl;Override;
  public
    { Public declarations }
    Promotion : TcontrollerPromotion;
    stock : Tcontrollerstock;
    CodigoDetalhe : Integer;
  end;

var
  CadPromotion: TCadPromotion;

implementation

uses
  msg_form, UnFunctions;

{$R *.dfm}



function TCadPromotion.AdicionaImagem: boolean;
begin

end;

procedure TCadPromotion.Cancel;
begin
  inherited;

end;

procedure TCadPromotion.Change;
begin
  inherited;
  E_promocao.SetFocus;
  if CodigoDEtalhe > 0 then
  Begin
    DBG_Produtos.setfocus;
    cds_promotion_itens.Locate('tb_product_id',CodigoDEtalhe,[]);
  End;
end;

procedure TCadPromotion.ClearAllFields;
begin
  ClearFields(self);
  CodigoDEtalhe := 0;
end;

procedure TCadPromotion.Delete;
begin
  Promotion.Items.Registro.Estabelecimento := Promotion.Registro.Estabelecimento;
  Promotion.Items.Registro.Promocao := Promotion.Registro.Codigo;
  Promotion.Items.deleteByPromotion;
  Promotion.Registro.Ativo := 'N';
  Promotion.update;
  Close;
end;

procedure TCadPromotion.DeleteItems(cds_promotion_itens: TClientDataSet;
  order_id: Integer);
Var
  LcOperacao : String;
  cds_temp : TClientDataSet;
begin
  if cds_promotion_itens.ChangeCount > 0 then
  Begin
    cds_temp := TClientDataSet.Create(Self);
    cds_temp.Data := cds_promotion_itens.Delta;
    cds_temp.First;
    cds_promotion_itens.First;
    //Trata somente os dados deletados
    while not cds_temp.eof do
    Begin
      if cds_temp.UpdateStatus = usDeleted then
      Begin
        //Detalhe
        Promotion.Items.Registro.Promocao         := cds_Temp.FieldByName('tb_promotion_id').AsInteger;
        Promotion.Items.Registro.Estabelecimento  := cds_Temp.FieldByName('tb_institution_id').AsInteger;
        Promotion.Items.Registro.Produto          := cds_Temp.FieldByName('tb_product_id').AsInteger;
        Promotion.Items.delete;
      End;
      cds_temp.Next;
    end;
    cds_temp.Close;
    cds_temp.disposeOf;
  End;
end;

procedure TCadPromotion.EditionControl;
begin
  inherited;
  Sb_Ins_Produto.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
  Sb_Exc_Produto.Enabled := ( EditionState = 'I' ) or ( EditionState = 'E' );
end;

procedure TCadPromotion.E_Cd_BarrasExit(Sender: TObject);
begin
  E_Produto.Tag  := 0;
  E_Produto.Clear;
  if Length(E_Cd_Barras.Text) >=8 then
  Begin
    Promotion.Items.Produto.Parametro.Produto.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Promotion.Items.Produto.Parametro.CodigoBarras := E_Cd_Barras.Text;
    Promotion.Items.Produto.getByCodebar;
    IF Promotion.Items.Produto.exist THEN
    Begin
      E_Produto.Tag  := Promotion.Items.Produto.Registro.Codigo;
      E_Produto.Text := Promotion.Items.Produto.Registro.Descricao;
      Sb_Ins_ProdutoClick(sender);
    End;
  End;
end;

procedure TCadPromotion.e_QuantidadeExit(Sender: TObject);
begin
  inherited;
  montadescription;
end;

procedure TCadPromotion.E_ValorTotalExit(Sender: TObject);
begin
  inherited;
  montadescription;
end;

procedure TCadPromotion.DeleteItemCDS;
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
          cds_promotion_itens.Delete;
        End;
      end
    );


end;

procedure TCadPromotion.FormatScreen;
begin
  inherited;
end;

procedure TCadPromotion.geralog(acesso: string);
begin

end;

procedure TCadPromotion.GravarItems(cds_promotion_itens: TClientDataSet;
  PromotionID: Integer);
begin

end;

procedure TCadPromotion.InitVariable;
begin
  inherited;
  Promotion := TControllerPromotion.Create(Self);
  VerifyPromotion := TcontrollerPromotion.Create(Self);
  CodigoDEtalhe := 0;
end;

procedure TCadPromotion.Insert;
begin
  inherited;
  ClearAllFields;
  ChBx_Ativa.Checked := True;
  E_promocao.SetFocus;
end;

procedure TCadPromotion.InsertItem;
begin
 with self.cds_promotion_itens do
  Begin
    if not Active then createDataset;
    Append;
    FieldByName('tb_institution_id').AsInteger  := UMM.GInstitution.registro.Codigo;
    FieldByName('tb_promotion_id').AsInteger    := Promotion.Registro.Codigo;
    FieldByName('tb_product_id').AsInteger      := E_Produto.Tag;
    FieldByName('description').AsString         := E_Produto.Text;
    Post;
    Active := False;
    Active := True;
  End;
end;

function TCadPromotion.montadescription: String;
Var
  LcQtde:REal;
  LcValor:REal;
begin
  Result := '';

  LcQtde := StrToFloatDef(e_Quantidade.Text,0);
  Result := concat(FloatToStrF(LcQtde,ffFixed,10,0),' X ');

  LcValor := StrToFloatDef(E_ValorTotal.Text,0);

  Result := concat(Result, FloatToStrF(LcValor,ffFixed,10,2));

  E_Valor.Text := FloatToStrF(LcValor / LcQtde  ,ffFixed,10,2);
  E_promocao.Text := Result;
end;

procedure TCadPromotion.MostraImagem;
begin

end;

procedure TCadPromotion.Save;
begin
  SavePromotion;
  saveItems(cds_promotion_itens,Promotion.Registro.Codigo);
  CodigoRegistro := Promotion.Registro.Codigo;
  EditionState := 'B';
  GeraLogOperation('GRAVOU',
                    concat('Promoção : ',
                        Promotion.Registro.Codigo.ToString, ' - ',
                        Promotion.Registro.Descricao  )
                  );
end;

procedure TCadPromotion.SaveItems(cds_promotion_itens: TClientDataSet;
  PromotionID: Integer);
Var
  LcOperacao : String;
begin
  deleteItems(cds_promotion_itens, PromotionID);

  if cds_promotion_itens.ChangeCount > 0 then
  Begin
    cds_promotion_itens.First;
    //Trata somente os dados Inseridos ou Alterados
    while not cds_promotion_itens.eof do
    Begin
      with Promotion.Items do
      Begin
        Registro.Promocao         := Promotion.Registro.Codigo;
        Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo;
        Registro.Produto          := cds_promotion_itens.FieldByName('tb_product_id').AsInteger;
        case cds_promotion_itens.UpdateStatus of
          usModified: update;
          usInserted: Begin
                        insert;
                        GeraLogOperation('GRAVOU',
                                          concat('Item de Promoção : ',
                                              cds_promotion_itens.FieldByName('tb_product_id').AsString, ' - ',
                                              cds_promotion_itens.FieldByName('description').AsString  )
                                        );
          End;
        end;
      End;
      cds_promotion_itens.next;
    End;
    cds_promotion_itens.MergeChangeLog;
  End;
end;

procedure TCadPromotion.SavePromotion;
begin
  with Promotion.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.registro.Codigo;
    Descricao := E_promocao.Text;
    Preco := StrtoFloatDef(E_Valor.Text,0);
    Quantidade := StrtoFloatDef(e_Quantidade.Text,0);
    if ChBx_Ativa.Checked then
      Ativo := 'S'
    else
      Ativo := 'N';
  End;
  Promotion.salva;
end;

procedure TCadPromotion.Sb_Exc_ProdutoClick(Sender: TObject);
begin
 if ValidaDeleteItems then
  Begin
    DeleteItemCDS;
  End;
end;

procedure TCadPromotion.Sb_Ins_ProdutoClick(Sender: TObject);
begin
  if ValidaInsertItem then
  Begin
    InsertItem;
    E_Cd_Barras.Clear;
    E_Produto.Tag := 0;
    E_Produto.Clear;
    E_Cd_Barras.SetFocus;
  End;
end;

procedure TCadPromotion.Sb_SearchClick(Sender: TObject);
Var
  Form : TSeaProduct;
begin
  if Form = nil then
    Form := TSeaProduct.Create(UniApplication);
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      if form.cds_search.Active then
      Begin
        Self.E_Produto.tag := form.cds_search.fieldByName('id').AsInteger;
        Self.E_Produto.Text := form.cds_search.fieldByName('description').AsString;
      End;
      Form := nil;
    end
  );

end;

procedure TCadPromotion.setImages;
begin
  inherited;

end;

procedure TCadPromotion.SetVariable;
begin
  if CodigoRegistro > 0 then
  Begin
    Promotion.Parametro.Promocao.Codigo := CodigoRegistro;
    Promotion.Parametro.Promocao.Estabelecimento := UMM.GInstitution.registro.Codigo;
    Promotion.getbyKey;
  End;
  inherited;
end;

procedure TCadPromotion.ShowData;
begin
  with Promotion.Registro do
  Begin
    E_promocao.Text     := Descricao;
    E_ValorTotal.Text   := FloattoStrF(Preco * quantidade,ffFixed,10,2);
    E_Valor.Text        := FloattoStrF(Preco,ffFixed,10,2);
    e_Quantidade.Text   := FloattoStrF(Quantidade,ffFixed,10,0);
    ChBx_Ativa.Checked  := (Ativo = 'S');
  End;
  ShowlisttItems( cds_promotion_itens,CodigoRegistro);
  inherited;
end;

procedure TCadPromotion.ShowItem;
begin
  Promotion.Items.Registro.Estabelecimento  := UMM.GInstitution.registro.Codigo ;
  Promotion.Items.Registro.Produto          := CodigoDetalhe;
  Promotion.Items.Registro.Promocao         := Promotion.Registro.Codigo;
  Promotion.Items.getbyId;
  if Promotion.Items.exist then
  Begin
    with cds_promotion_itens  do
    Begin
      if not Active then CreateDataSet;
      cds_promotion_itens.LogChanges := False;
      cds_promotion_itens.EmptyDataSet;
      Append;
      FieldByName('tb_institution_id').AsInteger  := Promotion.Items.Registro.Estabelecimento;
      FieldByName('tb_promotion_id').AsInteger    := Promotion.Items.Registro.Promocao;
      FieldByName('tb_product_id').AsInteger      := Promotion.Items.Registro.Produto;
      //dados dos Produtos
      Promotion.Items.Produto.Registro.Codigo     := Promotion.Items.Registro.Produto;
      Promotion.Items.Produto.Registro.Estabelecimento := Promotion.Items.Registro.Estabelecimento;
      Promotion.Items.Produto.getByKey;
      FieldByName('description').AsString := Promotion.Items.Produto.Registro.Descricao;
      Post;
      LogChanges := True;
    End;
  End;
end;

procedure TCadPromotion.ShowlisttItems(cds_promotion_itens: TClientDataSet;
  CodigoID: Integer);
Var
  I : Integer;
  Registro : TPromotionItems;
begin
  Promotion.Items.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo;
  Promotion.Items.Registro.Promocao := CodigoID;
  Promotion.Items.getList;

  with cds_promotion_itens  do
  Begin
    if not Active then CreateDataSet;
    cds_promotion_itens.LogChanges := False;
    cds_promotion_itens.EmptyDataSet;
    for I := 0 to Promotion.Items.Lista.Count - 1 do
    Begin
      Registro := Promotion.Items.Lista[I];
      Append;
      FieldByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      FieldByName('tb_promotion_id').AsInteger    := Registro.Promocao;
      FieldByName('tb_product_id').AsInteger      := Registro.Produto;
      //dados dos Produtos
      Promotion.Items.Produto.Registro.Codigo := Registro.Produto;
      Promotion.Items.Produto.Registro.Estabelecimento := Registro.Estabelecimento;
      Promotion.Items.Produto.getByKey;
      FieldByName('description').AsString := Promotion.Items.Produto.Registro.Descricao;
      Post;
    End;
  End;
  cds_promotion_itens.LogChanges := True;

end;

procedure TCadPromotion.ShowNoData;
begin
  inherited;

end;

function TCadPromotion.ValidaDeleteItems: Boolean;
begin
  Result := True;
  if not cds_promotion_itens.Active then cds_promotion_itens.CreateDataSet;

  if cds_promotion_itens.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.'      ,
                  'Não há itens para excluir.'     ,
                  'Verifique antes de continuar.' ]);
    Result := False;
    exit;
  End;
end;

function TCadPromotion.ValidaInsertItem: Boolean;
Var
  LctrocaProduto : Boolean;
begin
  Result:=true;
  if not cds_promotion_itens.Active then cds_promotion_itens.CreateDataSet;
  if (E_Produto.Text = '') then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                 'Informe o produto a ser inserido.',
                 'Preencha para continuar.']);
    result:=False;
    Exit;
  end;

  if cds_promotion_itens.Locate('TB_PRODUCT_ID',E_Produto.Tag,[]) then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                  'Este Produto já está na lista desta promoção.']);
    result:=False;
    Exit;
  end;

  if VerificaProdutoDuplicado then
  BEgin
    result:=False;
    Exit;
  End;
end;

function TCadPromotion.ValidateCancel: boolean;
begin

end;

function TCadPromotion.ValidateChange: boolean;
begin

end;

function TCadPromotion.ValidateDelete: boolean;
begin

end;

function TCadPromotion.ValidateSave: boolean;
begin
  Result:=true;
  if StrToFloatDef(E_Valor.Text,0) = 0 then
  begin

    MensageAlert(['A T E N Ç Ã O!.',
                   'Valor da promoção não informado.',
                   'Preencha para continuar.']);
   result:=False;
   setFocus(E_Valor.JSName);
   Exit;
  end;

  if StrToFloatDef(e_Quantidade.Text,0)= 0 then
  begin
    MensageAlert(['A T E N Ç Ã O!.',
                   'Quantidade da promoção não informado.',
                   'Preencha para continuar.']);
   result:=False;
   setFocus(e_Quantidade.JSName);
   Exit;
  end;

  montadescription;

  if not cds_promotion_itens.Active then cds_promotion_itens.CreateDataSet;

  if cds_promotion_itens.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                   'Nenhum produto associado a esta promoção.',
                   'Verifique para continuar.']);
   result:=False;
   Exit;
  End;

end;

function TCadPromotion.VerificaProdutoDuplicado: Boolean;
Var
  LcResultado : Boolean;
begin
  try
    LcResultado := False;
    //Pesquisa se o produto está em outra promroção
    VerifyPromotion.Items.Registro.Estabelecimento := UMM.GInstitution.registro.Codigo ;
    VerifyPromotion.Items.Registro.Produto         := E_Produto.Tag;
    VerifyPromotion.Items.Registro.Promocao        := Promotion.Registro.Codigo;
    VerifyPromotion.Items.getProductDuplicated;
    if VerifyPromotion.Items.exist then
    Begin
      LcResultado := True;
      MensageYesNo(['C O N F I R M A Ç Ã O!',
                  'Este produto já está cadastrado em outra promoção.',
                  'Para incluir nesta é necessário excluir da anterior.',
                  'Deseja excluir este produto da promoção anterior?',
                  'clique em SIM para confirmar.'],mpAlerta);
      FormMsg.ShowModal(
        Procedure(Sender: TComponent; AResult:Integer)
        begin
          if (Sender as TMsgForm).BotaoEscolhido > 0 then
          Begin
            //Delata  item da promoção antiga
            Self.VerifyPromotion.Parametro.Promocao.Estabelecimento := Self.VerifyPromotion.Items.Registro.Estabelecimento;
            Self.VerifyPromotion.Parametro.Promocao.Codigo := Self.VerifyPromotion.Items.Registro.Promocao;
            Self.VerifyPromotion.getbyKey;
            Self.VerifyPromotion.Items.delete;
            Self.VerifyPromotion.update;
          End;
        end
        )
    End;
  finally
    REsult := LcResultado;
  end;
end;

end.
