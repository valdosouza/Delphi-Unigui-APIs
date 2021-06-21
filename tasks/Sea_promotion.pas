unit Sea_promotion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_search, uniEdit, uniLabel,
  Vcl.Menus, uniMainMenu, Datasnap.Provider, Data.DB, Datasnap.DBClient,
  uniButton, uniBitBtn, uniSpeedButton, uniGUIClasses, uniBasicGrid, uniDBGrid,
  uniPageControl, uniGUIBaseClasses, uniPanel, uniCheckBox, mainmodule, Cad_Promotion;

type
  TSeaPromotion = class(TBaseSearch)
    UniLabel1: TUniLabel;
    E_ValorTotal: TUniEdit;
    E_BuscaProduto: TUniEdit;
    E_BuscaCodBarras: TUniEdit;
    ChBx_Active: TUniCheckBox;
    cds_searchid: TIntegerField;
    cds_searchpromocao: TStringField;
    cds_searchproduto: TStringField;
    cds_searchprice_tag: TFMTBCDField;
    cds_searchquantity: TBCDField;
    cds_searchpro_codigo: TIntegerField;
    pnl_param_row_1: TUniPanel;
    E_Qtde: TUniEdit;
  private
    { Private declarations }
  protected
    procedure FormatScreen;Override;
    procedure InitVariable;Override;
    procedure SetVariable;Override;

    procedure SelectSql;Override;
    procedure InnerJoinSql;Override;
    procedure WhereSql;Override;
    procedure OrderBySql;Override;
    procedure SetParameters;Override;
    procedure GetView;Override;
    procedure SetRegister;Override;
  public
    { Public declarations }
  end;

var
  SeaPromotion: TSeaPromotion;

implementation

{$R *.dfm}

{ TBaseSearch1 }

procedure TSeaPromotion.FormatScreen;
begin
  inherited;
  ChBx_Active.Checked := True;
end;

procedure TSeaPromotion.GetView;
Var
  Form : TCadPromotion;
begin
  if Form = nil then
    Form := TCadPromotion.Create(UniApplication);
  Form.CodigoRegistro := cds_search.FieldByName('id').AsInteger;
  Form.Codigodetalhe  := cds_search.FieldByName('pro_codigo').AsInteger;
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
    end
  );
end;

procedure TSeaPromotion.InitVariable;
begin
  inherited;

end;

procedure TSeaPromotion.InnerJoinSql;
begin
  InnerJoinTxt := concat(
              '  inner join tb_promotion_items pit                  ',
              '  on (pit.tb_promotion_id = p.id)                    ',
              '  and (pit.tb_institution_id = p.tb_institution_id)  ',
              '  inner join tb_product prd                          ',
              '  on (prd.id = pit.tb_product_id)                    ',
              '  and (prd.tb_institution_id = p.tb_institution_id)  ',
              '  inner join tb_stock s                              ',
              '  on (s.tb_merchandise_id = prd.id )                 ',
              '  and (s.tb_institution_id = prd.tb_institution_id)  '

            );

end;

procedure TSeaPromotion.OrderBySql;
begin
  OrderByTxt := concat(
              ' order by p.description '
            );
end;

procedure TSeaPromotion.SelectSql;
begin
  SelectTxt := concat(
              'select p.id, p.description promocao, prd.DESCRIPTION produto, p.price_tag, p.quantity, ',
              'prd.id pro_codigo ',
              'from tb_promotion p '
            );
end;

procedure TSeaPromotion.SetParameters;
Var
  LcDesc : string;
  LcQtde : REal;
  LcValor : Real;
begin
  //Passagem de parametro
  with UMM.Qr_Crud do
  Begin
    ParamByName('institution_id').AsInteger := UMM.GInstitution.registro.Codigo;
    LcDesc := '';
    if (E_Qtde.Text <> '') or (E_ValorTotal.Text <> '') then
    BEgin
      LcQtde := StrToFloatDef(E_Qtde.Text,0);
      LcDesc := concat(FloatToStrF(LcQtde,ffFixed,10,0),' X ');
      LcValor := StrToFloatDef(E_ValorTotal.Text,0);
      LcDesc := concat(LcDesc, FloatToStrF(LcValor,ffFixed,10,2));
      ParamByName('promocao').AsString := concat('%',LcDesc,'%');
    End;

    if E_BuscaCodBarras.Text <> '' then
      ParamByName('codebar').AsString := E_BuscaCodBarras.Text;

    if E_BuscaProduto.Text <> '' then
      ParamByName('produto').AsString := concat('%',Copy(Trim(E_BuscaProduto.Text),1,98),'%');
  End;
end;

procedure TSeaPromotion.SetRegister;
Var
  Form:TCadPromotion;
begin
  Try
    Form := TCadPromotion.create(UniApplication);
    Form.CodigoRegistro := 0;
    Form.ShowModal;
  Finally
    FreeAndNil(Form);
  End;
end;

procedure TSeaPromotion.SetVariable;
begin
  inherited;

end;

procedure TSeaPromotion.WhereSql;
begin
  WhereTxt := concat(
             'where p.tb_institution_id =:institution_id '
              );
    //incrementa SQL
  if ChBx_Active.Checked then
    WhereTxt := concat(
                  WhereTxt,
                  ' and (REG_ACTIVE = ''S'') '
                )
    else
    WhereTxt := concat(
                  WhereTxt,
                  'and (REG_ACTIVE = ''N'')'
                );
  if (E_Qtde.Text <> '') or (E_ValorTotal.Text <> '') then
  begin
    WhereTxt := concat(
                  WhereTxt,
                  ' and (p.description like :promocao)'
                );
  end;

  if E_BuscaCodBarras.Text <> '' then
  begin
    WhereTxt := concat(
                  WhereTxt,
                  'and s.codebar =:codebar '
                );
  end;
  if E_BuscaProduto.Text <> '' then
  begin
    WhereTxt := concat(
                  WhereTxt,
                  ' and (prd.description like :produto) '
                );
  end
end;

end.
