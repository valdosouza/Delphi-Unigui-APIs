unit ControllerMedInsertDate;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedInsertDate, FireDAC.Comp.Client,FireDAC.Stan.Param,
      ControllerMedPosProg, System.Generics.Collections;


Type
  TListaMedInsertDate = TObjectList<TMedInsertDate>;

  TControllerMedInsertDate = Class(TBaseController)
  Lista: TListaMedInsertDate;
    procedure clear;
  private

  protected
    function getNext:Integer;
  public
    Registro : TMedInsertDate;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function getByParts:Boolean;
    function update:boolean;
    Function getList:Boolean;
  End;

implementation

procedure TControllerMedInsertDate.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMedInsertDate.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TMedInsertDate.Create;
  Lista     := TListaMedInsertDate.Create;
end;

function TControllerMedInsertDate.delete: boolean;
 begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
 end;

destructor TControllerMedInsertDate.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerMedInsertDate.insert: boolean;
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

function TControllerMedInsertDate.save: boolean;
begin
  try
    //Linha abaixo desativada por que o Id será sempre definido na interface
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerMedInsertDate.update: boolean;
begin
  Result := updateObj(Registro);
end;




function TControllerMedInsertDate.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerMedInsertDate.getByParts: Boolean;
begin

end;

function TControllerMedInsertDate.getList: Boolean;
var
  Qry : TFDQuery;
  LITem : TMedInsertDate;
begin
  Try
    Qry := createQuery;
    with Qry do Begin
      sql.add(concat('SELECT * ',
                     'FROM tb_med_insert_date  ',
                     'WHERE tb_institution_id =:institution_id ',
                     '  AND tb_order_id =:order_id '
                     ));
      if Registro.PosicaoPecas > 0 then
        sql.add('  AND tb_med_parts_id =:med_parts_id ');
      sql.add(' ORDER BY dt_insertion ');

      ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
      ParamByName('order_id').AsInteger := Registro.Ordem;
      if Registro.PosicaoPecas > 0 then
        ParamByName('med_parts_id').AsInteger := Registro.PosicaoPecas;
      Active := True;
      FetchAll;
      First;
      Lista.Clear;
      while not eof do
      Begin
        LITem := TMedInsertDate.Create;
        get(Qry,LITem);
        Lista.add(LITem);
        next;
      end;
    end;
  Finally
    Qry.Close;
    FreeAndNil(Qry);
  End;

end;

function TControllerMedInsertDate.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Lc_qry := createQuery;
  with Lc_qry do
  Begin
    sql.Clear;
    sql.Add(concat(
                'SELECT MAX(id) id ',
                'FROM tb_med_insert_date ',
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
