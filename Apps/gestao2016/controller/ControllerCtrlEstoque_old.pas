unit ControllerCtrlEstoque;

interface

uses IBX.IBDatabase,System.Classes, IBX.IBQuery, System.SysUtils,BaseController,
      GenericDao,  System.Generics.Collections;

Type
  TListaCtrEstoque = TObjectList<TCtrlEstoque>;

  TControllerCtrlEstoque = Class(TBaseController)
    Lista : TListaCtrEstoque;
  private

  protected
    Procedure setDataModel;Override;
  public
    Registro : TCtrlEstoque;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Insert:boolean;
    Function delete:boolean;
    procedure getbyId;
    procedure getlistSincronia;
    procedure Registra;
  End;

implementation

constructor TControllerCtrlEstoque.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TCtrlEstoque.Create;
  Lista := TListaCtrEstoque.Create;
  Composicao := TControllerComposicao.Create(Self);

end;


destructor TControllerCtrlEstoque.Destroy;
begin
  Composicao.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;



function TControllerCtrlEstoque.delete: boolean;
Var
  Lc_SqlTxt : String;
  LcQry : TIBQuery;
Begin
  LcQry := GeraQuery;
  with LcQry do
  Begin
    if not Transaction.InTransaction then Transaction.StartTransaction;
    SQL.Clear;
    Lc_SqlTxt := 'DELETE '+
                 'FROM TB_CTRL_ESTOQUE '+
                 'WHERE (CET_VINCULO=:CET_VINCULO) ';
    //Incremento do SQL
    if ( Registro.Ordem > 0) then
      Lc_SqlTxt := Lc_SqlTxt  + 'AND (CET_CONTROLE =:CET_CONTROLE) '
    else
      Lc_SqlTxt := Lc_SqlTxt  + 'AND (CET_ITEM_CTRL =:CET_ITEM_CTRL) ';
    SQL.ADD(Lc_SqlTxt);

    //Passagem de Parametros
    ParamByName('CET_VINCULO').AsAnsiString := Registro.Vinculo;

    if ( Registro.Ordem > 0) then
      ParamByName('CET_CONTROLE').AsInteger := Registro.Ordem
    else
      ParamByName('CET_ITEM_CTRL').AsInteger := Registro.Item;
    ExecSQL;
    if Transaction.InTransaction then Transaction.Commit;
  end;
end;

procedure TControllerCtrlEstoque.getById;
begin
  exist := existObj(Registro);
  if (exist) then get(FDataMod.Qr_Crud,Registro);
end;


procedure TControllerCtrlEstoque.getlistSincronia;
Var
  LcTime : TDatetime;
  LcSyT : TControllerSyncTable;
  Qry:TIBQuery;
  LcReg :  TCtrlEstoque;
begin
  TRY
    LcSyT := TControllerSyncTable.Create(nil);
    with LcSyT.Registro do
    Begin
      Codigo := 'TB_CTRL_ESTOQUE';
      //R - Recieve / S - Send / W - Web
      Sentido := 'W';
    End;
    LcTime := LcSyT.getTime;
    Qry := GeraQuery;
    with Qry do
    Begin
      sql.Clear;
      sql.Add(concat(
                'Select * ',
                'from TB_CTRL_ESTOQUE ',
                'where UPDATE_AT>=:UPDATE_AT'
          ));
      ParamByName('UPDATE_AT').AsDateTime := LcTime;
      Active := True;
      First;
      while not eof do
      Begin
        LcReg := TCtrlEstoque.Create;
        get(Qry,LcReg);
        Lista.Add(LcReg);
      End;
    End;
  FINALLY
    FreeAndNil(LcSyT);
  END;
end;

function TControllerCtrlEstoque.Insert: boolean;
begin
  Try
    InsertObj(Registro);
    Result := True;
  Except
    Result := False
  End;

end;

procedure TControllerCtrlEstoque.Registra;
Var
  Lc_SqlTxt : String;
  Lc_Qtde : String;
  I : Integer;
  LcComp : TComposicao;
Begin
  Composicao.Registro.produtoMaster :=  Self.Registro.Produto;
  Composicao.getList;
  for I := 0 to Composicao.ListaComposicao.Count - 1 do
  Begin
    LcComp := TComposicao.Create;
    LcComp := Composicao.ListaComposicao[I];
    if (( LcComp.Composicao = '1') or (LcComp.Composicao = '3')) then
    Begin
      //Registra o produto Principal
      self.Insert;
    end;
    if ((LcComp.Composicao = '2') or (LcComp.Composicao ='3')) then
    Begin
      //Registra o produto da composicao
      if (LcComp.produtodetalhe > 0) then
      Begin
        Registro.Produto     := LcComp.produtodetalhe;
        Registro.Quantidade  := LcComp.Qtde *  Self.Registro.Quantidade;
        self.Insert;
      end;
    end;
  end;
end;

procedure TControllerCtrlEstoque.setDataModel;
begin
  inherited;
  Composicao.DataMod := FDataMod;
end;



end.
