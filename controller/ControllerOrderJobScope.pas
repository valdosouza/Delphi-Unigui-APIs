unit ControllerOrderJobScope;

interface

uses System.Classes, System.SysUtils,BaseController,
      tblOrderJobScope, FireDAC.Comp.Client,FireDAC.Stan.Param,
      System.Generics.Collections, ControllerWorkFront;

Type
  TListaOrdemScope = TObjectList<TOrderJobScope>;

  TControllerOrderJobScope = Class(TBaseController)
    Lista: TListaOrdemScope;
    procedure clear;
  private

  public
    Registro : TOrderJobScope;
    WorkFront : TControllerWorkFront;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure getList;
    function save:boolean;
    function insert:boolean;
    function update:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
  End;

implementation


{ TControllerOrder }

procedure TControllerOrderJobScope.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerOrderJobScope.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TOrderJobScope.Create;
  WorkFront := TControllerWorkFront.Create(Self);
  Lista := TListaOrdemScope.Create;
end;

function TControllerOrderJobScope.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

destructor TControllerOrderJobScope.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;


function TControllerOrderJobScope.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

procedure TControllerOrderJobScope.getList;
var
  Qry : TFDQuery;
  LITem : TOrderJobScope;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat('SELECT js.* ',
                    'FROM tb_order_job_scope js ',
                    'WHERE js.tb_institution_id =:institution_id ',
                    ' AND js.tb_order_id =:order_id ',
                    ' ORDER BY js.id '));

    ParamByName('institution_id').AsInteger := Registro.Estabelecimento;
    ParamByName('order_id').AsInteger := Registro.Ordem;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TOrderJobScope.Create;
      with LITem do
      Begin
        Codigo          := FieldByName('id').AsInteger;
        Estabelecimento := FieldByName('tb_institution_id').AsInteger;
        Ordem           := FieldByName('tb_order_id').AsInteger;
        Descricao       := FieldByName('description').asString;
        FrenteTrabalho  := FieldByName('tb_work_front_id').AsInteger;
        Detalhes        := FieldByName('note').asString;
        ValorPRevisto   := FieldByName('value_forecast').asFloat;
        DataPrevista    := FieldByName('dt_forecast').AsDateTime;
        RegistroCriado  := FieldByName('created_at').AsDateTime;
        RegistroAlterado:= FieldByName('updated_at').AsDateTime;
      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);
end;

function TControllerOrderJobScope.insert: boolean;
begin
  try
    Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    insertObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerOrderJobScope.save: boolean;
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



function TControllerOrderJobScope.update: boolean;
begin
  try
    UpdateObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

end.
