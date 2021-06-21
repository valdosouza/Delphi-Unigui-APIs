unit ControllerMerchandiseHasProvider;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMerchandiseHasProvider,FireDAC.Comp.Client,Md5, FireDAC.Stan.Param,
      ControllerProvider;

Type
  TControllerMerchandiseHasProvider = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TMerchandiseHasProvider;
    provider : TControllerProvider;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getByProvider:Boolean;
  End;

implementation

{ ControllerModule }


procedure TControllerMerchandiseHasProvider.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMerchandiseHasProvider.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMerchandiseHasProvider.Create;
  provider := TControllerProvider.Create(nil);
end;

function TControllerMerchandiseHasProvider.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerMerchandiseHasProvider.Destroy;
begin
  provider.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerMerchandiseHasProvider.save: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerMerchandiseHasProvider.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerMerchandiseHasProvider.getByProvider: Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                  'Select m.* ',
                  'from  tb_merchandise_has_provider m ',
                  'where (m.product_provider =:product_provider) ',
                  ' and (tb_provider_id =:tb_provider_id)',
                  ' and (tb_institution_id =:tb_institution_id)'
                  ));
      ParamByName('tb_provider_id').AsInteger := Registro.Fornecedor;
      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('product_provider').AsString := Registro.ProdutoFornecedor;
      active := True;
        FetchAll;
      Result := RecordCount > 0;
      if (Result) then get(Lc_Qry,Registro);
    End;
  Finally
    Lc_Qry.Close;
    FreeAndNil(Lc_Qry);
  End;
end;

function TControllerMerchandiseHasProvider.insert: boolean;
begin
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
