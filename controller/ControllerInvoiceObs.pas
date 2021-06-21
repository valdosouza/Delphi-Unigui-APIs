unit ControllerInvoiceObs;

interface
uses System.Classes, System.SysUtils,BaseController,System.Generics.Collections,
      tblInvoiceObs, FireDAC.Comp.Client,Md5, FireDAC.Stan.Param ;

Type
  TlistaObs   = TObjectList<TInvoiceObs>;

  TControllerInvoiceObs = Class(TBaseController)
    procedure clear;
  private

  public
    Registro : TInvoiceObs;
    Lista : TlistaObs;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getAllByKey:boolean;
    function getlist:Boolean;
  End;

implementation

{ ControllerInvoiceObs }

procedure TControllerInvoiceObs.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerInvoiceObs.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TInvoiceObs.Create;
  Lista := TlistaObs.Create;
end;

function TControllerInvoiceObs.delete: boolean;
begin
  deleteObj(Registro);
  inherited;
end;

destructor TControllerInvoiceObs.Destroy;
begin
  Lista.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;


function TControllerInvoiceObs.insert: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerInvoiceObs.save: boolean;
begin
  try
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;


end;

function TControllerInvoiceObs.getAllByKey: boolean;
begin
  getByKey;
End;

function TControllerInvoiceObs.getByKey: Boolean;
begin
  _getByKey(Registro);
end;
function TControllerInvoiceObs.getlist: Boolean;
Var
  Lc_Qry : TFDQuery;
  item : TInvoiceObs;
begin
  try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      sql.Clear;
      sql.Add(concat(
                'SELECT obs.* ',
                'FROM tb_invoice_obs obs ',
                'where obs.tb_institution_id =:tb_institution_id ',
                ' AND  obs.tb_invoice_id =:tb_invoice_id ',
                ' AND obs.terminal =:terminal '
              ));
      ParamByName('tb_institution_id').AsInteger  := Registro.Estabelecimento;
      ParamByName('tb_invoice_id').AsInteger      := Registro.NotaFiscal;
      ParamByName('terminal').AsInteger           := Registro.Terminal;
      Active := True;
      FetchAll;
      lista.Clear;
      while not eof do
      Begin
        item := TInvoiceObs.Create;
        get(Lc_Qry,item);
        lista.Add(item);
        next;
      End;
    End;
  finally
    finalizaQuery(Lc_Qry);
  end;
end;

end.
