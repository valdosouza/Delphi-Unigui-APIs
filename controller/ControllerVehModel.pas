unit ControllerVehModel;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblBrand, tblInstitutionHasPaymentTypes, FireDAC.Comp.Client,
      FireDAC.Stan.Param, tblVehModel, System.Generics.Collections;

Type
  TListaPrice = TObjectList<TVehModel>;

  TControllerVehModel = Class(TBaseController)
    Lista : TListaPrice;
    procedure clear;
  private

  protected
   function getNext:Integer;
  public
    Registro : TVehModel;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function getbyKey:boolean;
    function insert:boolean;
    Function delete:boolean;
    Function getList:Boolean;
    function update:boolean;
  End;

implementation

{ TControllerVehBrand }

uses ControllerVehBrand;

procedure TControllerVehModel.clear;
begin
  ClearObj(Registro);
end;

constructor TControllerVehModel.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TVehModel.Create;
  Lista     := TListaPrice.Create;
end;

function TControllerVehModel.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

destructor TControllerVehModel.Destroy;
begin
  FreeAndNil(Registro);
  inherited;
end;

function TControllerVehModel.getbyKey: boolean;
begin
  _getByKey(Registro);
end;

function TControllerVehModel.getList: Boolean;
var
  Qry : TFDQuery;
  LITem : TVehModel;
begin
  Qry := createQuery;
  with Qry do
  Begin
    sql.add(concat( ' SELECT vm.id, vm.tb_veh_brand_id, vm.description  ',
                    ' FROM tb_veh_model vm ',
                    ' INNER JOIN tb_veh_brand vb ',
                    ' ON vb.id = vm.tb_veh_brand_id ',
                    ' where (tb_veh_brand_id =:tb_veh_brand_id) '
                    ));
    ParamByName('tb_veh_brand_id').AsInteger := Registro.Marca;
    Active := True;
    FetchAll;
    First;
    Lista.Clear;
    while not eof do
    Begin
      LITem := TVehModel.Create;
      with LITem do
      Begin
        Codigo            := FieldByName('id').AsInteger;
        Marca             := FieldByName('tb_veh_brand_id').asInteger;
        Descricao         := FieldByName('description').asString;
      end;
      Lista.add(LITem);
      next;
    end;
    Close;
  end;
  FreeAndNil(Qry);

end;

function TControllerVehModel.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Lc_qry := createQuery;
  with Lc_qry do
  Begin
    sql.Clear;
    sql.Add(concat(
                'SELECT MAX(id) id ',
                'FROM tb_veh_model vm ',
                ' where (tb_veh_brand_id =:tb_veh_brand_id) '
                ));
    ParamByName('tb_veh_brand_id').AsInteger := Registro.Marca;
    Active := True;
    First;
    result := StrToIntDef(FieldByName('id').AsString,0) + 1;
  End;
  FreeAndNil(Lc_qry);
end;

function TControllerVehModel.insert: boolean;
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

function TControllerVehModel.save: boolean;
begin
  try
    if Registro.Codigo = 0 then
      Registro.Codigo := getNextByField(Registro,'id',0);
    saveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;

function TControllerVehModel.update: boolean;
begin
  Result := UpdateObj(Registro);
end;

end.
