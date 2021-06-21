unit ControllerMedPartsJr;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedPartsJr, FireDAC.Comp.Client,FireDAC.Stan.Param,
      ControllerMedPriceListJr,
      Datasnap.DBClient,Data.DB,  System.Generics.Collections;


Type
  TListaMedPartsJr = TObjectList<TMedPartsJr>;

  TControllerMedPartsJr = Class(TBaseController)
    Lista: TListaMedPartsJr;
    procedure clear;
  private

  protected
    function getNext:Integer;

  public
    Registro : TMedPartsJr;
    Tabela : TControllerMedPriceListJr;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    Function getList:Boolean;
    function update:boolean;
  End;


implementation

{ TControllerMedPartsJr}

procedure TControllerMedPartsJr.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMedPartsJr.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMedPartsJr.Create;
  Tabela := TControllerMedPriceListJr.Create(Self);
  Lista := TListaMedPartsJr.Create;
 end;

function TControllerMedPartsJr.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerMedPartsJr.Destroy;
begin
  Lista.DisposeOf;
  Tabela.DisposeOf;
  Registro.DisposeOf;
  inherited;
end;

function TControllerMedPartsJr.insert: boolean;
begin
  if Registro.Codigo = 0 then
   Registro.Codigo := getNextByField(Registro,'id',0);
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerMedPartsJr.save: boolean;
begin
  //Linha abaixo desativada por que o Id será sempre definido na interface
  //if Registro.Codigo = 0 then Registro.Codigo := TgetNextByField(Registro,'id',Registro.Estabelecimento);
  try
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerMedPartsJr.update: boolean;
begin
  Result := updateObj(Registro);
end;



function TControllerMedPartsJr.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerMedPartsJr.getList: Boolean;
var
  Qry : TFDQuery;
  LITem : TMedPartsJr;
begin
  try
    Qry := createQuery;
    with Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM tb_med_parts_jr jr ',
                      'WHERE tb_institution_id =:tb_institution_id ',
                      ' AND tb_order_id =:tb_order_id ',
                      ' ORDER BY id '));

      ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('tb_order_id').AsInteger := Registro.Ordem;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TMedPartsJr.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
      Close;
    end;
  finally
    Qry.Close;
    FreeAndNil(Qry);
  end;
end;

function TControllerMedPartsJr.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Lc_qry := createQuery;
  with Lc_qry do
  Begin
    sql.Clear;
    sql.Add(concat(
                'SELECT MAX(id) id ',
                'FROM tb_med_parts_jr ',
                ' where ( tb_institution_id =:tb_institution_id ) ',
                ' and (tb_order_id =:tb_order_id) '
                ));
    ParamByName('tb_institution_id').AsInteger := Registro.Estabelecimento;
    ParamByName('tb_order_id').AsInteger := Registro.Ordem;
    Active := True;
    First;
    result := StrToIntDef(FieldByName('id').AsString,0) + 1;
  End;
  FreeAndNil(Lc_qry);
end;

end.
