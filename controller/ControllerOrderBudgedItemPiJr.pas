unit ControllerOrderBudgedItemPiJr;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblOrderBudgedItemPi, FireDAC.Comp.Client,FireDAC.Stan.Param,
      ControllerBroadcaster, Datasnap.DBClient,Data.DB,
      System.Generics.Collections;


Type
  TListaMedPartsJr = TObjectList<TOrderBudItMedJr>;

  TControllerOrderBudgedItemPiJr = Class(TBaseController)
  Lista: TListaMedPartsJr;
    procedure clear;
  private

 protected
    function getNext:Integer;

  public
    Registro : TOrderBudItMedJr;
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
{ TControllerOrderBudgedItemPiJr }

procedure TControllerOrderBudgedItemPiJr.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderBudgedItemPiJr.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TOrderBudItMedJr.Create;
  Lista     := TListaMedPartsJr.Create;
end;

function TControllerOrderBudgedItemPiJr.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderBudgedItemPiJr.Destroy;
begin
  FreeAndNil(Registro);
     inherited;
end;

function TControllerOrderBudgedItemPiJr.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerOrderBudgedItemPiJr.getList: Boolean;
var
  Qry : TFDQuery;
  LITem : TOrderBudItMedJr;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat('SELECT * ',
                    'FROM tb_order_bud_it_med_jr jr ',
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
      LITem := TOrderBudItMedJr.Create;
      with LITem do
      Begin
        Codigo            := FieldByName('id').AsInteger;
        Estabelecimento   := FieldByName('tb_institution_id').AsInteger;
        Ordem             := FieldByName('tb_order_id').AsInteger;
        Veiculo           := FieldByName('tb_broadcaster_id').AsInteger;
        Posicao           := FieldByName('tb_med_pos_prog_id').AsInteger;
        Dia               := FieldByName('day').AsString;
        Cor               := FieldByName('Color').AsString;
        ValorTabela       := FieldByName('table_value').AsFloat;
        Desconto          := FieldByName('aliq_desc').AsFloat;
        ValorUnitario     := FieldByName('unit_value').AsFloat;
        Coluna            := FieldByName('nr_column').AsString;
        Altura            := FieldByName('nr_height').AsString;
        insercao          := FieldByName('insertion').AsInteger;

        RegistroCriado    := FieldByName('created_at').AsDateTime;
        RegistroAlterado  := FieldByName('updated_at').AsDateTime;
      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);
end;

function TControllerOrderBudgedItemPiJr.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Lc_qry := createQuery;
  with Lc_qry do
  Begin
    sql.Clear;
    sql.Add(concat(
                'SELECT MAX(id) id ',
                'FROM tb_order_bud_it_med_jr ',
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

function TControllerOrderBudgedItemPiJr.insert: boolean;
begin
  if Registro.Codigo > 0 then
    Registro.Codigo := getNext;
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;


function TControllerOrderBudgedItemPiJr.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderBudgedItemPiJr.update: boolean;
begin
  Result := UpdateObj(Registro);
end;

end.
