unit ControllerMedPartsRt;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedPartsRt, FireDAC.Comp.Client,FireDAC.Stan.Param,
      System.Generics.Collections, ControllerMedInsertDate,
      ControllerMedPriceListRT, ControllerBroadcaster;


Type
  TListaMedPartsRt = TObjectList<TMedPartsRt>;

  TControllerMedPartsRt = Class(TBaseController)

  Lista: TListaMedPartsRt;
    procedure clear;
  private

  protected
   function getNext:Integer;

  public
    Registro : TMedPartsRt;
    Tabela : TControllerMedPriceListRt;
    Broadcaster : TControllerBroadcaster;

    MedPartsInsert : TControllerMedInsertDate;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    Function getList:Boolean;
  End;


implementation
{ TControllerMedPartsRt}

procedure TControllerMedPartsRt.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMedPartsRt.Create(AOwner: TComponent);
begin
  inherited;
  Registro        := TMedPartsRt.Create;
  Lista           := TListaMedPartsRt.Create;
  MedPartsInsert  := TControllerMedInsertDate.Create(self);
  Tabela          := TControllerMedPriceListRt.Create(self);
  Broadcaster     := TControllerBroadcaster.Create(self);


 end;

function TControllerMedPartsRt.delete: boolean;
 begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
 end;

destructor TControllerMedPartsRt.Destroy;
begin
  Registro.DisposeOf;
  Lista.DisposeOf;
  MedPartsInsert.DisposeOf;
  Tabela.DisposeOf;
  Broadcaster.DisposeOf;
 inherited;
end;

function TControllerMedPartsRt.insert: boolean;
begin
  if Registro.Codigo = 0 then
    Registro.Codigo := getNext;
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

function TControllerMedPartsRt.save: boolean;
begin
  try
    //Linha abaixo desativada por que o Id será sempre definido na interface
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerMedPartsRt.update: boolean;
begin
  Result := updateObj(Registro);
end;



function TControllerMedPartsRt.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerMedPartsRt.getList: Boolean;
var
  Qry : TFDQuery;
  LITem : TMedPartsRt;
begin
  Try
    Qry := createQuery;
    with Qry do
    Begin
      sql.add(concat('SELECT * ',
                      'FROM tb_med_parts_rt jr ',
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
        LITem := TMedPartsRt.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
      Close;
    end;
  Finally
    Qry.Close;
    FreeAndNil(Qry);
  End;


end;

function TControllerMedPartsRt.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Lc_qry := createQuery;
  with Lc_qry do
  Begin
    sql.Clear;
    sql.Add(concat(
                'SELECT MAX(id) id ',
                'FROM tb_med_parts_rt ',
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
