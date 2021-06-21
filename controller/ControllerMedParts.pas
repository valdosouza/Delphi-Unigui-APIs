unit ControllerMedParts;

interface
uses System.Classes, System.SysUtils,BaseController,
      tblMedParts, FireDAC.Comp.Client,FireDAC.Stan.Param,
      ControllerMedMaterial, ControllerMedPosProg, Datasnap.DBClient,Data.DB,
      System.Generics.Collections, ControllerMedPartsJr, ControllerMedPartsRt;


Type
  TListaMedParts = TObjectList<TMedParts>;

  TControllerMedParts = Class(TBaseController)
    Lista: TListaMedParts;
    procedure clear;
  private

  protected
   function getNext:Integer;

  public
    Registro : TMedParts;
    material : TControllerMedMaterial;
    PartJR : TcontrollermedPartsJR;
    PartRT : TcontrollermedPartsRT;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function insert:boolean;
    Function delete:boolean;
    function getByKey:Boolean;
    function update:boolean;
    Function getList:Boolean;
    function getAllByKey:boolean;
  End;


implementation

procedure TControllerMedParts.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMedParts.Create(AOwner: TComponent);
begin
  inherited;
  Registro  := TMedParts.Create;
  material  := TControllerMedMaterial.Create(Self);
  Lista     := TListaMedParts.create;
  PartJR    := TcontrollermedPartsJR.Create(Self);
  PartRT    := TcontrollermedPartsRT.Create(Self);

 end;

function TControllerMedParts.delete: boolean;
 begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
 end;

destructor TControllerMedParts.Destroy;
begin
  Registro.DisposeOf;
  Material.DisposeOf;
  PArtJR.DisposeOf;
  PArtRT.DisposeOf;
  inherited;
end;

function TControllerMedParts.insert: boolean;
begin
  if Registro.Codigo > 0 then Registro.Codigo := getNext;
  Try
    insertObj(Registro);
    Result := True;
  Except
    Result := False;
  End;

end;

function TControllerMedParts.save: boolean;
begin
  try
    //Linha abaixo desativada por que o Id será sempre definido na interface
    //if Registro.Codigo = 0 then Registro.Codigo := getNextByField(Registro,'id',Registro.Estabelecimento);
    SaveObj(Registro);
    Result := true;
  except
    Result := False;
  end;
end;


function TControllerMedParts.update: boolean;
begin
  Result := updateObj(Registro);
end;




function TControllerMedParts.getAllByKey: boolean;
begin
  _getByKey(Registro);

  material.Registro.Codigo := Self.Registro.Material;
  material.Registro.Estabelecimento := Self.Registro.Estabelecimento;
  material.getByKey;

end;

function TControllerMedParts.getByKey: Boolean;
begin
  _getByKey(Registro);
end;

function TControllerMedParts.getList: Boolean;
var
  Qry : TFDQuery;
  LITem : TMedParts;
begin
  Try
    Qry := createQuery;
    with Qry do
    Begin
      sql.add(concat( 'SELECT * ',
                      'FROM tb_med_parts mp ',
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
        LITem := TMedParts.Create;
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

function TControllerMedParts.getNext: Integer;
var
  Lc_qry: TFDQuery;
begin
  Lc_qry := createQuery;
  with Lc_qry do
  Begin
    sql.Clear;
    sql.Add(concat(
                'SELECT MAX(id) id ',
                'FROM tb_med_parts ',
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
