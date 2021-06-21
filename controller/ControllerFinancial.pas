unit ControllerFinancial;

interface
uses System.Classes, System.SysUtils,BaseController, TypesCollection,
      tblFinancial, tblEntity, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerPaymentTypes;

Type
  TControllerFinancial= Class(TBaseController)
    Lista : TListFinancial;
    procedure clear;
  private

  public
    Registro : TFinancial;
    PaymentType : TControllerPaymentTypes;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getByKey:Boolean;
    function getList:Boolean;
  End;

implementation

{ ControllerFinancial }

procedure TControllerFinancial.clear;
begin
  clearObj(Registro);
end;

constructor TControllerFinancial.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TFinancial.Create;
  Lista := TListFinancial.Create;
  PaymentType := TControllerPaymentTypes.Create(self);
end;

destructor TControllerFinancial.Destroy;
begin
  PaymentType.DisposeOf;
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerFinancial.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerFinancial.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerFinancial.getList: Boolean;
var
  Lc_Qry : TFDQuery;
  LITem : TFinancial;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM tb_financial ',
                      'WHERE tb_institution_id =:tb_institution_id '
                      ));
      if Registro.Ordem > 0 then
        sql.add('AND tb_order_id =:tb_order_id');

      if Registro.Terminal > 0 then
        sql.add('AND terminal =:terminal ');

      sql.add(' ORDER BY tb_order_id ');

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      if Registro.Ordem > 0 then
        ParamByName('tb_order_id').AsInteger := Registro.Ordem;

      if Registro.Terminal > 0 then
        ParamByName('terminal').AsInteger := Registro.Terminal;

      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TFinancial.Create;
        get(Lc_Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    FinalizaQuery(Lc_Qry);
  End;
end;

end.
